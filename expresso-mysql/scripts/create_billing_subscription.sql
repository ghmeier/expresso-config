CREATE TABLE billing_subscription(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	userId VARCHAR(36) NOT NULL,
	subscriptionId VARCHAR(36) NOT NULL,
	planId VARCHAR(48) NOT NULL,
	amount FLOAT(10, 2),
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	due_at TIMESTAMP
);