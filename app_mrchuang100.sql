-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2014 年 03 月 19 日 20:21
-- 服务器版本: 5.5.27
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `app_mrchuang100`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_name` char(8) NOT NULL COMMENT '管理员姓名',
  `admin_privilege` varchar(32) NOT NULL COMMENT '管理员权限',
  `admin_passwd` char(32) NOT NULL COMMENT '管理员密码',
  `admin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '管理员创建时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台系统管理员' AUTO_INCREMENT=66027523 ;

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `article_title` char(64) NOT NULL COMMENT '文章标题',
  `article_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章发布时间',
  `article_content` text COMMENT '文章内容',
  `article_profile` text NOT NULL COMMENT '文章简介',
  `article_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文章有效',
  `article_draft` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章是草稿吗',
  `article_focus_number` int(11) NOT NULL DEFAULT '0' COMMENT '文章被关注的数量',
  `article_collect_number` int(11) NOT NULL DEFAULT '0' COMMENT '文章被收藏的数量',
  `article_up_number` int(11) NOT NULL DEFAULT '0' COMMENT '文章被赞的数量',
  `article_down_number` int(11) NOT NULL DEFAULT '0' COMMENT '文章被踩的数量',
  `article_type` int(11) NOT NULL COMMENT '文章类型',
  `article_comment_number` int(11) NOT NULL DEFAULT '0' COMMENT '文章总评论数',
  `article_hits` int(11) NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `article_tags` text,
  `article_pictrue_url` char(40) DEFAULT NULL COMMENT '发表文章时候添加的图片',
  PRIMARY KEY (`article_id`),
  KEY `FK_post_article` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章' AUTO_INCREMENT=201326681 ;

-- --------------------------------------------------------

--
-- 表的结构 `article_have_tag`
--

CREATE TABLE IF NOT EXISTS `article_have_tag` (
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `article_id` int(11) NOT NULL COMMENT '文章id',
  PRIMARY KEY (`tag_id`,`article_id`),
  KEY `FK_article_have_tag2` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章具有标签';

-- --------------------------------------------------------

--
-- 表的结构 `belong_to_circle`
--

CREATE TABLE IF NOT EXISTS `belong_to_circle` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `circle_id` int(11) NOT NULL COMMENT '圈子id',
  `belong_to_circle_in_request` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否处于申请状态(in_request)',
  `belong_to_circle_info` char(32) DEFAULT NULL COMMENT '用户在圈子中的信息(地位类型等乱七八糟的或许可以由圈主自定义的的东西)',
  `belong_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`circle_id`),
  KEY `FK_belong_to_circle2` (`circle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户属于圈子';

-- --------------------------------------------------------

--
-- 表的结构 `belong_to_organization`
--

CREATE TABLE IF NOT EXISTS `belong_to_organization` (
  `organization_user_id` int(11) NOT NULL COMMENT '组织id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '处于申请状态',
  `belong_to_organization_info` char(32) DEFAULT NULL COMMENT '用户在组织中的信息',
  PRIMARY KEY (`organization_user_id`,`user_id`),
  KEY `FK_belong_to_organization2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='属于组织';

-- --------------------------------------------------------

--
-- 表的结构 `block`
--

CREATE TABLE IF NOT EXISTS `block` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_id_blocked` int(11) NOT NULL COMMENT '被屏蔽用户id',
  PRIMARY KEY (`user_id`,`user_id_blocked`),
  KEY `FK_block2` (`user_id_blocked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='屏蔽(黑名单)';

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织类别id',
  `category_name` char(32) NOT NULL COMMENT '组织类别名字',
  `category_priviledge` char(32) NOT NULL COMMENT '组织类别权限',
  `category_profile` char(64) DEFAULT NULL COMMENT '组织类别简介',
  `category_standby` text COMMENT '组织备用',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='组织类别category' AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `circle`
--

CREATE TABLE IF NOT EXISTS `circle` (
  `circle_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '圈子id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `circle_name` char(16) NOT NULL COMMENT '圈子名字',
  `circle_limit` int(11) NOT NULL DEFAULT '50' COMMENT '圈子人数上限',
  `circle_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '圈子创建时间',
  `circle_profile` text NOT NULL COMMENT '圈子简介',
  `circle_avatar_url` char(128) DEFAULT NULL COMMENT '圈子头像url',
  `circle_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '圈子有效位',
  `circle_number` int(11) NOT NULL DEFAULT '1',
  `circle_tags` char(10) DEFAULT NULL,
  PRIMARY KEY (`circle_id`),
  KEY `FK_create_circle` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='圈子' AUTO_INCREMENT=67108871 ;

-- --------------------------------------------------------

--
-- 表的结构 `circle_have_tag`
--

CREATE TABLE IF NOT EXISTS `circle_have_tag` (
  `circle_id` int(11) NOT NULL COMMENT '圈子id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`circle_id`,`tag_id`),
  KEY `FK_circle_have_tag2` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子具有标签';

-- --------------------------------------------------------

--
-- 表的结构 `circle_invitation`
--

CREATE TABLE IF NOT EXISTS `circle_invitation` (
  `circle_id` int(11) NOT NULL,
  `circle_invitation_code` char(8) DEFAULT NULL,
  `circle_invitation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `circle_invitation_effective` tinyint(1) DEFAULT '1',
  KEY `FK_circle_have_invitation` (`circle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `collect_article`
--

CREATE TABLE IF NOT EXISTS `collect_article` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`article_id`,`user_id`),
  KEY `FK_collect_article2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏';

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(11) NOT NULL COMMENT '发表评论的用户的id',
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论发布时间',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `comment_up_number` int(11) NOT NULL DEFAULT '0' COMMENT '评论赞的数量',
  `comment_down_number` int(11) NOT NULL DEFAULT '0' COMMENT '评论踩的数量',
  `comment_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评论有效位',
  `comment_type` int(11) NOT NULL COMMENT '评论类型',
  `comment_second_comment_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `FK_comment_belong_to_article` (`article_id`),
  KEY `FK_post_comment` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论' AUTO_INCREMENT=671088668 ;

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'config_id',
  `config_name` varchar(20) NOT NULL COMMENT 'config_name',
  `config_content` text NOT NULL COMMENT 'config_content',
  `config_info` varchar(50) NOT NULL COMMENT 'config_info',
  `config_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'config_time',
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统设置' AUTO_INCREMENT=66043907 ;

-- --------------------------------------------------------

--
-- 表的结构 `dialog`
--

CREATE TABLE IF NOT EXISTS `dialog` (
  `user_id_less` int(11) NOT NULL COMMENT '用户较小id',
  `user_id_more` int(11) NOT NULL COMMENT '用户较大id',
  `dialog_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最新消息时间',
  `dialog_content` text NOT NULL COMMENT '最新内容',
  `dialog_less_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'id小的有效位',
  `dialog_more_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'id大的有效位',
  PRIMARY KEY (`user_id_less`,`user_id_more`),
  KEY `FK_dialog2` (`user_id_more`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='对话表(记录了对话双方id和最新时间内容)';

-- --------------------------------------------------------

--
-- 表的结构 `down_article`
--

CREATE TABLE IF NOT EXISTS `down_article` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`article_id`,`user_id`),
  KEY `FK_down_article2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='踩';

-- --------------------------------------------------------

--
-- 表的结构 `down_comment`
--

CREATE TABLE IF NOT EXISTS `down_comment` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `comment_id` int(11) NOT NULL COMMENT '评论id',
  PRIMARY KEY (`user_id`,`comment_id`),
  KEY `FK_down_comment2` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='踩评论';

-- --------------------------------------------------------

--
-- 表的结构 `dynamic`
--

CREATE TABLE IF NOT EXISTS `dynamic` (
  `dynamic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态的id',
  `dynamic_subject_id` bigint(20) NOT NULL COMMENT '主格的id',
  `dynamic_object_id` bigint(20) NOT NULL COMMENT '宾格的id',
  `dynamic_type` bigint(20) NOT NULL COMMENT '动态类型',
  `dynamic_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '动态发生的时间',
  PRIMARY KEY (`dynamic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='动态' AUTO_INCREMENT=1073741825 ;

-- --------------------------------------------------------

--
-- 表的结构 `focus_on_article`
--

CREATE TABLE IF NOT EXISTS `focus_on_article` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`article_id`,`user_id`),
  KEY `FK_focus_on_article2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关注文章';

-- --------------------------------------------------------

--
-- 表的结构 `focus_on_tag`
--

CREATE TABLE IF NOT EXISTS `focus_on_tag` (
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`tag_id`,`user_id`),
  KEY `FK_focus_on_tag2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关注标签';

-- --------------------------------------------------------

--
-- 表的结构 `focus_on_user`
--

CREATE TABLE IF NOT EXISTS `focus_on_user` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_id_focused` int(11) NOT NULL COMMENT '被关注用户id',
  PRIMARY KEY (`user_id`,`user_id_focused`),
  KEY `FK_focus_on_user2` (`user_id_focused`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关注用户';

-- --------------------------------------------------------

--
-- 表的结构 `global_notice`
--

CREATE TABLE IF NOT EXISTS `global_notice` (
  `global_notice_type` int(11) DEFAULT NULL,
  `global_notice_content` text,
  `global_notice_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `global_notice_effective` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `invitation`
--

CREATE TABLE IF NOT EXISTS `invitation` (
  `invitation_code` char(8) DEFAULT NULL,
  `invitation_effective` tinyint(1) DEFAULT '1',
  `invitation_type` int(11) DEFAULT NULL,
  `invitation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信id',
  `send_user_id` int(11) NOT NULL COMMENT '发送者id',
  `receive_user_id` int(11) NOT NULL COMMENT '接受者id',
  `message_content` text NOT NULL COMMENT '私信内容',
  `message_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '私信发送时间',
  `message_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '私信有效位(默认为1,即有效)',
  `message_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '私信已读(默认为0,即未读)',
  `send_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发送者有效位',
  `receive_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '接收方有效位',
  PRIMARY KEY (`message_id`),
  KEY `FK_receive_message` (`receive_user_id`),
  KEY `FK_send_message` (`send_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='私信' AUTO_INCREMENT=268435474 ;

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提醒id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `notice_type` int(11) NOT NULL COMMENT '提醒类型',
  `notice_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提醒已读',
  `notice_title` char(100) DEFAULT NULL,
  `notice_content` text NOT NULL COMMENT '提醒内容',
  `notice_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提醒插入数据库的时间',
  `notice_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '提醒有效',
  PRIMARY KEY (`notice_id`),
  KEY `FK_notice_send_to_user` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统提醒' AUTO_INCREMENT=805306370 ;

-- --------------------------------------------------------

--
-- 表的结构 `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `category_id` int(11) NOT NULL COMMENT '组织类别id',
  `organization_customize` tinyint(1) NOT NULL DEFAULT '0' COMMENT '组织主页是否定制(默认为0,即不定制)',
  `organization_certification_infomation` char(64) DEFAULT NULL COMMENT '组织认证信息(一句话,小于64个字)',
  `organization_certified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '组织是否已经经过认证(默认为0)',
  `organization_milestone` text COMMENT '组织里程碑记录',
  PRIMARY KEY (`user_id`),
  KEY `FK_organization_belong_to_category` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组织';

-- --------------------------------------------------------

--
-- 表的结构 `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_sex` char(8) NOT NULL COMMENT '用户性别',
  `user_location` char(64) DEFAULT NULL COMMENT '用户所在地',
  `user_birthday` date DEFAULT NULL COMMENT '用户生日',
  `user_education_experience` text,
  `user_career_experience` text,
  `user_startup_point` text,
  `user_business` text,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人用户的详细信息';

-- --------------------------------------------------------

--
-- 表的结构 `policy`
--

CREATE TABLE IF NOT EXISTS `policy` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `policy_url` char(40) DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='政策';

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `circle_id` int(11) NOT NULL COMMENT '圈子id',
  `post_type` int(11) NOT NULL COMMENT '帖子类型',
  `post_hits` int(11) NOT NULL DEFAULT '0' COMMENT '帖子点击量',
  PRIMARY KEY (`article_id`),
  KEY `FK_post_belong_to_circle` (`circle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='圈子里的帖子(post)';

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `project_avatar_url` char(128) DEFAULT NULL COMMENT '项目封面图片',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目';

-- --------------------------------------------------------

--
-- 表的结构 `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题';

-- --------------------------------------------------------

--
-- 表的结构 `report_article`
--

CREATE TABLE IF NOT EXISTS `report_article` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `report_article_type` int(11) NOT NULL COMMENT '文章举报类型',
  `report_article_content` text COMMENT '文章举报内容',
  PRIMARY KEY (`article_id`,`user_id`),
  KEY `FK_report_article2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='举报文章';

-- --------------------------------------------------------

--
-- 表的结构 `report_comment`
--

CREATE TABLE IF NOT EXISTS `report_comment` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `comment_id` int(11) NOT NULL COMMENT '评论id',
  `report_comment_type` int(11) NOT NULL COMMENT '评论举报类型',
  `report_comment_content` text COMMENT '评论举报内容',
  PRIMARY KEY (`user_id`,`comment_id`),
  KEY `FK_report_comment2` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='举报评论';

-- --------------------------------------------------------

--
-- 表的结构 `report_second_comment`
--

CREATE TABLE IF NOT EXISTS `report_second_comment` (
  `user_id` int(11) NOT NULL,
  `second_comment_id` int(11) NOT NULL,
  `report_second_comment_type` int(11) NOT NULL,
  `report_second_comment_content` text,
  PRIMARY KEY (`user_id`,`second_comment_id`),
  KEY `report_second_comment_FK` (`user_id`),
  KEY `report_second_comment2_FK` (`second_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `second_comment`
--

CREATE TABLE IF NOT EXISTS `second_comment` (
  `second_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `second_comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `second_comment_content` text,
  `user_reply_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`second_comment_id`),
  KEY `FK_post_second_comment` (`user_id`),
  KEY `FK_second_comment_belong_to_comment` (`comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=536870914 ;

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_title` char(32) NOT NULL COMMENT '标签标题',
  `tag_circle_hits` int(11) NOT NULL DEFAULT '0',
  `tag_article_hits` int(11) NOT NULL DEFAULT '0',
  `tag_focus_number` int(11) NOT NULL DEFAULT '0' COMMENT '标签热度',
  `tag_profile` text COMMENT '标签信息(备用)',
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='标签' AUTO_INCREMENT=66060354 ;

-- --------------------------------------------------------

--
-- 表的结构 `up_article`
--

CREATE TABLE IF NOT EXISTS `up_article` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`article_id`,`user_id`),
  KEY `FK_up_article2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='赞';

-- --------------------------------------------------------

--
-- 表的结构 `up_comment`
--

CREATE TABLE IF NOT EXISTS `up_comment` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `comment_id` int(11) NOT NULL COMMENT '评论id',
  PRIMARY KEY (`user_id`,`comment_id`),
  KEY `FK_up_comment2` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='赞评论';

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `user_nickname` char(16) NOT NULL COMMENT '用户昵称(名称)',
  `user_email` char(32) NOT NULL COMMENT '用户email',
  `user_passwd` char(32) NOT NULL COMMENT '用户密码哈希值',
  `user_profile` text COMMENT '用户简介',
  `user_avatar_url` char(128) DEFAULT NULL COMMENT '用户头像url',
  `user_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户有效位',
  `user_last_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '用户最后一次操作的时间戳(last_time)',
  `user_type` int(11) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `user_signature` char(32) DEFAULT NULL COMMENT '用户签名',
  `user_focus_number` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户' AUTO_INCREMENT=134217779 ;

-- --------------------------------------------------------

--
-- 表的结构 `validate`
--

CREATE TABLE IF NOT EXISTS `validate` (
  `validate_id` int(11) NOT NULL COMMENT '验证的东西的id',
  `validate_key` char(16) NOT NULL COMMENT '验证密码',
  `validate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '验证时间',
  PRIMARY KEY (`validate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='验证表';
