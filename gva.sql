/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : gva

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 21/12/2021 23:35:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auto_code_examples
-- ----------------------------
DROP TABLE IF EXISTS `auto_code_examples`;
CREATE TABLE `auto_code_examples`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `auto_code_example_field` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仅作示例条目无实际作用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_auto_code_examples_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auto_code_examples
-- ----------------------------

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_direction` tinyint(1) NULL DEFAULT NULL COMMENT '作品方向，0：男频，1：女频\'',
  `cat_id` int(0) NULL DEFAULT NULL COMMENT '分类ID',
  `cat_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小说封面',
  `book_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小说名',
  `author_id` bigint(0) NULL DEFAULT NULL COMMENT '作者id',
  `author_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者名',
  `book_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书籍描述',
  `score` float NOT NULL COMMENT '评分，预留字段',
  `book_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '书籍状态，0：连载中，1：已完结',
  `visit_count` bigint(0) NULL DEFAULT 103 COMMENT '点击量',
  `word_count` int(0) NULL DEFAULT NULL COMMENT '总字数',
  `comment_count` int(0) NULL DEFAULT 0 COMMENT '评论数',
  `yesterday_buy` int(0) NULL DEFAULT 0 COMMENT '昨日订阅数',
  `last_index_id` bigint(0) NULL DEFAULT NULL COMMENT '最新目录ID',
  `last_index_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最新目录名',
  `last_index_update_time` datetime(3) NULL DEFAULT NULL COMMENT '最新目录更新时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态，0：入库，1：上架',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `crawl_source_id` int(0) NULL DEFAULT NULL COMMENT '爬虫源站ID',
  `crawl_book_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抓取的源站小说ID',
  `crawl_last_time` datetime(3) NULL DEFAULT NULL COMMENT '最后一次的抓取时间',
  `crawl_is_stop` tinyint(1) NULL DEFAULT 0 COMMENT '是否已停止更新，0：未停止，1：已停止',
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_createTime`(`create_time`) USING BTREE,
  INDEX `key_lastIndexUpdateTime`(`last_index_update_time`) USING BTREE,
  INDEX `idx_book_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for book_category
-- ----------------------------
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_direction` tinyint(1) NULL DEFAULT NULL COMMENT '作品方向，0：男频，1：女频\'',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名',
  `sort` tinyint(0) NOT NULL DEFAULT 10 COMMENT '排序',
  `create_user_id` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_user_id` bigint(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_category
-- ----------------------------

-- ----------------------------
-- Table structure for book_content
-- ----------------------------
DROP TABLE IF EXISTS `book_content`;
CREATE TABLE `book_content`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint(0) NULL DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '小说章节内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key_uq_indexId`(`index_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_content
-- ----------------------------

-- ----------------------------
-- Table structure for book_index
-- ----------------------------
DROP TABLE IF EXISTS `book_index`;
CREATE TABLE `book_index`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint(0) NOT NULL COMMENT '小说ID',
  `index_num` int(0) NOT NULL COMMENT '目录号',
  `index_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目录名',
  `word_count` int(0) NULL DEFAULT NULL COMMENT '字数',
  `storage_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'db' COMMENT '存储方式',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说目录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_index
-- ----------------------------

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `p_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/base/login', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/user/register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8881', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/base/login', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/user/register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/book/createBook', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/book/deleteBook', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/book/deleteBookByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/book/updateBook', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/book/findBook', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '9528', '/book/getBookList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/base/login', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/user/deleteUser', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/user/register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/user/setUserInfo', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/user/setUserAuthorities', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/api/deleteApisByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/authority/copyAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/authority/updateAuthority', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/system/getServerInfo', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/getDB', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/getTables', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/preview', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/getColumn', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/getMeta', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/rollback', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/getSysHistory', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/autoCode/delSysHistory', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionaryDetail/updateSysDictionaryDetail', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionaryDetail/createSysDictionaryDetail', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionaryDetail/deleteSysDictionaryDetail', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionaryDetail/findSysDictionaryDetail', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionaryDetail/getSysDictionaryDetailList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionary/createSysDictionary', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionary/deleteSysDictionary', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionary/updateSysDictionary', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionary/findSysDictionary', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysDictionary/getSysDictionaryList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysOperationRecord/createSysOperationRecord', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysOperationRecord/findSysOperationRecord', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysOperationRecord/getSysOperationRecordList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysOperationRecord/deleteSysOperationRecord', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/sysOperationRecord/deleteSysOperationRecordByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/simpleUploader/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/simpleUploader/checkFileMd5', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/simpleUploader/mergeFileMd5', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/email/emailTest', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/excel/importExcel', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/excel/loadExcel', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/excel/exportExcel', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/excel/downloadTemplate', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/book/createBook', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/book/deleteBook', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/book/deleteBookByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/book/updateBook', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/book/findBook', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '888', '/book/getBookList', 'GET', '', '', '');

-- ----------------------------
-- Table structure for exa_customers
-- ----------------------------
DROP TABLE IF EXISTS `exa_customers`;
CREATE TABLE `exa_customers`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `customer_phone_data` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `sys_user_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '管理ID',
  `sys_user_authority_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_customers_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_customers
-- ----------------------------

-- ----------------------------
-- Table structure for exa_file_chunks
-- ----------------------------
DROP TABLE IF EXISTS `exa_file_chunks`;
CREATE TABLE `exa_file_chunks`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `exa_file_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `file_chunk_number` bigint(0) NULL DEFAULT NULL,
  `file_chunk_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_file_chunks_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_file_chunks
-- ----------------------------

-- ----------------------------
-- Table structure for exa_file_upload_and_downloads
-- ----------------------------
DROP TABLE IF EXISTS `exa_file_upload_and_downloads`;
CREATE TABLE `exa_file_upload_and_downloads`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件标签',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_file_upload_and_downloads_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_file_upload_and_downloads
-- ----------------------------
INSERT INTO `exa_file_upload_and_downloads` VALUES (1, '2021-12-21 22:55:04.784', '2021-12-21 22:55:04.784', NULL, '10.png', 'https://qmplusimg.henrongyi.top/gvalogo.png', 'png', '158787308910.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (2, '2021-12-21 22:55:04.784', '2021-12-21 22:55:04.784', NULL, 'logo.png', 'https://qmplusimg.henrongyi.top/1576554439myAvatar.png', 'png', '1587973709logo.png');

-- ----------------------------
-- Table structure for exa_files
-- ----------------------------
DROP TABLE IF EXISTS `exa_files`;
CREATE TABLE `exa_files`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_md5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `chunk_total` bigint(0) NULL DEFAULT NULL,
  `is_finish` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_files_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_files
-- ----------------------------

-- ----------------------------
-- Table structure for jwt_blacklists
-- ----------------------------
DROP TABLE IF EXISTS `jwt_blacklists`;
CREATE TABLE `jwt_blacklists`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `jwt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'jwt',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_jwt_blacklists_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jwt_blacklists
-- ----------------------------

-- ----------------------------
-- Table structure for sys_apis
-- ----------------------------
DROP TABLE IF EXISTS `sys_apis`;
CREATE TABLE `sys_apis`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_apis_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_apis
-- ----------------------------
INSERT INTO `sys_apis` VALUES (1, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/base/login', '用户登录(必选)', 'base', 'POST');
INSERT INTO `sys_apis` VALUES (2, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/jwt/jsonInBlacklist', 'jwt加入黑名单(退出，必选)', 'jwt', 'POST');
INSERT INTO `sys_apis` VALUES (3, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/user/deleteUser', '删除用户', '系统用户', 'DELETE');
INSERT INTO `sys_apis` VALUES (4, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/user/register', '用户注册(必选)', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (5, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/user/getUserList', '获取用户列表', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (6, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/user/setUserInfo', '设置用户信息(必选)', '系统用户', 'PUT');
INSERT INTO `sys_apis` VALUES (7, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/user/getUserInfo', '获取自身信息(必选)', '系统用户', 'GET');
INSERT INTO `sys_apis` VALUES (8, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/user/setUserAuthorities', '设置权限组', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (9, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/user/changePassword', '修改密码（建(选择)', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (10, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/user/setUserAuthority', '修改用户角色(必选)', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (11, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/api/resetPassword', '重置用户密码', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (12, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/api/createApi', '创建api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (13, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/api/deleteApi', '删除Api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (14, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/api/updateApi', '更新Api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (15, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/api/getApiList', '获取api列表', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (16, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/api/getAllApis', '获取所有api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (17, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/api/getApiById', '获取api详细信息', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (18, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/api/deleteApisByIds', '批量删除api', 'api', 'DELETE');
INSERT INTO `sys_apis` VALUES (19, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/authority/copyAuthority', '拷贝角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (20, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/authority/createAuthority', '创建角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (21, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/authority/deleteAuthority', '删除角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (22, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/authority/updateAuthority', '更新角色信息', '角色', 'PUT');
INSERT INTO `sys_apis` VALUES (23, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/authority/getAuthorityList', '获取角色列表', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (24, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/authority/setDataAuthority', '设置角色资源权限', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (25, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/casbin/updateCasbin', '更改角色api权限', 'casbin', 'POST');
INSERT INTO `sys_apis` VALUES (26, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/casbin/getPolicyPathByAuthorityId', '获取权限列表', 'casbin', 'POST');
INSERT INTO `sys_apis` VALUES (27, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/addBaseMenu', '新增菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (28, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/getMenu', '获取菜单树(必选)', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (29, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/deleteBaseMenu', '删除菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (30, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/updateBaseMenu', '更新菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (31, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/getBaseMenuById', '根据id获取菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (32, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/getMenuList', '分页获取基础menu列表', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (33, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/getBaseMenuTree', '获取用户动态路由', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (34, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/getMenuAuthority', '获取指定角色menu', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (35, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/menu/addMenuAuthority', '增加menu和角色关联关系', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (36, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/fileUploadAndDownload/upload', '文件上传示例', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (37, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/fileUploadAndDownload/deleteFile', '删除文件', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (38, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/fileUploadAndDownload/getFileList', '获取上传文件列表', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (39, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/system/getServerInfo', '获取服务器信息', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (40, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/system/getSystemConfig', '获取配置文件内容', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (41, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/system/setSystemConfig', '设置配置文件内容', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (42, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/customer/customer', '更新客户', '客户', 'PUT');
INSERT INTO `sys_apis` VALUES (43, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/customer/customer', '创建客户', '客户', 'POST');
INSERT INTO `sys_apis` VALUES (44, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/customer/customer', '删除客户', '客户', 'DELETE');
INSERT INTO `sys_apis` VALUES (45, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/customer/customer', '获取单一客户', '客户', 'GET');
INSERT INTO `sys_apis` VALUES (46, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/customer/customerList', '获取客户列表', '客户', 'GET');
INSERT INTO `sys_apis` VALUES (47, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/getDB', '获取所有数据库', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (48, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/getTables', '获取数据库表', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (49, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/createTemp', '自动化代码', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (50, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/preview', '预览自动化代码', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (51, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/getColumn', '获取所选table的所有字段', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (52, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/getMeta', '获取meta信息', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (53, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/rollback', '回滚自动生成代码', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (54, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/getSysHistory', '查询回滚记录', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (55, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/autoCode/delSysHistory', '删除回滚记录', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (56, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionaryDetail/updateSysDictionaryDetail', '更新字典内容', '系统字典详情', 'PUT');
INSERT INTO `sys_apis` VALUES (57, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionaryDetail/createSysDictionaryDetail', '新增字典内容', '系统字典详情', 'POST');
INSERT INTO `sys_apis` VALUES (58, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionaryDetail/deleteSysDictionaryDetail', '删除字典内容', '系统字典详情', 'DELETE');
INSERT INTO `sys_apis` VALUES (59, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionaryDetail/findSysDictionaryDetail', '根据ID获取字典内容', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (60, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionaryDetail/getSysDictionaryDetailList', '获取字典内容列表', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (61, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionary/createSysDictionary', '新增字典', '系统字典', 'POST');
INSERT INTO `sys_apis` VALUES (62, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionary/deleteSysDictionary', '删除字典', '系统字典', 'DELETE');
INSERT INTO `sys_apis` VALUES (63, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionary/updateSysDictionary', '更新字典', '系统字典', 'PUT');
INSERT INTO `sys_apis` VALUES (64, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionary/findSysDictionary', '根据ID获取字典', '系统字典', 'GET');
INSERT INTO `sys_apis` VALUES (65, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysDictionary/getSysDictionaryList', '获取字典列表', '系统字典', 'GET');
INSERT INTO `sys_apis` VALUES (66, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysOperationRecord/createSysOperationRecord', '新增操作记录', '操作记录', 'POST');
INSERT INTO `sys_apis` VALUES (67, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysOperationRecord/findSysOperationRecord', '根据ID获取操作记录', '操作记录', 'GET');
INSERT INTO `sys_apis` VALUES (68, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysOperationRecord/getSysOperationRecordList', '获取操作记录列表', '操作记录', 'GET');
INSERT INTO `sys_apis` VALUES (69, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysOperationRecord/deleteSysOperationRecord', '删除操作记录', '操作记录', 'DELETE');
INSERT INTO `sys_apis` VALUES (70, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/sysOperationRecord/deleteSysOperationRecordByIds', '批量删除操作历史', '操作记录', 'DELETE');
INSERT INTO `sys_apis` VALUES (71, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/simpleUploader/upload', '插件版分片上传', '断点续传(插件版)', 'POST');
INSERT INTO `sys_apis` VALUES (72, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/simpleUploader/checkFileMd5', '文件完整度验证', '断点续传(插件版)', 'GET');
INSERT INTO `sys_apis` VALUES (73, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/simpleUploader/mergeFileMd5', '上传完成合并文件', '断点续传(插件版)', 'GET');
INSERT INTO `sys_apis` VALUES (74, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/email/emailTest', '发送测试邮件', 'email', 'POST');
INSERT INTO `sys_apis` VALUES (75, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/email/emailSend', '发送邮件示例', 'email', 'POST');
INSERT INTO `sys_apis` VALUES (76, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/excel/importExcel', '导入excel', 'excel', 'POST');
INSERT INTO `sys_apis` VALUES (77, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/excel/loadExcel', '下载excel', 'excel', 'GET');
INSERT INTO `sys_apis` VALUES (78, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/excel/exportExcel', '导出excel', 'excel', 'POST');
INSERT INTO `sys_apis` VALUES (79, '2021-12-21 22:55:04.563', '2021-12-21 22:55:04.563', NULL, '/excel/downloadTemplate', '下载excel模板', 'excel', 'GET');
INSERT INTO `sys_apis` VALUES (80, '2021-12-21 23:00:07.420', '2021-12-21 23:00:07.420', NULL, '/book/createBook', '新增book表', 'book', 'POST');
INSERT INTO `sys_apis` VALUES (81, '2021-12-21 23:00:07.422', '2021-12-21 23:00:07.422', NULL, '/book/deleteBook', '删除book表', 'book', 'DELETE');
INSERT INTO `sys_apis` VALUES (82, '2021-12-21 23:00:07.424', '2021-12-21 23:00:07.424', NULL, '/book/deleteBookByIds', '批量删除book表', 'book', 'DELETE');
INSERT INTO `sys_apis` VALUES (83, '2021-12-21 23:00:07.426', '2021-12-21 23:00:07.426', NULL, '/book/updateBook', '更新book表', 'book', 'PUT');
INSERT INTO `sys_apis` VALUES (84, '2021-12-21 23:00:07.428', '2021-12-21 23:00:07.428', NULL, '/book/findBook', '根据ID获取book表', 'book', 'GET');
INSERT INTO `sys_apis` VALUES (85, '2021-12-21 23:00:07.430', '2021-12-21 23:00:07.430', NULL, '/book/getBookList', '获取book表列表', 'book', 'GET');
INSERT INTO `sys_apis` VALUES (86, '2021-12-21 23:24:37.736', '2021-12-21 23:24:37.736', NULL, '/bookCategory/createBookCategory', '新增bookCategory表', 'bookCategory', 'POST');
INSERT INTO `sys_apis` VALUES (87, '2021-12-21 23:24:37.739', '2021-12-21 23:24:37.739', NULL, '/bookCategory/deleteBookCategory', '删除bookCategory表', 'bookCategory', 'DELETE');
INSERT INTO `sys_apis` VALUES (88, '2021-12-21 23:24:37.741', '2021-12-21 23:24:37.741', NULL, '/bookCategory/deleteBookCategoryByIds', '批量删除bookCategory表', 'bookCategory', 'DELETE');
INSERT INTO `sys_apis` VALUES (89, '2021-12-21 23:24:37.744', '2021-12-21 23:24:37.744', NULL, '/bookCategory/updateBookCategory', '更新bookCategory表', 'bookCategory', 'PUT');
INSERT INTO `sys_apis` VALUES (90, '2021-12-21 23:24:37.746', '2021-12-21 23:24:37.746', NULL, '/bookCategory/findBookCategory', '根据ID获取bookCategory表', 'bookCategory', 'GET');
INSERT INTO `sys_apis` VALUES (91, '2021-12-21 23:24:37.748', '2021-12-21 23:24:37.748', NULL, '/bookCategory/getBookCategoryList', '获取bookCategory表列表', 'bookCategory', 'GET');
INSERT INTO `sys_apis` VALUES (92, '2021-12-21 23:24:50.188', '2021-12-21 23:24:50.188', NULL, '/bookContent/createBookContent', '新增bookContent表', 'bookContent', 'POST');
INSERT INTO `sys_apis` VALUES (93, '2021-12-21 23:24:50.190', '2021-12-21 23:24:50.190', NULL, '/bookContent/deleteBookContent', '删除bookContent表', 'bookContent', 'DELETE');
INSERT INTO `sys_apis` VALUES (94, '2021-12-21 23:24:50.192', '2021-12-21 23:24:50.192', NULL, '/bookContent/deleteBookContentByIds', '批量删除bookContent表', 'bookContent', 'DELETE');
INSERT INTO `sys_apis` VALUES (95, '2021-12-21 23:24:50.194', '2021-12-21 23:24:50.194', NULL, '/bookContent/updateBookContent', '更新bookContent表', 'bookContent', 'PUT');
INSERT INTO `sys_apis` VALUES (96, '2021-12-21 23:24:50.197', '2021-12-21 23:24:50.197', NULL, '/bookContent/findBookContent', '根据ID获取bookContent表', 'bookContent', 'GET');
INSERT INTO `sys_apis` VALUES (97, '2021-12-21 23:24:50.199', '2021-12-21 23:24:50.199', NULL, '/bookContent/getBookContentList', '获取bookContent表列表', 'bookContent', 'GET');
INSERT INTO `sys_apis` VALUES (98, '2021-12-21 23:25:25.090', '2021-12-21 23:25:25.090', NULL, '/bookIndex/createBookIndex', '新增bookIndex表', 'bookIndex', 'POST');
INSERT INTO `sys_apis` VALUES (99, '2021-12-21 23:25:25.093', '2021-12-21 23:25:25.093', NULL, '/bookIndex/deleteBookIndex', '删除bookIndex表', 'bookIndex', 'DELETE');
INSERT INTO `sys_apis` VALUES (100, '2021-12-21 23:25:25.095', '2021-12-21 23:25:25.095', NULL, '/bookIndex/deleteBookIndexByIds', '批量删除bookIndex表', 'bookIndex', 'DELETE');
INSERT INTO `sys_apis` VALUES (101, '2021-12-21 23:25:25.098', '2021-12-21 23:25:25.098', NULL, '/bookIndex/updateBookIndex', '更新bookIndex表', 'bookIndex', 'PUT');
INSERT INTO `sys_apis` VALUES (102, '2021-12-21 23:25:25.101', '2021-12-21 23:25:25.101', NULL, '/bookIndex/findBookIndex', '根据ID获取bookIndex表', 'bookIndex', 'GET');
INSERT INTO `sys_apis` VALUES (103, '2021-12-21 23:25:25.103', '2021-12-21 23:25:25.103', NULL, '/bookIndex/getBookIndexList', '获取bookIndex表列表', 'bookIndex', 'GET');

-- ----------------------------
-- Table structure for sys_authorities
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorities`;
CREATE TABLE `sys_authorities`  (
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `authority_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `parent_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`) USING BTREE,
  UNIQUE INDEX `authority_id`(`authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authorities
-- ----------------------------
INSERT INTO `sys_authorities` VALUES ('2021-12-21 22:55:04.642', '2021-12-21 23:20:04.776', NULL, '888', '普通用户', '0', 'dashboard');
INSERT INTO `sys_authorities` VALUES ('2021-12-21 22:55:04.642', '2021-12-21 22:55:04.642', NULL, '8881', '普通用户子角色', '888', 'dashboard');
INSERT INTO `sys_authorities` VALUES ('2021-12-21 22:55:04.642', '2021-12-21 23:20:08.044', NULL, '9528', '测试角色', '0', 'dashboard');

-- ----------------------------
-- Table structure for sys_authority_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority_menus`;
CREATE TABLE `sys_authority_menus`  (
  `sys_authority_authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `sys_base_menu_id` bigint(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`sys_authority_authority_id`, `sys_base_menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authority_menus
-- ----------------------------
INSERT INTO `sys_authority_menus` VALUES ('888', 1);
INSERT INTO `sys_authority_menus` VALUES ('888', 2);
INSERT INTO `sys_authority_menus` VALUES ('888', 3);
INSERT INTO `sys_authority_menus` VALUES ('888', 4);
INSERT INTO `sys_authority_menus` VALUES ('888', 5);
INSERT INTO `sys_authority_menus` VALUES ('888', 6);
INSERT INTO `sys_authority_menus` VALUES ('888', 7);
INSERT INTO `sys_authority_menus` VALUES ('888', 8);
INSERT INTO `sys_authority_menus` VALUES ('888', 9);
INSERT INTO `sys_authority_menus` VALUES ('888', 10);
INSERT INTO `sys_authority_menus` VALUES ('888', 11);
INSERT INTO `sys_authority_menus` VALUES ('888', 12);
INSERT INTO `sys_authority_menus` VALUES ('888', 13);
INSERT INTO `sys_authority_menus` VALUES ('888', 14);
INSERT INTO `sys_authority_menus` VALUES ('888', 15);
INSERT INTO `sys_authority_menus` VALUES ('888', 16);
INSERT INTO `sys_authority_menus` VALUES ('888', 17);
INSERT INTO `sys_authority_menus` VALUES ('888', 18);
INSERT INTO `sys_authority_menus` VALUES ('888', 19);
INSERT INTO `sys_authority_menus` VALUES ('888', 20);
INSERT INTO `sys_authority_menus` VALUES ('888', 22);
INSERT INTO `sys_authority_menus` VALUES ('888', 23);
INSERT INTO `sys_authority_menus` VALUES ('888', 24);
INSERT INTO `sys_authority_menus` VALUES ('888', 25);
INSERT INTO `sys_authority_menus` VALUES ('888', 26);
INSERT INTO `sys_authority_menus` VALUES ('888', 27);
INSERT INTO `sys_authority_menus` VALUES ('8881', 1);
INSERT INTO `sys_authority_menus` VALUES ('8881', 2);
INSERT INTO `sys_authority_menus` VALUES ('8881', 8);
INSERT INTO `sys_authority_menus` VALUES ('9528', 1);
INSERT INTO `sys_authority_menus` VALUES ('9528', 2);
INSERT INTO `sys_authority_menus` VALUES ('9528', 3);
INSERT INTO `sys_authority_menus` VALUES ('9528', 4);
INSERT INTO `sys_authority_menus` VALUES ('9528', 5);
INSERT INTO `sys_authority_menus` VALUES ('9528', 6);
INSERT INTO `sys_authority_menus` VALUES ('9528', 7);
INSERT INTO `sys_authority_menus` VALUES ('9528', 8);
INSERT INTO `sys_authority_menus` VALUES ('9528', 9);
INSERT INTO `sys_authority_menus` VALUES ('9528', 10);
INSERT INTO `sys_authority_menus` VALUES ('9528', 11);
INSERT INTO `sys_authority_menus` VALUES ('9528', 12);
INSERT INTO `sys_authority_menus` VALUES ('9528', 14);
INSERT INTO `sys_authority_menus` VALUES ('9528', 15);
INSERT INTO `sys_authority_menus` VALUES ('9528', 16);
INSERT INTO `sys_authority_menus` VALUES ('9528', 17);
INSERT INTO `sys_authority_menus` VALUES ('9528', 26);
INSERT INTO `sys_authority_menus` VALUES ('9528', 27);

-- ----------------------------
-- Table structure for sys_auto_code_histories
-- ----------------------------
DROP TABLE IF EXISTS `sys_auto_code_histories`;
CREATE TABLE `sys_auto_code_histories`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request_meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `auto_code_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `injection_meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `struct_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `struct_cn_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `api_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `flag` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_auto_code_histories_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auto_code_histories
-- ----------------------------
INSERT INTO `sys_auto_code_histories` VALUES (1, '2021-12-21 23:02:34.466', '2021-12-21 23:02:34.466', NULL, 'book', '{\"structName\":\"Book\",\"tableName\":\"book\",\"packageName\":\"book\",\"humpPackageName\":\"book\",\"abbreviation\":\"book\",\"description\":\"book表\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"AuthorId\",\"fieldDesc\":\"作者id\",\"fieldType\":\"int\",\"fieldJson\":\"authorId\",\"dataTypeLong\":\"19\",\"comment\":\"作者id\",\"columnName\":\"author_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"AuthorName\",\"fieldDesc\":\"作者名\",\"fieldType\":\"string\",\"fieldJson\":\"authorName\",\"dataTypeLong\":\"50\",\"comment\":\"作者名\",\"columnName\":\"author_name\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"BookDesc\",\"fieldDesc\":\"书籍描述\",\"fieldType\":\"string\",\"fieldJson\":\"bookDesc\",\"dataTypeLong\":\"2000\",\"comment\":\"书籍描述\",\"columnName\":\"book_desc\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"BookName\",\"fieldDesc\":\"小说名\",\"fieldType\":\"string\",\"fieldJson\":\"bookName\",\"dataTypeLong\":\"50\",\"comment\":\"小说名\",\"columnName\":\"book_name\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"BookStatus\",\"fieldDesc\":\"书籍状态，0：连载中，1：已完结\",\"fieldType\":\"bool\",\"fieldJson\":\"bookStatus\",\"dataTypeLong\":\"\",\"comment\":\"书籍状态，0：连载中，1：已完结\",\"columnName\":\"book_status\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CatId\",\"fieldDesc\":\"分类ID\",\"fieldType\":\"int\",\"fieldJson\":\"catId\",\"dataTypeLong\":\"10\",\"comment\":\"分类ID\",\"columnName\":\"cat_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CatName\",\"fieldDesc\":\"分类名\",\"fieldType\":\"string\",\"fieldJson\":\"catName\",\"dataTypeLong\":\"50\",\"comment\":\"分类名\",\"columnName\":\"cat_name\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CommentCount\",\"fieldDesc\":\"评论数\",\"fieldType\":\"int\",\"fieldJson\":\"commentCount\",\"dataTypeLong\":\"10\",\"comment\":\"评论数\",\"columnName\":\"comment_count\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CrawlBookId\",\"fieldDesc\":\"抓取的源站小说ID\",\"fieldType\":\"string\",\"fieldJson\":\"crawlBookId\",\"dataTypeLong\":\"32\",\"comment\":\"抓取的源站小说ID\",\"columnName\":\"crawl_book_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CrawlIsStop\",\"fieldDesc\":\"是否已停止更新，0：未停止，1：已停止\",\"fieldType\":\"bool\",\"fieldJson\":\"crawlIsStop\",\"dataTypeLong\":\"\",\"comment\":\"是否已停止更新，0：未停止，1：已停止\",\"columnName\":\"crawl_is_stop\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CrawlLastTime\",\"fieldDesc\":\"最后一次的抓取时间\",\"fieldType\":\"time.Time\",\"fieldJson\":\"crawlLastTime\",\"dataTypeLong\":\"\",\"comment\":\"最后一次的抓取时间\",\"columnName\":\"crawl_last_time\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CrawlSourceId\",\"fieldDesc\":\"爬虫源站ID\",\"fieldType\":\"int\",\"fieldJson\":\"crawlSourceId\",\"dataTypeLong\":\"10\",\"comment\":\"爬虫源站ID\",\"columnName\":\"crawl_source_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CreateTime\",\"fieldDesc\":\"创建时间\",\"fieldType\":\"time.Time\",\"fieldJson\":\"createTime\",\"dataTypeLong\":\"\",\"comment\":\"创建时间\",\"columnName\":\"create_time\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"LastIndexId\",\"fieldDesc\":\"最新目录ID\",\"fieldType\":\"int\",\"fieldJson\":\"lastIndexId\",\"dataTypeLong\":\"19\",\"comment\":\"最新目录ID\",\"columnName\":\"last_index_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"LastIndexName\",\"fieldDesc\":\"最新目录名\",\"fieldType\":\"string\",\"fieldJson\":\"lastIndexName\",\"dataTypeLong\":\"50\",\"comment\":\"最新目录名\",\"columnName\":\"last_index_name\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"LastIndexUpdateTime\",\"fieldDesc\":\"最新目录更新时间\",\"fieldType\":\"time.Time\",\"fieldJson\":\"lastIndexUpdateTime\",\"dataTypeLong\":\"\",\"comment\":\"最新目录更新时间\",\"columnName\":\"last_index_update_time\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"PicUrl\",\"fieldDesc\":\"小说封面\",\"fieldType\":\"string\",\"fieldJson\":\"picUrl\",\"dataTypeLong\":\"200\",\"comment\":\"小说封面\",\"columnName\":\"pic_url\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Score\",\"fieldDesc\":\"评分，预留字段\",\"fieldType\":\"float64\",\"fieldJson\":\"score\",\"dataTypeLong\":\"\",\"comment\":\"评分，预留字段\",\"columnName\":\"score\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Status\",\"fieldDesc\":\"状态，0：入库，1：上架\",\"fieldType\":\"bool\",\"fieldJson\":\"status\",\"dataTypeLong\":\"\",\"comment\":\"状态，0：入库，1：上架\",\"columnName\":\"status\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"UpdateTime\",\"fieldDesc\":\"更新时间\",\"fieldType\":\"time.Time\",\"fieldJson\":\"updateTime\",\"dataTypeLong\":\"\",\"comment\":\"更新时间\",\"columnName\":\"update_time\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"VisitCount\",\"fieldDesc\":\"点击量\",\"fieldType\":\"int\",\"fieldJson\":\"visitCount\",\"dataTypeLong\":\"19\",\"comment\":\"点击量\",\"columnName\":\"visit_count\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"WordCount\",\"fieldDesc\":\"总字数\",\"fieldType\":\"int\",\"fieldJson\":\"wordCount\",\"dataTypeLong\":\"10\",\"comment\":\"总字数\",\"columnName\":\"word_count\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"WorkDirection\",\"fieldDesc\":\"作品方向，0：男频，1：女频\'\",\"fieldType\":\"bool\",\"fieldJson\":\"workDirection\",\"dataTypeLong\":\"\",\"comment\":\"作品方向，0：男频，1：女频\'\",\"columnName\":\"work_direction\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"YesterdayBuy\",\"fieldDesc\":\"昨日订阅数\",\"fieldType\":\"int\",\"fieldJson\":\"yesterdayBuy\",\"dataTypeLong\":\"10\",\"comment\":\"昨日订阅数\",\"columnName\":\"yesterday_buy\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}', 'D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\api\\v1\\autocode\\book.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\model\\autocode\\book.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\model\\autocode\\request\\book.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\router\\autocode\\book.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\service\\autocode\\book.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\api\\book.js;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\view\\book\\bookForm.vue;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\view\\book\\book.vue;', 'D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\initialize\\gorm.go@MysqlTables@autocode.Book{},;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\initialize\\router.go@Routers@autocodeRouter.InitBookRouter(PrivateGroup);D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\api\\v1\\autocode\\enter.go@ApiGroup@BookApi;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\router\\autocode\\enter.go@RouterGroup@BookRouter;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\service\\autocode\\enter.go@ServiceGroup@BookService;', 'Book', 'book表', '', 0);
INSERT INTO `sys_auto_code_histories` VALUES (2, '2021-12-21 23:24:37.798', '2021-12-21 23:24:37.798', NULL, 'book_category', '{\"structName\":\"BookCategory\",\"tableName\":\"book_category\",\"packageName\":\"bookCategory\",\"humpPackageName\":\"book_category\",\"abbreviation\":\"bookCategory\",\"description\":\"bookCategory表\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"CreateTime\",\"fieldDesc\":\"createTime字段\",\"fieldType\":\"time.Time\",\"fieldJson\":\"createTime\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"create_time\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CreateUserId\",\"fieldDesc\":\"createUserId字段\",\"fieldType\":\"int\",\"fieldJson\":\"createUserId\",\"dataTypeLong\":\"19\",\"comment\":\"\",\"columnName\":\"create_user_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Name\",\"fieldDesc\":\"分类名\",\"fieldType\":\"string\",\"fieldJson\":\"name\",\"dataTypeLong\":\"20\",\"comment\":\"分类名\",\"columnName\":\"name\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Sort\",\"fieldDesc\":\"排序\",\"fieldType\":\"bool\",\"fieldJson\":\"sort\",\"dataTypeLong\":\"\",\"comment\":\"排序\",\"columnName\":\"sort\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"UpdateTime\",\"fieldDesc\":\"updateTime字段\",\"fieldType\":\"time.Time\",\"fieldJson\":\"updateTime\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"update_time\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"UpdateUserId\",\"fieldDesc\":\"updateUserId字段\",\"fieldType\":\"int\",\"fieldJson\":\"updateUserId\",\"dataTypeLong\":\"19\",\"comment\":\"\",\"columnName\":\"update_user_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"WorkDirection\",\"fieldDesc\":\"作品方向，0：男频，1：女频\'\",\"fieldType\":\"bool\",\"fieldJson\":\"workDirection\",\"dataTypeLong\":\"\",\"comment\":\"作品方向，0：男频，1：女频\'\",\"columnName\":\"work_direction\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}', 'D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\api\\v1\\autocode\\book_category.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\model\\autocode\\book_category.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\model\\autocode\\request\\book_category.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\router\\autocode\\book_category.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\service\\autocode\\book_category.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\api\\bookCategory.js;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\view\\bookCategory\\bookCategoryForm.vue;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\view\\bookCategory\\bookCategory.vue;', 'D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\initialize\\gorm.go@MysqlTables@autocode.BookCategory{},;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\initialize\\router.go@Routers@autocodeRouter.InitBookCategoryRouter(PrivateGroup);D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\api\\v1\\autocode\\enter.go@ApiGroup@BookCategoryApi;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\router\\autocode\\enter.go@RouterGroup@BookCategoryRouter;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\service\\autocode\\enter.go@ServiceGroup@BookCategoryService;', 'BookCategory', 'bookCategory表', '86;87;88;89;90;91;', 0);
INSERT INTO `sys_auto_code_histories` VALUES (3, '2021-12-21 23:24:50.241', '2021-12-21 23:24:50.241', NULL, 'book_content', '{\"structName\":\"BookContent\",\"tableName\":\"book_content\",\"packageName\":\"bookContent\",\"humpPackageName\":\"book_content\",\"abbreviation\":\"bookContent\",\"description\":\"bookContent表\",\"autoCreateApiToSql\":true,\"autoMoveFile\":false,\"fields\":[{\"fieldName\":\"Content\",\"fieldDesc\":\"小说章节内容\",\"fieldType\":\"string\",\"fieldJson\":\"content\",\"dataTypeLong\":\"\",\"comment\":\"小说章节内容\",\"columnName\":\"content\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"IndexId\",\"fieldDesc\":\"目录ID\",\"fieldType\":\"int\",\"fieldJson\":\"indexId\",\"dataTypeLong\":\"19\",\"comment\":\"目录ID\",\"columnName\":\"index_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}', '', '', 'BookContent', 'bookContent表', '92;93;94;95;96;97;', 0);
INSERT INTO `sys_auto_code_histories` VALUES (4, '2021-12-21 23:25:25.146', '2021-12-21 23:25:25.146', NULL, 'book_index', '{\"structName\":\"BookIndex\",\"tableName\":\"book_index\",\"packageName\":\"bookIndex\",\"humpPackageName\":\"book_index\",\"abbreviation\":\"bookIndex\",\"description\":\"bookIndex表\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"BookId\",\"fieldDesc\":\"小说ID\",\"fieldType\":\"int\",\"fieldJson\":\"bookId\",\"dataTypeLong\":\"19\",\"comment\":\"小说ID\",\"columnName\":\"book_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"CreateTime\",\"fieldDesc\":\"createTime字段\",\"fieldType\":\"time.Time\",\"fieldJson\":\"createTime\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"create_time\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"IndexName\",\"fieldDesc\":\"目录名\",\"fieldType\":\"string\",\"fieldJson\":\"indexName\",\"dataTypeLong\":\"100\",\"comment\":\"目录名\",\"columnName\":\"index_name\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"IndexNum\",\"fieldDesc\":\"目录号\",\"fieldType\":\"int\",\"fieldJson\":\"indexNum\",\"dataTypeLong\":\"10\",\"comment\":\"目录号\",\"columnName\":\"index_num\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"StorageType\",\"fieldDesc\":\"存储方式\",\"fieldType\":\"string\",\"fieldJson\":\"storageType\",\"dataTypeLong\":\"10\",\"comment\":\"存储方式\",\"columnName\":\"storage_type\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"UpdateTime\",\"fieldDesc\":\"updateTime字段\",\"fieldType\":\"time.Time\",\"fieldJson\":\"updateTime\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"update_time\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"WordCount\",\"fieldDesc\":\"字数\",\"fieldType\":\"int\",\"fieldJson\":\"wordCount\",\"dataTypeLong\":\"10\",\"comment\":\"字数\",\"columnName\":\"word_count\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}', 'D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\api\\v1\\autocode\\book_index.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\model\\autocode\\book_index.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\model\\autocode\\request\\book_index.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\router\\autocode\\book_index.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\service\\autocode\\book_index.go;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\api\\bookIndex.js;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\view\\bookIndex\\bookIndexForm.vue;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel-web\\src\\view\\bookIndex\\bookIndex.vue;', 'D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\initialize\\gorm.go@MysqlTables@autocode.BookIndex{},;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\initialize\\router.go@Routers@autocodeRouter.InitBookIndexRouter(PrivateGroup);D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\api\\v1\\autocode\\enter.go@ApiGroup@BookIndexApi;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\router\\autocode\\enter.go@RouterGroup@BookIndexRouter;D:\\resource\\code\\goCode\\myCode\\2021.12\\easy-novel\\service\\autocode\\enter.go@ServiceGroup@BookIndexService;', 'BookIndex', 'bookIndex表', '98;99;100;101;102;103;', 0);

-- ----------------------------
-- Table structure for sys_base_menu_parameters
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menu_parameters`;
CREATE TABLE `sys_base_menu_parameters`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `sys_base_menu_id` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数的值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_base_menu_parameters_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_base_menu_parameters
-- ----------------------------

-- ----------------------------
-- Table structure for sys_base_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menus`;
CREATE TABLE `sys_base_menus`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `menu_level` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `parent_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) NULL DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint(0) NULL DEFAULT NULL COMMENT '排序标记',
  `keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '附加属性',
  `default_menu` tinyint(1) NULL DEFAULT NULL COMMENT '附加属性',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加属性',
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加属性',
  `close_tab` tinyint(1) NULL DEFAULT NULL COMMENT '附加属性',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_base_menus_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_base_menus
-- ----------------------------
INSERT INTO `sys_base_menus` VALUES (1, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '0', 'dashboard', 'dashboard', 0, 'view/dashboard/index.vue', 1, 0, 0, '仪表盘', 'odometer', 0);
INSERT INTO `sys_base_menus` VALUES (2, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '0', 'about', 'about', 0, 'view/about/index.vue', 7, 0, 0, '关于我们', 'info-filled', 0);
INSERT INTO `sys_base_menus` VALUES (3, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '0', 'admin', 'superAdmin', 0, 'view/superAdmin/index.vue', 3, 0, 0, '超级管理员', 'user', 0);
INSERT INTO `sys_base_menus` VALUES (4, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '3', 'authority', 'authority', 0, 'view/superAdmin/authority/authority.vue', 1, 0, 0, '角色管理', 'avatar', 0);
INSERT INTO `sys_base_menus` VALUES (5, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '3', 'menu', 'menu', 0, 'view/superAdmin/menu/menu.vue', 2, 1, 0, '菜单管理', 'tickets', 0);
INSERT INTO `sys_base_menus` VALUES (6, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '3', 'api', 'api', 0, 'view/superAdmin/api/api.vue', 3, 1, 0, 'api管理', 'platform', 0);
INSERT INTO `sys_base_menus` VALUES (7, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '3', 'user', 'user', 0, 'view/superAdmin/user/user.vue', 4, 0, 0, '用户管理', 'coordinate', 0);
INSERT INTO `sys_base_menus` VALUES (8, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '0', 'person', 'person', 1, 'view/person/person.vue', 4, 0, 0, '个人信息', 'message', 0);
INSERT INTO `sys_base_menus` VALUES (9, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '0', 'example', 'example', 0, 'view/example/index.vue', 6, 0, 0, '示例文件', 'management', 0);
INSERT INTO `sys_base_menus` VALUES (10, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '9', 'excel', 'excel', 0, 'view/example/excel/excel.vue', 4, 0, 0, 'excel导入导出', 'takeaway-box', 0);
INSERT INTO `sys_base_menus` VALUES (11, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '9', 'upload', 'upload', 0, 'view/example/upload/upload.vue', 5, 0, 0, '媒体库（上传下载）', 'upload', 0);
INSERT INTO `sys_base_menus` VALUES (12, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '9', 'breakpoint', 'breakpoint', 0, 'view/example/breakpoint/breakpoint.vue', 6, 0, 0, '断点续传', 'upload-filled', 0);
INSERT INTO `sys_base_menus` VALUES (13, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '9', 'customer', 'customer', 0, 'view/example/customer/customer.vue', 7, 0, 0, '客户列表（资源示例）', 'avatar', 0);
INSERT INTO `sys_base_menus` VALUES (14, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '0', 'systemTools', 'systemTools', 0, 'view/systemTools/index.vue', 5, 0, 0, '系统工具', 'tools', 0);
INSERT INTO `sys_base_menus` VALUES (15, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '14', 'autoCode', 'autoCode', 0, 'view/systemTools/autoCode/index.vue', 1, 1, 0, '代码生成器', 'cpu', 0);
INSERT INTO `sys_base_menus` VALUES (16, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '14', 'formCreate', 'formCreate', 0, 'view/systemTools/formCreate/index.vue', 2, 1, 0, '表单生成器', 'magic-stick', 0);
INSERT INTO `sys_base_menus` VALUES (17, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '14', 'system', 'system', 0, 'view/systemTools/system/system.vue', 3, 0, 0, '系统配置', 'operation', 0);
INSERT INTO `sys_base_menus` VALUES (18, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '3', 'dictionary', 'dictionary', 0, 'view/superAdmin/dictionary/sysDictionary.vue', 5, 0, 0, '字典管理', 'notebook', 0);
INSERT INTO `sys_base_menus` VALUES (19, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '3', 'dictionaryDetail/:id', 'dictionaryDetail', 1, 'view/superAdmin/dictionary/sysDictionaryDetail.vue', 1, 0, 0, '字典详情', 'order', 0);
INSERT INTO `sys_base_menus` VALUES (20, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '3', 'operation', 'operation', 0, 'view/superAdmin/operation/sysOperationRecord.vue', 6, 0, 0, '操作历史', 'pie-chart', 0);
INSERT INTO `sys_base_menus` VALUES (21, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '9', 'simpleUploader', 'simpleUploader', 0, 'view/example/simpleUploader/simpleUploader', 6, 0, 0, '断点续传（插件版）', 'upload', 0);
INSERT INTO `sys_base_menus` VALUES (22, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '0', 'https://www.gin-vue-admin.com', 'https://www.gin-vue-admin.com', 0, '/', 0, 0, 0, '官方网站', 'home-filled', 0);
INSERT INTO `sys_base_menus` VALUES (23, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '0', 'state', 'state', 0, 'view/system/state.vue', 6, 0, 0, '服务器状态', 'cloudy', 0);
INSERT INTO `sys_base_menus` VALUES (24, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '14', 'autoCodeAdmin', 'autoCodeAdmin', 0, 'view/systemTools/autoCodeAdmin/index.vue', 1, 0, 0, '自动化代码管理', 'magic-stick', 0);
INSERT INTO `sys_base_menus` VALUES (25, '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, '14', 'autoCodeEdit/:id', 'autoCodeEdit', 1, 'view/systemTools/autoCode/index.vue', 0, 0, 0, '自动化代码（复用）', 'magic-stick', 0);
INSERT INTO `sys_base_menus` VALUES (26, '2021-12-21 23:16:38.061', '2021-12-21 23:16:38.061', NULL, 0, '0', 'book', 'book', 0, 'view/routerHolder.vue', 6, 0, 0, '小说管理', 'notebook', 0);
INSERT INTO `sys_base_menus` VALUES (27, '2021-12-21 23:19:39.875', '2021-12-21 23:22:15.256', NULL, 0, '26', 'bookInfo', 'bookInfo', 0, 'view/book/book.vue', 0, 0, 0, '小说信息', '', 0);

-- ----------------------------
-- Table structure for sys_data_authority_id
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_authority_id`;
CREATE TABLE `sys_data_authority_id`  (
  `sys_authority_authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_authority_authority_id`, `data_authority_id_authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_authority_id
-- ----------------------------
INSERT INTO `sys_data_authority_id` VALUES ('888', '888');
INSERT INTO `sys_data_authority_id` VALUES ('888', '8881');
INSERT INTO `sys_data_authority_id` VALUES ('888', '9528');
INSERT INTO `sys_data_authority_id` VALUES ('9528', '8881');
INSERT INTO `sys_data_authority_id` VALUES ('9528', '9528');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dictionaries_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES (1, '2021-12-21 22:55:04.659', '2021-12-21 22:55:04.659', NULL, '性别', 'gender', 1, '性别字典');
INSERT INTO `sys_dictionaries` VALUES (2, '2021-12-21 22:55:04.659', '2021-12-21 22:55:04.659', NULL, '数据库int类型', 'int', 1, 'int类型对应的数据库类型');
INSERT INTO `sys_dictionaries` VALUES (3, '2021-12-21 22:55:04.659', '2021-12-21 22:55:04.659', NULL, '数据库时间日期类型', 'time.Time', 1, '数据库时间日期类型');
INSERT INTO `sys_dictionaries` VALUES (4, '2021-12-21 22:55:04.659', '2021-12-21 22:55:04.659', NULL, '数据库浮点型', 'float64', 1, '数据库浮点型');
INSERT INTO `sys_dictionaries` VALUES (5, '2021-12-21 22:55:04.659', '2021-12-21 22:55:04.659', NULL, '数据库字符串', 'string', 1, '数据库字符串');
INSERT INTO `sys_dictionaries` VALUES (6, '2021-12-21 22:55:04.659', '2021-12-21 22:55:04.659', NULL, '数据库bool类型', 'bool', 1, '数据库bool类型');

-- ----------------------------
-- Table structure for sys_dictionary_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_details`;
CREATE TABLE `sys_dictionary_details`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示值',
  `value` bigint(0) NULL DEFAULT NULL COMMENT '字典值',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '启用状态',
  `sort` bigint(0) NULL DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '关联标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dictionary_details_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary_details
-- ----------------------------
INSERT INTO `sys_dictionary_details` VALUES (1, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, '男', 1, 1, 1, 1);
INSERT INTO `sys_dictionary_details` VALUES (2, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, '女', 2, 1, 2, 1);
INSERT INTO `sys_dictionary_details` VALUES (3, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'smallint', 1, 1, 1, 2);
INSERT INTO `sys_dictionary_details` VALUES (4, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'mediumint', 2, 1, 2, 2);
INSERT INTO `sys_dictionary_details` VALUES (5, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'int', 3, 1, 3, 2);
INSERT INTO `sys_dictionary_details` VALUES (6, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'bigint', 4, 1, 4, 2);
INSERT INTO `sys_dictionary_details` VALUES (7, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'date', 0, 1, 0, 3);
INSERT INTO `sys_dictionary_details` VALUES (8, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'time', 1, 1, 1, 3);
INSERT INTO `sys_dictionary_details` VALUES (9, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'year', 2, 1, 2, 3);
INSERT INTO `sys_dictionary_details` VALUES (10, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'datetime', 3, 1, 3, 3);
INSERT INTO `sys_dictionary_details` VALUES (11, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'timestamp', 5, 1, 5, 3);
INSERT INTO `sys_dictionary_details` VALUES (12, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'float', 0, 1, 0, 4);
INSERT INTO `sys_dictionary_details` VALUES (13, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'double', 1, 1, 1, 4);
INSERT INTO `sys_dictionary_details` VALUES (14, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'decimal', 2, 1, 2, 4);
INSERT INTO `sys_dictionary_details` VALUES (15, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'char', 0, 1, 0, 5);
INSERT INTO `sys_dictionary_details` VALUES (16, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'varchar', 1, 1, 1, 5);
INSERT INTO `sys_dictionary_details` VALUES (17, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'tinyblob', 2, 1, 2, 5);
INSERT INTO `sys_dictionary_details` VALUES (18, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'tinytext', 3, 1, 3, 5);
INSERT INTO `sys_dictionary_details` VALUES (19, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'text', 4, 1, 4, 5);
INSERT INTO `sys_dictionary_details` VALUES (20, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'blob', 5, 1, 5, 5);
INSERT INTO `sys_dictionary_details` VALUES (21, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'mediumblob', 6, 1, 6, 5);
INSERT INTO `sys_dictionary_details` VALUES (22, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'mediumtext', 7, 1, 7, 5);
INSERT INTO `sys_dictionary_details` VALUES (23, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'longblob', 8, 1, 8, 5);
INSERT INTO `sys_dictionary_details` VALUES (24, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'longtext', 9, 1, 9, 5);
INSERT INTO `sys_dictionary_details` VALUES (25, '2021-12-21 22:55:04.739', '2021-12-21 22:55:04.739', NULL, 'tinyint', 0, 1, 0, 6);

-- ----------------------------
-- Table structure for sys_operation_records
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_records`;
CREATE TABLE `sys_operation_records`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `status` bigint(0) NULL DEFAULT NULL COMMENT '请求状态',
  `latency` bigint(0) NULL DEFAULT NULL COMMENT '延迟',
  `agent` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理',
  `error_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求Body',
  `resp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应Body',
  `user_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_operation_records_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_records
-- ----------------------------
INSERT INTO `sys_operation_records` VALUES (1, '2021-12-21 23:16:38.079', '2021-12-21 23:16:38.079', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200, 20469600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"ID\":0,\"path\":\"book\",\"name\":\"book\",\"hidden\":false,\"parentId\":\"0\",\"component\":\"view/routerHolder.vue\",\"meta\":{\"title\":\"小说管理\",\"icon\":\"notebook\",\"defaultMenu\":false,\"keepAlive\":\"\"},\"sort\":6,\"parameters\":[]}', '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (2, '2021-12-21 23:17:06.359', '2021-12-21 23:17:06.359', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority', 200, 35036300, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"menus\":[{\"ID\":22,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"https://www.gin-vue-admin.com\",\"name\":\"https://www.gin-vue-admin.com\",\"hidden\":false,\"component\":\"/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"官方网站\",\"icon\":\"home-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":1,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":3,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":19,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":18,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":20,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":19,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":18,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":20,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":8,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":14,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码（复用）\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":24,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":25,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码（复用）\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":24,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":23,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":false,\"component\":\"view/system/state.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":26,\"CreatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"UpdatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"parentId\":\"0\",\"path\":\"book\",\"name\":\"book\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":9,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":21,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":13,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":13,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":2,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"authorityId\":\"888\"}', '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (3, '2021-12-21 23:17:32.287', '2021-12-21 23:17:32.287', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority', 200, 33759600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"menus\":[{\"ID\":1,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":3,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":19,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":18,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":20,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":8,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":14,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码（复用）\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":24,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":26,\"CreatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"UpdatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"parentId\":\"0\",\"path\":\"book\",\"name\":\"book\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":9,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":21,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":13,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":2,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"authorityId\":\"9528\"}', '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (4, '2021-12-21 23:17:34.316', '2021-12-21 23:17:34.316', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority', 200, 35068700, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"menus\":[{\"ID\":1,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":3,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":19,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":18,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":20,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":8,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":14,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码（复用）\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":24,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":26,\"CreatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"UpdatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"parentId\":\"0\",\"path\":\"book\",\"name\":\"book\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":9,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":21,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":13,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":2,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"authorityId\":\"9528\"}', '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (5, '2021-12-21 23:17:44.920', '2021-12-21 23:17:44.920', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200, 94263900, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"authorityId\":\"9528\",\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/book/createBook\",\"method\":\"POST\"},{\"path\":\"/book/deleteBook\",\"method\":\"DELETE\"},{\"path\":\"/book/deleteBookByIds\",\"method\":\"DELETE\"},{\"path\":\"/book/updateBook\",\"method\":\"PUT\"},{\"path\":\"/book/findBook\",\"method\":\"GET\"},{\"path\":\"/book/getBookList\",\"method\":\"GET\"}]}', '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (6, '2021-12-21 23:17:45.730', '2021-12-21 23:17:45.730', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200, 92757600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"authorityId\":\"9528\",\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/book/createBook\",\"method\":\"POST\"},{\"path\":\"/book/deleteBook\",\"method\":\"DELETE\"},{\"path\":\"/book/deleteBookByIds\",\"method\":\"DELETE\"},{\"path\":\"/book/updateBook\",\"method\":\"PUT\"},{\"path\":\"/book/findBook\",\"method\":\"GET\"},{\"path\":\"/book/getBookList\",\"method\":\"GET\"}]}', '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (7, '2021-12-21 23:17:55.840', '2021-12-21 23:17:55.840', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200, 141572800, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"authorityId\":\"888\",\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/deleteUser\",\"method\":\"DELETE\"},{\"path\":\"/user/register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/setUserInfo\",\"method\":\"PUT\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/setUserAuthorities\",\"method\":\"POST\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/getDB\",\"method\":\"GET\"},{\"path\":\"/autoCode/getTables\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/autoCode/preview\",\"method\":\"POST\"},{\"path\":\"/autoCode/getColumn\",\"method\":\"GET\"},{\"path\":\"/autoCode/getMeta\",\"method\":\"POST\"},{\"path\":\"/autoCode/rollback\",\"method\":\"POST\"},{\"path\":\"/autoCode/getSysHistory\",\"method\":\"POST\"},{\"path\":\"/autoCode/delSysHistory\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/updateSysDictionaryDetail\",\"method\":\"PUT\"},{\"path\":\"/sysDictionaryDetail/createSysDictionaryDetail\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/deleteSysDictionaryDetail\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionaryDetail/findSysDictionaryDetail\",\"method\":\"GET\"},{\"path\":\"/sysDictionaryDetail/getSysDictionaryDetailList\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/createSysDictionary\",\"method\":\"POST\"},{\"path\":\"/sysDictionary/deleteSysDictionary\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionary/updateSysDictionary\",\"method\":\"PUT\"},{\"path\":\"/sysDictionary/findSysDictionary\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/getSysDictionaryList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/createSysOperationRecord\",\"method\":\"POST\"},{\"path\":\"/sysOperationRecord/findSysOperationRecord\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/getSysOperationRecordList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecord\",\"method\":\"DELETE\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecordByIds\",\"method\":\"DELETE\"},{\"path\":\"/simpleUploader/upload\",\"method\":\"POST\"},{\"path\":\"/simpleUploader/checkFileMd5\",\"method\":\"GET\"},{\"path\":\"/simpleUploader/mergeFileMd5\",\"method\":\"GET\"},{\"path\":\"/email/emailTest\",\"method\":\"POST\"},{\"path\":\"/excel/importExcel\",\"method\":\"POST\"},{\"path\":\"/excel/loadExcel\",\"method\":\"GET\"},{\"path\":\"/excel/exportExcel\",\"method\":\"POST\"},{\"path\":\"/excel/downloadTemplate\",\"method\":\"GET\"},{\"path\":\"/book/createBook\",\"method\":\"POST\"},{\"path\":\"/book/deleteBook\",\"method\":\"DELETE\"},{\"path\":\"/book/deleteBookByIds\",\"method\":\"DELETE\"},{\"path\":\"/book/updateBook\",\"method\":\"PUT\"},{\"path\":\"/book/findBook\",\"method\":\"GET\"},{\"path\":\"/book/getBookList\",\"method\":\"GET\"}]}', '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (8, '2021-12-21 23:19:39.892', '2021-12-21 23:19:39.892', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200, 20161100, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"ID\":0,\"path\":\"bookInfo\",\"name\":\"bookInfo\",\"hidden\":false,\"parentId\":\"26\",\"component\":\"view/book.vue\",\"meta\":{\"title\":\"小说信息\",\"icon\":\"\",\"defaultMenu\":false,\"closeTab\":false,\"keepAlive\":false},\"parameters\":[]}', '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (9, '2021-12-21 23:20:04.800', '2021-12-21 23:20:04.800', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority', 200, 34068000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"menus\":[{\"ID\":22,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"https://www.gin-vue-admin.com\",\"name\":\"https://www.gin-vue-admin.com\",\"hidden\":false,\"component\":\"/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"官方网站\",\"icon\":\"home-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":1,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":3,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":19,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":18,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":20,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":19,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":18,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":20,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":8,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":14,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码（复用）\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":24,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":25,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码（复用）\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":24,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":23,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":false,\"component\":\"view/system/state.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":9,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":21,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":13,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":13,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":26,\"CreatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"UpdatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"parentId\":\"0\",\"path\":\"book\",\"name\":\"book\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":27,\"CreatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"UpdatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"parentId\":\"26\",\"path\":\"bookInfo\",\"name\":\"bookInfo\",\"hidden\":false,\"component\":\"view/book.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说信息\",\"icon\":\"\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":27,\"CreatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"UpdatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"parentId\":\"26\",\"path\":\"bookInfo\",\"name\":\"bookInfo\",\"hidden\":false,\"component\":\"view/book.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说信息\",\"icon\":\"\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":2,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"authorityId\":\"888\"}', '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (10, '2021-12-21 23:20:08.068', '2021-12-21 23:20:08.068', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority', 200, 32615800, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"menus\":[{\"ID\":1,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":3,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":19,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":18,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":20,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":4,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":5,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":6,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":7,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":8,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":14,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码（复用）\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":24,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":15,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":16,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":17,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":9,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":21,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":13,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":10,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":11,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":12,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":26,\"CreatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"UpdatedAt\":\"2021-12-21T23:16:38.061+08:00\",\"parentId\":\"0\",\"path\":\"book\",\"name\":\"book\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":27,\"CreatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"UpdatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"parentId\":\"26\",\"path\":\"bookInfo\",\"name\":\"bookInfo\",\"hidden\":false,\"component\":\"view/book.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说信息\",\"icon\":\"\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"parameters\":[]},{\"ID\":27,\"CreatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"UpdatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"parentId\":\"26\",\"path\":\"bookInfo\",\"name\":\"bookInfo\",\"hidden\":false,\"component\":\"view/book.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说信息\",\"icon\":\"\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]},{\"ID\":2,\"CreatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"UpdatedAt\":\"2021-12-21T22:55:04.619+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}],\"authorityId\":\"9528\"}', '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1);
INSERT INTO `sys_operation_records` VALUES (11, '2021-12-21 23:22:15.273', '2021-12-21 23:22:15.273', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 19494200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0', '', '{\"ID\":27,\"CreatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"UpdatedAt\":\"2021-12-21T23:19:39.875+08:00\",\"parentId\":\"26\",\"path\":\"bookInfo\",\"name\":\"bookInfo\",\"hidden\":false,\"component\":\"view/book/book.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"小说信息\",\"icon\":\"\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[]}', '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1);

-- ----------------------------
-- Table structure for sys_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_authority`;
CREATE TABLE `sys_user_authority`  (
  `sys_user_id` bigint(0) UNSIGNED NOT NULL,
  `sys_authority_authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`, `sys_authority_authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_authority
-- ----------------------------
INSERT INTO `sys_user_authority` VALUES (1, '888');
INSERT INTO `sys_user_authority` VALUES (1, '8881');
INSERT INTO `sys_user_authority` VALUES (1, '9528');
INSERT INTO `sys_user_authority` VALUES (2, '888');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户UUID',
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录密码',
  `nick_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '系统用户' COMMENT '用户昵称',
  `side_mode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'dark' COMMENT '用户侧边主题',
  `header_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
  `base_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#fff' COMMENT '基础颜色',
  `active_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#1890ff' COMMENT '活跃颜色',
  `authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '888' COMMENT '用户角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_users_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, '2021-12-21 22:55:04.584', '2021-12-21 22:55:04.584', NULL, '17303000-69c4-48ad-8145-0796ed8b320b', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', 'dark', 'https://qmplusimg.henrongyi.top/gva_header.jpg', '#fff', '#1890ff', '888');
INSERT INTO `sys_users` VALUES (2, '2021-12-21 22:55:04.584', '2021-12-21 22:55:04.584', NULL, '173db55f-8ed2-48ef-b1a9-027d9b17f241', 'a303176530', '3ec063004a6f31642261936a379fde3d', 'QMPlusUser', 'dark', 'https:///qmplusimg.henrongyi.top/1572075907logo.png', '#fff', '#1890ff', '9528');

-- ----------------------------
-- View structure for authority_menu
-- ----------------------------
DROP VIEW IF EXISTS `authority_menu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `authority_menu` AS select `sys_base_menus`.`id` AS `id`,`sys_base_menus`.`path` AS `path`,`sys_base_menus`.`icon` AS `icon`,`sys_base_menus`.`name` AS `name`,`sys_base_menus`.`sort` AS `sort`,`sys_base_menus`.`title` AS `title`,`sys_base_menus`.`hidden` AS `hidden`,`sys_base_menus`.`component` AS `component`,`sys_base_menus`.`parent_id` AS `parent_id`,`sys_base_menus`.`created_at` AS `created_at`,`sys_base_menus`.`updated_at` AS `updated_at`,`sys_base_menus`.`deleted_at` AS `deleted_at`,`sys_base_menus`.`keep_alive` AS `keep_alive`,`sys_base_menus`.`menu_level` AS `menu_level`,`sys_base_menus`.`default_menu` AS `default_menu`,`sys_base_menus`.`close_tab` AS `close_tab`,`sys_authority_menus`.`sys_base_menu_id` AS `menu_id`,`sys_authority_menus`.`sys_authority_authority_id` AS `authority_id` from (`sys_authority_menus` join `sys_base_menus` on((`sys_authority_menus`.`sys_base_menu_id` = `sys_base_menus`.`id`)));

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, 'dashboard', 'odometer', 'dashboard', 1, '仪表盘', 0, 'view/dashboard/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 1, '888');
INSERT INTO `sys_users` VALUES (2, 'about', 'info-filled', 'about', 7, '关于我们', 0, 'view/about/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 2, '888');
INSERT INTO `sys_users` VALUES (3, 'admin', 'user', 'superAdmin', 3, '超级管理员', 0, 'view/superAdmin/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 3, '888');
INSERT INTO `sys_users` VALUES (4, 'authority', 'avatar', 'authority', 1, '角色管理', 0, 'view/superAdmin/authority/authority.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 4, '888');
INSERT INTO `sys_users` VALUES (5, 'menu', 'tickets', 'menu', 2, '菜单管理', 0, 'view/superAdmin/menu/menu.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 1, 0, 0, 0, 5, '888');
INSERT INTO `sys_users` VALUES (6, 'api', 'platform', 'api', 3, 'api管理', 0, 'view/superAdmin/api/api.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 1, 0, 0, 0, 6, '888');
INSERT INTO `sys_users` VALUES (7, 'user', 'coordinate', 'user', 4, '用户管理', 0, 'view/superAdmin/user/user.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 7, '888');
INSERT INTO `sys_users` VALUES (8, 'person', 'message', 'person', 4, '个人信息', 1, 'view/person/person.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 8, '888');
INSERT INTO `sys_users` VALUES (9, 'example', 'management', 'example', 6, '示例文件', 0, 'view/example/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 9, '888');
INSERT INTO `sys_users` VALUES (10, 'excel', 'takeaway-box', 'excel', 4, 'excel导入导出', 0, 'view/example/excel/excel.vue', '9', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 10, '888');
INSERT INTO `sys_users` VALUES (11, 'upload', 'upload', 'upload', 5, '媒体库（上传下载）', 0, 'view/example/upload/upload.vue', '9', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 11, '888');
INSERT INTO `sys_users` VALUES (12, 'breakpoint', 'upload-filled', 'breakpoint', 6, '断点续传', 0, 'view/example/breakpoint/breakpoint.vue', '9', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 12, '888');
INSERT INTO `sys_users` VALUES (13, 'customer', 'avatar', 'customer', 7, '客户列表（资源示例）', 0, 'view/example/customer/customer.vue', '9', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 13, '888');
INSERT INTO `sys_users` VALUES (14, 'systemTools', 'tools', 'systemTools', 5, '系统工具', 0, 'view/systemTools/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 14, '888');
INSERT INTO `sys_users` VALUES (15, 'autoCode', 'cpu', 'autoCode', 1, '代码生成器', 0, 'view/systemTools/autoCode/index.vue', '14', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 1, 0, 0, 0, 15, '888');
INSERT INTO `sys_users` VALUES (16, 'formCreate', 'magic-stick', 'formCreate', 2, '表单生成器', 0, 'view/systemTools/formCreate/index.vue', '14', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 1, 0, 0, 0, 16, '888');
INSERT INTO `sys_users` VALUES (17, 'system', 'operation', 'system', 3, '系统配置', 0, 'view/systemTools/system/system.vue', '14', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 17, '888');
INSERT INTO `sys_users` VALUES (18, 'dictionary', 'notebook', 'dictionary', 5, '字典管理', 0, 'view/superAdmin/dictionary/sysDictionary.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 18, '888');
INSERT INTO `sys_users` VALUES (19, 'dictionaryDetail/:id', 'order', 'dictionaryDetail', 1, '字典详情', 1, 'view/superAdmin/dictionary/sysDictionaryDetail.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 19, '888');
INSERT INTO `sys_users` VALUES (20, 'operation', 'pie-chart', 'operation', 6, '操作历史', 0, 'view/superAdmin/operation/sysOperationRecord.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 20, '888');
INSERT INTO `sys_users` VALUES (22, 'https://www.gin-vue-admin.com', 'home-filled', 'https://www.gin-vue-admin.com', 0, '官方网站', 0, '/', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 22, '888');
INSERT INTO `sys_users` VALUES (23, 'state', 'cloudy', 'state', 6, '服务器状态', 0, 'view/system/state.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 23, '888');
INSERT INTO `sys_users` VALUES (24, 'autoCodeAdmin', 'magic-stick', 'autoCodeAdmin', 1, '自动化代码管理', 0, 'view/systemTools/autoCodeAdmin/index.vue', '14', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 24, '888');
INSERT INTO `sys_users` VALUES (25, 'autoCodeEdit/:id', 'magic-stick', 'autoCodeEdit', 0, '自动化代码（复用）', 1, 'view/systemTools/autoCode/index.vue', '14', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 25, '888');
INSERT INTO `sys_users` VALUES (26, 'book', 'notebook', 'book', 6, '小说管理', 0, 'view/routerHolder.vue', '0', '2021-12-21 23:16:38.061', '2021-12-21 23:16:38.061', NULL, 0, 0, 0, 0, 26, '888');
INSERT INTO `sys_users` VALUES (27, 'bookInfo', '', 'bookInfo', 0, '小说信息', 0, 'view/book/book.vue', '26', '2021-12-21 23:19:39.875', '2021-12-21 23:22:15.256', NULL, 0, 0, 0, 0, 27, '888');
INSERT INTO `sys_users` VALUES (1, 'dashboard', 'odometer', 'dashboard', 1, '仪表盘', 0, 'view/dashboard/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 1, '8881');
INSERT INTO `sys_users` VALUES (2, 'about', 'info-filled', 'about', 7, '关于我们', 0, 'view/about/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 2, '8881');
INSERT INTO `sys_users` VALUES (8, 'person', 'message', 'person', 4, '个人信息', 1, 'view/person/person.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 8, '8881');
INSERT INTO `sys_users` VALUES (1, 'dashboard', 'odometer', 'dashboard', 1, '仪表盘', 0, 'view/dashboard/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 1, '9528');
INSERT INTO `sys_users` VALUES (2, 'about', 'info-filled', 'about', 7, '关于我们', 0, 'view/about/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 2, '9528');
INSERT INTO `sys_users` VALUES (3, 'admin', 'user', 'superAdmin', 3, '超级管理员', 0, 'view/superAdmin/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 3, '9528');
INSERT INTO `sys_users` VALUES (4, 'authority', 'avatar', 'authority', 1, '角色管理', 0, 'view/superAdmin/authority/authority.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 4, '9528');
INSERT INTO `sys_users` VALUES (5, 'menu', 'tickets', 'menu', 2, '菜单管理', 0, 'view/superAdmin/menu/menu.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 1, 0, 0, 0, 5, '9528');
INSERT INTO `sys_users` VALUES (6, 'api', 'platform', 'api', 3, 'api管理', 0, 'view/superAdmin/api/api.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 1, 0, 0, 0, 6, '9528');
INSERT INTO `sys_users` VALUES (7, 'user', 'coordinate', 'user', 4, '用户管理', 0, 'view/superAdmin/user/user.vue', '3', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 7, '9528');
INSERT INTO `sys_users` VALUES (8, 'person', 'message', 'person', 4, '个人信息', 1, 'view/person/person.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 8, '9528');
INSERT INTO `sys_users` VALUES (9, 'example', 'management', 'example', 6, '示例文件', 0, 'view/example/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 9, '9528');
INSERT INTO `sys_users` VALUES (10, 'excel', 'takeaway-box', 'excel', 4, 'excel导入导出', 0, 'view/example/excel/excel.vue', '9', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 10, '9528');
INSERT INTO `sys_users` VALUES (11, 'upload', 'upload', 'upload', 5, '媒体库（上传下载）', 0, 'view/example/upload/upload.vue', '9', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 11, '9528');
INSERT INTO `sys_users` VALUES (12, 'breakpoint', 'upload-filled', 'breakpoint', 6, '断点续传', 0, 'view/example/breakpoint/breakpoint.vue', '9', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 12, '9528');
INSERT INTO `sys_users` VALUES (14, 'systemTools', 'tools', 'systemTools', 5, '系统工具', 0, 'view/systemTools/index.vue', '0', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 14, '9528');
INSERT INTO `sys_users` VALUES (15, 'autoCode', 'cpu', 'autoCode', 1, '代码生成器', 0, 'view/systemTools/autoCode/index.vue', '14', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 1, 0, 0, 0, 15, '9528');
INSERT INTO `sys_users` VALUES (16, 'formCreate', 'magic-stick', 'formCreate', 2, '表单生成器', 0, 'view/systemTools/formCreate/index.vue', '14', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 1, 0, 0, 0, 16, '9528');
INSERT INTO `sys_users` VALUES (17, 'system', 'operation', 'system', 3, '系统配置', 0, 'view/systemTools/system/system.vue', '14', '2021-12-21 22:55:04.619', '2021-12-21 22:55:04.619', NULL, 0, 0, 0, 0, 17, '9528');
INSERT INTO `sys_users` VALUES (26, 'book', 'notebook', 'book', 6, '小说管理', 0, 'view/routerHolder.vue', '0', '2021-12-21 23:16:38.061', '2021-12-21 23:16:38.061', NULL, 0, 0, 0, 0, 26, '9528');
INSERT INTO `sys_users` VALUES (27, 'bookInfo', '', 'bookInfo', 0, '小说信息', 0, 'view/book/book.vue', '26', '2021-12-21 23:19:39.875', '2021-12-21 23:22:15.256', NULL, 0, 0, 0, 0, 27, '9528');

SET FOREIGN_KEY_CHECKS = 1;
