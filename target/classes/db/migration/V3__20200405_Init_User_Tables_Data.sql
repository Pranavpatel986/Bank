--
-- Table structure for table user
--

DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    user_id            bigint(20) NOT NULL AUTO_INCREMENT,
    email              varchar(255) NOT NULL,
    enabled            bit(1)       NOT NULL,
    first_name         varchar(255) DEFAULT NULL,
    last_name          varchar(255) DEFAULT NULL,
    password           varchar(255) DEFAULT NULL,
    phone              varchar(255) DEFAULT NULL,
    username           varchar(255) DEFAULT NULL,
    primary_account_id bigint(20) DEFAULT NULL,
    savings_account_id bigint(20) DEFAULT NULL,
    PRIMARY KEY (user_id),
    UNIQUE KEY UK_ob8kqyqqgmefl0aco34akdtpe (email),
    KEY                FKbj0uoj9i40dory8w4t5ojyb9n(primary_account_id),
    KEY                FKihums7d3g5cv9ehminfs1539e(savings_account_id),
    CONSTRAINT FKbj0uoj9i40dory8w4t5ojyb9n FOREIGN KEY (primary_account_id) REFERENCES primary_account (id),
    CONSTRAINT FKihums7d3g5cv9ehminfs1539e FOREIGN KEY (savings_account_id) REFERENCES savings_account (id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table user
--

LOCK TABLES user WRITE;
INSERT INTO user
VALUES (1, 'patelpranav986@gmail.com', '', 'Pranav', 'Patel',
        '$2a$12$LtbYtEzOBdnsiD/E9Wtj2OfisOTyGV1PANy5rWMH7dZOBoN/vKgbu', '5551112345', 'User', 1, 1),
       (2, 'pranavpatel986@gmail.com', '', 'Pranav', 'Patel',
        '$2a$12$LtbYtEzOBdnsiD/E9Wtj2OfisOTyGV1PANy5rWMH7dZOBoN/vKgbu',
        '1111111111', 'Admin', 2, 2);
UNLOCK TABLES;

