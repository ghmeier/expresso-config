CREATE TABLE roaster_account(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	userId VARCHAR(36) NOT NULL,
	stripeAccountId VARCHAR(48) NOT NULL
);