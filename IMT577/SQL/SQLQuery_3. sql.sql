CREATE OR REPLACE TABLE Fact_ProductSalesTarget(

DimProductID INT Foreign Key REFERENCES Dim_Product(DimProductID), 
DimTargetDateID NUMBER(9) Foreign Key REFERENCES Dim_Date(DATE_PKEY), 
ProductTargetSalesQuantity FLOAT
); 
INSERT INTO Fact_ProductSalesTarget(
DimProductID, 
DimTargetDateID, 
ProductTargetSalesQuantity
)
SELECT P.DIMPRODUCTID, 
     DD.DATE_PKEY, 
     TP.SALESQUANTITYTARGET
FROM DIM_PRODUCT P 
    JOIN STAGE_TARGETDATA_PRODUCT TP ON P.PRODUCTID = TP.PRODUCTID
    JOIN dim_date dd ON dd.year = TP.targetyear WHERE dd.day_num_in_month = 1 AND dd.day_num_in_year = 1


 

CREATE OR REPLACE TABLE Fact_SRCSalesTarget (
DimStoreID INT Foreign Key REFERENCES Dim_Store(DimStoreID), 
DimResellerID INT Foreign Key REFERENCES Dim_Reseller(DimResellerID),
DimChannelID INT Foreign Key REFERENCES Dim_Channel(DimChannelID),
DimTargetDateID number(9) Foreign Key REFERENCES Dim_Date(DATE_PKEY),
SalesTargetAmount FLOAT 
);

INSERT INTO Fact_SRCSalesTarget(DimStoreID,DimResellerID, DimChannelID, DimTargetDateID, SalesTargetAmount
)
SELECT
ds.dimstoreid,
dr.dimresellerid,
dc.dimchannelid,
dd.date_pkey,
stdc.targetsalesamount
FROM stage_targetdata_channelresellerandstore stdc
JOIN 
(SELECT channelid,dimchannelid,
 REPLACE( channelname, 'On-line', 'Online') AS channelname FROM dim_channel) dc ON dc.channelname = stdc.channelname
 LEFT JOIN (SELECT resellerid,dimresellerid, replace(resellername, 'Mississipi', 'Mississippi') AS resellername FROM dim_reseller) dr ON stdc.targetname = dr.resellername
 LEFT JOIN dim_store ds ON stdc.targetname = ds.storename
 INNER JOIN dim_date dd ON dd.year = stdc.targetyear WHERE dd.day_num_in_month = 1 AND dd.day_num_in_year = 1
;

)
/*
*/



CREATE OR REPLACE TABLE Fact_SalesActual (
DimProductID INT Foreign Key REFERENCES Dim_Product(DimProductID),
DimStoreID INT Foreign Key REFERENCES Dim_Store(DimStoreID),
DimResellerID INT Foreign Key REFERENCES Dim_Reseller(DIMRESELLERID), 
DimCustomerID INT Foreign Key REFERENCES Dim_Customer(DimCustomerID), 
DimChannelID INT  Foreign Key REFERENCES Dim_Channel(DIMCHANNELID), 
DimSaleDateID number(9)  Foreign Key REFERENCES Dim_Date(DATE_PKEY),
DimLocationID INT Foreign Key REFERENCES Dim_Location(DIMLOCATIONID),
SalesHeaderID INT  Foreign Key REFERENCES STAGE_SALESHEADER(SALESHEADERID),
SalesDetailID INT  Foreign Key REFERENCES STAGE_SALESDETAIL(SALESDETAILID), 
SalesAmount FLOAT, 
SalesQuantity INT,
SaleUnitPrice FLOAT,
SaleExtendedCost FLOAT,
SaleTotalProfit FLOAT 
);
INSERT INTO Fact_SalesActual(
DimProductID, 
DimStoreID,
DimResellerID, 
DimCustomerID, 
DimChannelID, 
DimSaleDateID,
DimLocationID,
SalesHeaderID,
SalesDetailID, 
SalesAmount, 
SalesQuantity,
SaleUnitPrice,
SaleExtendedCost,
SaleTotalProfit
)
SELECT 
DP.DIMPRODUCTID, 
DS.DIMSTOREID,
DR.DIMRESELLERID, 
DCU.DIMCUSTOMERID,
DC.DIMCHANNELID,
DD.DATE_PKEY,
COALESCE (DS.DIMLOCATIONID, DR.DIMLOCATIONID, DCU.dimlocationid),
SSH.SALESHEADERID, 
SD.SALESDETAILID,
SD.SALESAMOUNT, 
SD.SALESQUANTITY, 
P.PRICE AS SaleUnitPrice,
(SD.SALESQUANTITY - P.COST) AS SaleExtendedCost, 
(SD.SALESAMOUNT - P.COST) AS SaleTotalProfit
 
FROM STAGE_SALESDETAIL SD
JOIN (
SELECT salesheaderID, 
        channelID, 
        storeID, 
        customerID, 
        resellerID, 
        replace(SALESHEADERDATE, '00', '20') AS sales_date
        FROM STAGE_SALESHEADER) ssh ON ssh.salesheaderid = sd.salesheaderid
JOIN dim_date dd ON ssh.sales_date = dd.date
JOIN dim_channel dc ON ssh.channelId = dc.dimchannelid
LEFT JOIN dim_store ds ON ssh.storeID = ds.dimstoreid
LEFT JOIN dim_customer dcu ON ssh.customerid = dcu.customerid
LEFT JOIN dim_reseller dr ON ssh.resellerID = dr.resellerid
JOIN dim_product dp ON sd.productid = dp.dimproductid
JOIN STAGE_PRODUCT P ON dp.dimproductid = p.productid

)

