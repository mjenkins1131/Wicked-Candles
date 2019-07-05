

/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES'; */

-- -----------------------------------------------------
-- Schema Wicked_Candles
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Wicked_Candles
-- -----------------------------------------------------

USE [Wicked_Candles] ;

-- -----------------------------------------------------
-- Table `Wicked_Candles`.`CC`
-- -----------------------------------------------------
CREATE TABLE CC (
  [CCID] INT NOT NULL,
  [CC_Name] VARCHAR(45) NULL,
  [CC_Number] INT NULL,
  [CC_Expiration] DATE NULL,
  PRIMARY KEY ([CCID]))
;


-- -----------------------------------------------------
-- Table `Wicked_Candles`.`Product`
-- -----------------------------------------------------
CREATE TABLE Product (
  [ProductID] INT NOT NULL,
  [ProductName] VARCHAR(100) NOT NULL,
  [ProductDescription] VARCHAR(100) NOT NULL,
  [ProductImages] VARBINARY(max) NULL,
  [ProductPrice] DECIMAL(38) NOT NULL,
  PRIMARY KEY ([ProductID]))
;


-- -----------------------------------------------------
-- Table `Wicked_Candles`.`Cart`
-- -----------------------------------------------------
CREATE TABLE Cart (
  [CartID] INT NOT NULL,
  [Product_ProductID] INT NOT NULL,
  [ProductName] VARCHAR(45) NOT NULL,
  [ProductImage] VARBINARY(max) NOT NULL,
  [ProductPrice] DECIMAL(38) NOT NULL,
  [Quantity] INT NOT NULL,
  PRIMARY KEY ([CartID], [Product_ProductID])
 ,
  CONSTRAINT [fk_Cart_Product1]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES Product ([ProductID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_Cart_Product1_idx] ON Cart ([Product_ProductID] ASC);


-- -----------------------------------------------------
-- Table `Wicked_Candles`.`WishList`
-- -----------------------------------------------------
CREATE TABLE WishList (
  [WishListID] INT NOT NULL,
  [Product_ProductID] INT NOT NULL,
  [ProductName] VARCHAR(100) NOT NULL,
  [ProductImage] VARBINARY(max) NOT NULL,
  [ProductPrice] DECIMAL(38) NOT NULL,
  PRIMARY KEY ([WishListID], [Product_ProductID])
 ,
  CONSTRAINT [fk_WishList_Product1]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES Product ([ProductID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_WishList_Product1_idx] ON WishList ([Product_ProductID] ASC);


-- -----------------------------------------------------
-- Table `Wicked_Candles`.`Transaction`
-- -----------------------------------------------------
CREATE TABLE Transactions (
  [TransactionID] INT NOT NULL,
  [Product_ProductID] INT NOT NULL,
  [ProductName] VARCHAR(45) NOT NULL,
  [ProductPrice] DECIMAL(38) NOT NULL,
  [Quantity] INT NOT NULL,
  PRIMARY KEY ([TransactionID], [Product_ProductID])
 ,
  CONSTRAINT [fk_Transaction_Product1]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES Product ([ProductID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_Transaction_Product1_idx] ON Transactions ([Product_ProductID] ASC);


-- -----------------------------------------------------
-- Table `Wicked_Candles`.`User`
-- -----------------------------------------------------
CREATE TABLE Users (
  [UserID] INT NOT NULL,
  [Name] VARCHAR(100) NOT NULL,
  [PhoneNumber] INT NULL,
  [Email_Address] VARCHAR(100) NOT NULL,
  [Street] VARCHAR(100) NULL,
  [State] VARCHAR(45) NULL,
  [Zip] INT NULL,
  [City] VARCHAR(45) NULL,
  [CC_CCID] INT NOT NULL,
  [Cart_CartID] INT NOT NULL,
  [WishList_WishListID] INT NOT NULL,
  [Transaction_TransactionID] INT NOT NULL,
  PRIMARY KEY ([UserID], [CC_CCID], [Cart_CartID], [WishList_WishListID], [Transaction_TransactionID])
 ,
  CONSTRAINT [fk_User_CC]
    FOREIGN KEY ([CC_CCID])
    REFERENCES CC ([CCID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_Users_Cart1]
    FOREIGN KEY ([Cart_CartID])
    REFERENCES Cart ([CartID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_User_WishList1]
    FOREIGN KEY ([WishList_WishListID])
    REFERENCES WishList ([WishListID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_User_Transaction1]
    FOREIGN KEY ([Transaction_TransactionID])
    REFERENCES Transactions ([TransactionID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_User_CC_idx] ON Users ([CC_CCID] ASC);
CREATE INDEX [fk_User_Cart1_idx] ON Users ([Cart_CartID] ASC);
CREATE INDEX [fk_User_WishList1_idx] ON Users ([WishList_WishListID] ASC);
CREATE INDEX [fk_User_Transaction1_idx] ON Users ([Transaction_TransactionID] ASC);


/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */
