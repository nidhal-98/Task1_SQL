CREATE TABLE Registration (
AcNo INT Primary Key,FName Varchar(15) Not null,
LName Varchar(15) Not null,DOB Date,
RegDate Date Default GETDATE(),
CivillD int Not null,Gender Char(1) Check (Gender IN ( 'M', 'm', 'F', 'f')), GSM NUMERIC(8,0) Unique,
OpenBal float Check (OpenBal >= 50) 
);

create table Deposits(
DNo int Primary Key,
AcNo int not null,
FOREIGN KEY (AcNo) REFERENCES Registration(AcNo),
DDate Date Default GETDATE(),
DAmount float Not null,
DLocation Varchar(10) Not null 
);

CREATE TABLE Withdrawls (
WNo int Primary Key,
AcNo int not null,
FOREIGN KEY (AcNo) REFERENCES Registration(AcNo),
WDate Date Default GETDATE(),
WAmount FLOAT Not null,
WLocation Varchar(10) Not null 
);

CREATE PROCEDURE Reg_Add_Record_Registration(
@AcNo INT,
@FName Varchar(15),
@LName Varchar(15),
@DOB DATE,
@RegDate DATE,
@CivillD INT,
@Gender Char(1),
@GSM NUMERIC(8,0),
@OpenBal float
)
AS
Begin
	INSERT INTO Registration Values (@AcNo, @FName, @LName, @DOB,@RegDate, @Gender, @GSM, @OpenBal);
	PRINT('record saved sucessfully');
End;

EXEC Reg_Add_Record_Registration 111, 'Nidhal', 'Almamari', '1998-08-13', 11179418, 'M', 93566686, 90