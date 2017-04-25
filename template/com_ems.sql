-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-23 16:52:01
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `com_ems`
--

-- --------------------------------------------------------

--
-- 表的结构 `ems_activity`
--

CREATE TABLE `ems_activity` (
  `activityID` int(11) NOT NULL COMMENT '考试活动表',
  `activityTitle` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `activityPIN` char(64) NOT NULL COMMENT '此次活动PIN码',
  `activityBegin` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `activityEnd` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `examID` int(11) DEFAULT NULL COMMENT '试卷ID',
  `activityDesc` text COMMENT '活动描述',
  `resultOption` char(128) DEFAULT '[{"通过":"60-100","不通过":"0-59"}]' COMMENT '分析结果选项',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `PIN` int(11) NOT NULL COMMENT '识别码',
  `userID` int(11) NOT NULL COMMENT '操作者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ems_activity_result`
--

CREATE TABLE `ems_activity_result` (
  `activityResultID` int(11) NOT NULL COMMENT '考试结果表',
  `activityPIN` char(64) NOT NULL COMMENT '此次活动PIN码',
  `userPIN` char(64) NOT NULL COMMENT '参与者PIN码',
  `start` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `result` char(64) DEFAULT '' COMMENT '结果',
  `score` decimal(10,1) DEFAULT '0.0' COMMENT '分数',
  `description` text COMMENT '描述',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `PIN` int(11) NOT NULL COMMENT '识别码',
  `userID` int(11) NOT NULL COMMENT '操作者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ems_exam`
--

CREATE TABLE `ems_exam` (
  `examID` int(11) NOT NULL COMMENT '试卷表',
  `examTitle` varchar(40) DEFAULT NULL COMMENT '试卷标题',
  `examContent` varchar(220) DEFAULT NULL COMMENT '试卷描述',
  `examTime` int(11) DEFAULT '0' COMMENT '考试时长',
  `trainNum` int(10) DEFAULT '0' COMMENT '试题数',
  `score` decimal(10,1) DEFAULT '0.0' COMMENT '分数',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `PIN` int(11) NOT NULL COMMENT '识别码',
  `userID` int(11) NOT NULL COMMENT '操作者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ems_exam_train`
--

CREATE TABLE `ems_exam_train` (
  `examTrainID` int(11) NOT NULL COMMENT '考卷试题关联表',
  `sort` int(11) DEFAULT '0' COMMENT '序号',
  `examID` int(11) DEFAULT NULL COMMENT '考卷表',
  `trainID` int(11) DEFAULT NULL COMMENT '试题id',
  `score` decimal(10,1) DEFAULT '0.0' COMMENT '分数',
  `duration` int(11) DEFAULT '0' COMMENT '时长',
  `PIN` int(11) NOT NULL COMMENT '识别码',
  `userID` int(11) NOT NULL COMMENT '操作者',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ems_train`
--

CREATE TABLE `ems_train` (
  `trainID` int(11) NOT NULL COMMENT '题库表',
  `trainContent` text COMMENT '题目内容',
  `trainSort` int(10) DEFAULT '99' COMMENT '试题排序',
  `trainType` tinyint(1) DEFAULT '1' COMMENT '1表示单选 2表示多选',
  `trainOption` text COMMENT '题目选项',
  `trainAnswer` varchar(250) DEFAULT NULL COMMENT '答案json字符串 {''a'',''b''}',
  `trainExplain` varchar(250) DEFAULT NULL COMMENT '正确答案解析',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `PIN` int(11) NOT NULL COMMENT '识别码',
  `userID` int(11) NOT NULL COMMENT '操作者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ems_user`
--

CREATE TABLE `ems_user` (
  `userID` int(11) NOT NULL,
  `PIN` char(255) NOT NULL DEFAULT '0' COMMENT '用户PIN 不唯一，用来区分子账户',
  `userNick` char(255) DEFAULT '会员' COMMENT '用户昵称',
  `usreName` char(64) NOT NULL COMMENT '账户',
  `userPass` char(64) NOT NULL COMMENT '密码',
  `roleID` int(11) DEFAULT '0' COMMENT '角色ID 0表示administrator',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '当前状态 1启用 2禁用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ems_activity`
--
ALTER TABLE `ems_activity`
  ADD PRIMARY KEY (`activityID`);

--
-- Indexes for table `ems_activity_result`
--
ALTER TABLE `ems_activity_result`
  ADD PRIMARY KEY (`activityResultID`);

--
-- Indexes for table `ems_exam`
--
ALTER TABLE `ems_exam`
  ADD PRIMARY KEY (`examID`);

--
-- Indexes for table `ems_exam_train`
--
ALTER TABLE `ems_exam_train`
  ADD PRIMARY KEY (`examTrainID`);

--
-- Indexes for table `ems_train`
--
ALTER TABLE `ems_train`
  ADD PRIMARY KEY (`trainID`);

--
-- Indexes for table `ems_user`
--
ALTER TABLE `ems_user`
  ADD PRIMARY KEY (`userID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ems_activity`
--
ALTER TABLE `ems_activity`
  MODIFY `activityID` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试活动表', AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `ems_activity_result`
--
ALTER TABLE `ems_activity_result`
  MODIFY `activityResultID` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试结果表', AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `ems_exam`
--
ALTER TABLE `ems_exam`
  MODIFY `examID` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷表', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ems_exam_train`
--
ALTER TABLE `ems_exam_train`
  MODIFY `examTrainID` int(11) NOT NULL AUTO_INCREMENT COMMENT '考卷试题关联表', AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `ems_train`
--
ALTER TABLE `ems_train`
  MODIFY `trainID` int(11) NOT NULL AUTO_INCREMENT COMMENT '题库表', AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
