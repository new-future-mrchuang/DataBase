/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/2/13 17:37:25                           */
/*==============================================================*/


drop table if exists admin;

drop table if exists answer;

drop table if exists article;

drop table if exists article_have_tag;

drop table if exists belong_to_circle;

drop table if exists belong_to_organization;

drop table if exists block;

drop table if exists category;

drop table if exists circle;

drop table if exists collect_article;

drop table if exists comment;

drop table if exists config;

drop table if exists dialog;

drop table if exists down;

drop table if exists focus_on_article;

drop table if exists focus_on_user;

drop table if exists improvement;

drop table if exists log;

drop table if exists message;

drop table if exists notice;

drop table if exists organization;

drop table if exists policy;

drop table if exists post;

drop table if exists project;

drop table if exists question;

drop table if exists report;

drop table if exists tag;

drop table if exists up;

drop table if exists user;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             bigint not null auto_increment comment '管理员id',
   admin_name           char(8) not null comment '管理员姓名',
   admin_privilege      varchar(32) not null comment '管理员权限',
   admin_passwd         char(32) not null comment '管理员密码',
   admin_time           timestamp not null comment '管理员创建时间',
   primary key (admin_id)
);

alter table admin comment '后台系统管理员';

/*==============================================================*/
/* Table: answer                                                */
/*==============================================================*/
create table answer
(
   article_id           bigint not null comment '文章id',
   question_article_id  bigint not null comment '问题_文章id',
   primary key (article_id)
);

alter table answer comment '回答';

/*==============================================================*/
/* Table: article                                               */
/*==============================================================*/
create table article
(
   article_id           bigint not null auto_increment comment '文章id',
   user_id              bigint not null comment '用户id',
   article_title        char(32) not null comment '文章标题',
   article_time         timestamp not null comment '文章发布时间',
   article_content      text not null comment '文章内容',
   article_profile      text not null comment '文章简介',
   article_effective    bool not null default 1 comment '文章有效',
   article_draft        bool not null default 0 comment '文章是草稿吗',
   article_focus_number int not null default 0 comment '文章被关注的数量',
   article_collect_number int not null default 0 comment '文章被收藏的数量',
   article_up_number    int not null default 0 comment '文章被赞的数量',
   article_down_number  int not null default 0 comment '文章被踩的数量',
   primary key (article_id)
);

alter table article comment '文章';

/*==============================================================*/
/* Table: article_have_tag                                      */
/*==============================================================*/
create table article_have_tag
(
   tag_id               bigint not null comment '标签id',
   article_id           bigint not null comment '文章id',
   primary key (tag_id, article_id)
);

alter table article_have_tag comment '文章具有标签';

/*==============================================================*/
/* Table: belong_to_circle                                      */
/*==============================================================*/
create table belong_to_circle
(
   user_id              bigint not null comment '用户id',
   circle_id            bigint not null comment '圈子id',
   belong_to_circle_in_request bool not null default 1 comment '是否处于申请状态(in_request)',
   primary key (user_id, circle_id)
);

alter table belong_to_circle comment '用户属于圈子';

/*==============================================================*/
/* Table: belong_to_organization                                */
/*==============================================================*/
create table belong_to_organization
(
   org_user_id          bigint not null comment '组织_用户id',
   user_id              bigint not null comment '用户id',
   belong_to_organization_in_request bool not null default 1 comment '处于申请状态',
   primary key (org_user_id, user_id)
);

alter table belong_to_organization comment '属于组织';

/*==============================================================*/
/* Table: block                                                 */
/*==============================================================*/
create table block
(
   user_id              bigint not null comment '用户id',
   user_id_blocked      bigint not null comment '被屏蔽用户id',
   primary key (user_id, user_id_blocked)
);

alter table block comment '屏蔽(黑名单)';

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   category_id          bigint not null auto_increment comment '组织类别id',
   category_name        char(32) not null comment '组织类别名字',
   category_priviledge  char(32) not null comment '组织类别权限',
   category_profile     char(64) comment '组织类别简介',
   category_standby     text comment '组织备用',
   primary key (category_id)
);

alter table category comment '组织类别category';

/*==============================================================*/
/* Table: circle                                                */
/*==============================================================*/
create table circle
(
   circle_id            bigint not null auto_increment comment '圈子id',
   circle_name          char(16) not null comment '圈子名字',
   circle_limit         int not null default 50 comment '圈子人数上限',
   circle_time          timestamp not null comment '圈子创建时间',
   primary key (circle_id)
);

alter table circle comment '圈子';

/*==============================================================*/
/* Table: collect_article                                       */
/*==============================================================*/
create table collect_article
(
   article_id           bigint not null comment '文章id',
   user_id              bigint not null comment '用户id',
   primary key (article_id, user_id)
);

alter table collect_article comment '收藏';

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           bigint not null auto_increment comment '评论id',
   user_id              bigint not null comment '用户id',
   article_id           bigint not null comment '文章id',
   comment_time         timestamp not null comment '评论发布时间',
   comment_content      text not null comment '评论内容',
   primary key (comment_id)
);

alter table comment comment '评论';

/*==============================================================*/
/* Table: config                                                */
/*==============================================================*/
create table config
(
   config_id            bigint not null auto_increment comment 'config_id',
   config_name          varchar(20) not null comment 'config_name',
   config_content       text not null comment 'config_content',
   config_info          varchar(50) not null comment 'config_info',
   config_time          timestamp not null comment 'config_time',
   primary key (config_id)
);

alter table config comment '系统设置';

/*==============================================================*/
/* Table: dialog                                                */
/*==============================================================*/
create table dialog
(
   user_id_one          bigint not null comment '用户_用户id',
   user_id_another      bigint not null comment '用户id',
   dialog_time          timestamp not null comment '最新消息时间',
   dialog_content       text not null comment '最新内容',
   primary key (user_id_one, user_id_another)
);

alter table dialog comment '对话表(记录了对话双方id和最新时间内容)';

/*==============================================================*/
/* Table: down                                                  */
/*==============================================================*/
create table down
(
   article_id           bigint not null comment '文章id',
   user_id              bigint not null comment '用户id',
   primary key (article_id, user_id)
);

alter table down comment '踩';

/*==============================================================*/
/* Table: focus_on_article                                      */
/*==============================================================*/
create table focus_on_article
(
   article_id           bigint not null comment '文章id',
   user_id              bigint not null comment '用户id',
   article_dynamic      text comment '文章动态',
   primary key (article_id, user_id)
);

alter table focus_on_article comment '关注文章';

/*==============================================================*/
/* Table: focus_on_user                                         */
/*==============================================================*/
create table focus_on_user
(
   user_id_focused      bigint not null comment '用户_用户id',
   user_id              bigint not null comment '用户id',
   user_dynamic         text comment '动态',
   primary key (user_id_focused, user_id)
);

alter table focus_on_user comment '关注用户';

/*==============================================================*/
/* Table: improvement                                           */
/*==============================================================*/
create table improvement
(
   article_id           bigint not null comment '文章id',
   project_article_id   bigint not null comment '项目_文章id',
   improvement_accepted bool not null default 0 comment '完善是否被采用',
   primary key (article_id)
);

alter table improvement comment '完善';

/*==============================================================*/
/* Table: log                                                   */
/*==============================================================*/
create table log
(
   log_id               bigint not null auto_increment comment '记录id',
   log_target           bigint not null comment '记录对象',
   log_content          text not null comment '记录内容',
   primary key (log_id)
);

alter table log comment '记录';

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   message_id           bigint not null auto_increment comment '私信id',
   send_user_id         bigint not null comment '发送者id',
   receive_user_id      bigint not null comment '接受者id',
   message_content      text not null comment '私信内容',
   message_time         timestamp not null comment '私信发送时间',
   message_effective    bool not null default 1 comment '私信有效位(默认为1,即有效)',
   message_read         bool not null default 0 comment '私信已读(默认为0,即未读)',
   send_effective       bool not null default 1 comment '发送者有效位',
   receive_effective    bool not null default 1 comment '接收方有效位',
   primary key (message_id)
);

alter table message comment '私信';

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   notice_id            bigint not null auto_increment comment '提醒id',
   user_id              bigint not null comment '用户id',
   notice_type          int not null comment '提醒类型',
   notice_read          bool not null default 0 comment '提醒已读',
   notice_content       text not null comment '提醒内容',
   notice_time          timestamp not null comment '提醒插入数据库的时间',
   notice_effective     bool not null default 1 comment '提醒有效',
   primary key (notice_id)
);

alter table notice comment '系统提醒';

/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization
(
   user_id              bigint not null comment '用户id',
   category_id          bigint not null comment '组织类别id',
   organization_customize bool not null default 0 comment '组织主页是否定制(默认为0,即不定制)',
   organization_certification_infomation char(64) comment '组织认证信息(一句话,小于64个字)',
   organization_certified bool not null default 0 comment '组织是否已经经过认证(默认为0)',
   organization_milestone text comment '组织里程碑记录',
   primary key (user_id)
);

alter table organization comment '组织';

/*==============================================================*/
/* Table: policy                                                */
/*==============================================================*/
create table policy
(
   article_id           bigint not null comment '文章id',
   policy_hits          int not null default 0 comment '政策点击量',
   primary key (article_id)
);

alter table policy comment '政策';

/*==============================================================*/
/* Table: post                                                  */
/*==============================================================*/
create table post
(
   article_id           bigint not null comment '文章id',
   circle_id            bigint not null comment '圈子id',
   post_type            int not null default 0 comment '帖子类型',
   post_hits            bigint not null default 0 comment '帖子点击量',
   primary key (article_id)
);

alter table post comment '圈子里的帖子(post)';

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project
(
   article_id           bigint not null comment '文章id',
   project_hits         bigint not null default 0 comment '项目点击量',
   project_avater_url   char(128) not null comment '项目头像图片',
   primary key (article_id)
);

alter table project comment '项目';

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   article_id           bigint not null comment '文章id',
   question_hits        int not null default 0 comment '问题点击量',
   primary key (article_id)
);

alter table question comment '问题';

/*==============================================================*/
/* Table: report                                                */
/*==============================================================*/
create table report
(
   article_id           bigint not null comment '文章id',
   user_id              bigint not null comment '用户id',
   report_type          int not null comment '举报类型',
   report_content       text not null comment '举报内容',
   primary key (article_id, user_id)
);

alter table report comment '举报';

/*==============================================================*/
/* Table: tag                                                   */
/*==============================================================*/
create table tag
(
   tag_id               bigint not null auto_increment comment '标签id',
   tag_title            char(32) not null comment '标签标题',
   tag_hits             bigint not null default 0 comment '标签热度',
   tag_profile          text comment '标签信息(备用)',
   primary key (tag_id)
);

alter table tag comment '标签';

/*==============================================================*/
/* Table: up                                                    */
/*==============================================================*/
create table up
(
   article_id           bigint not null comment '文章id',
   user_id              bigint not null comment '用户id',
   primary key (article_id, user_id)
);

alter table up comment '赞';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              bigint not null auto_increment comment '用户id',
   user_time            timestamp not null comment '用户创建时间',
   user_nickname        char(16) not null comment '用户昵称',
   user_email           char(32) not null comment '用户email',
   user_passwd          char(32) not null comment '用户密码哈希值',
   user_profile         text not null comment '用户简介',
   user_avater_url      char(128) not null comment '用户头像url',
   user_sex             char(8) not null default 'unknown' comment '用户性别',
   user_effective       bool not null default 1 comment '用户有效位',
   user_last_time       timestamp not null comment '用户最后一次操作的时间戳(last_time)',
   primary key (user_id)
);

alter table user comment '用户';

alter table answer add constraint FK_answer_belong_to_question foreign key (question_article_id)
      references question (article_id) on delete restrict on update restrict;

alter table answer add constraint FK_answer_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table article add constraint FK_post_article foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table article_have_tag add constraint FK_article_have_tag foreign key (tag_id)
      references tag (tag_id) on delete restrict on update restrict;

alter table article_have_tag add constraint FK_article_have_tag2 foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table belong_to_circle add constraint FK_belong_to_circle foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table belong_to_circle add constraint FK_belong_to_circle2 foreign key (circle_id)
      references circle (circle_id) on delete restrict on update restrict;

alter table belong_to_organization add constraint FK_belong_to_organization foreign key (org_user_id)
      references organization (user_id) on delete restrict on update restrict;

alter table belong_to_organization add constraint FK_belong_to_organization2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table block add constraint FK_block foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table block add constraint FK_block2 foreign key (user_id_blocked)
      references user (user_id) on delete restrict on update restrict;

alter table collect_article add constraint FK_collect_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table collect_article add constraint FK_collect_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment_belong_to_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table comment add constraint FK_post_comment foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table dialog add constraint FK_dialog foreign key (user_id_one)
      references user (user_id) on delete restrict on update restrict;

alter table dialog add constraint FK_dialog2 foreign key (user_id_another)
      references user (user_id) on delete restrict on update restrict;

alter table down add constraint FK_down foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table down add constraint FK_down2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_article add constraint FK_focus_on_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table focus_on_article add constraint FK_focus_on_article2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_user add constraint FK_focus_on_user foreign key (user_id_focused)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_user add constraint FK_focus_on_user2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table improvement add constraint FK_improvement_belong_to_project foreign key (project_article_id)
      references project (article_id) on delete restrict on update restrict;

alter table improvement add constraint FK_improvement_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table message add constraint FK_receive_message foreign key (receive_user_id)
      references user (user_id) on delete restrict on update restrict;

alter table message add constraint FK_send_message foreign key (send_user_id)
      references user (user_id) on delete restrict on update restrict;

alter table notice add constraint FK_notice_sen_to_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table organization add constraint FK_organization_belong_to_category foreign key (category_id)
      references category (category_id) on delete restrict on update restrict;

alter table organization add constraint FK_organization_isa_user foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table policy add constraint FK_policy_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table post add constraint FK_post_belong_to_circle foreign key (circle_id)
      references circle (circle_id) on delete restrict on update restrict;

alter table post add constraint FK_post_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table project add constraint FK_project_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table question add constraint FK_question_isa_article foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table report add constraint FK_report foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table report add constraint FK_report2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table up add constraint FK_up foreign key (article_id)
      references article (article_id) on delete restrict on update restrict;

alter table up add constraint FK_up2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

