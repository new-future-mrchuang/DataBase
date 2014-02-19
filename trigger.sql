delimiter //;

create trigger add_article_collect_number after insert
on collect_article for each row
begin
    update article
    set article.article_collect_number = article.article_collect_number+1
    where article.article_id = new.article_id
end;//


create trigger sub_article_collect_number after delete
on collect_article for each row
begin
    update article
    set article.article_collect_number = article.article_collect_number-1
    where article.article_id = old.article_id
end;//


create trigger add_article_focus_number after insert
on focus_on_article for each row
begin
    update article
    set article.article_focus_number = article.article_focus_number+1
    where article.article_id = new.article_id
end;//


create trigger sub_article_focus_number after delete
on focus_on_article for each row
begin
    update article
    set article.article_focus_number = article.article_focus_number-1
    where article.article_id = old.article_id
end;//


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
        dialog.dialog_content=new.message_content
end;//

delimiter ;//