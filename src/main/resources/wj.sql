-- 设置编码（PostgreSQL 一般默认是 UTF8，无需手动设置）
-- 本文件使用 UTF8 编码

-- ----------------------------
-- Table structure for admin
-- ----------------------------
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "user" CASCADE;
CREATE TABLE IF NOT EXISTS "user" (
                                      id SERIAL PRIMARY KEY,
                                      username VARCHAR(255) NOT NULL,
                                      password VARCHAR(255),
                                      salt VARCHAR(255),
                                      name VARCHAR(255),
                                      phone VARCHAR(255),
                                      email VARCHAR(255),
                                      enabled BOOLEAN
);

BEGIN;
INSERT INTO "user" (username, password, salt, name, phone, email, enabled) VALUES
                                                                               ('admin', '35b9529f89cfb9b848060ca576237e17', '8O+vDNr2sI3N82BI31fu1A==', '管理员', '12312312312', 'evan_nightly@163.com', true),
                                                                               ('test', '85087738b6c1e1d212683bfafc163853', 'JBba3j5qRykIPJQYTNNH9A==', '测试', '12312312312', '123@123.com', true),
                                                                               ('editor', '8b31d7c0f3a07a735a7a8f9e5931aabc', 'Xk0VJ22NzszSu+N7+9gvUg==', '编辑', '12312312312', 'editor@example.com', false);

COMMIT;


DROP TABLE IF EXISTS admin CASCADE;
CREATE TABLE IF NOT EXISTS admin (
                                     id SERIAL PRIMARY KEY,
                                     user_id INTEGER NOT NULL UNIQUE,
                                     name VARCHAR(255),
                                     phone VARCHAR(255),
                                     email VARCHAR(255),
                                     CONSTRAINT fk_admin_user FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE
);

BEGIN;

INSERT INTO "admin" ("id", "user_id", "name", "phone", "email") VALUES (1, 1, '管理员', '12312312312', 'evan_nightly@163.com');
INSERT INTO "admin" ("id", "user_id", "name", "phone", "email") VALUES (2, 2, '测试', '12312312312', '123@123.com');
INSERT INTO "admin" ("id", "user_id", "name", "phone", "email") VALUES (3, 3, '编辑', NULL, NULL);

COMMIT;


-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS admin_menu CASCADE;
CREATE TABLE IF NOT EXISTS admin_menu (
                                          id SERIAL PRIMARY KEY,
                                          path VARCHAR(64),
                                          name VARCHAR(64),
                                          name_zh VARCHAR(64),
                                          icon_cls VARCHAR(64),
                                          component VARCHAR(64),
                                          parent_id INTEGER
);

BEGIN;

INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (1, '/admin', 'AdminIndex', '首页', 'el-icon-s-home', 'AdminIndex', 0);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (2, '/admin/dashboard', 'DashboardAdmin', '运行情况', NULL, 'dashboard/admin/index', 1);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (3, '/admin', 'User', '用户管理', 'el-icon-user', 'AdminIndex', 0);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (4, '/admin', 'Content', '内容管理', 'el-icon-tickets', 'AdminIndex', 0);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (5, '/admin', 'System', '系统配置', 'el-icon-s-tools', 'AdminIndex', 0);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (6, '/admin/user/profile', 'Profile', '用户信息', NULL, 'user/UserProfile', 3);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (7, '/admin/user/role', 'Role', '角色配置', NULL, 'user/Role', 3);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (8, '/admin/content/book', 'BookManagement', '作业管理', NULL, 'content/BookManagement', 4);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (9, '/admin/content/banner', 'BannerManagement', '成绩管理', NULL, 'content/BannerManagement', 4);
INSERT INTO "admin_menu" ("id", "path", "name", "name_zh", "icon_cls", "component", "parent_id") VALUES (10, '/admin/content/article', 'ArticleManagement', '成绩统计', NULL, 'content/ArticleManagement', 4);

COMMIT;


-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS admin_permission CASCADE;
CREATE TABLE IF NOT EXISTS admin_permission (
                                                id SERIAL PRIMARY KEY,
                                                name VARCHAR(100),
                                                desc_ VARCHAR(100),
                                                url VARCHAR(100)
);

BEGIN;

ALTER TABLE admin_permission DISABLE TRIGGER ALL;
INSERT INTO "admin_permission" ("id", "name", "desc_", "url") VALUES (1, 'users_management', '用户管理', '/api/admin/user');
INSERT INTO "admin_permission" ("id", "name", "desc_", "url") VALUES (2, 'roles_management', '角色管理', '/api/admin/role');
INSERT INTO "admin_permission" ("id", "name", "desc_", "url") VALUES (3, 'content_management', '内容管理', '/api/admin/content');
ALTER TABLE admin_permission ENABLE TRIGGER ALL;

COMMIT;


-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS admin_role CASCADE;
CREATE TABLE IF NOT EXISTS admin_role (
                                          id SERIAL PRIMARY KEY,
                                          name VARCHAR(100),
                                          name_zh VARCHAR(100),
                                          enabled BOOLEAN
);

BEGIN;

ALTER TABLE admin_role DISABLE TRIGGER ALL;
INSERT INTO admin_role (id, name, name_zh, enabled) VALUES (1, 'sysAdmin', '系统管理员', true);
INSERT INTO admin_role (id, name, name_zh, enabled) VALUES (2, 'contentManager', '内容管理员', true);
INSERT INTO admin_role (id, name, name_zh, enabled) VALUES (3, 'visitor', '访客', true);
INSERT INTO admin_role (id, name, name_zh, enabled) VALUES (9, 'test', '测试角色', true);
ALTER TABLE admin_role ENABLE TRIGGER ALL;

COMMIT;



-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS admin_role_menu CASCADE;
CREATE TABLE IF NOT EXISTS admin_role_menu (
                                               id SERIAL PRIMARY KEY,
                                               rid INTEGER,
                                               mid INTEGER
);

BEGIN;

ALTER TABLE admin_role_menu DISABLE TRIGGER ALL;
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (19, 4, 1);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (20, 4, 2);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (21, 3, 1);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (22, 3, 2);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (23, 9, 1);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (24, 9, 2);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (77, 2, 1);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (78, 2, 2);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (79, 2, 4);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (80, 2, 8);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (81, 2, 9);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (82, 2, 10);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (121, 1, 1);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (122, 1, 2);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (123, 1, 3);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (124, 1, 6);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (125, 1, 7);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (126, 1, 4);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (127, 1, 8);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (128, 1, 9);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (129, 1, 10);
INSERT INTO "admin_role_menu" ("id", "rid", "mid") VALUES (130, 1, 5);
ALTER TABLE admin_role_menu ENABLE TRIGGER ALL;

COMMIT;


-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS admin_role_permission CASCADE;
CREATE TABLE IF NOT EXISTS admin_role_permission (
                                                     id SERIAL PRIMARY KEY,
                                                     rid INTEGER,
                                                     pid INTEGER,
                                                     CONSTRAINT fk_role_permission_role FOREIGN KEY (rid) REFERENCES admin_role (id),
                                                     CONSTRAINT fk_role_permission_permission FOREIGN KEY (pid) REFERENCES admin_permission (id)
);

BEGIN;
ALTER TABLE admin_role_permission DISABLE TRIGGER ALL;
INSERT INTO "admin_role_permission" ("id", "rid", "pid") VALUES (83, 5, 3);
INSERT INTO "admin_role_permission" ("id", "rid", "pid") VALUES (97, 2, 3);
INSERT INTO "admin_role_permission" ("id", "rid", "pid") VALUES (108, 1, 1);
INSERT INTO "admin_role_permission" ("id", "rid", "pid") VALUES (109, 1, 2);
INSERT INTO "admin_role_permission" ("id", "rid", "pid") VALUES (110, 1, 3);
ALTER TABLE admin_role_permission ENABLE TRIGGER ALL;
COMMIT;


-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS admin_user_role CASCADE;
CREATE TABLE IF NOT EXISTS admin_user_role (
                                               id SERIAL PRIMARY KEY,
                                               uid INTEGER,
                                               rid INTEGER,
                                               CONSTRAINT fk_operator_role_user FOREIGN KEY (uid) REFERENCES "user" (id),
                                               CONSTRAINT fk_operator_role_role FOREIGN KEY (rid) REFERENCES admin_role (id)
);

BEGIN;

ALTER TABLE admin_user_role DISABLE TRIGGER ALL;
INSERT INTO "admin_user_role" ("id", "uid", "rid") VALUES (40, 24, 2);
INSERT INTO "admin_user_role" ("id", "uid", "rid") VALUES (63, 3, 2);
INSERT INTO "admin_user_role" ("id", "uid", "rid") VALUES (64, 1, 1);
INSERT INTO "admin_user_role" ("id", "uid", "rid") VALUES (65, 2, 3);
INSERT INTO "admin_user_role" ("id", "uid", "rid") VALUES (66, 2, 9);
ALTER TABLE admin_user_role ENABLE TRIGGER ALL;

COMMIT;


-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS book CASCADE;
CREATE TABLE IF NOT EXISTS book (
                                    id SERIAL PRIMARY KEY,
                                    cover VARCHAR(255) DEFAULT '',
                                    title VARCHAR(255) NOT NULL DEFAULT '',
                                    author VARCHAR(255) DEFAULT '',
                                    date VARCHAR(20) DEFAULT '',
                                    press VARCHAR(255) DEFAULT '',
                                    abs VARCHAR(255),
                                    cid INTEGER,
                                    CONSTRAINT fk_book_category FOREIGN KEY (cid) REFERENCES category (id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS category CASCADE;
CREATE TABLE IF NOT EXISTS category (
                                        id INTEGER PRIMARY KEY,
                                        name VARCHAR(255) NOT NULL
);

-- ----------------------------
-- Enum type for grade category
-- ----------------------------
DO $$ BEGIN
    CREATE TYPE grade_category AS ENUM ('主观题', '客观题', '半开放');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS grade CASCADE;
CREATE TABLE IF NOT EXISTS grade (
                                     student_id INTEGER NOT NULL,
                                     homework_id INTEGER NOT NULL,
                                     score NUMERIC(5,2),
                                     completed BOOLEAN NOT NULL,
                                     category grade_category NOT NULL,
                                     homework_name VARCHAR(255) NOT NULL,
                                     description TEXT,
                                     cross_check BOOLEAN DEFAULT FALSE,
                                     PRIMARY KEY (student_id, homework_id)
);

BEGIN;

ALTER TABLE grade DISABLE TRIGGER ALL;
INSERT INTO "grade" ("student_id", "homework_id", "score", "completed", "category", "homework_name", "description", "cross_check")
VALUES
    (1, 979, 78.00, true, '半开放', 'Evelyn', 'e.', FALSE),
    (2, 2, 85.00, true, '主观题', '数据库作业02_范式设计', '85\n\n整体评分为85分。评分依据如下：\n\n1. **数据库设计的合理性（35/40）**:\n   - 数据库结构清晰，包含了书籍、用户和借阅记录三张主要表，覆盖了基本需求。\n   - 使用了主键和外键，确保数据完整性。\n   - 对借阅状态应用了检查约束，增强了数据的有效性。\n   - 然而，对于图书的“可借阅数量”字段，可能需要更明确的设计，比如与实际借阅记录进行更有效的关系设置以动态更新可借阅数量，增添了一定的复杂性。\n\n2. **SQL查询的正确性（30/30）**:\n   - 所有的SQL查询均能准确反映需求功能，并且符合SQL的语法规范。\n   - 查询逻辑清晰，使用了JOIN结合不同表的数据，确保了数据的正确性。\n   - 使用了参数化查询（如: `WHERE br.user_id = ?`）来提升查询的灵活性和安全性。\n   \n3. **数据库优化的考虑（20/30）**:\n   - 在索引创建上做出了合理的考虑，尤其是在借阅记录表上为频繁查询的字段建立了索引。\n   - 然而，对于数据库性能的提升缺少更深入的分析，例如在处理大数据量时的表分区、查询优化策略上的考虑可以深入探讨。\n\n总的来说，作业的设计和实现都比较扎实，但是在进一步优化上还有提升的空间。', NULL),
    (2, 4, 100.00, true, '客观题', 'Sugawara Rena', NULL, FALSE),
    (3, 2, 85.00, true, '主观题', '数据库作业02_范式设计', '85\n\n评分理由：该数据库作业整体表现良好，具体分析如下：\n\n1. **数据库设计的合理性**（评分：30/35）\n   - 数据库结构较为清晰，并且考虑了基本的实体和属性，如图书、用户、借阅记录等。每个表都合理地使用了主键和外键以维护数据完整性。\n   - 对于借阅状态使用了CHECK约束，使得数据更加规范。\n   - 然而，可以进一步考虑对可借阅数量进行合理的设计（如确保不可借阅数量小于等于总书籍数量），以及更详细的类别设计（如提供一个类别表）。\n\n2. **SQL 查询的正确性**（评分：30/35）\n   - SQL 查询语句基本正确，覆盖了题目要求的各项查询需求。\n   - 使用JOIN语句和GROUP BY功能合理，可以有效地获取所需信息。不过，某些查询中缺少了参数的定义，虽然是为了示例，但在评分时会觉得略显不足，如查询某个用户的借阅历史中并未明确如何使用参数。\n\n3. **数据库优化的考虑**（评分：25/30）\n   - 设计了适当的索引以优化查询性能，值得肯定，尤其是针对借阅记录的热门查询。\n   - 但是，数据库优化建议可以更深入，例如在数据量极大的情况下，考虑分区表，或是对大型表进行归档操作等。\n\n综上所述，该作业展示了合理的数据库设计与SQL查询能力，同时在优化方面也有所考虑，但仍有完善的空间。因此，评分为85。', true),
    (3, 4, 100.00, true, '客观题', 'Sugawara Rena', NULL, FALSE),
    (4, 2, 85.00, true, '客观题', 'Steven Bryant', '85\n\n评分理由：\n1. **数据库设计的合理性（30/40）**：作业中的数据库设计基本合理，表结构清晰，涵盖了图书管理系统的主要功能。但在借阅记录表中，借阅状态使用文本类型并加上CHECK约束虽然可行，但在实现中使用布尔型（或自定义枚举）可能更优，以提高查询性能和可维护性。\n\n2. **SQL 查询的正确性（30/40）**：所提供的SQL查询基本上能够实现题目要求。但在查询借阅次数最多的图书时，需要注意样本的准确性（例如，不应只考虑已归还的书籍），可以改用“借阅总数”进行排序，不再过滤状态，这样能更好反映热图书。此外，查询某个用户借阅历史时，建议处理没有借阅记录的情况，以提高用户体验和可扩展性。\n\n3. **数据库优化的考虑（25/20）**：在数据库优化方面，已提出适当的索引设计，可以有效提高查询性能。然而，对于提高借阅效率，虽然具有索引设计是一个步骤，但在借阅记录表中考虑其他优化技巧，如分区表或物化视图，可以进一步改善性能。此外，对于查询图书借阅次数的部分，也应考虑加入索引以提高该特定查询的效率。\n\n总体来看，虽然在SQL和设计方面有一些小瑕疵，但作业总体质量较高，并有积极的优化考虑，因此给予85分。', FALSE),
    (4, 4, 100.00, true, '客观题', 'Sugawara Rena', NULL, FALSE),
    (5, 4, 100.00, true, '客观题', 'Sugawara Rena', NULL, FALSE),
    (6, 1, 100.00, true, '半开放', 'Yamada Miu', NULL, FALSE),
    (6, 4, 100.00, FALSE, '客观题', 'Sugawara Rena', NULL, FALSE),
    (7, 3, 90.00, true, '主观题', '数据库作业03_SQL查询练习', '90\n\n评分理由：该数据库作业展现了很高的质量，尤其是在数据库设计、SQL查询和优化考虑方面。\n\n1. **数据库设计的合理性（30/30）**：设计清晰合理，各个表的结构符合题目的要求，而且字段定义合理。通过主键和外键的使用，保持了数据的完整性，并且使用了适当的约束，如ISBN的唯一性和借阅状态的检查，非常符合实际应用要求。\n\n2. **SQL查询的正确性（30/30）**：提供的SQL查询能够准确完成任务要求，且逻辑严谨，数据提取有效。无论是复杂的聚合查询还是简单的联合查询，都具有良好的可读性和执行效率。\n\n3. **数据库优化的考虑（30/40）**：在优化考虑方面，作业中提供了索引的设计，这表明对查询性能的关注。但是，优化方案的论述和具体实施方案相对较少，比如没有明确说明如何增强“热门图书”查询的性能，或者在数据量增长时如何进行进一步优化，这个环节可以进一步深化以获得更高的分数。\n\n总的来说，该作业已经做得很好，但在优化考虑部分可以进一步加强细节，所以我给出了90分。', NULL),
    (9, 3, 88.00, true, '主观题', '数据库作业03_SQL查询练习', '88\n\n评分理由：\n1. **数据库设计的合理性**（评分：30/35）：\n   - 数据库设计涵盖了所有需求，包括图书表、用户表和借阅记录表，表结构合理且包含必要的字段和约束（主键、外键和CHECK约束）。可以进一步考虑为图书添加发布日期和标签字段，以促进对图书信息的更全面管理。\n\n2. **SQL 查询的正确性**（评分：28/35）：\n   - 所有 SQL 查询均能满足任务要求，且逻辑清晰。但在某些查询中（如查询借阅次数最多的图书），未考虑借阅中未归还的图书的借阅次数。此外，查询某个用户借阅历史的 SQL 查询中，缺少对用户 ID 的具体示例，这在实际应用中可能会导致性能响应不佳。\n\n3. **数据库优化的考虑**（评分：30/30）：\n   - 提供了适当的索引设计来优化查询，尤其是针对借阅记录表的索引设计思考周全，有助于提升与热门图书和用户相关的性能。对查询性能细节的关注令人满意。\n\n总体而言，该数据库作业在设计、查询和优化方面都表现良好，但在查询逻辑和示例方面稍显弱点，所以给出 88 分的评分。', NULL),
    (18, 3, 85.00, true, '主观题', '数据库作业03_SQL查询练习', '85\n\n评分理由：这篇数据库作业展示了良好的数据库设计、合理的SQL查询和考虑到优化的设计策略。\n\n1. **数据库设计的合理性**：设计的结构整体合理，表之间的关系清晰且符合一对多的常见模式（如书籍和借阅记录）。主键、外键等约束条件的使用恰当。但在用户表中没有考虑到联系方式的具体类型（如电子邮件或手机），这可能会影响数据的完整性。\n\n2. **SQL查询的正确性**：所有SQL查询语句的逻辑是正确的，能够有效地实现任务目标。特别是关于借阅次数最多书籍和每月借阅总数的查询，使用了良好的聚合和分组功能。\n\n3. **数据库优化的考虑**：在优化方面，提供了针对借阅记录表的索引设计，适当的索引可以显著提高查询性能。然而，还可以进一步探讨其他优化方式，比如字段的数据类型选择、更详细的可借阅数量更新策略等，这方面的描述可以更深入。\n\n综上所述，虽然作业完成得很好，但还存在一些可以改进的地方，因此给予85分。', true),
    (123, 4, 100.00, true, '客观题', 'Yamada Miu', NULL, FALSE),
    (234, 4, 100.00, true, '客观题', 'Sugawara Rena', NULL, FALSE),
    (1234, 4, 100.00, true, '客观题', '数据库作业1', NULL, FALSE),
    (1914, 4, 100.00, true, '客观题', 'Sugawara Rena', NULL, FALSE),
    (12341, 1, 100.00, true, '半开放', '数据库作业2', NULL, FALSE),
    (13231, 1, 100.00, true, '半开放', 'Yamada Miu', NULL, FALSE);
ALTER TABLE grade ENABLE TRIGGER ALL;

COMMIT;

-- ----------------------------
-- Enum type for homework category
-- ----------------------------
DO $$ BEGIN
    CREATE TYPE homework_category AS ENUM ('客观题', '半开放', '主观');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS homework CASCADE;
CREATE TABLE IF NOT EXISTS homework (
                                        id SERIAL PRIMARY KEY,
                                        name VARCHAR(255) NOT NULL,
                                        category homework_category NOT NULL
);

BEGIN;

INSERT INTO homework (id, name, category) VALUES
                                              (1, '数据库作业01_实体建模', '半开放'),
                                              (2, '数据库作业02_范式设计', '主观'),
                                              (3, '数据库作业03_SQL查询练习', '主观'),
                                              (4, '数据库作业04_存储过程开发', '客观题'),
                                              (5, '数据库作业05_触发器应用', '客观题'),
                                              (6, '数据库作业06_索引优化', '半开放'),
                                              (7, '数据库作业07_视图创建', '客观题'),
                                              (8, '数据库作业08_ER图绘制', '主观'),
                                              (9, '数据库作业09_事务管理', '主观'),
                                              (10, '数据库作业10_并发控制', '客观题'),
                                              (11, '数据库作业11_数据分片实践', '主观'),
                                              (12, '数据库作业12_备份与恢复', '半开放'),
                                              (13, '数据库作业13_模式迁移', '半开放'),
                                              (14, '数据库作业14_NoSQL入门', '主观'),
                                              (15, '数据库作业15_大数据处理', '半开放'),
                                              (16, '数据库作业16_全文检索实现', '半开放'),
                                              (17, '数据库作业17_分布式数据库设计', '半开放'),
                                              (18, '数据库作业18_查询性能优化', '客观题'),
                                              (19, '数据库作业19_权限与安全控制', '半开放'),
                                              (20, '数据库作业20_数据一致性保障', '主观'),
                                              (21, '数据库作业21_海量数据存储', '客观题'),
                                              (22, '数据库作业22_日志系统设计', '半开放'),
                                              (23, '数据库作业23_数据库连接池应用', '半开放'),
                                              (24, '数据库作业24_数据仓库建模', '客观题'),
                                              (25, '数据库作业25_ETL流程设计', '客观题'),
                                              (26, '数据库作业26_关系代数基础', '半开放'),
                                              (27, '数据库作业27_SQL注入防护', '主观'),
                                              (28, '数据库作业28_主从复制搭建', '主观'),
                                              (29, '数据库作业29_冷备与热备策略', '主观'),
                                              (30, '数据库作业大作业一', '主观'),
                                              (31, '数据库作业大作业二', '主观'),
                                              (32, '数据库作业大作业三', '主观'),
                                              (33, '数据库作业大作业四', '主观');

COMMIT;


-- ----------------------------
-- Table structure for jotter_article
-- ----------------------------
DROP TABLE IF EXISTS jotter_article CASCADE;
CREATE TABLE IF NOT EXISTS jotter_article (
                                              id SERIAL PRIMARY KEY,
                                              article_title VARCHAR(255),
                                              article_content_html TEXT,
                                              article_content_md TEXT,
                                              article_abstract VARCHAR(255),
                                              article_cover VARCHAR(255),
                                              article_date TIMESTAMP
);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS student CASCADE;
CREATE TABLE IF NOT EXISTS student (
                                       id SERIAL PRIMARY KEY,
                                       user_id INTEGER NOT NULL UNIQUE,
                                       name VARCHAR(255),
                                       phone VARCHAR(255),
                                       email VARCHAR(255),
                                       CONSTRAINT fk_student_user FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE
);