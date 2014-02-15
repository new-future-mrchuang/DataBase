-- 改变id的auto_increment开始的数字
ALTER TABLE `user` AUTO_INCREMENT =88 
--或者
create table tb(
    user_id int identity(X,Y),
    user_name char(8)
)
--或者
create table test
(
ID int primary key auto_increment=100,
name varchar(50)
); 


--mysql5 中触发器:
delimiter //;
create trigger add_article_collect_number after insert
on collect_article for each row
begin
    update article
    set article.article_collect_number = article.article_collect_number+1
    where article.article_id = new.article_id
end;//
delimiter ;//

-- !!记得更改user_last_time的默认值,去掉单引号

--嘿嘿
ALTER TABLE `admin`                    AUTO_INCREMENT =  1125899906842625;    -- 1 + 1  * (2^50)
ALTER TABLE `answer`                   AUTO_INCREMENT =  2251799813685249;    -- 1 + 2  * (2^50)
ALTER TABLE `article`                  AUTO_INCREMENT =  3377699720527873;    -- 1 + 3  * (2^50)
ALTER TABLE `block`                    AUTO_INCREMENT =  4503599627370497;    -- 1 + 4  * (2^50)
ALTER TABLE `category`                 AUTO_INCREMENT =  5629499534213121;    -- 1 + 5  * (2^50)
ALTER TABLE `circle`                   AUTO_INCREMENT =  6755399441055745;    -- 1 + 6  * (2^50)
ALTER TABLE `comment`                  AUTO_INCREMENT =  7881299347898369;    -- 1 + 7  * (2^50)
ALTER TABLE `config`                   AUTO_INCREMENT =  9007199254740993;    -- 1 + 8  * (2^50)
ALTER TABLE `dialog`                   AUTO_INCREMENT = 10133099161583617;    -- 1 + 9  * (2^50)
ALTER TABLE `dynamic`                  AUTO_INCREMENT = 11258999068426241;    -- 1 + 10 * (2^50)
ALTER TABLE `improvement`              AUTO_INCREMENT = 12384898975268865;    -- 1 + 11 * (2^50)
ALTER TABLE `message`                  AUTO_INCREMENT = 13510798882111489;    -- 1 + 12 * (2^50)
ALTER TABLE `notice`                   AUTO_INCREMENT = 14636698788954113;    -- 1 + 13 * (2^50)
ALTER TABLE `organization`             AUTO_INCREMENT = 15762598695796737;    -- 1 + 14 * (2^50)
ALTER TABLE `policy`                   AUTO_INCREMENT = 16888498602639361;    -- 1 + 15 * (2^50)
ALTER TABLE `post`                     AUTO_INCREMENT = 18014398509481985;    -- 1 + 16 * (2^50)
ALTER TABLE `project`                  AUTO_INCREMENT = 19140298416324609;    -- 1 + 17 * (2^50)
ALTER TABLE `question`                 AUTO_INCREMENT = 20266198323167233;    -- 1 + 18 * (2^50)
ALTER TABLE `tag`                      AUTO_INCREMENT = 21392098230009857;    -- 1 + 19 * (2^50)
--  AUTO_INCREMENT = 22517998136852481;    -- 1 + 20 * (2^50)
--  AUTO_INCREMENT = 23643898043695105;    -- 1 + 21 * (2^50)
--  AUTO_INCREMENT = 24769797950537729;    -- 1 + 22 * (2^50)
--  AUTO_INCREMENT = 25895697857380353;    -- 1 + 23 * (2^50)
--  AUTO_INCREMENT = 27021597764222977;    -- 1 + 24 * (2^50)
--  AUTO_INCREMENT = 28147497671065601;    -- 1 + 25 * (2^50)
--  AUTO_INCREMENT = 29273397577908225;    -- 1 + 26 * (2^50)
--  AUTO_INCREMENT = 30399297484750849;    -- 1 + 27 * (2^50)
--  AUTO_INCREMENT = 31525197391593473;    -- 1 + 28 * (2^50)
--  AUTO_INCREMENT = 32651097298436097;    -- 1 + 29 * (2^50)
--  AUTO_INCREMENT = 33776997205278721;    -- 1 + 30 * (2^50)
--  AUTO_INCREMENT = 34902897112121345;    -- 1 + 31 * (2^50)
--  AUTO_INCREMENT = 36028797018963969;    -- 1 + 32 * (2^50) 