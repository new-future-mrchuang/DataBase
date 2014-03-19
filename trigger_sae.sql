delimiter //;

create trigger add_hits_article after insert
on article_have_tag for each row
begin
    update tag
    set tag.tag_article_hits = tag.tag_article_hits+1
    where tag.tag_id = new.tag_id;
end;//


create trigger sub_hits_article after delete
on article_have_tag for each row
begin
    update tag
    set tag.tag_article_hits = tag.tag_article_hits -1
    where tag.tag_id = old.tag_id;
end;//


create trigger add_hits_circle after insert
on circle_have_tag for each row
begin
    update tag
    set tag.tag_circle_hits = tag.tag_circle_hits+1
    where tag.tag_id = new.tag_id;
end; //


create trigger sub_hits_circle after delete
on circle_have_tag for each row
begin
    update tag
    set tag.tag_circle_hits = tag.tag_circle_hits - 1
    where tag.tag_id = old.tag_id;
end; //


create trigger add_article_collect_number after insert
on collect_article for each row
begin
    update article
    set article.article_collect_number = article.article_collect_number+1
    where article.article_id = new.article_id;
end; //


create trigger sub_article_collect_number after delete
on collect_article for each row
begin
    update article
    set article.article_collect_number = article.article_collect_number-1
    where article.article_id = old.article_id;
end; //


create trigger add_article_focus_number after insert
on focus_on_article for each row
begin
    update article
    set article.article_focus_number = article.article_focus_number+1
    where article.article_id = new.article_id;
end; //


create trigger sub_article_focus_number after delete
on focus_on_article for each row
begin
    update article
    set article.article_focus_number = article.article_focus_number-1
    where article.article_id = old.article_id;
end; //


create trigger add_tag_focus_number after insert
on focus_on_tag for each row
begin
    update tag
    set tag.tag_focus_number = tag.tag_focus_number + 1
    where tag.tag_id = new.tag_id;
end; //


create trigger sub_tag_focus_number after delete
on focus_on_tag for each row
begin
    update tag
    set tag.tag_focus_number = tag.tag_focus_number - 1
    where tag.tag_id = old.tag_id;
end; //


create trigger update_dialog after insert
on message for each row
begin
    set @l=if(new.send_user_id<new.receive_user_id,
              new.send_user_id,new.receive_user_id);
    set @m=if(new.send_user_id>new.receive_user_id,
              new.send_user_id,new.receive_user_id);
              
    insert into dialog(dialog_time,dialog_content,user_id_less,user_id_more)
    value(new.message_time, new.message_content, @l, @m)
    on duplicate key update dialog_time=new.message_time,
        dialog.dialog_content=new.message_content;
end; //

delimiter ;//
