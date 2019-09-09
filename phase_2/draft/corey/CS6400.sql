CREATE TABLE 'User'(
	Email varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	MiddleName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Username varchar(50) NOT NULL,
	Password varchar(50) NOT NULL,
	PRIMARY KEY (Email));
	
CREATE TABLE 'Clerk'(
	Email varchar(50) NOT NULL,
	EmployeeNumber varchar(50) NOT NULL,
	TempPassword varchar(50) NOT NULL,
	DateOfHire datetime NOT NULL,
	PRIMARY KEY (EmployeeNumber),
	FOREIGN Key (Email));
	
CREATE TABLE 'Customer'(
	Email varchar(50) NOT NULL,
	CCNumber varchar(50) NOT NULL,
	CCNameOnCard varchar(50) NOT NULL,
	CCExpirationMonth varchar(50) NOT NULL,
	CCExpirationYear varchar(50) NOT NULL,
	CCCVC int(16) NOT NULL,
	AddStreet varchar(50) NOT NULL,
	AddCity varchar(50) NOT NULL,
	AddState varchar(50) NOT NULL,
	AddZipCode int(16) NOT NULL,
	PhNumAreaCode int (16) NOT NULL,
	PhNumPhNum int(16) NOT NULL,
	PhNumExt int(16) NOT NULL,
	PhNumPri int(16) NOT NULL,
	PRIMARY KEY (Email));
	
CREATE TABLE 'Service Order'(
	Email varchar(50) NOT NULL,
	ServOrdID int(16) NOT NULL,
	ServCost double(16) NOT NULL,
	ServStart datetime NOT NULL;
	ServEnd datetime NOT NULL;
	PRIMARY KEY (ServOrdID),
	FOREIGN KEY (Email));


-- FROM TYLER:
-- Here is an example table using the formatting rules provided on the Deliverables document
-- and additional details on the foreign key constraints.

CREATE TABLE ``.`ServiceOrder` (
	service_order_id int NOT NULL,
    clerk_email varchar(256) NOT NULL,
    tool_number int NOT NULL,
    service_cost double NOT NULL,
    service_start_date datetime NOT NULL,
    service_end_date datetime NOT NULL,
    PRIMARY KEY (service_order_id),
    FOREIGN KEY (clerk_email) REFERENCES `Clerk`(email),
    FOREIGN KEY (tool_number) REFERENCES `Tool`(tool_number)
);

-- END FROM TYLER

	
CREATE TABLE 'Reservation'(
	Email varchar(50) NOT NULL,
	ReservID int(16) NOT NULL,
	PickUp double(16) NOT NULL,
	DropOff datetime NOT NULL;
	StartDate datetime NOT NULL;
	EndDate datetime NOT NULL;
	Tool varchar(50) NOT NULL;
	SubOption varchar(50) NOT NULL,
	SubT varchar(50) NOT NULL,
	ToolType varchar(50) NOT NULL,
	PRIMARY KEY (ServOrdID),
	FOREIGN KEY (Email));

CREATE TABLE 'Sale Order'(
	ForSaleDate datetime NOT NULL,
	SaleDate datetime NOT NULL,
	SalePrice double(16) NOT NULL);	
	
CREATE TABLE 'Tool'(
	ToolNumber int(16) NOT NULL,
	SubOption varchar(50) NOT NULL,
	SubT varchar(50) NOT NULL,
	ForSale boolean NOT NULL,
	ToolType varchar(50) NOT NULL,
	Material varchar(50) NOT NULL,
	OrigPrice double(16) NOT NULL,
	ToolLen double(16) NOT NULL,
	WidthDia double(16) NOT NULL,
	PowerSource varchar(50) NOT NULL,
	ForRent int(16) NOT NULL,
	PRIMARY KEY (ToolNumber));
	
CREATE TABLE 'Garden Tool'(
	ToolNumber int(16) NOT NULL,
	HandleMaterial varchar(50) NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Digging'(
	ToolNumber int(16) NOT NULL,
	BladeLength varchar(50) NOT NULL,
	Blade varchar(50) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Wheel Barrow'(
	ToolNumber int(16) NOT NULL,
	BinMaterial varchar(50) NOT NULL,
	BinVolume varchar(50) NOT NULL,
	WheelCount int(16) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Raking'(
	ToolNumber int(16) NOT NULL,
	TimeCount int(16)) NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Striking'(
	ToolNumber int(16) NOT NULL,
	HeadWeight int(16) NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Pruning'(
	ToolNumber int(16) NOT NULL,
	BladeMaterial varchar(50) NOT NULL,
	BladeLength varchar(50) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Hand Tool'(
	ToolNumber int(16) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Hand Socket'(
	ToolNumber int(16) NOT NULL,
	SaeSize int(16) NOT NULL,
	DriveSize int(16) NOT NULL,
	DeepSocket boolean NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Hand Screwdriver'(
	ToolNumber int(16) NOT NULL,
	ScrewSize int(16)) NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Hand Rachet'(
	ToolNumber int(16) NOT NULL,
	DriveSize int(16)) NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Hand Plier'(
	ToolNumber int(16) NOT NULL,
	Adjustable boolean NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Hand Hammer'(
	ToolNumber int(16) NOT NULL,
	AntiVibration boolean NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Hand Gun'(
	ToolNumber int(16) NOT NULL,
	GaugeRating varchar(50) NOT NULL,
	Capacity varchar(50) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Power Tool'(
	ToolNumber int(16) NOT NULL,
	AmpRating varchar(50) NOT NULL,
	VoltRating varchar(50) NOT NULL,
	MaxRPMRating varchar(50) NOT NULL,
	MinRPMRating varchar(50) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Power Drill'(
	ToolNumber int(16) NOT NULL,
	MaxTorqueRating varchar(50) NOT NULL,
	MinTorqueRating varchar(50) NOT NULL,
	AdjClutch varchar(50) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Power Saw'(
	ToolNumber int(16) NOT NULL,
	BladeSize int(16) NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Power Sander'(
	ToolNumber int(16) NOT NULL,
	DustBag boolean NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Power Generator'(
	ToolNumber int(16) NOT NULL,
	PowerRating int(16) NOT NULL, 
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Power Air Compressor'(
	ToolNumber int(16) NOT NULL,
	TankSize double(16) NOT NULL,
	PressureRating int(16) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Power Air Compressor'(
	ToolNumber int(16) NOT NULL,
	DrumSize double(16) NOT NULL,
	MotorRating int(16) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'DC Cordless'(
	ToolNumber int(16) NOT NULL,
	FOREIGN KEY(ToolNumber));
	
CREATE TABLE 'Tool Accessory'(
	AccessoryName varchar(50) NOT NULL,
	AccessQuan int(16) NOT NULL,
	AccessDesc varchar(50) NOT NULL);
	
CREATE TABLE 'Battery'(
	Voltage double(16) NOT NULL,
	Amperage double(16) NOT NULL;
	
--Check Tool Availability
SELECT ToolNumber, SubOption, SubT, ForRent, ToolType, Material, ToolLen FROM 'Tool'
INNER JOIN 'Reservation' ON 'Tool'.SubOption='Reservation'.SubOption AND 'Tool'.SubT='Reservation'.SubT AND 'Tool'.ToolType='Reservation'.ToolType

--Make Reservation
UPDATE 'Reservation' SET email='$UserID', tooltype='$ToolType', StartDate='$StartDate', EndDate='$EndDate' 

--Purchase Tool
UPDATE 'Sale Order' SET SaleDate=datetime
DELETE FROM 'Tool' WHERE Tool.ToolNumber='$ToolNumber'