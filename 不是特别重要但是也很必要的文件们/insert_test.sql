insert into user(user_email, user_passwd, user_nickname, user_profile, user_avatar_url)
values('niuliang3@gmail.com','123456', '牛亮', 'Hello,Jinx~', 'public/img/avatar.png');
insert into user(user_email, user_passwd, user_nickname, user_profile, user_avatar_url)
values('niuliang2@gmail.com','123456', '流量', 'Hello,Yi~', 'public/img/avatar.png');
insert into user(user_email, user_passwd, user_nickname, user_profile, user_avatar_url)
values('niuliang1@gmail.com','123456', '牛酿', 'Hello,Ahse~', 'public/img/avatar.png');
insert into user(user_email, user_passwd, user_nickname, user_profile, user_avatar_url)
values('niuliang0@gmail.com','123456', '流酿', 'Hello,LuLu~', 'public/img/avatar.png');


insert into circle(circle_name,user_id,circle_profile)
values('南开商圈',134217729,'我是看南门的~');
insert into circle(circle_name,user_id,circle_profile)
values('天大商圈',134217729,'我们距世界一流大学只有一墙之隔~');
insert into circle(circle_name,user_id,circle_profile)
values('泰达会馆圈',134217729,'总理我就不让你往南看~');

insert into article(user_id, article_title, article_profile, article_content, article_type)
    values(134217729, '我不是标题', '我不是简介', '我不是内容', 1);
insert into article(user_id, article_title, article_profile, article_content, article_type)
    values(134217729, '闯先生', '简介:创业', '闯爷一句话,走遍天下都不怕~', 2);
insert into article(user_id, article_title, article_profile, article_content, article_type)
    values(134217729, '天使汇', '天使融资', '内容:周恩来总理的亲戚办的创业网站', 2);
insert into article(user_id, article_title, article_profile, article_content, article_type)
    values(134217729, '知乎', 'zhihu.com', '知乎是中国最大的逼格最高的问答网站,对,就是中国的quora!', 2);

insert into tag(tag_title)
    values('南开');
insert into tag(tag_title)
    values('天大');
insert into tag(tag_title)
    values('闯先生');
insert into tag(tag_title)
    values('腾讯');

insert into focus_on_tag(tag_id, user_id)
    values(1, 134217729);
insert into focus_on_tag(tag_id, user_id)
    values(4, 134217730);
insert into focus_on_tag(tag_id, user_id)
    values(2, 134217729);
insert into focus_on_tag(tag_id, user_id)
    values(4, 134217732);

