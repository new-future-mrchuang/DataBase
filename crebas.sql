/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/2/13 16:11:10                           */
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
   admin_id             bigint not null,
   admin_name           char(8) not null,
   admin_privilege      varchar(32) not null,
   admin_passwd         char(32) not null,
   admin_time           timestamp not null,
   primary key (admin_id)
);

/*==============================================================*/
/* Table: answer                                                */
/*==============================================================*/
create table answer
(
   article_id           bigint not null,
   que_article_id       bigint not null,
   primary key (article_id)
);

/*==============================================================*/
/* Table: article                                               */
/*==============================================================*/
create table article
(
   article_id           bigint not null,
   user_id              bigint not null,
   article_title        char(32) not null,
   article_time         timestamp not null,
   article_content      text not null,
   article_profile      text not null,
   article_effective    bool not null default 1,
   article_draft        bool not null default 0,
   article_focus_number int not null default 0,
   article_collect_number int not null default 0,
   article_up_number    int not null default 0,
   article_down_number  int not null default 0,
   primary key (article_id)
);

/*==============================================================*/
/* Table: article_have_tag                                      */
/*==============================================================*/
create table article_have_tag
(
   tag_id               bigint not null,
   article_id           bigint not null,
   primary key (tag_id, article_id)
);

/*==============================================================*/
/* Table: belong_to_circle                                      */
/*==============================================================*/
create table belong_to_circle
(
   user_id              bigint not null,
   circle_id            bigint not null,
   belong_to_circle_in_request bool not null default 1,
   primary key (user_id, circle_id)
);

/*==============================================================*/
/* Table: belong_to_organization                                */
/*==============================================================*/
create table belong_to_organization
(
   org_user_id          bigint not null,
   user_id              bigint not null,
   belong_to_organization_in_request bool not null default 1,
   primary key (org_user_id, user_id)
);

/*==============================================================*/
/* Table: block                                                 */
/*==============================================================*/
create table block
(
   user_id              bigint not null,
   use_user_id          bigint not null,
   primary key (user_id, use_user_id)
);

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   category_id          bigint not null,
   category_name        char(32) not null,
   category_priviledge  char(32) not null,
   category_profile     char(64),
   category_standby     text,
   primary key (category_id)
);

/*==============================================================*/
/* Table: circle                                                */
/*==============================================================*/
create table circle
(
   circle_id            bigint not null,
   circle_name          char(16) not null,
   circle_limit         int not null default 50,
   circle_time          timestamp not null,
   primary key (circle_id)
);

/*==============================================================*/
/* Table: collect_article                                       */
/*==============================================================*/
create table collect_article
(
   article_id           bigint not null,
   user_id              bigint not null,
   primary key (article_id, user_id)
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           bigint not null,
   user_id              bigint not null,
   article_id           bigint not null,
   comment_time         timestamp not null,
   comment_content      text not null,
   primary key (comment_id)
);

/*==============================================================*/
/* Table: config                                                */
/*==============================================================*/
create table config
(
   config_id            bigint not null,
   config_name          varchar(20) not null,
   config_content       text not null,
   config_info          varchar(50) not null,
   config_time          timestamp not null,
   primary key (config_id)
);

/*==============================================================*/
/* Table: dialog                                                */
/*==============================================================*/
create table dialog
(
   user_id_one          bigint not null,
   user_id_another      bigint not null,
   dialog_time          timestamp not null,
   dialog_content       text not null,
   primary key (user_id_one, user_id_another)
);

/*==============================================================*/
/* Table: down                                                  */
/*==============================================================*/
create table down
(
   article_id           bigint not null,
   user_id              bigint not null,
   primary key (article_id, user_id)
);

/*==============================================================*/
/* Table: focus_on_article                                      */
/*==============================================================*/
create table focus_on_article
(
   article_id           bigint not null,
   user_id              bigint not null,
   article_dynamic      text,
   primary key (article_id, user_id)
);

/*==============================================================*/
/* Table: focus_on_user                                         */
/*==============================================================*/
create table focus_on_user
(
   use_user_id          bigint not null,
   user_id              bigint not null,
   user_dynamic         text,
   primary key (use_user_id, user_id)
);

/*==============================================================*/
/* Table: improvement                                           */
/*==============================================================*/
create table improvement
(
   article_id           bigint not null,
   pro_article_id       bigint not null,
   improvement_accepted bool not null default 0,
   primary key (article_id)
);

/*==============================================================*/
/* Table: log                                                   */
/*==============================================================*/
create table log
(
   log_id               bigint not null,
   log_target           bigint not null,
   log_content          text not null,
   primary key (log_id)
);

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   message_id           bigint not null,
   send_user_id         bigint not null,
   receive_user_id      bigint not null,
   message_content      text not null,
   message_time         timestamp not null,
   message_effective    bool not null default 1,
   message_read         bool not null default 0,
   send_effective       bool not null default 1,
   receive_effective    bool not null default 1,
   primary key (message_id)
);

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   notice_id            bigint not null,
   user_id              bigint not null,
   notice_type          int not null,
   notice_read          bool not null default 0,
   notice_content       text not null,
   notice_time          timestamp not null,
   notice_effective     bool not null default 1,
   primary key (notice_id)
);

/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization
(
   user_id              bigint not null,
   category_id          bigint not null,
   organization_customize bool not null default 0,
   organization_certification_infomation char(64),
   organization_certified bool not null default 0,
   organization_milestone text,
   primary key (user_id)
);

/*==============================================================*/
/* Table: policy                                                */
/*==============================================================*/
create table policy
(
   article_id           bigint not null,
   policy_hits          int not null default 0,
   primary key (article_id)
);

/*==============================================================*/
/* Table: post                                                  */
/*==============================================================*/
create table post
(
   article_id           bigint not null,
   circle_id            bigint not null,
   post_type            int not null default 0,
   post_hits            bigint not null default 0,
   primary key (article_id)
);

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project
(
   article_id           bigint not null,
   project_hits         bigint not null default 0,
   project_avater_url   char(128) not null,
   primary key (article_id)
);

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   article_id           bigint not null,
   question_hits        int not null default 0,
   primary key (article_id)
);

/*==============================================================*/
/* Table: report                                                */
/*==============================================================*/
create table report
(
   article_id           bigint not null,
   user_id              bigint not null,
   report_type          int not null,
   report_content       text not null,
   primary key (article_id, user_id)
);

/*==============================================================*/
/* Table: tag                                                   */
/*==============================================================*/
create table tag
(
   tag_id               bigint not null,
   tag_title            char(32) not null,
   tag_hits             bigint not null default 0,
   tag_profile          text,
   primary key (tag_id)
);

/*==============================================================*/
/* Table: up                                                    */
/*==============================================================*/
create table up
(
   article_id           bigint not null,
   user_id              bigint not null,
   primary key (article_id, user_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              bigint not null,
   user_time            timestamp not null,
   user_nickname        char(16) not null,
   user_email           char(32) not null,
   user_passwd          char(32) not null,
   user_profile         text not null,
   user_avater_url      char(128) not null,
   user_sex             char(8) not null default 'unknown',
   user_effective       bool not null default 1,
   user_last_time       timestamp not null,
   primary key (user_id)
);

alter table answer add constraint FK_answer_belong_to_question foreign key (que_article_id)
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

alter table block add constraint FK_block2 foreign key (use_user_id)
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

alter table focus_on_user add constraint FK_focus_on_user foreign key (use_user_id)
      references user (user_id) on delete restrict on update restrict;

alter table focus_on_user add constraint FK_focus_on_user2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table improvement add constraint FK_improvement_belong_to_project foreign key (pro_article_id)
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

