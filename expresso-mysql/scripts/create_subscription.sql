DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	userId VARCHAR(36) NOT NULL, FOREIGN KEY (userId) REFERENCES towncenter.user (id) ON UPDATE CASCADE,
	status VARCHAR(48) NOT NULL,
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	frequency VARCHAR(36) NOT NULL,
	roasterId VARCHAR(36) NOT NULL, FOREIGN KEY (roasterId) REFERENCES towncenter.roaster(id) ON UPDATE CASCADE,
	itemId VARCHAR(36) NOT NULL, FOREIGN KEY (itemId) REFERENCES warehouse.item(id) ON UPDATE CASCADE
);