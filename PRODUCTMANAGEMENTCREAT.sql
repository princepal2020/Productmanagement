 
CREATE TABLE [dbo].[TblAddProducts](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Brand_Name] [varchar](500) NULL,
	[Product_Name] [varchar](500) NULL,
	[Product_code] [varchar](50) NOT NULL,
	[Category] [int] NULL,
	[sub_category] [int] NULL,
	[Product_HSN_ode] [varchar](100) NULL,
	[Product_serial_No] [varchar](100) NULL,
	[Product_details] [varchar](max) NULL,
	[Product_varcode] [varchar](100) NULL,
	[CreateBy] [varchar](max) NULL,
	[Add_Date] [datetime] NULL,
	[Update_by] [varchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	CONSTRAINT [PK_TblAddProducts] PRIMARY KEY ([Product_id]),
)
CREATE TABLE [dbo].[TblCatogeryMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatogeryName] [varchar](100) NULL,
	[CatogeryDescription] [varchar](200) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	CONSTRAINT [PK_TblCatogeryMaster] PRIMARY KEY ([id]),
)
CREATE TABLE [dbo].[TblCustomerMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customerid] [varchar](30) NOT NULL,
	[Name] [varchar](300) NOT NULL,
	[Mobil_No] [varchar](15) NOT NULL,
	[Email_Id] [varchar](300) NULL,
	[status] [varchar](100) NULL,
	[CreateBy] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [datetime] NULL,
	CONSTRAINT [PK_TblCustomerMaster] PRIMARY KEY ([id]),
)



CREATE TABLE [dbo].[TblOrderProduct](
	[Order_Id] [varchar](50) NOT NULL,
	[StockId] [varchar](50) NULL,
	[Qunatity] [int] NULL,
	[Order_By] [varchar](30) NULL,
	[PRICE] [decimal](18, 4) NULL,
	[Total_Amount] [decimal](18, 4) NULL,
	[PaymentIamge] [varchar](1000) NULL,
	[Status] [varchar](50) NULL,
	[Order_Date] [datetime] NULL,
	[UpdateBy] [varchar](20) NULL,
	[UpdateDate] [datetime] NULL,
	[Paymentmode] [varchar](100) NULL,
	CONSTRAINT [PK_TblOrderProduct] PRIMARY KEY ([Order_Id]),
)
CREATE TABLE [dbo].[TblProductImages](
	[Iamgeid] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] FOREIGN KEY REFERENCES [TblAddProducts]( [Product_id]),
	
	[Product_Image1] [varchar](1000) NULL,
	[Product_Image2] [varchar](1000) NULL,
	[Product_Image3] [varchar](1000) NULL,
	[Product_Image4] [varchar](1000) NULL,
	[Product_Image5] [varchar](1000) NULL,
	[Product_Image6] [varchar](1000) NULL,
	[CreateBy] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [varchar](100) NULL,
	[Updatedate] [datetime] NULL,
	CONSTRAINT [PK_TblProductImages] PRIMARY KEY ([Iamgeid]),
)
CREATE TABLE [dbo].[TblSalllerStock](
	[SellerStockid] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [varchar](50) NOT NULL,
	[Stockid] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 4) NULL,
	[PurchaseDate] [date] NULL,
	[Sell_Price] [decimal](18, 4) NULL,
	[Sdiscount] [decimal](18, 4) NULL,
	[DisCountType] [int] NULL,
	[MRP] [decimal](18, 4) NULL,
	CONSTRAINT [PK_TblSalllerStock] PRIMARY KEY ([SellerStockid]),
)
CREATE TABLE [dbo].[TblSellMaster](
	[Sell_id] [int] IDENTITY(1,1) NOT NULL,
	[Sell_Quentity] [int] NULL,
	[Customer_id] [varchar](100) NULL,
	[Product_Code] [varchar](30) NULL,
	[Cstockid] [int] NULL,
	[status] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[SellBy] [varchar](30) NULL,
	CONSTRAINT [PK_TblSellMaster] PRIMARY KEY ([Sell_id]),
)
CREATE TABLE [dbo].[TblSizeMaster](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [varchar](50) NULL,
	[Size_Description] [varchar](500) NULL,
	[status] [int] NULL,
	[CreateBy] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL
	CONSTRAINT [PK_TblSizeMaster] PRIMARY KEY ([SizeID]),
)
CREATE TABLE [dbo].[TblStateMaster](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[State_name] [varchar](200) NULL,
	[CreateBy] [varchar](10) NULL,
	[CreateOn] [datetime] NULL,
	[UpdateBy] [varchar](10) NULL,
	[UpdateOn] [datetime] NULL,
	CONSTRAINT [PK_TblStateMaster] PRIMARY KEY ([StateId]),
)

CREATE TABLE [dbo].[tblStockManage](
	[ProductCode] [varchar](50) NULL,
	[ProductName] [varchar](50) NULL,
	[BrandName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[SizeID] [int] NULL,
	[DistCountType] [varchar](50) NULL,
	[Discount] [decimal](18, 4) NULL,
	[ProductMRP] [decimal](18, 4) NULL,
	[ProductPrice] [decimal](18, 4) NULL,
	[SellPrice] [decimal](18, 4) NULL,
	[MFGDate] [date] NULL,
	[ExpriyDate] [date] NULL,
	[CreateBy] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	[TaxTypeId] [int] NULL,
	[StId] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NULL,
	CONSTRAINT [PK_tblStockManage] PRIMARY KEY ([StId]),
)
CREATE TABLE [dbo].[TblSubCatogeryMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Categoryid] [int] NULL FOREIGN KEY REFERENCES [TblCatogeryMaster] ([Id]),
	[SubCatogeryName] [varchar](100) NULL,
	[SubCatogeryDescription] [varchar](200) NULL,
	[Status] [bit] NULL,
	[CreateBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL
	CONSTRAINT [PK_TblSubCatogeryMaster] PRIMARY KEY ([Id]),
) 
CREATE TABLE [dbo].[TblTax](
	[TaxId] [int] IDENTITY(1,1) NOT NULL,
	[CGST] [decimal](18, 4) NULL,
	[SGST] [decimal](18, 4) NULL,
	[IGST] [decimal](18, 4) NULL,
	[CreateBy] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [varchar](50) NULL,
	[UpdateDate] [datetime] NULL,
	CONSTRAINT [PK_TblTax] PRIMARY KEY ([TaxId]),
)

CREATE TABLE [dbo].[TblUserMasterType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserType_Name] [varchar](200) NULL,
	[Create_date] [datetime] NULL,
	[Status] [int] NULL,
	CONSTRAINT [PK_TblUserMasterType] PRIMARY KEY (Id),
	
)
CREATE TABLE [dbo].[TblUSerMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](30) NOT NULL,
	[UserName] [varchar](200) NULL,
	[Mobile_No] [varchar](15) NOT NULL,
	[Email_id] [varchar](300) NOT NULL,
	[Company_Name] [varchar](400) NULL,
	[Password] [varchar](20) NULL,
	[Status] [int] NULL,
	[User_Type] [int] NULL,
	[Address] [varchar](1000) NULL,
	[Aadhar_No] [varchar](12) NULL,
	[Pancard_No] [varchar](10) NULL,
	[Gstin_no] [varchar](50) NULL,
	[User_Image] [varchar](500) NULL,
	[Aadhar_image] [varchar](500) NULL,
	[Pancard_image] [varchar](500) NULL,
	[Store_Name] [varchar](400) NULL,
	[Branch_details] [varchar](max) NULL,
	[Dob] [datetime] NULL,
	[ParentId] [varchar](30) NULL,
	[Create_On] [datetime] NULL,
	[UpdateBy] [varchar](30) NULL,
	[Update_On] [datetime] NULL,
	[State] [varchar](200) NULL,
	[distric] [varchar](200) NULL,
	[city] [varchar](200) NULL,
	[Adhar_back_image] [varchar](400) NULL,
	[Gender] [varchar](100) NULL,
	[Pin_Code] [int] NULL,
	[Company_Logo] [varchar](300) NULL,
	[InstagramLink] [varchar](max) NULL,
	[Facebooklink] [varchar](max) NULL,
	[TwiterLink] [varchar](max) NULL,
	CONSTRAINT [PK_TblUSerMaster] PRIMARY KEY (Id),
	 CONSTRAINT FK_User_Type FOREIGN KEY ([User_Type])
        REFERENCES [TblUserMasterType] (ID)
)
CREATE TABLE [dbo].[TblDistrictMAster](
	[District_Id] [int] IDENTITY(1,1) NOT NULL,
	[District_Name] [varchar](200) NULL,
	[StateId] [int] NULL FOREIGN KEY REFERENCES [TblStateMaster] ([StateId]),
	[CreateBy] [varchar](10) NULL,
	[CreateOn] [datetime] NULL,
	[UpdateBy] [varchar](10) NULL,
	[UpdateOn] [datetime] NULL,
	CONSTRAINT [PK_TblDistrictMAster] PRIMARY KEY ([District_Id]),)





/****** Object:  StoredProcedure [dbo].[Sp_ActiveUpdate]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_ActiveUpdate]
	@userid varchar (30),
	@username varchar (200),
	@mobileNo varchar (15),
	@emailId varchar (300),
	@Address varchar (1000),
	@State varchar(100) ,
	@District varchar(100) ,
	@city varchar (300),
	@pincode int,
	@image varchar(300),
	@updateBy varchar (100)
	as
	begin
	update TblUSerMaster set UserName=@username,Mobile_No=@mobileNo,Email_id=@emailId,Address=@Address,State=@State,distric=@District,city=@city,Pin_Code=@pincode, User_Image=@image,UpdateBy=@updateBy,Update_On=GETDATE() where UserId=@userid
	end
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddSallerStock]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[Sp_AddSallerStock]    
@SellerID varchar(50) ,    
@Stockid int ,    
@Quantity INT,    
@Price DECIMAL(18, 4)   
  
as    
begin    
if not Exists (select Stockid from TblSalllerStock where  Stockid =@Stockid and SellerID=@SellerID )  
begin  
update tblStockManage set Quantity-=@Quantity where StId=@Stockid    
insert into TblSalllerStock (SellerID,Stockid,Quantity,Price,PurchaseDate)values(@SellerID,@Stockid,@Quantity,@Price,GetDate())  
end  
else  
begin  
  
update tblStockManage set Quantity-=@Quantity,UpdateDate=GETDATE() where StId=@Stockid    
UPDATE TblSalllerStock  
SET Quantity = ISNULL(Quantity, 0)+@Quantity,PurchaseDate=GETDATE()  
WHERE Stockid = @Stockid and SellerID=@SellerID  
end  
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CategoryGet]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CategoryGet]
as
begin
select *from  TblCatogeryMaster
end 
GO
/****** Object:  StoredProcedure [dbo].[Sp_CheckCustomerRegister]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Sp_CheckCustomerRegister]
@Mobil_No varchar(15)
as
begin
select *from TblCustomerMaster where Mobil_No=@Mobil_No
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_CustomerList]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[Sp_CustomerList]
 as 
 begin
select *from tblcustomermaster
end
GO
/****** Object:  StoredProcedure [dbo].[sp_customerSearch]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[sp_customerSearch] 
@search varchar  (100),
@userid varchar (100),
@action varchar (100)
as
begin
if @action='1'
begin
select *from TblCustomerMaster where CreateBy=@userid and  Mobil_No like @search+'%'
end
else if @action='2'
begin
select *from TblCustomerMaster where CreateBy=@userid and  Name like @search+'%'
end
end 
GO
/****** Object:  StoredProcedure [dbo].[Sp_Deletestokaddproduct]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Sp_Deletestokaddproduct]  
@product_code varchar (50)  
as   
begin
declare @Product_id int=(select Product_id from TblAddProducts where Product_code=@product_code )

delete from TblProductImages where product_id=@Product_id
delete from tblStockManage where ProductCode=@product_code;  
delete from TblAddProducts where Product_code=@product_code 


 
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteUSer]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_DeleteUSer]  
@userid varchar(30)   
as  
begin  
delete from TblUSerMaster where UserId=@userid  
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAdminOrderListAll]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_GetAdminOrderListAll]
as
begin
select *from TblOrderProduct
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetOrderList]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetOrderList] 
@userid varchar(50)
as   
begin  
select *from TblOrderProduct  where Order_By=@userid 
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductid]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_GetProductid]
@Product_code  varchar(50)      
as       
begin 
select *from TblAddProducts where Product_code=@Product_code
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetQuantity]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Proc [dbo].[Sp_GetQuantity]
 @stockId int 
 as
 begin
 select *from tblStockManage  where StId=@stockId
 end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetSaller]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_GetSaller]
@userid varchar (50)
as 
begin
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetSallerProductList]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[Sp_GetSallerProductList]    
    as       
  begin      
  select * from TblAddProducts as tbpro inner join TblProductImages as pbimage on  tbpro.Product_id =pbimage.product_id join tblStockManage as tblstock on tbpro.Product_code=tblstock.ProductCode  join TblSizeMaster as size on size.SizeID=tblstock.SizeID  join TblTax on tblstock.TaxTypeId=TblTax.TaxId
  end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetSallerProductListSearching]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_GetSallerProductListSearching]      
@Search varchar (max)      ,
@action varchar (100)
as      
begin  
if @action='1'
 select *from TblAddProducts join TblProductImages on TblAddProducts.Product_id=TblProductImages.product_id join tblStockManage as tblstock on TblAddProducts.Product_code=tblstock.ProductCode join TblSizeMaster as size on tblstock.SizeID=size.SizeID join TblTax on tblstock.TaxTypeId=TblTax.TaxId    where  Product_code  like @Search+ '%'    

else if @action='2'
 select *from TblAddProducts join TblProductImages on TblAddProducts.Product_id=TblProductImages.product_id join tblStockManage as tblstock on TblAddProducts.Product_code=tblstock.ProductCode join TblSizeMaster as size on tblstock.SizeID=size.SizeID join TblTax on tblstock.TaxTypeId=TblTax.TaxId    where  Brand_Name like @Search+ '%' 

else if @action='3'
 select *from TblAddProducts join TblProductImages on TblAddProducts.Product_id=TblProductImages.product_id join tblStockManage as tblstock on TblAddProducts.Product_code=tblstock.ProductCode join TblSizeMaster as size on tblstock.SizeID=size.SizeID join TblTax on tblstock.TaxTypeId=TblTax.TaxId    where Product_serial_No like @Search+ '%'  

else if @action='4'
 select *from TblAddProducts join TblProductImages on TblAddProducts.Product_id=TblProductImages.product_id join tblStockManage as tblstock on TblAddProducts.Product_code=tblstock.ProductCode join TblSizeMaster as size on tblstock.SizeID=size.SizeID join TblTax on tblstock.TaxTypeId=TblTax.TaxId    where SellPrice like  @Search+ '%'   

else if @action='5'
 select *from TblAddProducts join TblProductImages on TblAddProducts.Product_id=TblProductImages.product_id join tblStockManage as tblstock on TblAddProducts.Product_code=tblstock.ProductCode join TblSizeMaster as size on tblstock.SizeID=size.SizeID join TblTax on tblstock.TaxTypeId=TblTax.TaxId    where Product_Name like @Search+ '%'  

--else if @action='6'
-- select *from TblAddProducts join TblProductImages on TblAddProducts.Product_id=TblProductImages.product_id join tblStockManage as tblstock on TblAddProducts.Product_code=tblstock.ProductCode join TblSizeMaster as size on tblstock.SizeID=size.SizeID join TblTax on tblstock.TaxTypeId=TblTax.TaxId    where Product_Name like @Search+ '%' or( Brand_Name like @Search+ '%' ) or( Product_code  like @Search+ '%' ) or( Product_serial_No like @Search+ '%' )  or (SellPrice like  @Search+ '%' )    

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetStocks]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_GetStocks]    
 as    
 begin     
 select *from tblStockManage tbstok join TblSizeMaster as tbsize on tbsize.SizeID=tbstok.SizeID  where tbstok.ExpriyDate>GETDATE()
 end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetSubCategory]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetSubCategory]
@CatogeryId int 
as 
begin
select *from TblSubCatogeryMaster where Categoryid=@CatogeryId
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetTblSizeMaster]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_GetTblSizeMaster]
	as
	begin
	select *from TblSizeMaster
	end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetTblTax]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Sp_GetTblTax]    
 @TblTax int  
 as    
 begin    
 select TaxId, cast(CGST as decimal(18,2))as CGST, cast(SGST as decimal(18,2))as SGST, cast(IGST as decimal(18,2))as IGST from TblTax  where TaxId=@TblTax  
 end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetTblTaxd]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Sp_GetTblTaxd]  

 as  
 begin  
 select TaxId, cast(CGST as decimal(18,2))as CGST, cast(SGST as decimal(18,2))as SGST, cast(IGST as decimal(18,2))as IGST from TblTax  
 end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUser]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetUser]  
as  
begin  
select *from TblUSerMaster  where User_Type>1
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserSigleuser]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetUserSigleuser]       
@UserId varchar(50) ,    
@Action varchar(100)    
as        
begin       
begin    
if @Action='Userid'    
select *from TblUSerMaster  where UserId=@UserId       
end    
begin    
if @Action='id'    
select *from TblUSerMaster as tblus join TblUserMasterType as tbltype on tblus.User_Type=tbltype.Id join TblStateMaster as tstate  on tblus.State =tstate.StateId join TblDistrictMAster as tbldis on tblus.distric=tbldis.District_Id where tblus.UserId=@UserId
end    
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserType]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Sp_GetUserType]  
@id int 
as    
begin    
select *from TblUserMasterType where  id>@id  
end
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCatogery]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE Proc [dbo].[SP_InsertCatogery]  
   @CatogeryName varchar(100),
   @CatogeryDescription varchar(200),
   @CreateBy int

    
   As   Begin            
   insert into TblCatogeryMaster(CatogeryName,CatogeryDescription, Status, CreateDate, CreateBy) values
(@CatogeryName,@CatogeryDescription, 1, GETDATE(), @CreateBy)    End 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomer]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[SP_InsertCustomer]    
@Customerid varchar (30)  ,    
@Name varchar (300) ,    
@Mobil_No Varchar (15) ,    
@status Varchar (100),    
@CreateBy varchar(50)    
as     
begin    
insert Into TblCustomerMaster(Customerid,Name,Mobil_No,status,CreateBy,CreateDate)values(@Customerid,@Name,@Mobil_No,@status,@CreateBy,GETDATE())    
end 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertSubCatogery]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SP_InsertSubCatogery]     
@CatogeryId int,    
@SubCatogeryName varchar(100),    
@SubCatogeryDescription varchar(100),   
@CreateBy int  
  
As   Begin        
insert into TblSubCatogeryMaster(SubCatogeryName, SubCatogeryDescription, Categoryid, Status, CreateDate, CreateBy) values (@SubCatogeryName,@SubCatogeryDescription, @CatogeryId, 1, GETDATE(), @CreateBy)     End 
GO
/****** Object:  StoredProcedure [dbo].[SP_OrderSearchAdmin]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_OrderSearchAdmin]
@search varchar (100),
@action varchaR (100)
AS 
BEGIN
if @action ='1'
SELECT *FROM TblOrderProduct where Order_Id like @search+'%'
else if @action ='2'
SELECT *FROM TblOrderProduct where Order_By like @search+'%'
else if @action ='3'
SELECT *FROM TblOrderProduct where  CONVERT(VARCHAR(10), Order_Date, 101) =CONVERT (VARCHAR(10), @search, 101)
else if @action ='4'
SELECT *FROM TblOrderProduct where Status like @search+'%'
else if @action ='5'
SELECT *FROM TblOrderProduct where Paymentmode like @search+'%'
END 
GO
/****** Object:  StoredProcedure [dbo].[Sp_ProductUpdate]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_ProductUpdate]  
  @brand_name varchar (500),  
  @Product_Name varchar(500),  
  @Product_serial_No varchar (500),  
  @Product_HSN_ode varchar (50),  
  @Product_details varchar(500),  
  @Product_Image1 varchar (300),  
  @Product_Image2 varchar  (300),  
  @Product_Image3 varchar (300),  
   @Product_Image4 varchar (300),  
    @Product_Image5 varchar (300),  
  @Product_Image6 varchar (300),  
  @Product_code varchar(50)  
  as  
  begin  

      update  TblAddProducts  set brand_name=@brand_name,Product_Name=@Product_Name,Product_serial_No=@Product_serial_No,Product_HSN_ode=@Product_HSN_ode,Product_details=@Product_details  where Product_code=@Product_code;  
  declare @product_id int =(select Product_id from TblAddProducts where Product_code=@Product_code)
  update TblProductImages set Product_Image1=@Product_Image1,Product_Image2=@Product_Image2,Product_Image3=@Product_Image3,Product_Image4=@Product_Image4,Product_Image5=@Product_Image5,Product_Image6=@Product_Image6 where product_id=@product_id
  END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuntityAdd]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE pROC [dbo].[Sp_QuntityAdd]    
@product_code varchar (50),    
@quntity int     
as    
begin    
   
 
UPDATE tblStockManage
SET Quantity = ISNULL(Quantity, 0) + @quntity
WHERE stid = @product_code;    
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Searching]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_Searching]
@Search varchar (max)
as
begin
	select *from TblAddProducts join TblProductImages on TblAddProducts.Product_id=TblProductImages.product_id  where Product_Name like @Search+ '%' or( Brand_Name like @Search+ '%' ) or( Product_code  like @Search+ '%' ) or( Product_serial_No like @Search+ '%' )
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_SearchOrder]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_SearchOrder]
@search varchar (100),
@userid varchar(100),
@action varchar (100)
as
begin
if @action='1'
select *from TblOrderProduct where  Order_By=@userid and Order_Id like @search+'%'
else if @action='2'
select *from TblOrderProduct where  Order_By=@userid and Cast(PRICE as varchar(100)) like  @search+'%'
else if @action='3'
select *from TblOrderProduct where  Order_By=@userid and  Status like @search+'%'
else if @action='4'
 SELECT *
FROM TblOrderProduct
WHERE Order_By = @userid
  AND CONVERT(VARCHAR(10), Order_Date, 101) =CONVERT (VARCHAR(10), @search, 101)
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Searchsallerstock]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Searchsallerstock]
@search varchar (100),
@userid varchar(100),
@action varchar (100)
as
begin
if @action='1'
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID =@userid and   tbstock.ProductCode like @search+'%'

else if @action='2'
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid  and tbstock.BrandName like @search+'%'

else if @action='3'
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid  and adproduct.Product_serial_No like @search+'%'
else if @action='4'
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid  and adproduct.Product_HSN_ode like @search+'%'
else if @action='5'
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid  and tblcat.CatogeryName like @search+'%'
else if @action='6'
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid  and tblsubcat.SubCatogeryName like @search+'%'

end 
GO
/****** Object:  StoredProcedure [dbo].[Sp_SearchSellingList]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_SearchSellingList]  
@userid varchar (50),  
@search varchar (100),  
@action varchar (100)  
as  
begin   
if @action='1'  
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid and adproduct.Product_code like @search+'%'
else if @action='2'  
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid and tbstock.BrandName like @search+'%' 
else if @action='3'  
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid and cast(tbsell.MRP as varchar(50)) like @search+'%' 
 
else if @action='4'  
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid and cast(tbsell.Sell_Price as varchar(50)) like @search+'%'
else if @action='5'  
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid and tblcat.CatogeryName like @search+'%'  
  
else if @action='6'  
select *from TblSalllerStock as tbsell join tblStockManage as tbstock on tbsell.Stockid=tbstock.StId join TblAddProducts as adproduct on tbstock.ProductCode=adproduct.Product_code join TblProductImages as pimage on adproduct.Product_id=pimage.product_id join TblSizeMaster as tblsize on tbstock.status=tblsize.SizeID join TblCatogeryMaster as tblcat on adproduct.Category=tblcat.Id join TblSubCatogeryMaster tblsubcat on adproduct.sub_category=tblsubcat.Id where tbsell.SellerID=@userid and tblsubcat.SubCatogeryName like @search+'%'     
  
end	
GO
/****** Object:  StoredProcedure [dbo].[Sp_SearchStock]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE  PROc [dbo].[Sp_SearchStock]
  @Search varchar (100)
  as begin
  select *from tblStockManage as tbstok join TblSizeMaster as tbsize on tbsize.SizeID=tbstok.SizeID where  tbstok.ProductCode like @Search+'%' or ProductName like @Search+'%' or BrandName like @Search+'%' or Quantity like @Search+'%' or SizeName like @Search+'%' or SellPrice like @Search+'%'
  end
GO
/****** Object:  StoredProcedure [dbo].[Sp_SellPriceFixed]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[Sp_SellPriceFixed]
@sell_Price decimal(18,4),
@SDiscount decimal(18,4),
@DisCountType int,


@SellerStockId int,
@MRP decimal(18,4)
as
begin
Update TblSalllerStock set sell_Price =@sell_Price ,SDiscount=@SDiscount,DisCountType=@DisCountType,MRP=@MRP where SellerStockId=@SellerStockId
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblAddProduct]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_TblAddProduct]    
   
@Brand_Name varchar (500),    
@Product_Name varchar (500),    
@Product_code varchar (50),    
@Category int ,    
@sub_category int ,    
@Product_HSN_ode varchar (100),    
@Product_serial_No  varchar (100),    
@Product_details varchar(max),    
@Product_varcode varchar(100),    
  
   
    
    
@CreateBy varchar (max)   
  
as     
begin     
insert into TblAddProducts(Brand_Name,Product_Name,Product_code,Category,sub_category,Product_HSN_ode,Product_serial_No,Product_details,Product_varcode,CreateBy,Add_Date) values (@Brand_Name,@Product_Name,@Product_code,@Category,@sub_category,@Product_HSN_ode,@Product_serial_No,@Product_details,@Product_varcode,@CreateBy,GetDate()  
)    
end  
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblAddProduct_GetId]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE proc [dbo].[Sp_TblAddProduct_GetId]    
@Product_code  varchar(50)    
as     
begin 
begin
 declare @product_id int=( select Product_id  from  TblAddProducts where Product_code=@Product_code )   
  end
  select *from  TblAddProducts as Tblpd join TblProductImages as pimage on Tblpd.Product_id=pimage.product_id where  Tblpd.Product_id=@product_id
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblAddProductImagesGet]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[Sp_TblAddProductImagesGet]
  as 
  begin
  select * from TblAddProducts as tbpro inner join TblProductImages as pbimage on  tbpro.Product_id =pbimage.product_id
  end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblAddProductImagesGetUpdate]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_TblAddProductImagesGetUpdate]    
  @Product_code varchar (50)    
  as       
  begin  
    select * from TblAddProducts as tbpro inner join TblProductImages as pbimage on  tbpro.Product_id =pbimage.product_id   where tbpro.Product_code=@Product_code    

  end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblDistrictMAster]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_TblDistrictMAster]
@StateId int
as
begin
select *from TblDistrictMAster where StateId= @StateId
end 
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblOrderProductInsert]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_TblOrderProductInsert]  
  
@Order_Id varchar (50),  
@StockId varchar(50) ,  
@Qunatity int ,  
@Order_By VARCHAR(30),  
@PRICE DECIMAL (18,4),  
@Total_Amount decimal(18,4),  
@PaymentIamge varchar (1000),  
@Status varchar(50),
@Paymentmode varchar (100)
  
as   
begin   
insert into TblOrderProduct(Order_Id,StockId,Qunatity,Order_By,PRICE,Total_Amount,PaymentIamge,Status,Order_Date,Paymentmode)values(@Order_Id,@StockId,@Qunatity,@Order_By,@PRICE,@Total_Amount,@PaymentIamge,@Status,GETDATE(),@Paymentmode)  
end 
GO
/****** Object:  StoredProcedure [dbo].[SP_TblProductImage]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SP_TblProductImage]  
  
@product_id int ,  
@Product_Image1 varchAR  (500),  
@Product_Image2 varchAR  (500),  
@Product_Image3 varchAR  (500),  
@Product_Image4 varchAR  (500),  
@Product_Image5 varchAR  (500),  
@Product_Image6 varchAR  (500),  
@CreateBy varchAR  (50)  
AS   
BEGIN   
INSERT INTO TblProductImages(product_id,Product_Image1,Product_Image2,Product_Image3,Product_Image4,Product_Image5,Product_Image6,CreateBy,CreateDate)VALUES(@product_id,@Product_Image1,@Product_Image2,@Product_Image3,@Product_Image4,@Product_Image5,@Product_Image6,@CreateBy,GetDate())  
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblSellMaster]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_TblSellMaster]    
@Sell_Quentity int,    
@Customer_id varchar(100),    
@Product_Code varchar(30),    
@Cstockid int ,    
@status varchar (100) ,  
@SellBy varchar(30)  
as    
begin 
update TblSalllerStock set Quantity-=@Sell_Quentity where SellerStockid=@Cstockid
insert into TblSellMaster(Sell_Quentity,Customer_id,Product_Code,Cstockid,status,CreateDate,SellBy)values(@Sell_Quentity,@Customer_id,@Product_Code,@Cstockid,@status,getdate(),@SellBy)    
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblSizeMaster]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 create proc  [dbo].[Sp_TblSizeMaster]
	@SizeName varchar(50),
	@Size_Description varchar (500),
	
	@CreateBy  varchar (50)
	as 
	begin
	insert into TblSizeMaster(SizeName,Size_Description, status,CreateBy,CreateDate)values(@SizeName,@Size_Description,1,@CreateBy,getdate())
	end 
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblStateMaster]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Sp_TblStateMaster]
as
begin
select *from TblStateMaster
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblStockManage]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_TblStockManage]  
 @ProductCode varchar(50),  
 @ProductName varchar (50),   
 @BrandName varchar (50),  
 @Quantity int,  
 @SizeID  int ,  
 @DistCountType varchar(50),  
 @Discount decimal (18,4),  
 @ProductMRP decimal (18,4),  
 @ProductPrice decimal (18,4),  
 @SellPrice decimal (18,4),  
 @MFGDate date,  
 @ExpriyDate date,  
 @CreateBy varchar (50) ,
 @TaxTypeId int
   
 as  
 begin  
 insert into tblStockManage(ProductCode,ProductName,BrandName,Quantity,SizeID,DistCountType,Discount,ProductMRP,ProductPrice,SellPrice,MFGDate,ExpriyDate,CreateBy,CreateDate,TaxTypeId)values(@ProductCode,@ProductName,@BrandName,@Quantity,@SizeID,@DistCountType,@Discount,@ProductMRP,@ProductPrice,@SellPrice,@MFGDate,@ExpriyDate,@CreateBy,GETDATE(),@TaxTypeId)  
 end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblTax]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_TblTax]
	@CGST Decimal (18,4),
	@SGST decimal (18,4),
	@IGST decimal (18,4),
	@CreateBy varchar (20)
	as 
	begin
	insert into TblTax (CGST,SGST,IGST,CreateBy,CreateDate)VALUES (@CGST,@SGST,@IGST,@CreateBy,GETDATE())
	end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblUSerMaster]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_TblUSerMaster]        
@Userid varchar(30),        
@Username varchar (200),        
@Mobile_no varchar (15),        
@Email_id varchar (500),        
@Company_Name varchar (500),        
@Password varchar (20),        
      
@User_Type int,        
@Address vARCHAR (1000),        
@Aadhar_No varchar  (12),        
@Pancard_No varchar (10),        
@Gstin_no varchar(50),        
@User_image varchar(500),        
@Aadhar_image varchar (500),        
@Pancard_image varchar (500),        
@Store_Name varchar (500),        
@Branch_Details varchar (max),        
@Dob DateTime,        
@Create_By varchar(30),        
@state varchar (200),        
@District varchar(200),        
@city varchar (200)  ,      
@Adhar_back_image varchar (400) ,  
@gender varchar(100)  
as        
begin        
insert into TblUSerMaster(UserId,UserName,Mobile_No,Email_id,Company_Name,Password,Status,User_Type,Address,Aadhar_No,Pancard_No,Gstin_no,User_Image,Aadhar_image,Pancard_image,Store_Name,Branch_details,Dob,ParentId,Create_On,State,distric,city,Adhar_back_image,Gender)values(@UserId,@UserName,@Mobile_No,@Email_id,@Company_Name,@Password,1,@User_Type,@Address,@Aadhar_No,@Pancard_No,@Gstin_no,@User_Image,@Aadhar_image,@Pancard_image,@Store_Name,@Branch_details,@Dob,@Create_By,GETDATE(),@State,@district,@city,@Adhar_back_image,@gender)        
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateOrderStatus]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_UpdateOrderStatus]
@order_id varchar(30),
@status varchar(100),
@updatby varchar  (30)
as
begin
update TblOrderProduct set Order_Id=@order_id,Status=@status,UpdateBy=@updatby,UpdateDate=GETDATE() where Order_Id=@order_id
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_UserLogin]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Sp_UserLogin]    
@Mobile_No varchar (300),    
@password varchar (20)    
as     
begin     
select *from  TblUSerMaster where (Mobile_No=@Mobile_No or Email_id=@Mobile_No  )and (Password=@password and Status=1 )
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_UserSearch]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Sp_UserSearch]  
 @search varchar (100)  
 as  
 begin  
 select *from TblUSerMaster where  UserId like @search +'%' or UserName like @search +'%' or Mobile_No like @search +'%' or Email_id like @search +'%'  and User_Type>1
  
  end
GO
/****** Object:  StoredProcedure [dbo].[Sp_UserUpdate]    Script Date: 27-10-2024 13:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_UserUpdate]    
@Userid varchar(30),    
@Username varchar (200),      
@Mobile_no varchar (15),      
@Email_id varchar (500),      
@Company_Name varchar (500),      
@Password varchar (20),        
@Address vARCHAR (1000),      
@Aadhar_No varchar  (12),      
@Pancard_No varchar (10),      
@Gstin_no varchar(50),      
@User_image varchar(500),      
@Aadhar_image varchar (500),      
@Pancard_image varchar (500),      
@Store_Name varchar (500),      
@Branch_Details varchar (max),      
@Dob DateTime,      
@UpdateBy varchar(30),      
@state varchar (200),      
@District varchar(200),      
@city varchar (200)  ,  
@Adhar_back_image varchar(200)  ,
@gender varchar (100)
as    
begin    
update TblUSerMaster set UserName=@Username,Mobile_No=@Mobile_no,Email_id=@Email_id,Company_Name=@Company_Name,Password=@Password,Address=@Address,Aadhar_No=@Aadhar_No,Pancard_No=@Pancard_No,Gstin_no=@Gstin_no,    
User_Image=@User_image,Aadhar_image=@Aadhar_image,Pancard_image=@Pancard_image,Store_Name=@Store_Name,Branch_details=@Branch_Details,Dob=@Dob,UpdateBy=@UpdateBy,Update_On=getdate(),state=@state,Distric=@District,city=@city,Adhar_back_image=@Adhar_back_image ,gender=@gender where UserId=@Userid    
end

