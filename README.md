## 闯先生数据库模型   
=======================================================
### 目前版本状态
目前是一个初期来说比较完整的模型了.   
如果要测试,请使用utf8_general_ci编码.随后按顺序导入crebas.sql和trigger.sql,最后是init.sql.
其他详情请烦见cdm和pdm.   

----------------------------------------   
### 简单说明
这次的模型采用了继承层次进行设计,项目政策等类似的表都通过继承"文章"来实现.  
具体来说,"文章"中有一些文章共有的属性,然后子表(项目政策等)只包含特有属性,两者通过article_id联系  
文章的子表有:项目project,政策policy,完善improvement,问题question,回答answer,圈子中的帖子post   
组织和用户的关系也类似,组织是用户的子表(因为组织支持所有用户操作,所以设计成子表比较方便)  
组织特有的东西在organization表中.     个人用户的信息全部存放在user表中,但是组织用户的信息存放在user和organization两张表中   
模型能够将所有东西的id进行区分,每条记录对应唯一id,具体请参见crebas.sql末尾

========================================================
### 每张表说明
- admin                     后台管理员表,id从
- answer                    回答,文章的一种,每个回答都与一个问题相对应
- article                   文章(项目政策问题回答完善帖子的父表),用户可以对所有文章进行:赞踩举报发表收藏关注
- article_have_tag          记录文章有哪些标签
- belong_to_circle          记录用户属于什么圈子,其中字段含义请见注释
- belong_to_organization    记录用户属于什么组织.待申请状态类似上一条
- block                     黑名单,记录了哪个用户屏蔽了谁
- category                  组织的类别,包含了权限和简介
- circle                    圈子,包含了人数上限
- collect_article           收藏文章(收藏项目政策啥的都在这个里面了)
- comment                   评论
- config                    系统设置
- dialog                    应闪闪学长要求设计的,内容是对话双方id和最新时间内容,message表变动时对本表有触发器
- down_article              对文章点踩
- down_comment              对评论点踩
- dynamic                   记录动态的表
- focus_on_article          记录谁关注了哪篇文章.
- focus_on_user             记录谁关注了谁.
- focus_on_tag              记录谁关注了什么标签.
- improvement               完善,每个完善对应一个项目
- message                   私信,其中的有效位用于屏蔽
- notice                    系统消息(系统提醒),系统发给用户的提醒
- organization              组织,是用户的子类表,customize是增值服务部分,这部分注释比较清楚了
- policy                    政策,没啥说的
- post                      指的是帖子(圈子中的文章),类型字段用于标识是活动还是群聊还是纯粹的帖子
- project                   项目,有访问量的记录,有头像,记录了属于哪个组织.
- question                  问题
- report_article            举报文章,参照知乎的举报进行设计,当类型为其他时,用户可以自行填写举报内容
- report_comment            举报评论,参上一条解释
- tag                       标签
- up_article                用户对文章点赞的记录
- up_comment                用户对评论点赞的记录
- user                      用户,目前没有加入个人用户的详细信息

### 每个触发器的说明
- add_article_collect_number(sub_article_collect_number)
  每次用户收藏(取消收藏)了一篇文章,就给这个文章的总收藏数加一(减一)
- add_article_down_number(sub_article_down_number)
  每次用户踩)取消踩了一篇文章,就给这个文章的总踩数加一(减一)
- 余下类似,我就不一一解释了,都是以此类推,除了:
- update_dialog
  每次有新的私信就更新或者插入dialog表相关的记录
  