CREATE DATABASE IF NOT EXISTS `blogadmindb`;

USE blogadmindb;

CREATE TABLE `user`
(
    `id`         INT PRIMARY KEY AUTO_INCREMENT,
    `username`   VARCHAR(255) NOT NULL,
    `password`   VARCHAR(255) NOT NULL,
    `email`      VARCHAR(255),
    `telephone`  VARCHAR(20),
    `gender`     ENUM ('男', '女'),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `blog`
(
    `id`            INT PRIMARY KEY AUTO_INCREMENT,
    `title`         VARCHAR(255) NOT NULL,
    `content`       TEXT         NOT NULL,
    `author_id`     INT,
    `created_at`    DATETIME                    DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    DATETIME                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `status`        ENUM ('draft', 'published') DEFAULT 'draft',
    `view_count`    INT                         DEFAULT 0,
    `comment_count` INT                         DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES user (id)
);

CREATE TABLE `admin`
(
    `id`       INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
    `password` VARCHAR(20) NOT NULL
);

insert into admin (username, password)
values ('admin', 'admin');

INSERT INTO `user` (`username`, `password`, `email`, `telephone`, `gender`)
VALUES ('john_doe', 'password123', 'john_doe@qq.com', '13012345678', '男'),
       ('jane_smith', 'password456', 'jane_smith@163.com', '13345678901', '女'),
       ('mike_jones', 'password789', 'mike_jones@gmail.com', '13678901234', '男'),
       ('emily_davis', 'passwordabc', 'emily_davis@qq.com', '13901234567', '女'),
       ('david_miller', 'passworddef', 'david_miller@gmail.com', '15234567890', '男'),
       ('sarah_wilson', 'passwordghi', 'sarah_wilson@gmail.com', '15567890123', '女'),
       ('kevin_brown', 'passwordjkl', 'kevin_brown@qq.com', '15890123456', '男'),
       ('lisa_taylor', 'passwordmno', 'lisa_taylor@gmail.com', '17123456789', '女'),
       ('steven_clark', 'passwordpqr', 'steven_clark@163.com', '17456789012', '男'),
       ('olivia_thomas', 'passwordstu', 'olivia_thomas@163.com', '17789012345', '女'),
       ('ryan_roberts', 'passwordvwx', 'ryan_roberts@163.com', '17678901234', '男'),
       ('chloe_hall', 'passwordyz1', 'chloe_hall@163.com', '13123456789', '女'),
       ('eric_wood', 'password234', 'eric_wood@163.com', '13456789012', '男'),
       ('natalie_evans', 'password567', 'natalie_evans@qq.com', '13789012345', '女'),
       ('jason_carter', 'password890', 'jason_carter@qq.com', '15012345678', '男'),
       ('amanda_hill', 'passwordabc', 'amanda_hill@gmail.com', '15345678901', '女'),
       ('justin_scott', 'passworddef', 'justin_scott@qq.com', '15678901234', '男'),
       ('hannah_green', 'passwordghi', 'hannah_green@qq.com', '15901234567', '女'),
       ('peter_adams', 'passwordjkl', 'peter_adams@gmail.com', '17234567890', '男'),
       ('katie_wright', 'passwordmno', 'katie_wright@qq.com', '17567890123', '女'),
       ('brandon_morris', 'passwordpqr', 'brandon_morris@gmail.com', '17890123456', '男'),
       ('jessica_ross', 'passwordstu', 'jessica_ross@163.com', '13234567890', '女'),
       ('adam_bell', 'passwordvwx', 'adam_bell@163.com', '13567890123', '男'),
       ('lauren_watson', 'passwordyz1', 'lauren_watson@qq.com', '13890123456', '女'),
       ('jacob_cook', 'password234', 'jacob_cook@gmail.com', '15123456789', '男'),
       ('megan_long', 'password567', 'megan_long@gmail.com', '15456789012', '女'),
       ('nathan_reed', 'password890', 'nathan_reed@gmail.com', '15789012345', '男'),
       ('sophia_murphy', 'passwordabc', 'sophia_murphy@gmail.com', '17012345678', '女'),
       ('tyler_ward', 'passworddef', 'tyler_ward@qq.com', '17345678901', '男');

INSERT INTO blog (title, content, author_id, status, view_count, comment_count)
VALUES ('如何学习编程', '学习编程的步骤和方法', 125, 'published', 100, 20),
       ('美食文化探索', '各地美食文化的特色介绍', 127, 'published', 150, 30),
       ('旅行中的收获', '旅行带给我的心灵启发', 126, 'published', 80, 15),
       ('编程语言比较', '不同编程语言的优缺点分析', 128, 'published', 120, 25),
       ('家常菜做法分享', '简单易学的家常菜做法', 129, 'published', 90, 18),
       ('编程技术进阶', '提升编程技术的方法和技巧', 130, 'published', 110, 22),
       ('美食摄影分享', '美食摄影的技巧和分享', 131, 'published', 130, 26),
       ('健康生活指南', '保持健康的生活习惯和方法', 132, 'published', 70, 14),
       ('编程职业发展', '编程行业的职业规划和发展', 133, 'published', 140, 28),
       ('世界各地旅行', '世界各地旅行见闻和感悟', 134, 'published', 160, 32),
       ('烘焙技巧分享', '烘焙技巧和心得分享', 135, 'published', 95, 19),
       ('编程项目实战', '实际编程项目的经验分享', 136, 'published', 105, 21),
       ('异国风情美食', '异国美食的特色和魅力', 137, 'published', 125, 25),
       ('健身锻炼指南', '科学的健身锻炼方法和建议', 138, 'published', 75, 15),
       ('编程技术分享', '编程技术的心得和分享', 139, 'published', 115, 23),
       ('美食小吃探店', '城市美食小吃的探店分享', 140, 'published', 135, 27),
       ('心灵成长感悟', '心灵成长的感悟和体会', 141, 'published', 85, 17),
       ('编程学习心得', '编程学习的心得和体会', 142, 'published', 145, 29),
       ('甜品制作技巧', '各种甜品制作的技巧和方法', 143, 'published', 165, 33),
       ('户外运动体验', '户外运动的乐趣和体验', 144, 'published', 100, 20),
       ('编程入门指南', '编程初学者的入门指南', 145, 'published', 120, 24),
       ('地方美食推荐', '各地特色美食的推荐和介绍', 146, 'published', 150, 30),
       ('旅行中的美景', '旅行中的美丽风景和感受', 147, 'published', 80, 16),
       ('编程技术探讨', '编程技术的深入探讨和分析', 148, 'published', 110, 22),
       ('家常菜做法分享', '简单易学的家常菜做法', 149, 'published', 90, 18),
       ('编程技术进阶', '提升编程技术的方法和技巧', 150, 'published', 100, 20),
       ('美食摄影分享', '美食摄影的技巧和分享', 151, 'published', 130, 26),
       ('健康生活指南', '保持健康的生活习惯和方法', 152, 'published', 70, 14),
       ('编程职业发展', '编程行业的职业规划和发展', 153, 'published', 140, 28),
       ('世界各地旅行', '世界各地旅行见闻和感悟', 153, 'published', 160, 32);

