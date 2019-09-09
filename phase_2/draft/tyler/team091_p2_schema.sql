CREATE DATABASE `cs6400_sfa17_team091`;

CREATE TABLE `cs6400_sfa17_team091`.`User`
(
	`email` VARCHAR(256) NOT NULL,
    `username` VARCHAR(128) NOT NULL,
    `first_name` VARCHAR(128) NOT NULL,
    `middle_name` VARCHAR(128) NOT NULL,
    `last_name` VARCHAR(128) NOT NULL,
    `password` VARCHAR(64) NOT NULL,
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

CREATE TABLE `cs6400_sfa17_team091`.`Customer`
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
	`email` VARCHAR(256) NOT NULL,
    `street` VARCHAR(256) NOT NULL,
    `city` VARCHAR(256) NOT NULL,
    `state` VARCHAR(2) NOT NULL,
    `zip_code` VARCHAR(10) NOT NULL,
    `number` BIGINT NOT NULL,
    `name_on_card` VARCHAR(256) NOT NULL,
    `expiration_month` INT NOT NULL,
    `expiration_year` INT NOT NULL,
    `cvc` INT NOT NULL,
    `area_code` INT,
    `phone_number` INT,
    `extension`INT,
    `primary` BOOLEAN,
    
    FOREIGN KEY (`email`)
		REFERENCES `cs6400_sfa17_team091`.`User`(`email`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Generate Tool Report

SELECT
	`tool_number`,
    `short_desc`,
    '$' + CAST(`original_price` as DECIMAL(10,2)) as `original_price`,
    CASE WHEN blah
		 THEN
         ELSE
         WHEN blah
         THEN
         ELSE
         WHEN blah
         THEN
	END as `current_status`
FROM
	`Tools` t
    INNER JOIN `ToolsPowerSource` tps ON t.tool_number = tps.tool_number
    LEFT JOIN `Renting` rn ON t.tool_number = rn.tool_number
    LEFT JOIN `Reservation` rs ON t.tool_number = rs.tool_number
    LEFT JOIN `SaleOrder` sao ON t.tool_number = sao.tool_number
    LEFT JOIN `ServiceOrder` seo ON t.tool_number = seo.tool_number
GROUP BY
    