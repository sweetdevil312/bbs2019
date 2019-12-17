package service;

import pojo.Reply;

import java.util.List;

public interface ReplyService {

    List<Reply> getRepliesOfTopic(Integer topidId);

    boolean addReply(Reply reply);

    int repliesNum(Integer topicId);

    //删除主题下面的全部回复
    int deleteByTopicId(int id);

    //删除某个回复
    int deleteByPrimaryKey(Long id);
}
