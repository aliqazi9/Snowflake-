CREATE DATABASE IMT577_DW_ALI_QAZI9_1;
CREATE WAREHOUSE IMT577_DW_ALI_QAZI9_1 WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE COMMENT = '';
select
    current_database(),
    current_schema();
USE WAREHOUSE IMT577_DW_ALI_QAZI9_1;
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Channel_STAGE URL = 'azure://sp72storage.blob.core.windows.net/channel' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Customer_STAGE URL = 'azure://sp72storage.blob.core.windows.net/customer' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Channel_Category_STAGE URL = 'azure://sp72storage.blob.core.windows.net/channelcategory' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Product_STAGE URL = 'azure://sp72storage.blob.core.windows.net/product' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Product_Category_STAGE URL = 'azure://sp72storage.blob.core.windows.net/productcategory' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Product_Type_STAGE URL = 'azure://sp72storage.blob.core.windows.net/producttype' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Reseller_STAGE URL = 'azure://sp72storage.blob.core.windows.net/reseller' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Sales_Detail_STAGE URL = '	
azure://sp72storage.blob.core.windows.net/salesdetail' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Sales_Header_STAGE URL = 'azure://sp72storage.blob.core.windows.net/salesheader' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Store_STAGE URL = 'azure://sp72storage.blob.core.windows.net/store' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Target_Data_Channel_Reseller_and_Store_STAGE URL = 'azure://sp72storage.blob.core.windows.net/targetdatachannel' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
CREATE STAGE "IMT577_DW_ALI_QAZI9_1"."PUBLIC".Target_Data_Product_STAGE URL = 'azure://sp72storage.blob.core.windows.net/targetdataproduct' CREDENTIALS = (
        AZURE_SAS_TOKEN = '?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2026-04-23T10:59:43Z&st=2022-04-23T02:59:43Z&spr=https,http&sig=uWPc88FzwC98%2BdzbqdTHprs2ON%2FhAzK7m2Hrig8w9G8%3D'
    );
USE DATABASE IMT577_DW_ALI_QAZI9_1 CREATE
    OR REPLACE FILE FORMAT CSV_SKIP_HEADER type = 'CSV' field_delimiter = ',' FIELD_OPTIONALLY_ENCLOSED_BY = '"' skip_header = 1;
DROP TABLE STAGE_PRODUCT_CATEGORY create
    or replace TABLE STAGE_Product_Category (
        ProductCategoryID INT PRIMARY KEY NOT NULL,
        ProductCategory VARCHAR(255),
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255)
    );
DROP TABLE STAGE_PRODUCT_TYPE create
    or replace TABLE STAGE_Product_Type (
        ProductTypeID INT PRIMARY KEY NOT NULL,
        ProductCategoryID INT Foreign Key REFERENCES STAGE_PRODUCT_CATEGORY(ProductCategoryID),
        ProductType VARCHAR(255),
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255)
    );
DROP TABLE STAGE_PRODUCT create
    or replace TABLE STAGE_Product (
        ProductID INT PRIMARY KEY NOT NULL,
        ProductTypeID INT Foreign Key REFERENCES STAGE_PRODUCT_TYPE(ProductTypeID),
        Product VARCHAR(255),
        Color VARCHAR(255),
        Style VARCHAR(255),
        UnitofMeasure INT,
        Weight FLOAT,
        Price FLOAT,
        Cost FLOAT,
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255),
        WholesalePrice FLOAT
    );
DROP TABLE STAGE_CHANNEL_CATEGORY create
    or replace TABLE STAGE_Channel_Category (
        ChannelCategoryID INT PRIMARY KEY NOT NULL,
        ChannelCategory VARCHAR(255),
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255)
    );
DROP TABLE STAGE_STORE create
    or replace TABLE STAGE_Store (
        StoreID INT PRIMARY KEY NOT NULL,
        SubsegmentID CHAR(1),
        StoreNumber CHAR(3),
        StoreManager VARCHAR(255),
        Address VARCHAR(255),
        City VARCHAR(255),
        StateProvince VARCHAR(255),
        Country VARCHAR(255),
        PostalCode VARCHAR(255),
        PhoneNumber VARCHAR(255),
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255)
    );
DROP TABLE STAGE_CUSTOMER create
    or replace TABLE STAGE_Customer (
        CustomerID VARCHAR(255) PRIMARY KEY NOT NULL,
        SubsegmentID INT,
        FirstName VARCHAR(255),
        LastName VARCHAR(255),
        Gender VARCHAR(255),
        EmailAddress VARCHAR(255),
        Address VARCHAR(255),
        City VARCHAR(255),
        StateProvince VARCHAR(255),
        Country VARCHAR(255),
        PostalCode VARCHAR(255),
        PhoneNumber VARCHAR(255),
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255)
    );
DROP TABLE STAGE_RESELLER create
    or replace TABLE STAGE_Reseller (
        ResellerID VARCHAR(255) PRIMARY KEY NOT NULL,
        Contact VARCHAR(255),
        EmailAddress VARCHAR(255),
        Address VARCHAR(255),
        City VARCHAR(255),
        StateProvince VARCHAR(255),
        Country VARCHAR(255),
        PostalCode VARCHAR(255),
        PhoneNumber VARCHAR(255),
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255),
        ResellerName VARCHAR(255)
    );
DROP TABLE STAGE_CHANNEL create
    or replace TABLE STAGE_Channel (
        ChannelID INT PRIMARY KEY NOT NULL,
        ChannelCategoryID INT Foreign Key REFERENCES STAGE_Channel_Category(ChannelCategoryID),
        Channel VARCHAR(255),
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255)
    );
DROP TABLE STAGE_SALESHEADER create
    or replace TABLE STAGE_SalesHeader (
        SalesHeaderID INT PRIMARY KEY NOT NULL,
        SalesHeaderDate DATETIME,
        ChannelID INT Foreign Key REFERENCES STAGE_Channel(ChannelID),
        StoreID INT Foreign Key REFERENCES STAGE_Store(StoreID),
        CustomerID VARCHAR(255) Foreign Key REFERENCES STAGE_Customer(CustomerID),
        ResellerID VARCHAR(255) Foreign Key REFERENCES STAGE_Reseller(ResellerID),
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255)
    );
DROP table STAGE_SALESDETAIL create
    or replace TABLE STAGE_SalesDetail (
        SalesDetailID INT PRIMARY KEY NOT NULL,
        SalesHeaderID INT Foreign Key REFERENCES STAGE_SalesHeader(SalesHeaderID),
        ProductID INT Foreign Key REFERENCES STAGE_Product(ProductID),
        SalesQuantity INT,
        SalesAmount FLOAT,
        CreatedDate VARCHAR(255),
        CreatedBy VARCHAR(255),
        ModifiedDate VARCHAR(255),
        ModifiedBy VARCHAR(255)
    );
DROP TABLE STAGE_TargetData_ChannelResellerandStore create
    or replace TABLE STAGE_TargetData_ChannelResellerandStore (
        TargetYear CHAR(4),
        ChannelName VARCHAR(255),
        TargetName VARCHAR(255),
        TargetSalesAmount FLOAT
    );
DROP TABLE STAGE_TargetData_Product create
    or replace TABLE STAGE_TargetData_Product (
        ProductID INT Foreign Key REFERENCES STAGE_Product(ProductID),
        Product VARCHAR(255),
        TargetYear CHAR(4),
        SalesQuantityTarget FLOAT
    );
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_PRODUCT_CATEGORY"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."PRODUCT_CATEGORY_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_PRODUCT_TYPE"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."PRODUCT_TYPE_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_PRODUCT"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."PRODUCT_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_CHANNEL_CATEGORY"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CHANNEL_CATEGORY_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_STORE"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STORE_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_CUSTOMER"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CUSTOMER_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_RESELLER"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."RESELLER_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_CHANNEL"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CHANNEL_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_SALESHEADER"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."SALES_HEADER_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_SALESDETAIL"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."SALES_DETAIL_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC"."STAGE_TARGETDATA_CHANNELRESELLERANDSTORE"
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."TARGET_DATA_CHANNEL_RESELLER_AND_STORE_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;
COPY INTO "IMT577_DW_ALI_QAZI9_1"."PUBLIC".STAGE_TARGETDATA_PRODUCT
FROM
    '@"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."TARGET_DATA_PRODUCT_STAGE"' FILE_FORMAT = '"IMT577_DW_ALI_QAZI9_1"."PUBLIC"."CSV_SKIP_HEADER"' ON_ERROR = 'ABORT_STATEMENT' PURGE = FALSE;