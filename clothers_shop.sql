/*
 Navicat Premium Data Transfer

 Source Server         : ShopMyPham
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3307
 Source Schema         : clothers_shop

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 16/12/2023 19:54:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `RE_LOGIN_TOKEN` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `VALIDATE_TOKEN` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LAST_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FIRST_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ROLE_ID` bigint NULL DEFAULT NULL,
  `STATUS_ID` bigint NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ACCOUNT_ROLE`(`ROLE_ID` ASC) USING BTREE,
  INDEX `ACCOUNT_STATUS`(`STATUS_ID` ASC) USING BTREE,
  CONSTRAINT `ACCOUNT_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACCOUNT_STATUS` FOREIGN KEY (`STATUS_ID`) REFERENCES `status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, NULL, NULL, 'Lương Hữu', 'Luân', '1215943200', 'admin1@gmail.com', NULL, 'admin1', 'e00cf25ad42683b3df678c61f42c6bda', 1, 2, '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `account` VALUES (2, NULL, NULL, 'Nguyễn Dũy', 'Long', '1325943200', 'admin2@gmail.com', NULL, 'admin2', 'c84258e9c39059a89ab77d846ddab909', 1, 2, '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `account` VALUES (3, NULL, NULL, 'Nguyễn Công', 'Phúc', '3455943200', 'admin3@gmail.com', NULL, 'admin3', '32cacb2f994f6b42183a1300d9a3e8d6', 1, 2, '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `account` VALUES (4, NULL, NULL, 'Nguyễn Văn', 'A', '1826384619', 'khachhang1@gmail.com', NULL, 'khachhang1', '32cacb2f994f6b42183a1300d9a3e8d6', 1, 2, '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `account` VALUES (5, NULL, '41c67630-117f-4e01-85f4-d25f5e04b016', 'quân', 'Bùi Dương', '0328216787', 'khaquan9a2.2016@gmail.com1', NULL, 'admin', 'b59c67bf196a4758191e42f76670ceba', 2, 2, '2023-12-14 19:12:37', NULL, '2023-12-14 19:12:37', NULL);
INSERT INTO `account` VALUES (16, NULL, '4b133537-d55a-4d19-9060-32794ee3285f', 'quân', 'Bùi Dương', '0328216787', 'khaquan9a2.2016@gmail.com11', NULL, 'admin111', 'b59c67bf196a4758191e42f76670ceba', 2, 2, '2023-12-16 17:53:24', NULL, '2023-12-16 17:53:24', NULL);
INSERT INTO `account` VALUES (17, NULL, 'da48e47b-4a20-4524-9709-668efd971144', 'quân', 'Bùi Dương', '0328216787', 'khaquan9a2.2016@gmail.com11111', NULL, 'admin1111', 'b59c67bf196a4758191e42f76670ceba', 2, 2, '2023-12-16 18:08:39', NULL, '2023-12-16 18:08:39', NULL);
INSERT INTO `account` VALUES (18, NULL, '98e4aa0b-a2ca-456d-a53e-89dcb8c7d47a', 'quân', 'Bùi Dương', '0328216787', 'khaquan9a2.2016@gmail.com', NULL, 'admin2222', 'b59c67bf196a4758191e42f76670ceba', 2, 2, '2023-12-16 19:13:20', NULL, '2023-12-16 19:13:20', NULL);

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, 'NIKE', 'NIKE', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `brand` VALUES (2, 'FAKE', 'FAKE', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `brand` VALUES (3, 'LOCAL-BRAND', 'LOCAL BRAND', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `brand` VALUES (4, 'GUUCI', 'GUCCI', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `brand` VALUES (5, 'LV', 'LV', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACCOUNT_ID` bigint NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CART_ACCOUNT`(`ACCOUNT_ID` ASC) USING BTREE,
  CONSTRAINT `CART_ACCOUNT` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 5, '2023-12-14 19:13:52', NULL, '2023-12-14 19:13:52', NULL);
INSERT INTO `cart` VALUES (2, 17, '2023-12-16 18:09:10', NULL, '2023-12-16 18:09:10', NULL);
INSERT INTO `cart` VALUES (3, 18, '2023-12-16 19:13:39', NULL, '2023-12-16 19:13:39', NULL);

-- ----------------------------
-- Table structure for cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE `cart_detail`  (
  `CART_ID` bigint NULL DEFAULT NULL,
  `PRODUCT_ID` bigint NULL DEFAULT NULL,
  `COLOR_ID` bigint NULL DEFAULT NULL,
  `SIZE_ID` bigint NULL DEFAULT NULL,
  `AMOUNT` int NULL DEFAULT 1,
  INDEX `CART_DETAIL_CART`(`CART_ID` ASC) USING BTREE,
  INDEX `CART_DETAIL_PRODUCT`(`PRODUCT_ID` ASC) USING BTREE,
  INDEX `CART_DETAIL_COLOR`(`COLOR_ID` ASC) USING BTREE,
  INDEX `CART_DETAIL_SIZE`(`SIZE_ID` ASC) USING BTREE,
  CONSTRAINT `CART_DETAIL_CART` FOREIGN KEY (`CART_ID`) REFERENCES `cart` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CART_DETAIL_COLOR` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CART_DETAIL_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CART_DETAIL_SIZE` FOREIGN KEY (`SIZE_ID`) REFERENCES `size` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_detail
-- ----------------------------
INSERT INTO `cart_detail` VALUES (1, 1, 1, 1, 1);
INSERT INTO `cart_detail` VALUES (2, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'AO-KHOAT', 'ÁO KHOÁT', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `category` VALUES (2, 'QUAN-TAY', 'QUẦN TÂY', '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES (1, 'DEN', 'ĐEN', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (2, 'TRANG', 'TRẮNG', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (3, 'DO', 'ĐỎ', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (4, 'XAM', 'XÁM', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (5, 'BAC', 'BẠC', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (6, 'XANH', 'XANH', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (7, 'XANH-REU', 'XANH RÊU', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (8, 'XANH-DEN', 'XANH ĐEN', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (9, 'BO', 'BÓ', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (10, 'BE', 'BE', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `color` VALUES (11, 'NAU', 'NÂU', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `ORDER_ID` bigint NULL DEFAULT NULL,
  `PRODUCT_ID` bigint NULL DEFAULT NULL,
  `COLOR_ID` bigint NULL DEFAULT NULL,
  `SIZE_ID` bigint NULL DEFAULT NULL,
  `AMOUNT` int NULL DEFAULT 1,
  `PRICE` double NULL DEFAULT NULL,
  `DISCOUNT` int NULL DEFAULT NULL,
  INDEX `ORDER_DETAIL_ORDER`(`ORDER_ID` ASC) USING BTREE,
  INDEX `ORDER_DETAIL_PRODUCT`(`PRODUCT_ID` ASC) USING BTREE,
  INDEX `ORDER_DETAIL_COLOR`(`COLOR_ID` ASC) USING BTREE,
  INDEX `ORDER_DETAIL_SIZE`(`SIZE_ID` ASC) USING BTREE,
  CONSTRAINT `ORDER_DETAIL_COLOR` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ORDER_DETAIL_ORDER` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ORDER_DETAIL_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ORDER_DETAIL_SIZE` FOREIGN KEY (`SIZE_ID`) REFERENCES `size` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (15, 1, 1, 1, 1, 315000, 0);
INSERT INTO `order_detail` VALUES (16, 1, 1, 1, 1, 315000, 0);
INSERT INTO `order_detail` VALUES (17, 1, 1, 1, 1, 315000, 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACCOUNT_ID` bigint NULL DEFAULT NULL,
  `RECIPIENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORDERS_PHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ORDERS_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STATUS_ID` bigint NULL DEFAULT 4,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `HASHMESS` varchar(5000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ORDER_ACCOUNT`(`ACCOUNT_ID` ASC) USING BTREE,
  INDEX `ORDER_STATUS`(`STATUS_ID` ASC) USING BTREE,
  CONSTRAINT `ORDER_ACCOUNT` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ORDER_STATUS` FOREIGN KEY (`STATUS_ID`) REFERENCES `status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (15, 18, 'quân Bùi Dương', '0328216787', 'Chợ Mới', 5, '2023-12-16 19:23:13', NULL, '2023-12-16 19:23:13', NULL, '');
INSERT INTO `orders` VALUES (16, 18, 'quân Bùi Dương', '0328216787', 'Linh Trung, Thủ Đức', 5, '2023-12-16 19:31:05', NULL, '2023-12-16 19:31:05', NULL, 'AJ6yoQM3EFOuV7dewLUpDjh9kon1iKo58LntME64taIUUq231JotEFgmwNTxeTo8EZAp8cvLYbQy91d34D4LnUMoccq0fJSRhvdFVClSklMOUJ+3SiOk+1qg1HtRWFzFSjmADEKIsHr4+iMKNCFWdiWdCkKXYeWHJ4MS4LElWm2r39b5RbRf6P8nzLx04fBZMBPXmGg/7juu8YOWH6u+/Cp0/XNX7MKI/q7IH/OQp4p5lss0WpI3ASeAAMwyNQ7gUI9zs2BTLm/d4M5lsSDKSDLa9UHcc6vjhz+l/NyshBsl1zs/KyqpuRuNgv3GmXGf1paVC3C1oVEH6OqsEYu1zA==');
INSERT INTO `orders` VALUES (17, 18, 'quân Bùi Dương', '0328216787', 'Chợ Mới', 4, '2023-12-16 19:46:57', NULL, '2023-12-16 19:46:57', NULL, 'OVy/Id9QciYV6R0n5z7WGSay/Z1DmHzVb0kgTT38IOtYfaDy9eIuMV9w75IjMctYPBbiVG56NPOtd9V3ptfd/CWSssCxfnUNmoQrePS+1ml+Wa+ReIcOEaUw0hNkM2pvaZrD1IzJvawEb8zMSSJtQTiBriwPTe2rlFTr69U8FhG4zcVJZtkokt4Ef1+YnvRyhMZ64DVa2m9HH7fr7bkvJ1QHserKiQ+zryagCZw0cKf+rcZ9iAXYHVK9XvIa0164hcCVEANtMJ8+lP7kmePLy33EaDOWMpHhIsjCb9qINoObQ0BsFxRpUAwzAn7Q5yrmNL+C6F6rWPRIO2JEIajyUQ==');

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`  (
  `PRODUCT_ID` bigint NULL DEFAULT NULL,
  `PHOTO_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  INDEX `PHOTO_PRODUCT`(`PRODUCT_ID` ASC) USING BTREE,
  CONSTRAINT `PHOTO_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_den_1_1.jpg');
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_den_1_2.jpg');
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_den_1_3.png');
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_den_1_4.jpg');
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_do_1_1.jpg');
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_do_1_2.jpg');
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_do_1_3.jpg');
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_do_1_4.jpg');
INSERT INTO `photo` VALUES (1, '/assets/imgs/product-imgs/ak_trang_1_1.jpg');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_den_2_1.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_den_2_2.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_den_2_3.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_den_2_4.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_den_2_5.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_den_2_6.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_reu_2_1.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_reu_2_2.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_reu_2_3.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_reu_2_4.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_reu_2_5.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_reu_2_6.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_xam_2_1.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_xam_2_2.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_xam_2_3.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_xam_2_4.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_xam_2_5.png');
INSERT INTO `photo` VALUES (2, '/assets/imgs/product-imgs/ak_xam_2_6.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_bo_3_1.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_bo_3_2.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_bo_3_3.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_bo_3_4.jpg');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_reu_3_1.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_reu_3_2.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_reu_3_3.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_reu_3_4.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_reu_3_5.png');
INSERT INTO `photo` VALUES (3, '/assets/imgs/product-imgs/ak_reu_3_6.jpg');
INSERT INTO `photo` VALUES (4, '/assets/imgs/product-imgs/ak_den_4_1.png');
INSERT INTO `photo` VALUES (4, '/assets/imgs/product-imgs/ak_den_4_2.png');
INSERT INTO `photo` VALUES (4, '/assets/imgs/product-imgs/ak_den_4_3.png');
INSERT INTO `photo` VALUES (4, '/assets/imgs/product-imgs/ak_xam_4_1.png');
INSERT INTO `photo` VALUES (4, '/assets/imgs/product-imgs/ak_xam_4_2.png');
INSERT INTO `photo` VALUES (4, '/assets/imgs/product-imgs/ak_xam_4_3.png');
INSERT INTO `photo` VALUES (4, '/assets/imgs/product-imgs/ak_xam_4_4.png');
INSERT INTO `photo` VALUES (5, '/assets/imgs/product-imgs/ak_den_5_1.png');
INSERT INTO `photo` VALUES (5, '/assets/imgs/product-imgs/ak_den_5_2.png');
INSERT INTO `photo` VALUES (5, '/assets/imgs/product-imgs/ak_den_5_3.png');
INSERT INTO `photo` VALUES (5, '/assets/imgs/product-imgs/ak_reu_5_1.png');
INSERT INTO `photo` VALUES (5, '/assets/imgs/product-imgs/ak_reu_5_2.png');
INSERT INTO `photo` VALUES (5, '/assets/imgs/product-imgs/ak_reu_5_3.png');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_be_6_1.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_be_6_2.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_be_6_3.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_be_6_4.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_be_6_5.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_den_6_1.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_den_6_2.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_den_6_3.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_den_6_4.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_den_6_5.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_xanh_6_1.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_xanh_6_2.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_xanh_6_3.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_xanh_6_4.jpg');
INSERT INTO `photo` VALUES (6, '/assets/imgs/product-imgs/ak_xanh_6_5.jpg');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_bo_7_1.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_bo_7_2.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_bo_7_3.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_bo_7_4.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_bo_7_5.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_den_7_1.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_den_7_2.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_den_7_3.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_den_7_4.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_xam_7_1.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_xam_7_2.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_xam_7_3.png');
INSERT INTO `photo` VALUES (7, '/assets/imgs/product-imgs/ak_xam_7_4.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_den_8_1.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_den_8_2.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_den_8_3.jpg');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_den_8_4.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_den_8_5.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_nau_8_1.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_nau_8_2.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_nau_8_3.jpg');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_nau_8_4.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_nau_8_5.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_trang_8_1.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_trang_8_2.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_trang_8_3.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_trang_8_4.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_xam_8_1.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_xam_8_2.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_xam_8_3.jpg');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_xam_8_4.png');
INSERT INTO `photo` VALUES (8, '/assets/imgs/product-imgs/ak_xam_8_5.png');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_nau_9_1.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_nau_9_2.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_nau_9_3.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_nau_9_4.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_nau_9_5.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_xam_9_1.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_xam_9_2.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_xam_9_3.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_xam_9_4.jpg');
INSERT INTO `photo` VALUES (9, '/assets/imgs/product-imgs/ak_xam_9_5.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_bo_10_1.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_bo_10_2.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_bo_10_3.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_bo_10_4.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_bo_10_5.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_den_10_1.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_den_10_2.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_den_10_3.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_den_10_4.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_den_10_5.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_xam_10_1.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_xam_10_2.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_xam_10_3.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_xam_10_4.jpg');
INSERT INTO `photo` VALUES (10, '/assets/imgs/product-imgs/ak_xam_10_5.jpg');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_den_11_1.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_den_11_2.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_den_11_3.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_den_11_4.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_den_11_5.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_xanh_11_1.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_xanh_11_2.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_xanh_11_3.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_xanh_11_4.png');
INSERT INTO `photo` VALUES (11, '/assets/imgs/product-imgs/ak_xanh_11_5.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_den_12_1.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_den_12_2.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_den_12_3.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_den_12_4.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_den_12_5.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_xanh_12_1.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_xanh_12_2.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_xanh_12_3.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_xanh_12_4.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_xanh_12_5.png');
INSERT INTO `photo` VALUES (12, '/assets/imgs/product-imgs/ak_xanh_12_6.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_trang_13_1.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_trang_13_2.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_trang_13_3.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_trang_13_4.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_trang_13_5.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_trang_13_6.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_xanh_13_1.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_xanh_13_2.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_xanh_13_3.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_xanh_13_4.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_xanh_13_5.png');
INSERT INTO `photo` VALUES (13, '/assets/imgs/product-imgs/ak_xanh_13_6.png');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_den_14_1.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_den_14_2.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_den_14_3.jfif');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_den_14_4.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_den_14_5.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_reu_14_1.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_reu_14_2.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_reu_14_3.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_reu_14_4.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_reu_14_5.jpg');
INSERT INTO `photo` VALUES (14, '/assets/imgs/product-imgs/ak_reu_14_6.jpg');
INSERT INTO `photo` VALUES (15, '/assets/imgs/product-imgs/ak_den_15_1.jpg');
INSERT INTO `photo` VALUES (15, '/assets/imgs/product-imgs/ak_den_15_2.jpg');
INSERT INTO `photo` VALUES (15, '/assets/imgs/product-imgs/ak_den_15_3.jpg');
INSERT INTO `photo` VALUES (15, '/assets/imgs/product-imgs/ak_den_15_4.jpg');
INSERT INTO `photo` VALUES (15, '/assets/imgs/product-imgs/ak_den_15_5.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_bo_16_1.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_bo_16_2.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_bo_16_3.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_bo_16_4.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_bo_16_5.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_den_16_1.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_den_16_2.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_den_16_3.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_den_16_4.jpg');
INSERT INTO `photo` VALUES (16, '/assets/imgs/product-imgs/ak_den_16_5.jpg');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_den_17_1.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_den_17_2.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_den_17_3.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_den_17_4.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_den_17_5.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xam_17_1.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xam_17_2.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xam_17_3.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xam_17_4.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xam_17_5.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xanh_17_1.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xanh_17_2.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xanh_17_3.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xanh_17_4.png');
INSERT INTO `photo` VALUES (17, '/assets/imgs/product-imgs/ak_xanh_17_5.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_den_18_1.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_den_18_2.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_den_18_3.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_den_18_4.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_den_18_5.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_den_18_6.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_den_18_7.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_nau_18_1.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_nau_18_2.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_nau_18_3.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_nau_18_4.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_nau_18_5.png');
INSERT INTO `photo` VALUES (18, '/assets/imgs/product-imgs/qt_nau_18_6.png');
INSERT INTO `photo` VALUES (19, '/assets/imgs/product-imgs/qt_den_19_1.jpg');
INSERT INTO `photo` VALUES (19, '/assets/imgs/product-imgs/qt_den_19_2.jpg');
INSERT INTO `photo` VALUES (19, '/assets/imgs/product-imgs/qt_den_19_3.jpg');
INSERT INTO `photo` VALUES (19, '/assets/imgs/product-imgs/qt_den_19_4.jpg');
INSERT INTO `photo` VALUES (19, '/assets/imgs/product-imgs/qt_nau_19_1.jpg');
INSERT INTO `photo` VALUES (19, '/assets/imgs/product-imgs/qt_nau_19_2.jpg');
INSERT INTO `photo` VALUES (19, '/assets/imgs/product-imgs/qt_nau_19_3.jpg');
INSERT INTO `photo` VALUES (19, '/assets/imgs/product-imgs/qt_nau_19_4.jpg');
INSERT INTO `photo` VALUES (20, '/assets/imgs/product-imgs/qt_den_20_1.png');
INSERT INTO `photo` VALUES (20, '/assets/imgs/product-imgs/qt_den_20_2.png');
INSERT INTO `photo` VALUES (20, '/assets/imgs/product-imgs/qt_den_20_3.png');
INSERT INTO `photo` VALUES (20, '/assets/imgs/product-imgs/qt_den_20_4.png');
INSERT INTO `photo` VALUES (20, '/assets/imgs/product-imgs/qt_den_20_5.png');
INSERT INTO `photo` VALUES (21, '/assets/imgs/product-imgs/qt_xanh_21_1.png');
INSERT INTO `photo` VALUES (21, '/assets/imgs/product-imgs/qt_xanh_21_2.png');
INSERT INTO `photo` VALUES (21, '/assets/imgs/product-imgs/qt_xanh_21_3.png');
INSERT INTO `photo` VALUES (21, '/assets/imgs/product-imgs/qt_xanh_21_4.png');
INSERT INTO `photo` VALUES (21, '/assets/imgs/product-imgs/qt_xanh_21_5.png');
INSERT INTO `photo` VALUES (22, '/assets/imgs/product-imgs/qt_xam_22_1.png');
INSERT INTO `photo` VALUES (22, '/assets/imgs/product-imgs/qt_xam_22_2.png');
INSERT INTO `photo` VALUES (22, '/assets/imgs/product-imgs/qt_xam_22_3.png');
INSERT INTO `photo` VALUES (22, '/assets/imgs/product-imgs/qt_xam_22_4.png');
INSERT INTO `photo` VALUES (23, '/assets/imgs/product-imgs/qt_xam_23_1.png');
INSERT INTO `photo` VALUES (23, '/assets/imgs/product-imgs/qt_xam_23_2.png');
INSERT INTO `photo` VALUES (23, '/assets/imgs/product-imgs/qt_xam_23_3.png');
INSERT INTO `photo` VALUES (23, '/assets/imgs/product-imgs/qt_xam_23_4.png');
INSERT INTO `photo` VALUES (24, '/assets/imgs/product-imgs/qt_xam_24_1.png');
INSERT INTO `photo` VALUES (24, '/assets/imgs/product-imgs/qt_xam_24_2.png');
INSERT INTO `photo` VALUES (24, '/assets/imgs/product-imgs/qt_xam_24_3.png');
INSERT INTO `photo` VALUES (24, '/assets/imgs/product-imgs/qt_xam_24_4.png');
INSERT INTO `photo` VALUES (24, '/assets/imgs/product-imgs/qt_xam_24_5.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_den_25_1.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_den_25_2.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_den_25_3.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_den_25_4.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_den_25_5.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_xam_25_1.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_xam_25_2.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_xam_25_3.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_xam_25_4.png');
INSERT INTO `photo` VALUES (25, '/assets/imgs/product-imgs/qt_xam_25_5.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_den_26_1.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_den_26_2.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_den_26_3.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_den_26_4.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_den_26_5.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_xam_26_1.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_xam_26_2.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_xam_26_3.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_xam_26_4.png');
INSERT INTO `photo` VALUES (26, '/assets/imgs/product-imgs/qt_xam_26_5.png');
INSERT INTO `photo` VALUES (27, '/assets/imgs/product-imgs/qt_xam_27_1.png');
INSERT INTO `photo` VALUES (27, '/assets/imgs/product-imgs/qt_xam_27_2.png');
INSERT INTO `photo` VALUES (27, '/assets/imgs/product-imgs/qt_xam_27_3.png');
INSERT INTO `photo` VALUES (27, '/assets/imgs/product-imgs/qt_xam_27_4.png');
INSERT INTO `photo` VALUES (27, '/assets/imgs/product-imgs/qt_xam_27_5.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_den_28_1.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_den_28_2.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_den_28_3.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_den_28_4.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_den_28_5.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_xanh_28_1.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_xanh_28_2.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_xanh_28_3.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_xanh_28_4.png');
INSERT INTO `photo` VALUES (28, '/assets/imgs/product-imgs/qt_xanh_28_5.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_den_29_1.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_den_29_2.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_den_29_3.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_den_29_4.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_den_29_5.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_xanh_29_1.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_xanh_29_2.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_xanh_29_3.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_xanh_29_4.png');
INSERT INTO `photo` VALUES (29, '/assets/imgs/product-imgs/qt_xanh_29_5.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_den_30_1.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_den_30_2.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_den_30_3.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_den_30_4.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_den_30_5.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_xam_30_1.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_xam_30_2.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_xam_30_3.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_xam_30_4.png');
INSERT INTO `photo` VALUES (30, '/assets/imgs/product-imgs/qt_xam_30_5.png');
INSERT INTO `photo` VALUES (31, '/assets/imgs/product-imgs/qt_den_31_1.png');
INSERT INTO `photo` VALUES (31, '/assets/imgs/product-imgs/qt_den_31_2.png');
INSERT INTO `photo` VALUES (31, '/assets/imgs/product-imgs/qt_den_31_3.png');
INSERT INTO `photo` VALUES (31, '/assets/imgs/product-imgs/qt_den_31_4.png');
INSERT INTO `photo` VALUES (31, '/assets/imgs/product-imgs/qt_den_31_5.png');
INSERT INTO `photo` VALUES (32, '/assets/imgs/product-imgs/qt_den_32_1.png');
INSERT INTO `photo` VALUES (32, '/assets/imgs/product-imgs/qt_den_32_2.png');
INSERT INTO `photo` VALUES (32, '/assets/imgs/product-imgs/qt_den_32_3.png');
INSERT INTO `photo` VALUES (32, '/assets/imgs/product-imgs/qt_den_32_4.png');
INSERT INTO `photo` VALUES (32, '/assets/imgs/product-imgs/qt_den_32_5.png');
INSERT INTO `photo` VALUES (33, '/assets/imgs/product-imgs/qt_den_33_1.png');
INSERT INTO `photo` VALUES (33, '/assets/imgs/product-imgs/qt_den_33_2.png');
INSERT INTO `photo` VALUES (33, '/assets/imgs/product-imgs/qt_den_33_3.png');
INSERT INTO `photo` VALUES (33, '/assets/imgs/product-imgs/qt_den_33_4.png');
INSERT INTO `photo` VALUES (33, '/assets/imgs/product-imgs/qt_den_33_5.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_den_34_1.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_den_34_2.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_den_34_3.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_den_34_4.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_den_34_5.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_xam_34_1.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_xam_34_2.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_xam_34_3.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_xam_34_4.png');
INSERT INTO `photo` VALUES (34, '/assets/imgs/product-imgs/qt_xam_34_5.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_den_35_1.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_den_35_2.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_den_35_3.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_den_35_4.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_den_35_5.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_xam_35_1.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_xam_35_2.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_xam_35_3.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_xam_35_4.png');
INSERT INTO `photo` VALUES (35, '/assets/imgs/product-imgs/qt_xam_35_5.png');
INSERT INTO `photo` VALUES (36, '/assets/imgs/product-imgs/qt_xam_36_1.png');
INSERT INTO `photo` VALUES (36, '/assets/imgs/product-imgs/qt_xam_36_2.png');
INSERT INTO `photo` VALUES (36, '/assets/imgs/product-imgs/qt_xam_36_3.png');
INSERT INTO `photo` VALUES (36, '/assets/imgs/product-imgs/qt_xam_36_4.png');
INSERT INTO `photo` VALUES (36, '/assets/imgs/product-imgs/qt_xam_36_5.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_den_37_1.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_den_37_2.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_den_37_3.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_den_37_4.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_den_37_5.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_xam_37_1.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_xam_37_2.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_xam_37_3.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_xam_37_4.png');
INSERT INTO `photo` VALUES (37, '/assets/imgs/product-imgs/qt_xam_37_5.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_den_38_1.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_den_38_2.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_den_38_3.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_den_38_4.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_trang_38_1.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_trang_38_2.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_trang_38_3.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_trang_38_4.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_trang_38_5.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_xanh_38_1.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_xanh_38_2.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_xanh_38_3.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_xanh_38_4.png');
INSERT INTO `photo` VALUES (38, '/assets/imgs/product-imgs/qt_xanh_38_5.png');
INSERT INTO `photo` VALUES (39, '/assets/imgs/product-imgs/qt_den_39_1.png');
INSERT INTO `photo` VALUES (39, '/assets/imgs/product-imgs/qt_den_39_2.png');
INSERT INTO `photo` VALUES (39, '/assets/imgs/product-imgs/qt_den_39_3.png');
INSERT INTO `photo` VALUES (39, '/assets/imgs/product-imgs/qt_den_39_4.png');
INSERT INTO `photo` VALUES (40, '/assets/imgs/product-imgs/qt_den_40_1.png');
INSERT INTO `photo` VALUES (40, '/assets/imgs/product-imgs/qt_den_40_2.png');
INSERT INTO `photo` VALUES (40, '/assets/imgs/product-imgs/qt_den_40_3.png');
INSERT INTO `photo` VALUES (40, '/assets/imgs/product-imgs/qt_den_40_4.png');
INSERT INTO `photo` VALUES (40, '/assets/imgs/product-imgs/qt_den_40_5.png');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_den_41_1.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_den_41_2.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_den_41_3.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_den_41_4.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_den_41_5.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_xam_41_1.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_xam_41_2.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_xam_41_3.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_xam_41_4.jpg');
INSERT INTO `photo` VALUES (41, '/assets/imgs/product-imgs/qt_xam_41_5.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_den_42_1.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_den_42_2.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_den_42_3.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_den_42_4.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_den_42_5.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_xam_42_1.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_xam_42_2.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_xam_42_3.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_xam_42_4.jpg');
INSERT INTO `photo` VALUES (42, '/assets/imgs/product-imgs/qt_xam_42_5.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_den_43_1.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_den_43_2.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_den_43_3.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_den_43_4.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_den_43_5.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_den_43_6.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xam_43_1.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xam_43_2.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xam_43_3.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xam_43_4.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xam_43_5.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xanh_43_1.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xanh_43_2.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xanh_43_3.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xanh_43_4.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xanh_43_5.jpg');
INSERT INTO `photo` VALUES (43, '/assets/imgs/product-imgs/qt_xanh_43_6.jpg');
INSERT INTO `photo` VALUES (44, '/assets/imgs/product-imgs/qt_do_44_1.jpg');
INSERT INTO `photo` VALUES (44, '/assets/imgs/product-imgs/qt_do_44_2.jpg');
INSERT INTO `photo` VALUES (44, '/assets/imgs/product-imgs/qt_do_44_3.jpg');
INSERT INTO `photo` VALUES (44, '/assets/imgs/product-imgs/qt_do_44_4.jpg');
INSERT INTO `photo` VALUES (45, '/assets/imgs/product-imgs/qt_xam_45_1.jpg');
INSERT INTO `photo` VALUES (45, '/assets/imgs/product-imgs/qt_xam_45_2.jpg');
INSERT INTO `photo` VALUES (45, '/assets/imgs/product-imgs/qt_xam_45_3.jpg');
INSERT INTO `photo` VALUES (45, '/assets/imgs/product-imgs/qt_xam_45_4.jpg');
INSERT INTO `photo` VALUES (45, '/assets/imgs/product-imgs/qt_xam_45_5.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_den_46_1.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_den_46_2.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_den_46_3.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_den_46_4.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_den_46_5.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_xanh_46_1.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_xanh_46_2.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_xanh_46_3.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_xanh_46_4.jpg');
INSERT INTO `photo` VALUES (46, '/assets/imgs/product-imgs/qt_xanh_46_5.jpg');
INSERT INTO `photo` VALUES (47, '/assets/imgs/product-imgs/qt_den_47_1.jpg');
INSERT INTO `photo` VALUES (47, '/assets/imgs/product-imgs/qt_den_47_2.jpg');
INSERT INTO `photo` VALUES (47, '/assets/imgs/product-imgs/qt_den_47_3.jpg');
INSERT INTO `photo` VALUES (47, '/assets/imgs/product-imgs/qt_trang_47_1.jpg');
INSERT INTO `photo` VALUES (47, '/assets/imgs/product-imgs/qt_trang_47_2.jpg');
INSERT INTO `photo` VALUES (47, '/assets/imgs/product-imgs/qt_trang_47_3.jpg');
INSERT INTO `photo` VALUES (47, '/assets/imgs/product-imgs/qt_trang_47_4.jpg');
INSERT INTO `photo` VALUES (48, '/assets/imgs/product-imgs/qt_xam_48_1.jpg');
INSERT INTO `photo` VALUES (48, '/assets/imgs/product-imgs/qt_xam_48_2.jpg');
INSERT INTO `photo` VALUES (49, '/assets/imgs/product-imgs/qt_den_49_1.jpg');
INSERT INTO `photo` VALUES (49, '/assets/imgs/product-imgs/qt_den_49_2.jpg');
INSERT INTO `photo` VALUES (49, '/assets/imgs/product-imgs/qt_do_49_1.jpg');
INSERT INTO `photo` VALUES (49, '/assets/imgs/product-imgs/qt_do_49_2.jpg');
INSERT INTO `photo` VALUES (49, '/assets/imgs/product-imgs/qt_do_49_3.jpg');
INSERT INTO `photo` VALUES (50, '/assets/imgs/product-imgs/qt_den_50_1.jpg');
INSERT INTO `photo` VALUES (50, '/assets/imgs/product-imgs/qt_den_50_2.jpg');
INSERT INTO `photo` VALUES (50, '/assets/imgs/product-imgs/qt_den_50_3.jpg');
INSERT INTO `photo` VALUES (50, '/assets/imgs/product-imgs/qt_xanh_50_1.jpg');
INSERT INTO `photo` VALUES (50, '/assets/imgs/product-imgs/qt_xanh_50_2.jpg');
INSERT INTO `photo` VALUES (50, '/assets/imgs/product-imgs/qt_xanh_50_3.jpg');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `BRAND_ID` bigint NULL DEFAULT NULL,
  `CATEGORY_ID` bigint NULL DEFAULT NULL,
  `PRICE` double NULL DEFAULT NULL,
  `DISCOUNT` int NULL DEFAULT 0,
  `DESCRIPTION` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `THUMBNAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `TOTAL_REVIEW` int NULL DEFAULT 0,
  `TOTAL_STAR` int NULL DEFAULT 0,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `PRODUCT_BRAND`(`BRAND_ID` ASC) USING BTREE,
  INDEX `PRODUCT_CATEGORY`(`CATEGORY_ID` ASC) USING BTREE,
  CONSTRAINT `PRODUCT_BRAND` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `PRODUCT_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'SP1', 'ÁO KHOÁT DÙ TRƠN MÀU ĐEN AKO20', 3, 1, 315000, 0, NULL, '/assets/imgs/product-imgs/ak_den_1_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (2, 'SP2', 'ÁO KHOÁT DÙ TRƠN NÓN RỜI AK019', 3, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_2_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (3, 'SP3', 'ÁO KHOÁT KAKI BASIC AK018', 3, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_3_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (4, 'SP4', 'ÁO KHOÁT NẸP BẤM NÚT AK010', 3, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_den_4_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (5, 'SP5', 'ÁO KHOÁT NỈ TRƠN AK013', 3, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_den_5_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (6, 'SP6', 'ÁO HOODIE BELIEVE AK012', 1, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_be_6_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (7, 'SP7', 'ÁO KHOÁT KAKI TÚI ĐẮP AK017', 1, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_7_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (8, 'SP8', 'ÁO KHOÁT DA LỘN LIMITED AK016', 1, 1, 645000, 0, NULL, '/assets/imgs/product-imgs/ak_den_8_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (9, 'SP9', 'ÁO KHOÁT DA LỘN AK015', 1, 1, 395000, 0, NULL, '/assets/imgs/product-imgs/ak_nau_9_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (10, 'SP10', 'ÁO HOODIE SPORTS ELEGANT AK011', 1, 1, 315000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_10_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (11, 'SP11', 'ÁO KHOÁT DÙ TAY PHỐI TÚI AK008', 2, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_11_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (12, 'SP12', 'ÁO KHOÁT DÙ TÚI HỘP AK009', 2, 1, 345000, 0, NULL, '/assets/imgs/product-imgs/ak_den_12_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (13, 'SP13', 'ÁO KHOÁT DÙ HAI LỚP CÓ NÓN AK007', 2, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_trang_13_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (14, 'SP14', 'ÁO KHOÁT DÙ HAI LỚP CÓ NÓN AK001', 2, 1, 545000, 0, NULL, '/assets/imgs/product-imgs/ak_den_14_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (15, 'SP15', 'ÁO KHOÁT KAKI AK266', 2, 1, 445000, 0, NULL, '/assets/imgs/product-imgs/ak_den_15_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (16, 'SP16', 'ÁO KHOÁT MANGTO DẠ AK267', 4, 1, 1750000, 0, NULL, '/assets/imgs/product-imgs/ak_bo_16_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (17, 'SP17', 'ÁO KHOÁT JEAN AK263', 4, 1, 515000, 0, NULL, '/assets/imgs/product-imgs/ak_den_17_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (18, 'SP18', 'QUẦN TÂY TRƠN QT024', 4, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_18_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (19, 'SP19', 'QUẦN TÂY TRƠN REGULAR QT026', 4, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_19_1.jpg', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (20, 'SP20', 'QUẦN TÂY PHỐI SỌC QT023', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_20_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (21, 'SP21', 'QUẦN TÂY NAZAFU QT006', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xanh_21_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (22, 'SP22', 'QUẦN TÂY NAZAFU QT005', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_22_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (23, 'SP23', 'QUẦN TÂY NAZAFU QT003', 5, 2, 475000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_23_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (24, 'SP24', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT020', 5, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_24_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (25, 'SP25', 'QUẦN TÂY TÚI SAU PHỐI D Y DỆT QT022', 5, 2, 445000, 0, NULL, '/assets/imgs/product-imgs/qt_den_25_1.png', 0, 0, '2023-01-03 14:39:58', NULL, '2023-01-03 14:39:58', NULL);
INSERT INTO `product` VALUES (26, 'SP26', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT021', 1, 2, 445000, 0, NULL, '/assets/imgs/product-imgs/qt_den_26_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (27, 'SP27', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT019', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_27_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (28, 'SP28', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT018', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_28_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (29, 'SP29', 'QUẦN TÂY TÚI SAU PHỐI D Y DỆT QT017', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_29_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (30, 'SP30', 'QUẦN TÂY LƯNG SAU PHỐI D Y DỆT QT016', 1, 2, 345000, 0, NULL, '/assets/imgs/product-imgs/qt_den_30_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (31, 'SP31', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT015', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_31_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (32, 'SP32', 'QUẦN TÂY PHỐI D Y DỆT QT014', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_32_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (33, 'SP33', 'QUẦN TÂY PHỐI D Y DỆT QT013', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_33_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (34, 'SP34', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT012', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_34_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (35, 'SP35', 'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT011', 2, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_den_35_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (36, 'SP36', 'QUẦN TÂY KẺ CARO FORM SLIMFIT QT010', 3, 2, 425000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_36_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (37, 'SP37', 'QUẦN TÂY XẾP LY FORM SLIMFIT QT007', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_37_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (38, 'SP38', 'QUẦN TÂY LINEN LƯNG THUN QT008', 3, 2, 375000, 0, NULL, '/assets/imgs/product-imgs/qt_den_38_1.png', 0, 0, '2023-01-03 14:39:59', NULL, '2023-01-03 14:39:59', NULL);
INSERT INTO `product` VALUES (39, 'SP39', 'QUẦN TÂY LINEN FORM LOOSE-CROPPED QT002', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_39_1.png', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (40, 'SP40', 'QUẦN TÂY GẮN NHÃN QT001', 3, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_40_1.png', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (41, 'SP41', 'QUẦN TÂY FORM REGULAR QT155', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_41_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (42, 'SP42', 'QUẦN TÂY FORM REGULAR QT154', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_42_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (43, 'SP43', 'QUẦN TÂY SỌC SLIM-CROPPED LAI LƠ VÊ QT153', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_den_43_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (44, 'SP44', 'QUẦN TÂY ĐỎ ĐÔ QT110', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_do_44_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (45, 'SP45', 'QUẦN TÂY XÁM CHUỘT ĐẬM QT141', 4, 2, 385000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_45_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (46, 'SP46', 'QUẦN TÂY NAZAFU XANH ĐEN QT1128', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_46_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (47, 'SP47', 'QUẦN TÂY NAZAFU SỌC TRẮNG KEM QT1123', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_47_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (48, 'SP48', 'QUẦN TÂY XÁM QT1120', 5, 2, 395000, 0, NULL, '/assets/imgs/product-imgs/qt_xam_48_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (49, 'SP49', 'QUẦN TÂY NAZAFU ĐỎ ĐÔ QT1113', 5, 2, 545000, 0, NULL, '/assets/imgs/product-imgs/qt_den_49_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `product` VALUES (50, 'SP50', 'QUẦN TÂY NAZAFU ĐEN QT1109', 5, 2, 525000, 0, NULL, '/assets/imgs/product-imgs/qt_den_50_1.jpg', 0, 0, '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACCOUNT_ID` bigint NULL DEFAULT NULL,
  `PRODUCT_ID` bigint NULL DEFAULT NULL,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `STAR` int NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `REVIEW_ACCOUNT`(`ACCOUNT_ID` ASC) USING BTREE,
  INDEX `REVIEW_PRODUCT`(`PRODUCT_ID` ASC) USING BTREE,
  CONSTRAINT `REVIEW_ACCOUNT` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `REVIEW_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'VT1', 'ADMIN', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `role` VALUES (2, 'VT2', 'USER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACCOUNT_ID` bigint NULL DEFAULT NULL,
  `SIGN` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `KEY_SIZE` int NULL DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `SIGN_ACCOUNT`(`ACCOUNT_ID` ASC) USING BTREE,
  CONSTRAINT `SIGN_ACCOUNT` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES (1, 5, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSGRNMQd3UxLwxXWrWV4c9FKoLgG6t/VTOBB4g8Cq7ig6eaVPrYyMCE4wRIU6ib7cbNYyrL42dwpSANOgOpV4LiSDQEN0oTWpNGdNl4ehWhMZmRckkIw2byianwkD80BGT6ebQv1yyvvrr2G8VZuLhItoYSJsd2LSUYgLRNMlp4wIDAQAB', 1024, 0, '2023-12-14 19:14:09', NULL, '2023-12-14 19:14:09', NULL);
INSERT INTO `sign` VALUES (2, 5, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCSGRNMQd3UxLwxXWrWV4c9FKoLgG6t/VTOBB4g8Cq7ig6eaVPrYyMCE4wRIU6ib7cbNYyrL42dwpSANOgOpV4LiSDQEN0oTWpNGdNl4ehWhMZmRckkIw2byianwkD80BGT6ebQv1yyvvrr2G8VZuLhItoYSJsd2LSUYgLRNMlp4wIDAQAB', 1024, 1, '2023-12-14 19:14:44', NULL, '2023-12-14 19:14:44', NULL);
INSERT INTO `sign` VALUES (4, 16, 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn5d2ysWmcv2OdtviRY4QILUJpOqG582Xy2tc8T3QxAjk80tWeLTL0Y22bCMRxlkYgQjc425ybLeDfwJkPsZHKRjlsi3gxIqU4tT/BEM4Icg3sRn4eofp9gUs8mDpPqaK/vjgGKn8TN2ttuuzpBsKdxRCDTDRIjUIHlre4jk1F1zk9qDfTcPIyIU4wWe+eqn+WMEAqARbUZPSmGQsoePtVENFxlnsKSCiveBMrs/rvy/+YgY5atB0NDkhCZ1vAqyjSf1qdGce3mCOP054/unAXIE3s0tYAfmsiAfB6X2PdGrReJ17PL8CZRuCadH5yj+bTxfuNMo1Ix8orFuXS3SGawIDAQAB', 2024, 1, '2023-12-16 17:53:35', NULL, '2023-12-16 17:53:35', NULL);
INSERT INTO `sign` VALUES (5, 17, 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn5d2ysWmcv2OdtviRY4QILUJpOqG582Xy2tc8T3QxAjk80tWeLTL0Y22bCMRxlkYgQjc425ybLeDfwJkPsZHKRjlsi3gxIqU4tT/BEM4Icg3sRn4eofp9gUs8mDpPqaK/vjgGKn8TN2ttuuzpBsKdxRCDTDRIjUIHlre4jk1F1zk9qDfTcPIyIU4wWe+eqn+WMEAqARbUZPSmGQsoePtVENFxlnsKSCiveBMrs/rvy/+YgY5atB0NDkhCZ1vAqyjSf1qdGce3mCOP054/unAXIE3s0tYAfmsiAfB6X2PdGrReJ17PL8CZRuCadH5yj+bTxfuNMo1Ix8orFuXS3SGawIDAQAB', 2024, 1, '2023-12-16 18:08:51', NULL, '2023-12-16 18:08:51', NULL);
INSERT INTO `sign` VALUES (6, 18, 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsLpiev9NiqPO9fE2jonluzHfBMDi9UTAo76wq3PqGSi72N2Lj1MCxV9O/ZCiT+M5C7rThNGz/MJUuS/h95JOg9XEYgLLESzQyDzQK2kz62wlAjuX4NzncZb+bPBKZ4NXAna8MFuSlREgkv/CTjAE5DrPqyqIZA9K1BbRTWb5w/tJIdsep/tRsFJCQdHwQkrM3o3zleplKA8+it7bLcTqnFeFRvOL/9Jv6m6i6dzygXNk1CA+4z7NfMMJoENqUu9aL89eeFU6XSgpWba9B6bbIP+Qf9JJckbIwCw86JQMoB8Zz6/eABDHnwPGg6i6GQ1ExCYlmXpMng/tabFKdU0jsQIDAQAB', 2024, 1, '2023-12-16 19:13:30', NULL, '2023-12-16 19:13:30', NULL);

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES (1, 'S', 'SMALL', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `size` VALUES (2, 'M', 'MEDIUM', '2023-01-03 14:40:00', NULL, '2023-01-03 14:40:00', NULL);
INSERT INTO `size` VALUES (3, 'L', 'LARGE', '2023-01-03 14:40:01', NULL, '2023-01-03 14:40:01', NULL);
INSERT INTO `size` VALUES (4, 'XL', 'EXTRA LARGE', '2023-01-03 14:40:01', NULL, '2023-01-03 14:40:01', NULL);

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `STATUS_GROUP` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'UNVALIDATE', 'UNVALIDATE', NULL, 'ACCOUNT', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `status` VALUES (2, 'ACTIVE', 'ACTIVE', NULL, 'ACCOUNT', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `status` VALUES (3, 'BLOCK', 'BLOCK', NULL, 'ACCOUNT', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `status` VALUES (4, 'WAIT', 'WAIT', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `status` VALUES (5, 'VERIFY', 'VERIFY', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `status` VALUES (6, 'PACKING', 'PACKING', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `status` VALUES (7, 'DELIVERING', 'DELIVERING', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `status` VALUES (8, 'DONE', 'DONE', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);
INSERT INTO `status` VALUES (9, 'CANCEL', 'CANCEL', NULL, 'ORDER', '2023-01-03 14:39:57', NULL, '2023-01-03 14:39:57', NULL);

-- ----------------------------
-- Table structure for verification
-- ----------------------------
DROP TABLE IF EXISTS `verification`;
CREATE TABLE `verification`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ORDER_ID` bigint NULL DEFAULT NULL,
  `HASH_VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SIGN_ID` bigint NULL DEFAULT NULL,
  `IS_OK` tinyint(1) NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `VERIFICATION_ORDER`(`ORDER_ID` ASC) USING BTREE,
  INDEX `VERIFICATION_SIGN`(`SIGN_ID` ASC) USING BTREE,
  CONSTRAINT `VERIFICATION_ORDER` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `VERIFICATION_SIGN` FOREIGN KEY (`SIGN_ID`) REFERENCES `sign` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of verification
-- ----------------------------

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint NULL DEFAULT NULL,
  `SIZE_ID` bigint NULL DEFAULT NULL,
  `COLOR_ID` bigint NULL DEFAULT NULL,
  `AMOUNT` int NULL DEFAULT 0,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `WAREHOUSE_PRODUCT`(`PRODUCT_ID` ASC) USING BTREE,
  INDEX `WAREHOUSE_SIZE`(`SIZE_ID` ASC) USING BTREE,
  INDEX `WAREHOUSE_COLOR`(`COLOR_ID` ASC) USING BTREE,
  CONSTRAINT `WAREHOUSE_COLOR` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `WAREHOUSE_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `WAREHOUSE_SIZE` FOREIGN KEY (`SIZE_ID`) REFERENCES `size` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES (1, 1, 1, 1, 1, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse` VALUES (2, 1, 2, 1, 1, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse` VALUES (3, 1, 3, 1, 1, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse` VALUES (4, 1, 4, 1, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (5, 1, 1, 2, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (6, 1, 2, 2, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (7, 1, 3, 2, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (8, 1, 4, 2, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (9, 1, 1, 3, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (10, 1, 2, 3, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (11, 1, 3, 3, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (12, 1, 4, 3, 1, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (13, 2, 1, 1, 83, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (14, 2, 2, 1, 93, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (15, 2, 3, 1, 48, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (16, 2, 4, 1, 55, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (17, 2, 1, 2, 30, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (18, 2, 2, 2, 15, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (19, 2, 3, 2, 88, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (20, 2, 4, 2, 64, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (21, 2, 1, 3, 83, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (22, 2, 2, 3, 94, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (23, 2, 3, 3, 35, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (24, 2, 4, 3, 78, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (25, 3, 1, 1, 74, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (26, 3, 2, 1, 71, '2023-01-03 14:40:20', NULL, '2023-01-03 14:40:20', NULL);
INSERT INTO `warehouse` VALUES (27, 3, 3, 1, 11, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (28, 3, 4, 1, 83, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (29, 3, 1, 2, 63, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (30, 3, 2, 2, 15, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (31, 3, 3, 2, 87, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (32, 3, 4, 2, 46, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (33, 3, 1, 3, 58, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (34, 3, 2, 3, 72, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (35, 3, 3, 3, 82, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (36, 3, 4, 3, 77, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (37, 4, 1, 1, 59, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (38, 4, 2, 1, 14, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (39, 4, 3, 1, 20, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (40, 4, 4, 1, 36, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (41, 4, 1, 2, 93, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (42, 4, 2, 2, 7, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (43, 4, 3, 2, 96, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (44, 4, 4, 2, 48, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (45, 4, 1, 3, 40, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (46, 4, 2, 3, 40, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (47, 4, 3, 3, 84, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (48, 4, 4, 3, 67, '2023-01-03 14:40:21', NULL, '2023-01-03 14:40:21', NULL);
INSERT INTO `warehouse` VALUES (49, 5, 1, 1, 42, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (50, 5, 2, 1, 45, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (51, 5, 3, 1, 74, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (52, 5, 4, 1, 27, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (53, 5, 1, 2, 23, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (54, 5, 2, 2, 44, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (55, 5, 3, 2, 76, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (56, 5, 4, 2, 22, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (57, 5, 1, 3, 33, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (58, 5, 2, 3, 25, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (59, 5, 3, 3, 10, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (60, 5, 4, 3, 86, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (61, 6, 1, 1, 51, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (62, 6, 2, 1, 45, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (63, 6, 3, 1, 81, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (64, 6, 4, 1, 15, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (65, 6, 1, 2, 26, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (66, 6, 2, 2, 89, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (67, 6, 3, 2, 47, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (68, 6, 4, 2, 30, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (69, 6, 1, 3, 63, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (70, 6, 2, 3, 2, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (71, 6, 3, 3, 7, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (72, 6, 4, 3, 59, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (73, 7, 1, 1, 24, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (74, 7, 2, 1, 23, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (75, 7, 3, 1, 75, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (76, 7, 4, 1, 71, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (77, 7, 1, 2, 9, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (78, 7, 2, 2, 87, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (79, 7, 3, 2, 96, '2023-01-03 14:40:22', NULL, '2023-01-03 14:40:22', NULL);
INSERT INTO `warehouse` VALUES (80, 7, 4, 2, 64, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (81, 7, 1, 3, 35, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (82, 7, 2, 3, 82, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (83, 7, 3, 3, 59, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (84, 7, 4, 3, 19, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (85, 8, 1, 1, 75, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (86, 8, 2, 1, 78, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (87, 8, 3, 1, 5, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (88, 8, 4, 1, 69, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (89, 8, 1, 2, 34, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (90, 8, 2, 2, 83, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (91, 8, 3, 2, 90, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (92, 8, 4, 2, 30, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (93, 8, 1, 3, 13, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (94, 8, 2, 3, 36, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (95, 8, 3, 3, 47, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (96, 8, 4, 3, 30, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (97, 9, 1, 1, 25, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (98, 9, 2, 1, 70, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (99, 9, 3, 1, 30, '2023-01-03 14:40:23', NULL, '2023-01-03 14:40:23', NULL);
INSERT INTO `warehouse` VALUES (100, 9, 4, 1, 89, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (101, 9, 1, 2, 57, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (102, 9, 2, 2, 56, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (103, 9, 3, 2, 11, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (104, 9, 4, 2, 35, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (105, 9, 1, 3, 87, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (106, 9, 2, 3, 20, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (107, 9, 3, 3, 97, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (108, 9, 4, 3, 5, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (109, 10, 1, 1, 90, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (110, 10, 2, 1, 48, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (111, 10, 3, 1, 55, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (112, 10, 4, 1, 39, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (113, 10, 1, 2, 36, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (114, 10, 2, 2, 40, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (115, 10, 3, 2, 81, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (116, 10, 4, 2, 67, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (117, 10, 1, 3, 37, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (118, 10, 2, 3, 1, '2023-01-03 14:40:24', NULL, '2023-01-03 14:40:24', NULL);
INSERT INTO `warehouse` VALUES (119, 10, 3, 3, 66, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (120, 10, 4, 3, 75, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (121, 11, 1, 1, 28, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (122, 11, 2, 1, 36, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (123, 11, 3, 1, 27, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (124, 11, 4, 1, 91, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (125, 11, 1, 2, 18, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (126, 11, 2, 2, 33, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (127, 11, 3, 2, 88, '2023-01-03 14:40:25', NULL, '2023-01-03 14:40:25', NULL);
INSERT INTO `warehouse` VALUES (128, 11, 4, 2, 2, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (129, 11, 1, 3, 34, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (130, 11, 2, 3, 34, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (131, 11, 3, 3, 39, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (132, 11, 4, 3, 23, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (133, 12, 1, 1, 22, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (134, 12, 2, 1, 36, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (135, 12, 3, 1, 95, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (136, 12, 4, 1, 87, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (137, 12, 1, 2, 21, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (138, 12, 2, 2, 58, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (139, 12, 3, 2, 57, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (140, 12, 4, 2, 30, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (141, 12, 1, 3, 58, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (142, 12, 2, 3, 78, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (143, 12, 3, 3, 45, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (144, 12, 4, 3, 60, '2023-01-03 14:40:26', NULL, '2023-01-03 14:40:26', NULL);
INSERT INTO `warehouse` VALUES (145, 13, 1, 1, 74, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (146, 13, 2, 1, 4, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (147, 13, 3, 1, 90, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (148, 13, 4, 1, 67, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (149, 13, 1, 2, 71, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (150, 13, 2, 2, 60, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (151, 13, 3, 2, 92, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (152, 13, 4, 2, 55, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (153, 13, 1, 3, 59, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (154, 13, 2, 3, 88, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (155, 13, 3, 3, 85, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (156, 13, 4, 3, 69, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (157, 14, 1, 1, 16, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (158, 14, 2, 1, 60, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (159, 14, 3, 1, 89, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (160, 14, 4, 1, 21, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (161, 14, 1, 2, 29, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (162, 14, 2, 2, 75, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (163, 14, 3, 2, 65, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (164, 14, 4, 2, 59, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (165, 14, 1, 3, 39, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (166, 14, 2, 3, 11, '2023-01-03 14:40:27', NULL, '2023-01-03 14:40:27', NULL);
INSERT INTO `warehouse` VALUES (167, 14, 3, 3, 4, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (168, 14, 4, 3, 100, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (169, 15, 1, 1, 35, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (170, 15, 2, 1, 64, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (171, 15, 3, 1, 53, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (172, 15, 4, 1, 27, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (173, 15, 1, 2, 43, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (174, 15, 2, 2, 22, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (175, 15, 3, 2, 83, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (176, 15, 4, 2, 99, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (177, 15, 1, 3, 24, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (178, 15, 2, 3, 78, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (179, 15, 3, 3, 98, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (180, 15, 4, 3, 60, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (181, 16, 1, 1, 34, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (182, 16, 2, 1, 80, '2023-01-03 14:40:28', NULL, '2023-01-03 14:40:28', NULL);
INSERT INTO `warehouse` VALUES (183, 16, 3, 1, 94, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (184, 16, 4, 1, 2, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (185, 16, 1, 2, 40, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (186, 16, 2, 2, 90, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (187, 16, 3, 2, 59, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (188, 16, 4, 2, 81, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (189, 16, 1, 3, 16, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (190, 16, 2, 3, 72, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (191, 16, 3, 3, 8, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (192, 16, 4, 3, 56, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (193, 17, 1, 1, 76, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (194, 17, 2, 1, 67, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (195, 17, 3, 1, 61, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (196, 17, 4, 1, 76, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (197, 17, 1, 2, 34, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (198, 17, 2, 2, 24, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (199, 17, 3, 2, 56, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (200, 17, 4, 2, 26, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (201, 17, 1, 3, 20, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (202, 17, 2, 3, 8, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (203, 17, 3, 3, 75, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (204, 17, 4, 3, 26, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (205, 18, 1, 1, 92, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (206, 18, 2, 1, 50, '2023-01-03 14:40:29', NULL, '2023-01-03 14:40:29', NULL);
INSERT INTO `warehouse` VALUES (207, 18, 3, 1, 16, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (208, 18, 4, 1, 47, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (209, 18, 1, 2, 39, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (210, 18, 2, 2, 10, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (211, 18, 3, 2, 39, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (212, 18, 4, 2, 52, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (213, 18, 1, 3, 31, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (214, 18, 2, 3, 76, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (215, 18, 3, 3, 89, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (216, 18, 4, 3, 4, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (217, 19, 1, 1, 63, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (218, 19, 2, 1, 40, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (219, 19, 3, 1, 6, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (220, 19, 4, 1, 5, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (221, 19, 1, 2, 87, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (222, 19, 2, 2, 77, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (223, 19, 3, 2, 68, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (224, 19, 4, 2, 18, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (225, 19, 1, 3, 72, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (226, 19, 2, 3, 51, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (227, 19, 3, 3, 43, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (228, 19, 4, 3, 68, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (229, 20, 1, 1, 49, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (230, 20, 2, 1, 8, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (231, 20, 3, 1, 90, '2023-01-03 14:40:30', NULL, '2023-01-03 14:40:30', NULL);
INSERT INTO `warehouse` VALUES (232, 20, 4, 1, 17, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (233, 20, 1, 2, 33, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (234, 20, 2, 2, 100, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (235, 20, 3, 2, 48, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (236, 20, 4, 2, 37, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (237, 20, 1, 3, 1, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (238, 20, 2, 3, 54, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (239, 20, 3, 3, 28, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (240, 20, 4, 3, 96, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (241, 21, 1, 1, 19, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (242, 21, 2, 1, 15, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (243, 21, 3, 1, 87, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (244, 21, 4, 1, 73, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (245, 21, 1, 2, 8, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (246, 21, 2, 2, 52, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (247, 21, 3, 2, 67, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (248, 21, 4, 2, 80, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (249, 21, 1, 3, 47, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (250, 21, 2, 3, 44, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (251, 21, 3, 3, 78, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (252, 21, 4, 3, 71, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (253, 22, 1, 1, 39, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (254, 22, 2, 1, 95, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (255, 22, 3, 1, 37, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (256, 22, 4, 1, 68, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (257, 22, 1, 2, 27, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (258, 22, 2, 2, 60, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (259, 22, 3, 2, 95, '2023-01-03 14:40:31', NULL, '2023-01-03 14:40:31', NULL);
INSERT INTO `warehouse` VALUES (260, 22, 4, 2, 71, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (261, 22, 1, 3, 6, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (262, 22, 2, 3, 14, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (263, 22, 3, 3, 90, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (264, 22, 4, 3, 52, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (265, 23, 1, 1, 46, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (266, 23, 2, 1, 58, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (267, 23, 3, 1, 36, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (268, 23, 4, 1, 55, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (269, 23, 1, 2, 46, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (270, 23, 2, 2, 40, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (271, 23, 3, 2, 3, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (272, 23, 4, 2, 24, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (273, 23, 1, 3, 99, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (274, 23, 2, 3, 67, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (275, 23, 3, 3, 51, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (276, 23, 4, 3, 1, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (277, 24, 1, 1, 71, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (278, 24, 2, 1, 57, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (279, 24, 3, 1, 54, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (280, 24, 4, 1, 95, '2023-01-03 14:40:32', NULL, '2023-01-03 14:40:32', NULL);
INSERT INTO `warehouse` VALUES (281, 24, 1, 2, 65, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (282, 24, 2, 2, 91, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (283, 24, 3, 2, 75, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (284, 24, 4, 2, 82, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (285, 24, 1, 3, 21, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (286, 24, 2, 3, 39, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (287, 24, 3, 3, 76, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (288, 24, 4, 3, 42, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (289, 25, 1, 1, 89, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (290, 25, 2, 1, 100, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (291, 25, 3, 1, 73, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (292, 25, 4, 1, 31, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (293, 25, 1, 2, 39, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (294, 25, 2, 2, 95, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (295, 25, 3, 2, 4, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (296, 25, 4, 2, 55, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (297, 25, 1, 3, 30, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (298, 25, 2, 3, 60, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (299, 25, 3, 3, 42, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (300, 25, 4, 3, 92, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (301, 26, 1, 1, 55, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (302, 26, 2, 1, 27, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (303, 26, 3, 1, 90, '2023-01-03 14:40:33', NULL, '2023-01-03 14:40:33', NULL);
INSERT INTO `warehouse` VALUES (304, 26, 4, 1, 61, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (305, 26, 1, 2, 31, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (306, 26, 2, 2, 21, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (307, 26, 3, 2, 59, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (308, 26, 4, 2, 46, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (309, 26, 1, 3, 47, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (310, 26, 2, 3, 14, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (311, 26, 3, 3, 17, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (312, 26, 4, 3, 24, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (313, 27, 1, 1, 20, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (314, 27, 2, 1, 49, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (315, 27, 3, 1, 32, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (316, 27, 4, 1, 70, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (317, 27, 1, 2, 34, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (318, 27, 2, 2, 77, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (319, 27, 3, 2, 47, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (320, 27, 4, 2, 79, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (321, 27, 1, 3, 57, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (322, 27, 2, 3, 76, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (323, 27, 3, 3, 72, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (324, 27, 4, 3, 21, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (325, 28, 1, 1, 42, '2023-01-03 14:40:34', NULL, '2023-01-03 14:40:34', NULL);
INSERT INTO `warehouse` VALUES (326, 28, 2, 1, 61, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (327, 28, 3, 1, 25, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (328, 28, 4, 1, 96, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (329, 28, 1, 2, 57, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (330, 28, 2, 2, 71, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (331, 28, 3, 2, 88, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (332, 28, 4, 2, 96, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (333, 28, 1, 3, 92, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (334, 28, 2, 3, 68, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (335, 28, 3, 3, 100, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (336, 28, 4, 3, 31, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (337, 29, 1, 1, 28, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (338, 29, 2, 1, 24, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (339, 29, 3, 1, 83, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (340, 29, 4, 1, 91, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (341, 29, 1, 2, 11, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (342, 29, 2, 2, 36, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (343, 29, 3, 2, 45, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (344, 29, 4, 2, 45, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (345, 29, 1, 3, 53, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (346, 29, 2, 3, 62, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (347, 29, 3, 3, 2, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (348, 29, 4, 3, 7, '2023-01-03 14:40:35', NULL, '2023-01-03 14:40:35', NULL);
INSERT INTO `warehouse` VALUES (349, 30, 1, 1, 84, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (350, 30, 2, 1, 20, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (351, 30, 3, 1, 21, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (352, 30, 4, 1, 40, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (353, 30, 1, 2, 44, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (354, 30, 2, 2, 4, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (355, 30, 3, 2, 73, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (356, 30, 4, 2, 50, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (357, 30, 1, 3, 37, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (358, 30, 2, 3, 87, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (359, 30, 3, 3, 56, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (360, 30, 4, 3, 17, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (361, 31, 1, 1, 32, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (362, 31, 2, 1, 35, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (363, 31, 3, 1, 16, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (364, 31, 4, 1, 31, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (365, 31, 1, 2, 93, '2023-01-03 14:40:36', NULL, '2023-01-03 14:40:36', NULL);
INSERT INTO `warehouse` VALUES (366, 31, 2, 2, 29, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (367, 31, 3, 2, 33, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (368, 31, 4, 2, 88, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (369, 31, 1, 3, 54, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (370, 31, 2, 3, 69, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (371, 31, 3, 3, 98, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (372, 31, 4, 3, 36, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (373, 32, 1, 1, 21, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (374, 32, 2, 1, 50, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (375, 32, 3, 1, 92, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (376, 32, 4, 1, 35, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (377, 32, 1, 2, 75, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (378, 32, 2, 2, 66, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (379, 32, 3, 2, 37, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (380, 32, 4, 2, 94, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (381, 32, 1, 3, 97, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (382, 32, 2, 3, 100, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (383, 32, 3, 3, 23, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (384, 32, 4, 3, 9, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (385, 33, 1, 1, 29, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (386, 33, 2, 1, 23, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (387, 33, 3, 1, 8, '2023-01-03 14:40:37', NULL, '2023-01-03 14:40:37', NULL);
INSERT INTO `warehouse` VALUES (388, 33, 4, 1, 21, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (389, 33, 1, 2, 79, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (390, 33, 2, 2, 79, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (391, 33, 3, 2, 5, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (392, 33, 4, 2, 63, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (393, 33, 1, 3, 31, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (394, 33, 2, 3, 12, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (395, 33, 3, 3, 83, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (396, 33, 4, 3, 50, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (397, 34, 1, 1, 98, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (398, 34, 2, 1, 2, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (399, 34, 3, 1, 42, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (400, 34, 4, 1, 90, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (401, 34, 1, 2, 36, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (402, 34, 2, 2, 53, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (403, 34, 3, 2, 78, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (404, 34, 4, 2, 18, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (405, 34, 1, 3, 67, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (406, 34, 2, 3, 52, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (407, 34, 3, 3, 96, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (408, 34, 4, 3, 9, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (409, 35, 1, 1, 51, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (410, 35, 2, 1, 25, '2023-01-03 14:40:38', NULL, '2023-01-03 14:40:38', NULL);
INSERT INTO `warehouse` VALUES (411, 35, 3, 1, 53, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (412, 35, 4, 1, 1, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (413, 35, 1, 2, 92, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (414, 35, 2, 2, 18, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (415, 35, 3, 2, 71, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (416, 35, 4, 2, 29, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (417, 35, 1, 3, 45, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (418, 35, 2, 3, 99, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (419, 35, 3, 3, 60, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (420, 35, 4, 3, 34, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (421, 36, 1, 1, 39, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (422, 36, 2, 1, 9, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (423, 36, 3, 1, 61, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (424, 36, 4, 1, 41, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (425, 36, 1, 2, 85, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (426, 36, 2, 2, 74, '2023-01-03 14:40:39', NULL, '2023-01-03 14:40:39', NULL);
INSERT INTO `warehouse` VALUES (427, 36, 3, 2, 81, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (428, 36, 4, 2, 31, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (429, 36, 1, 3, 83, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (430, 36, 2, 3, 50, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (431, 36, 3, 3, 82, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (432, 36, 4, 3, 33, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (433, 37, 1, 1, 98, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (434, 37, 2, 1, 98, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (435, 37, 3, 1, 41, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (436, 37, 4, 1, 15, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (437, 37, 1, 2, 7, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (438, 37, 2, 2, 35, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (439, 37, 3, 2, 41, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (440, 37, 4, 2, 29, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (441, 37, 1, 3, 13, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (442, 37, 2, 3, 19, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (443, 37, 3, 3, 46, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (444, 37, 4, 3, 34, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (445, 38, 1, 1, 20, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (446, 38, 2, 1, 21, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (447, 38, 3, 1, 40, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (448, 38, 4, 1, 53, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (449, 38, 1, 2, 72, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (450, 38, 2, 2, 35, '2023-01-03 14:40:40', NULL, '2023-01-03 14:40:40', NULL);
INSERT INTO `warehouse` VALUES (451, 38, 3, 2, 83, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (452, 38, 4, 2, 85, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (453, 38, 1, 3, 75, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (454, 38, 2, 3, 49, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (455, 38, 3, 3, 87, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (456, 38, 4, 3, 72, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (457, 39, 1, 1, 75, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (458, 39, 2, 1, 80, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (459, 39, 3, 1, 37, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (460, 39, 4, 1, 64, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (461, 39, 1, 2, 8, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (462, 39, 2, 2, 17, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (463, 39, 3, 2, 93, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (464, 39, 4, 2, 63, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (465, 39, 1, 3, 54, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (466, 39, 2, 3, 25, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (467, 39, 3, 3, 7, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (468, 39, 4, 3, 85, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (469, 40, 1, 1, 40, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (470, 40, 2, 1, 82, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (471, 40, 3, 1, 69, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (472, 40, 4, 1, 76, '2023-01-03 14:40:41', NULL, '2023-01-03 14:40:41', NULL);
INSERT INTO `warehouse` VALUES (473, 40, 1, 2, 7, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (474, 40, 2, 2, 4, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (475, 40, 3, 2, 59, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (476, 40, 4, 2, 48, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (477, 40, 1, 3, 27, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (478, 40, 2, 3, 9, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (479, 40, 3, 3, 86, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (480, 40, 4, 3, 41, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (481, 41, 1, 1, 57, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (482, 41, 2, 1, 2, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (483, 41, 3, 1, 43, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (484, 41, 4, 1, 66, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (485, 41, 1, 2, 46, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (486, 41, 2, 2, 76, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (487, 41, 3, 2, 51, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (488, 41, 4, 2, 16, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (489, 41, 1, 3, 100, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (490, 41, 2, 3, 44, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (491, 41, 3, 3, 100, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (492, 41, 4, 3, 84, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (493, 42, 1, 1, 1, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (494, 42, 2, 1, 12, '2023-01-03 14:40:42', NULL, '2023-01-03 14:40:42', NULL);
INSERT INTO `warehouse` VALUES (495, 42, 3, 1, 19, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (496, 42, 4, 1, 34, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (497, 42, 1, 2, 85, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (498, 42, 2, 2, 38, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (499, 42, 3, 2, 82, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (500, 42, 4, 2, 43, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (501, 42, 1, 3, 58, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (502, 42, 2, 3, 42, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (503, 42, 3, 3, 22, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (504, 42, 4, 3, 18, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (505, 43, 1, 1, 84, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (506, 43, 2, 1, 79, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (507, 43, 3, 1, 73, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (508, 43, 4, 1, 7, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (509, 43, 1, 2, 59, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (510, 43, 2, 2, 27, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (511, 43, 3, 2, 93, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (512, 43, 4, 2, 80, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (513, 43, 1, 3, 96, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (514, 43, 2, 3, 94, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (515, 43, 3, 3, 97, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (516, 43, 4, 3, 54, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (517, 44, 1, 1, 16, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (518, 44, 2, 1, 85, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (519, 44, 3, 1, 38, '2023-01-03 14:40:43', NULL, '2023-01-03 14:40:43', NULL);
INSERT INTO `warehouse` VALUES (520, 44, 4, 1, 48, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (521, 44, 1, 2, 28, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (522, 44, 2, 2, 49, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (523, 44, 3, 2, 54, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (524, 44, 4, 2, 7, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (525, 44, 1, 3, 94, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (526, 44, 2, 3, 34, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (527, 44, 3, 3, 13, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (528, 44, 4, 3, 62, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (529, 45, 1, 1, 97, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (530, 45, 2, 1, 73, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (531, 45, 3, 1, 32, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (532, 45, 4, 1, 5, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (533, 45, 1, 2, 80, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (534, 45, 2, 2, 22, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (535, 45, 3, 2, 23, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (536, 45, 4, 2, 78, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (537, 45, 1, 3, 22, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (538, 45, 2, 3, 26, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (539, 45, 3, 3, 60, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (540, 45, 4, 3, 75, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (541, 46, 1, 1, 62, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (542, 46, 2, 1, 78, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (543, 46, 3, 1, 50, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (544, 46, 4, 1, 91, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (545, 46, 1, 2, 90, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (546, 46, 2, 2, 1, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (547, 46, 3, 2, 29, '2023-01-03 14:40:44', NULL, '2023-01-03 14:40:44', NULL);
INSERT INTO `warehouse` VALUES (548, 46, 4, 2, 51, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (549, 46, 1, 3, 24, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (550, 46, 2, 3, 1, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (551, 46, 3, 3, 30, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (552, 46, 4, 3, 21, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (553, 47, 1, 1, 9, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (554, 47, 2, 1, 10, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (555, 47, 3, 1, 71, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (556, 47, 4, 1, 29, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (557, 47, 1, 2, 31, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (558, 47, 2, 2, 95, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (559, 47, 3, 2, 62, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (560, 47, 4, 2, 29, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (561, 47, 1, 3, 62, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (562, 47, 2, 3, 82, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (563, 47, 3, 3, 87, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (564, 47, 4, 3, 95, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (565, 48, 1, 1, 32, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (566, 48, 2, 1, 2, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (567, 48, 3, 1, 16, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (568, 48, 4, 1, 53, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (569, 48, 1, 2, 25, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (570, 48, 2, 2, 3, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (571, 48, 3, 2, 24, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (572, 48, 4, 2, 92, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (573, 48, 1, 3, 11, '2023-01-03 14:40:45', NULL, '2023-01-03 14:40:45', NULL);
INSERT INTO `warehouse` VALUES (574, 48, 2, 3, 67, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (575, 48, 3, 3, 48, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (576, 48, 4, 3, 2, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (577, 49, 1, 1, 50, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (578, 49, 2, 1, 48, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (579, 49, 3, 1, 34, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (580, 49, 4, 1, 19, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (581, 49, 1, 2, 24, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (582, 49, 2, 2, 75, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (583, 49, 3, 2, 21, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (584, 49, 4, 2, 51, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (585, 49, 1, 3, 16, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (586, 49, 2, 3, 16, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (587, 49, 3, 3, 27, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (588, 49, 4, 3, 15, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (589, 50, 1, 1, 49, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (590, 50, 2, 1, 44, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (591, 50, 3, 1, 74, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (592, 50, 4, 1, 57, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (593, 50, 1, 2, 79, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (594, 50, 2, 2, 48, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (595, 50, 3, 2, 56, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (596, 50, 4, 2, 53, '2023-01-03 14:40:46', NULL, '2023-01-03 14:40:46', NULL);
INSERT INTO `warehouse` VALUES (597, 50, 1, 3, 89, '2023-01-03 14:40:47', NULL, '2023-01-03 14:40:47', NULL);
INSERT INTO `warehouse` VALUES (598, 50, 2, 3, 35, '2023-01-03 14:40:47', NULL, '2023-01-03 14:40:47', NULL);
INSERT INTO `warehouse` VALUES (599, 50, 3, 3, 26, '2023-01-03 14:40:47', NULL, '2023-01-03 14:40:47', NULL);
INSERT INTO `warehouse` VALUES (600, 50, 4, 3, 30, '2023-01-03 14:40:47', NULL, '2023-01-03 14:40:47', NULL);

-- ----------------------------
-- Table structure for warehouse_receipt
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_receipt`;
CREATE TABLE `warehouse_receipt`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint NULL DEFAULT NULL,
  `SIZE_ID` bigint NULL DEFAULT NULL,
  `COLOR_ID` bigint NULL DEFAULT NULL,
  `AMOUNT` int NULL DEFAULT 0,
  `PRICE` double NULL DEFAULT 0,
  `CREATED_DATE` datetime NULL DEFAULT current_timestamp,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT current_timestamp,
  `MODIFIED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `WAREHOUSE_RECEIPT_PRODUCT`(`PRODUCT_ID` ASC) USING BTREE,
  INDEX `WAREHOUSE_RECEIPT_SIZE`(`SIZE_ID` ASC) USING BTREE,
  INDEX `WAREHOUSE_RECEIPT_COLOR`(`COLOR_ID` ASC) USING BTREE,
  CONSTRAINT `WAREHOUSE_RECEIPT_COLOR` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `WAREHOUSE_RECEIPT_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `WAREHOUSE_RECEIPT_SIZE` FOREIGN KEY (`SIZE_ID`) REFERENCES `size` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_receipt
-- ----------------------------
INSERT INTO `warehouse_receipt` VALUES (1, 1, 1, 1, 1, 0, '2023-01-03 14:40:18', NULL, '2023-01-03 14:40:18', NULL);
INSERT INTO `warehouse_receipt` VALUES (2, 1, 2, 1, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (3, 1, 3, 1, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (4, 1, 4, 1, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (5, 1, 1, 2, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (6, 1, 2, 2, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (7, 1, 3, 2, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (8, 1, 4, 2, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (9, 1, 1, 3, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (10, 1, 2, 3, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (11, 1, 3, 3, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);
INSERT INTO `warehouse_receipt` VALUES (12, 1, 4, 3, 1, 0, '2023-01-03 14:40:19', NULL, '2023-01-03 14:40:19', NULL);

SET FOREIGN_KEY_CHECKS = 1;
