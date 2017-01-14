CREATE TABLE customer_account(
	id VARCHAR(36) NOT NULL PRIMARY KEY,
	userId VARCHAR(36) NOT NULL,
	stripeCustomerId VARCHAR(48) NOT NULL,
	stripeCardId VARCHAR(48),
	stripeSubscriptionId VARCHAR(48),
	stripePlanId VARCHAR(48)
);