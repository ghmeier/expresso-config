CREATE DATABASE IF NOT EXISTS towncenter;
USE towncenter;
CREATE TABLE roaster(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	email VARCHAR(200) NOT NULL,
	phone VARCHAR(12),
	addressLine1 VARCHAR(200) NOT NULL,
	addressLine2 VARCHAR(200) NOT NULL,
	addressCity VARCHAR(30) NOT NULL,
	addressState VARCHAR(30) NOT NULL,
	addressZip VARCHAR(10) NOT NULL,
	addressCountry VARCHAR(20) NOT NULL
);
CREATE TABLE user(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	passHash VARCHAR(60) NOT NULL,
	firstName VARCHAR(20) NOT NULL,
	lastName VARCHAR(20) NOT NULL,
	email VARCHAR(200) NOT NULL,
	phone VARCHAR(12),
	addressLine1 VARCHAR(200) NOT NULL,
	addressLine2 VARCHAR(200) NOT NULL,
	addressCity VARCHAR(30) NOT NULL,
	addressState VARCHAR(30) NOT NULL,
	addressZip VARCHAR(10) NOT NULL,
	addressCountry VARCHAR(20) NOT NULL,
	roasterId VARCHAR(36),
	isRoaster SMALLINT
);
CREATE TABLE token(
	value VARCHAR(36) NOT NULL,
	email VARCHAR(200) NOT NULL PRIMARY KEY,
	createdAt TIMESTAMP NOT NULL,
	status VARCHAR(20)
);
CREATE DATABASE IF NOT EXISTS bloodlines;
USE bloodlines;
CREATE TABLE content(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	contentType VARCHAR(20) NOT NULL,
	text varchar(4096) NOT NULL,
	parameters VARCHAR(1024),
	status VARCHAR(20) NOT NULL,
	subject varchar(1024)
);
CREATE TABLE job(
	sendTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	sendStatus VARCHAR(20) NOT NULL,
	receipts VARCHAR(4096) NOT NULL
);
CREATE TABLE preference(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	email VARCHAR(20) NOT NULL,
	userId VARCHAR(36) NOT NULL
);
CREATE TABLE receipt(
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	finished TIMESTAMP,
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	sendState VARCHAR(20) NOT NULL,
	vals VARCHAR(4096) NOT NULL,
	contentId VARCHAR(36) NOT NULL, FOREIGN KEY fk_content(contentId) REFERENCES content(id),
	userId VARCHAR(36) NOT NULL
);
CREATE TABLE b_trigger(
	id VARCHAR(36) NOT NULL,
	tkey VARCHAR(1024) NOT NULL,
	vals VARCHAR(4096) NOT NULL,
	contentId  VARCHAR(36) NOT NULL, FOREIGN KEY fk_triggercontent(contentId) REFERENCES content(id),
	PRIMARY KEY (id)
);

CREATE DATABASE IF NOT EXISTS billing;
USE billing;
CREATE TABLE roaster_account(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	stripeAccountId VARCHAR(48) NOT NULL
);
CREATE TABLE plan(
	roasterId VARCHAR(36) NOT NULL, FOREIGN KEY fk_roasterplan(roasterId) REFERENCES roaster_acount(id)
	planId VARCHAR(2048) NOT NULL
);
CREATE TABLE customer_account(
	userId VARCHAR(36) NOT NULL,
	stripeCustomerId VARCHAR(48) NOT NULL
);

CREATE DATABASE IF NOT EXISTS warehouse;
USE warehouse;
CREATE TABLE item(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	roasterID VARCHAR(36) NOT NULL,
	name VARCHAR(100) NOT NULL,
	pictureURL VARCHAR(200),
	coffeeType VARCHAR(100) NOT NULL,
	inStockBags INTEGER NOT NULL,
	providerPrice DECIMAL(5,2) NOT NULL,
	consumerPrice DECIMAL(5,2) NOT NULL,
	ozInBag DECIMAL(5,2) NOT NULL,
	description VARCHAR(2048),
	isDecaf bit(1) NOT NULL DEFAULT 0,
	isActive bit(1) NOT NULL DEFAULT 1,
	tags VARCHAR(2048),
	createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updatedAt TIMESTAMP NOT NULL
);
CREATE TABLE orderT(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	userID VARCHAR(36) NOT NULL,
	subscriptionID VARCHAR(36) NOT NULL,
	requestDate TIMESTAMP NOT NULL,
	shipDate TIMESTAMP
);
CREATE TABLE suborder(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	orderID VARCHAR(36) NOT NULL,
	itemID VARCHAR(36) NOT NULL,
	quantity INTEGER NOT NULL
);
CREATE DATABASE IF NOT EXISTS covenant;
USE covenant;
CREATE TABLE subscription(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	userId VARCHAR(36) NOT NULL, FOREIGN KEY (userId) REFERENCES towncenter.user (id) ON UPDATE CASCADE,
	status VARCHAR(48) NOT NULL,
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	frequency VARCHAR(36) NOT NULL,
	roasterId VARCHAR(36) NOT NULL, FOREIGN KEY (roasterId) REFERENCES towncenter.roaster(id) ON UPDATE CASCADE,
	itemId VARCHAR(36) NOT NULL, FOREIGN KEY (itemId) REFERENCES warehouse.item(id) ON UPDATE CASCADE,
	quantity INTEGER NOT NULL
);
