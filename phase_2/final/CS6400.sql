CREATE DATABASE `cs6400_sfa17_team091`;

CREATE TABLE `cs6400_sfa17_team091`.`User`
(
	`email` 		VARCHAR(256) 	NOT NULL,
    `username` 		VARCHAR(128) 	NOT NULL,
    `first_name` 	VARCHAR(128) 	NOT NULL,
    `middle_name` 	VARCHAR(128) 	NOT NULL,
    `last_name` 	VARCHAR(128) 	NOT NULL,
    `password` 		VARCHAR(64) 	NOT NULL,
    
    PRIMARY KEY(`email`)
);
    
CREATE TABLE `cs6400_sfa17_team091`.`Customer`
(
	`email` 				VARCHAR(256) 	NOT NULL,
    `add_street` 			VARCHAR(256) 	NOT NULL,
    `add_city` 				VARCHAR(256) 	NOT NULL,
    `add_state` 			VARCHAR(2) 		NOT NULL,
    `add_zip_code` 			VARCHAR(10) 	NOT NULL,
    `cc_number` 			BIGINT 			NOT NULL,
    `cc_name_on_card` 		VARCHAR(256) 	NOT NULL,
    `cc_expiration_month` 	INT 			NOT NULL,
    `cc_expiration_year` 	INT 			NOT NULL,
    `cc_cvc` 				INT 			NOT NULL,
    
    PRIMARY KEY (`email`),
    FOREIGN KEY (`email`)
		REFERENCES `cs6400_sfa17_team091`.`User`(`email`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`CustomerPhoneNumber`
(
	`email`				VARCHAR(256)	NOT NULL,
    `type`				VARCHAR(5)		NOT NULL,
    `area_code` 		INT				NOT NULL,
    `phone_number` 		INT				NOT NULL,
    `extension`			INT				NOT NULL,
    `primary` 			BOOLEAN			NOT NULL,
    
    PRIMARY KEY (`email`, `type`),
    FOREIGN KEY (`email`)
		REFERENCES `cs6400_sfa17_team091`.`Customer`(`email`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`Clerk`
(
	`email` 			VARCHAR(256) NOT NULL,
    `employee_number` 	INT NOT NULL,
    `temp-password` 	VARCHAR(128) NOT NULL,
    `state` 			VARCHAR(2) NOT NULL,
    
    PRIMARY KEY (`email`, `employee_number`),
    FOREIGN KEY (`email`)
		REFERENCES `cs6400_sfa17_team091`.`User`(`email`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`ServiceOrder` (

	service_order_id INT NOT NULL,
    clerk_email 			VARCHAR(256) 	NOT NULL,
    tool_number 			INT 			NOT NULL,
    service_cost 			DOUBLE 			NOT NULL,
    service_start_date 		DATETIME 		NOT NULL,
    service_end_date 		DATETIME 		NOT NULL,
    
    PRIMARY KEY (service_order_id),
    FOREIGN KEY (clerk_email)
		REFERENCES `Clerk`(email)
        ON UPDATE CASCADE
		ON DELETE CASCADE,
    FOREIGN KEY (tool_number)
		REFERENCES `Tool`(tool_number)
        ON UPDATE CASCADE
		ON DELETE CASCADE
);

	
CREATE TABLE `cs6400_sfa17_team091`.`Reservation`
(
	reservationID 	INT 			NOT NULL,
	email 			VARCHAR(256) 	NOT NULL,
	pick_up_date 	DOUBLE 			NOT NULL,
	drop_off_date 	DATETIME 		NOT NULL,
	start_date 		DATETIME 		NOT NULL,
	end_date 		DATETIME 		NOT NULL,

	PRIMARY KEY (`reservationID`),
	FOREIGN KEY (`email`)
		REFERENCES `Clerk`(`email`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`Renting`
(
	reservationID	INT		NOT NULL,
    tool_number		INT		NOT NULL,
    
    PRIMARY KEY (`reservationID`, `tool_number`),
    FOREIGN KEY (`reservationID`)
		REFERENCES `Reservation`(`reservationID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (`tool_number`)
		REFERENCES `Tool`(`tool_number`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`SaleOrder`
(
	tool_number 		INT 			NOT NULL,
    sold_by_email		VARCHAR(256)	NOT NULL,
    purchased_by_email 	VARCHAR(256),
    for_sale_date		DATETIME		NOT NULL,
    sale_date			DATETIME,
    sale_price			DOUBLE,
    
    PRIMARY KEY (`tool_number`, `sold_by_email`),
    FOREIGN KEY (`tool_number`)
		REFERENCES `Tool`(`tool_number`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (`sold_by_email`)
		REFERENCES `Clerk`(`email`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`Tool`
(
	tool_number		INT				NOT NULL,
    tool_type		VARCHAR(64)		NOT NULL,
    sub_type		VARCHAR(64)		NOT NULL,
    sub_option		VARCHAR(64)		NOT NULL,
    material		VARCHAR(128),
    manufacturer	VARCHAR(128)	NOT NULL,
    original_price	DOUBLE			NOT NULL,
    length			DOUBLE			NOT NULL,
    width_diameter	DOUBLE			NOT NULL,
    
    PRIMARY KEY (`tool_number`)
);
	
CREATE TABLE `cs6400_sfa17_team091`.`GardenTool`
(
	tool_number		INT				NOT NULL,
    handle_material	VARCHAR(64)		NOT NULL,
	PRIMARY KEY (`tool_number`),
    FOREIGN KEY (`tool_number`)
		REFERENCES `Tool`(`tool_number`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
	
CREATE TABLE `cs6400_sfa17_team091`.`Digging`
(
	tool_number		INT			NOT NULL,
    blade_length	DOUBLE		NOT NULL,
    blade_width		DOUBLE,
	PRIMARY KEY (`tool_number`),
    FOREIGN KEY (`tool_number`)
		REFERENCES `Tool`(`tool_number`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`Wheelbarrow`
(
	tool_number		INT				NOT NULL,
    bin_material	VARCHAR(64)		NOT NULL,
    bin_volume		DOUBLE,
    wheel_count		INT				NOT NULL,
	PRIMARY KEY (`tool_number`),
    FOREIGN KEY (`tool_number`)
		REFERENCES `Tool`(`tool_number`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`Raking`
(
	tool_number		INT		NOT NULL,
    tine_count		INT		NOT NULL,
	PRIMARY KEY (`tool_number`),
    FOREIGN KEY (`tool_number`)
		REFERENCES `Tool`(`tool_number`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
	
CREATE TABLE `cs6400_sfa17_team091`.`Striking`
(
	tool_number		INT			NOT NULL,
    head_weight		DOUBLE		NOT NULL,
	PRIMARY KEY (`tool_number`),
    FOREIGN KEY (`tool_number`)
		REFERENCES `Tool`(`tool_number`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE `cs6400_sfa17_team091`.`Pruning`
(
	tool_number		INT				NOT NULL,
    blade_material	VARCHAR(64)		NOT NULL,
    blade_length	DOUBLE			NOT NULL,
	PRIMARY KEY (`tool_number`),
    FOREIGN KEY (`tool_number`)
		REFERENCES `Tool`(`tool_number`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
	
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