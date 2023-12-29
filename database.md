# 数据库表设计

## 博客表（blog）

| 列名          | 数据类型         | 描述                                       |
| ------------- | ---------------- | ------------------------------------------ |
| id            | INT              | 博客的唯一标识，主键                       |
| title         | VARCHAR(255)     | 博客的标题                                 |
| content       | TEXT             | 博客的内容                                 |
| author_id     | INT              | 发布博客的用户的ID，外键（引用用户表的id） |
| created_at    | DATETIME         | 博客的创建时间                             |
| updated_at    | DATETIME         | 博客的更新时间                             |
| status        | ENUM('draft', 'published') | 博客的状态，可以是草稿（draft）或已发布（published） |
| view_count    | INT              | 博客的浏览次数                             |
| comment_count | INT              | 博客的评论次数                             |

## 用户表（user）

| 列名       | 数据类型            | 描述             |
| ---------- |-----------------| ---------------- |
| id         | INT             | 用户的唯一标识，主键 |
| username   | VARCHAR(255)    | 用户名           |
| password   | VARCHAR(255)    | 用户的密码       |
| email      | VARCHAR(255)    | 用户的电子邮件     |
| telephone  | VARCHAR(20)     | 用户的电话号码     |
 | gender     | ENUM('男', '女')  | 用户的性别       |
| created_at | DATETIME        | 用户的创建时间     |
| updated_at | DATETIME        | 用户的更新时间     |



CREATE TABLE `user` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL,
`email` VARCHAR(255),
`telephone` VARCHAR(20),
`gender` ENUM('男', '女'),
`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `Blog` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`title` VARCHAR(255) NOT NULL,
`content` TEXT NOT NULL,
`author_id` INT,
`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`status` ENUM('draft', 'published') DEFAULT 'draft',
`view_count` INT DEFAULT 0,
`comment_count` INT DEFAULT 0,
FOREIGN KEY (`author_id`) REFERENCES `User` (`id`)
);