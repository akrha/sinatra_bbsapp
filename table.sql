CREATE TABLE `comments` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `topic_id` int(11) DEFAULT NULL,
 `body` text,
 `created_at` datetime NOT NULL,
 `updated_at` datetime NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8

CREATE TABLE `topics` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `title` varchar(255) DEFAULT NULL,
 `body` text,
 `created_at` datetime NOT NULL,
 `updated_at` datetime NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8
