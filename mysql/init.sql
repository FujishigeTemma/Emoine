CREATE TABLE IF NOT EXISTS state
(
    id        SMALLINT UNSIGNED AUTO_INCREMENT,
    status    TINYTEXT NOT NULL,
    info      TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

# 初期値
INSERT INTO state (status, info) VALUES ('pause', '準備中...');

CREATE TABLE IF NOT EXISTS presentation
(
    id          SMALLINT UNSIGNED AUTO_INCREMENT,
    name        TEXT,
    speakers    TEXT,
    description TEXT,
    prev        SMALLINT,
    next        SMALLINT,
    createdAt   DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt   DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS reaction
(
    id             SMALLINT UNSIGNED AUTO_INCREMENT,
    userId         VARCHAR(36)       NOT NULL,
    presentationId SMALLINT UNSIGNED NOT NULL,
    stamp          TINYINT,
    createdAt      DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS comment
(
    id             SMALLINT UNSIGNED AUTO_INCREMENT,
    userId         VARCHAR(36)       NOT NULL,
    presentationId SMALLINT UNSIGNED NOT NULL,
    text           TEXT,
    createdAt      DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS review
(
    userId         VARCHAR(36),
    presentationId SMALLINT UNSIGNED NOT NULL,
    createdAt      DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt      DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`userId`, `presentationId`)
);
