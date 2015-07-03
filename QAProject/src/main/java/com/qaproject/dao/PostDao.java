package com.qaproject.dao;

import com.qaproject.dto.PostDto;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.Post;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface PostDao {
    List<Post> findAll();
    public Post find(Integer id);
    public List<Post> findPostChilds(Integer id,Integer page);
    public List<Post> findQuestionsByOwnerUser(User ownerUser);
    public List<Post> findArticlesByOwnerUser(User ownerUser);
    public List<Post> findRepliesByParentId(Integer parentId);
    public List<Post> findRepliesWasAcceptedByParentId(Integer parentId);
    public List<Post> findQuestionByOwnerClassroom(Classroom ownerClassroom);
    public List<Post> findQuestionByOwnerClassroom(Integer classroomId, Integer lastId);
    public List<Post> findArticleByOwnerClassroom(Integer classroomId, Integer lastId);
    public List<Post> findArticleByCategory(Integer categoryId, Integer nextFrom);
    public List<Post> findQuestionsByOwnerUser(Integer ownerUserId, Integer lastId);
    public List<Post> findArticlesByOwnerUser(Integer ownerUserId, Integer lastId);
    public List<PostDto> loadMoreAnswer(Integer id,Integer page);
    public Post findLastCreatedPostByOwner(User ownerUser);
    public Post findLastCreatedReplyByOwner(User ownerUser);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Post entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Post entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Post entity);
}
