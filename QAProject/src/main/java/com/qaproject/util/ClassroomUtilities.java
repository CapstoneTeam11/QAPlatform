package com.qaproject.util;

import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dao.MaterialDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dto.MaterialDto;
import com.qaproject.dto.PostDto;
import com.qaproject.dto.RequestDto;
import com.qaproject.dto.StudentDto;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.Material;
import com.qaproject.entity.Post;
import com.qaproject.util.ConvertEntityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 6/28/2015.
 */
@Component
public class ClassroomUtilities {
    @Autowired
    PostDao postDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    ClassroomUserDao classroomUserDao;

    public List<PostDto> loadQuestions(Integer classroomId, Integer lastId){
        List<Post> questions = postDao.findQuestionByOwnerClassroom(classroomId,lastId);
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        if (questions!=null) {
            for(Post question: questions){
                if (question !=null) {
                    List<Post> answers = postDao.findRepliesByParentId(question.getId());
                    if (answers!=null) {
                        Integer answerCount = answers.size();
                        PostDto questionDto = ConvertEntityDto.convertPostEntityToDto(question,answerCount);
                        questionDtos.add(questionDto);
                    }
                }

            }
        }
        return questionDtos;
    }

    public List<PostDto> loadArticles(Integer classroomId, Integer lastId){
        List<Post> articles = postDao.findArticleByOwnerClassroom(classroomId, lastId);
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        if (articles!=null) {
            for(Post article: articles){
                if (article !=null) {
                    List<Post> answers = postDao.findRepliesByParentId(article.getId());
                    if (answers!=null) {
                        Integer answerCount = answers.size();
                        PostDto articleDto = ConvertEntityDto.convertPostEntityToDto(article,answerCount);
                        articleDtos.add(articleDto);
                    }

                }

            }
        }
        return articleDtos;
    }

    public List<MaterialDto> loadMaterials(Integer classroomId, Integer lastId) {
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        List<Material> materials = materialDao.findMaterialByClassroom(classroomId,lastId);
        if (materials!=null) {
            for (Material material:materials){
                MaterialDto materialDto = ConvertEntityDto.convertMaterialEntityToDto(material);
                materialDtos.add(materialDto);
            }
        }
        return materialDtos;
    }

    public List<RequestDto> loadRequests(Integer classroomId, Integer lastId) {
        List<RequestDto> requestDtos = new ArrayList<RequestDto>();
        List<ClassroomUser> requests = classroomUserDao.findRequestsByClassroom(classroomId,lastId);
        if (requests!=null){
            for (ClassroomUser request :requests){
                if (request!=null) {
                    RequestDto requestDto = ConvertEntityDto.convertClassroomUserEntityToRequestDto(request);
                    requestDtos.add(requestDto);
                }
            }
        }
        return requestDtos;
    }

    public List<StudentDto> loadStudents(Integer classroomId, Integer lastId) {
        List<StudentDto> studentDtos = new ArrayList<StudentDto>();
        List<ClassroomUser> students = classroomUserDao.findStudentsByClassroom(classroomId, lastId);
        if (students!=null){
            for (ClassroomUser student :students){
                if (student!=null) {
                    StudentDto studentDto = ConvertEntityDto.convertClassroomUserEntityToStudentDto(student);
                    studentDtos.add(studentDto);
                }
            }
        }
        return studentDtos;
    }
}
