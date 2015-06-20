<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/21/2015
  Time: 8:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>Ask me – Responsive Questions and Answers Template</title>
    <meta name="description" content="Ask me Responsive Questions and Answers Template">
    <meta name="author" content="2code.info">



    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Main Style -->
    <link rel="stylesheet" href="/resource/assets/css/style.css">

    <!-- Skins -->
    <link rel="stylesheet" href="/resource/assets/css/skins/skins.css">

    <!-- Responsive Style -->
    <link rel="stylesheet" href="/resource/assets/css/responsive.css">

    <!-- Boostrap Style -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrap.min.css">

    <!-- Notification Style -->
    <link rel="stylesheet" href="/resource/assets/css/notification.css">

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">
    <!--TagInput-->
    <link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="/resource/assets/css/tag.css">
</head>

<body>

<div class="loader"><div class="loader_html"></div></div>

<div id="wrap">

<div class="panel-pop" id="addMaterial">
    <h2>Upload Material<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/upload" enctype="multipart/form-data">
            <div class="form-inputs clearfix">
                <p>
                    <input type="file" name="fileUpload" size="50">
                </p>
            </div>
            <p class="form-submit">
                <c:if test="${classroom.status == 1}">
                    <input type="submit" value="Upload" class="button color small submit">
                </c:if>
                <input type="hidden" name="classId" value="1">
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End upload material -->

<div class="panel-pop" id="add-to-folder">
    <h2>Add to folder<i class="icon-remove"></i></h2>
    <div style="height: auto; max-height: 300px; overflow-x: hidden;">

            <a href="/library/add/1/4" class="list-group-item">
                <h4 class="list-group-item-heading">Java </h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">C# </h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Document 4</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Piture 5</h4>
            </a>

        </div>
    </div><!-- End add to folder -->



<%@include file="header.jsp" %>

<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>${classroom.classroomName}</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
<div class="row">
<div class="col-md-9">
    <div class="clearfix"></div>
    <div class="row">
    <div class="col-md-6 col-sm-6">
        <input type="text" aria-required="true" value="Search in ${classroom.classroomName} class" onfocus="if(this.value=='Search in ${classroom.classroomName} class')this.value='';"
               onblur="if(this.value=='')this.value='Search in ${classroom.classroomName} class';" style="width: 100%">
    </div>
    <div class="col-md-6 col-sm-6">
        <div class="col-md-11 col-sm-9" id="createPost">
            <c:if test="${classroom.status == 1}">
                <a href="/post/create/${classroom.id}" class="button medium green-button" style="float: right"><i class="icon-pencil"></i> Create post</a>
            </c:if>

        </div>
        <div class="" style="margin-top: 20px">
            <c:if test="${userOwner.id == user.id}">
                <div class="btn-group">
                    <a data-toggle="dropdown" href="" aria-expanded="false"><i class="icon-cog" style="color: black;font-weight: bold;font-size: 20px;"></i><span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu" style="left: -127px;" id="activeBtn">
                        <c:if test="${classroom.status == 1}">
                            <li><a href="javascript:closeClass(${classroom.id}, 0);">Close class</a></li>
                        </c:if>
                        <c:if test="${classroom.status == 0}">
                            <li><a href="javascript:closeClass(${classroom.id}, 1);">Reopen class</a></li>
                        </c:if>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>

    </div>


<div class="tabs-warp question-tab">
<ul class="tabs">
    <li class="tab"><a href="#" class="current">Question</a></li>
    <li class="tab"><a href="#">Article</a></li>
    <li class="tab"><a href="#">Material</a></li>
    <li class="tab"><a href="#">Join Request</a></li>
    <li class="tab"><a href="#">Student</a></li>
</ul>

<div class="tab-inner-warp">
    <div class="tab-inner">
        <c:if test="${not empty questions}">
            <c:forEach var="question" items="${questions}">
                    <article class="question question-type-normal">
                        <h2>
                            <a href="/post/view/${question.id}">${question.title}</a>
                        </h2>
                        <div class="question-author">
                            <a href="/profile/view/${question.ownerUserId.id}" original-title="${question.ownerUserId.displayName}" class="question-author-img tooltip-n"><span></span><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/avatar.png"></a>
                        </div>
                        <div class="question-inner">
                            <div class="clearfix"></div>
                            <div class="question-desc short-text">${question.body}</div>
                            <div class="question-details">
                                <span class="question-answered question-answered-done">
                                    <c:if test="${question.acceptedAnswerId} != null">
                                        <i class="icon-ok"></i>Resolved
                                    </c:if>
                                </span>
                            </div>
                            <span class="question-date"><i class="icon-time"></i>${question.lastEditedDate}</span>
                            <span class="question-category"><a href="#"><i class="icon-group"></i>Class: ${question.ownerClassId.classroomName}</a></span>
                            <span class="question-comment"><a href="#"><i class="icon-comment"></i>${question.replyCount} Answer(s)</a></span>
                            <div class="clearfix"></div>
                        </div>
                    </article>
            </c:forEach>
            <a href="#" class="post-read-more button color small" style="margin-bottom: 20px;">Continue reading</a>
        </c:if>
    </div>
</div>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <c:if test="${not empty articles}">
            <c:forEach var="article" items="${articles}">
                <article class="post clearfix">
                    <div class="post-inner">
                        <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="/post/view/${article.id}">${article.title}</a></h2>
                        <div class="post-meta">
                            <span class="meta-author"><i class="icon-user"></i><a href="#">Author: ${article.ownerUserId.displayName}</a></span>
                            <span class="meta-date"><i class="icon-time"></i>${article.lastEditedDate}</span>
                            <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">${article.replyCount} comment(s)</a></span>
                            <span class="question-category"><a href="/classroom/${article.ownerClassId.id}"><i class="icon-group"></i>Class: ${article.ownerClassId.classroomName}</a></span>
                        </div>
                        <div class="post-content short-text">
                            <p>${article.body}</p>
                        </div><!-- End post-content -->
                    </div><!-- End post-inner -->
                </article>
            </c:forEach>
            <a href="#" class="post-read-more button color small" style="margin-bottom: 5px;">Continue reading</a>
        </c:if>
    </div>
</div>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <div class="col-md-3 col-sm-6" style="float: right">
            <c:if test="${classroom.status == 1}">
                <a href="#" class="button medium green-button" style="float: right;margin-top: -25px;margin-right: -10px;" id="addMaterial-click"><i class="icon-upload"></i> Upload</a>
            </c:if>
        </div>
        <table class="table table-hover">
            <tr>
                <th>No</th>
                <th>File name</th>
                <th>Uploaded Date</th>
                <th>File size</th>
                <th>Save to</th>
            </tr>
            <c:forEach var="material" items="${materials}" varStatus="counter">
                <tr>
                    <td>${counter.count}</td>
                    <td>${material.name}</td>
                    <td>${material.creationDate}</td>
                    <td>${material.size}</td>
                    <td><a id="add-to-folder-click" href="#">Folder</a> / <a href="/download/${material.id}"> Computer</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <c:if test="${not empty joinRequests}">
            <c:set var="total" value="${fn:length(joinRequests)}" />

            <c:forEach var="joinRequest" items="${joinRequests}" varStatus="counter">
                <c:if test="${counter.count <2}">
                    <form id="acceptForm${joinRequest.id}" method="post" action="/acceptRequest">
                        <input type="hidden" name="requestId" id ="requestId${joinRequest.id}"  value="${joinRequest.id}"/>
                        <input type="hidden" name="ownerClassroomId" id="ownerClassroomId${joinRequest.id}" value="${classroom.ownerUserId.id}"/>
                        <input type="hidden" name="currentClassroomId" id="currentClassroomId${joinRequest.id}" value="${classroom.id}"/>
                        <div class="about-author clearfix">
                            <div class="author-image">
                                <a href="#" original-title="${joinRequest.userId.displayName}" class="tooltip-n"><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></a>
                            </div>
                            <c:if test="${user.roleId.id==2}">
                                <a class="" href="#" onclick="javascript:ignoreRequest('acceptForm${joinRequest.id}', ${joinRequest.id});" style="float: right">Ignore</a>
                                <a class="" href="#" onclick="javascript:acceptRequest('acceptForm${joinRequest.id}', ${joinRequest.userId.id}, ${joinRequest.id});" style="float: right; margin-right: 15px">Confirm</a>
                            </c:if>
                            <div class="author-bio">
                            <h4><a href="#">${joinRequest.userId.displayName}</a></h4>
                            Requested to join <a href="/classroom/${classroom.id}" style="font-size: 15px">${classroom.classroomName}</a>
                            </div>
                        </div>
                    </form>
                </c:if>
            </c:forEach>
            <c:if test="${total >15}">
                <a href="javascript:loadMoreRequest()" class="load-questions-1"><i class="icon-refresh"></i>View more request</a>
            </c:if>
        </c:if>
    </div>
</div>
    <div class="tab-inner-warp" id="studentTag">
        <div class="tab-inner">
            <c:if test="${not empty students}">
                <c:set var="total" value="${fn:length(students)}" />
                <c:forEach var="student" items="${students}" varStatus="counter">
                    <c:if test="${counter.count <2}">
                        <div class="about-author clearfix" id="student${student.userId.id}">
                            <div class="author-image">
                                <a href="#" original-title="" class="tooltip-n"><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></a>
                            </div>
                            <c:if test="${classroom.status == 1}">
                                <a class="removeBtn" href="javascript:removeStudent(${student.userId.id});" style="float: right">Remove</a>
                            </c:if>
                            <div class="author-bio" style="margin-top: 25px">
                                <h4><a href="#">${student.userId.displayName}</a></h4>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <c:if test="${total >15}">
                    <a href="javascript:loadMoreStudent(${classroom.id});" class="load-questions"><i class="icon-refresh"></i>View more students</a>
                </c:if>
            </c:if>

        </div>
        <div class="tab-inner">
            <c:if test="${empty students}">
                <div class="about-author clearfix" id="no-student">
                    No student yet!
                </div>
            </c:if>
        </div>
    </div>
</div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget">
        <h3 class="widget_title">About class</h3>
        <ul class="related-posts">
            <li class="related-item">
                <p>${classroom.classroomDescription}</p>
                <div class="clear"></div><span>Feb 22, 2014</span>
            </li>
        </ul>
        <c:if test="${user.roleId.id==1}">
            <c:if test="${classroom.status == 1}">
                <c:if test="${empty checkClassroomUser || checkClassroomUser.approval == 2}">
                    <p id="link-btn"></p><a href="javascript:joinClass(${classroom.id})" class="button small color" id="join">Join</a></p>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 0 && checkClassroomUser.type == 1}">
                    <a href="#" class="button small color" id="join">Request Send</a>
                    <%--<a href="javascript:handleClass('${classroom.id}', 1)" class="button small color" id="join">Cancel Request</a>--%>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 0 && checkClassroomUser.type == 2}">
                    <p id="link-btn"><a href="javascript:handleClass('${classroom.id}', 2)" class="button small color" id="join">Accept Invitation</a></p>
                </c:if>
                <c:if test="${checkClassroomUser.approval == 1}">
                    <p id="link-btn"><a href="javascript:handleClass(${classroom.id}, 3)" class="button small color" id="join">Leave</a></p>
                </c:if>
            </c:if>
        </c:if>
    </div>
    <c:if test="${user.roleId.id==2}">
        <c:if test="${classroom.status == 1}">
            <div class="widget widget_login" style="  min-height: 130px;">
                <h3 class="widget_title">Invite student</h3>
                <div class="pull-right" style="width: 100%;">
                    <a href="#" id="create-folder-click" class="button medium color" style="width: 100%;text-align: center;"><i class="icon-plus-sign"></i> Invite</a>
                </div>
            </div>
        </c:if>
    </c:if>
    <div class="widget widget_highest_points">
        <h3 class="widget_title">Class Owner</h3>
        <ul>
            <li>
                <div class="author-img">
                    <a href="#"><img width="60" height="60" src="${userOwner.profileImageURL}" alt=""></a>
                </div>
                <h6><a href="#">${userOwner.displayName}</a></h6>
                <span class="comment">${userOwner.aboutMe}</span>
            </li>
        </ul>
    </div>

</aside><!-- End sidebar -->
</div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>
<div class="panel-pop" id="create-folder">
    <h2>Invite student join to class<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/folder/create">
            <div class="form-inputs clearfix">
                <div style="display: flex;height: 42px;">
                    <p style="width: 18% !important;">
                        <label class="required">Student<span>*</span></label>
                    </p>
                    <div style="width: 82%">
                        <input type="text" class="input" name="tag" id="tagsuggest1"/>
                    </div>
                    <div id="hiddenTag1"></div>
                </div>
            </div>
            <p class="form-submit">
                <a href="javascript:inviteStudent(${classroom.id})" class="button color small submit">Invite</a>
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End create folder -->
<!-- js -->
<script src="/resource/assets/js/jquery.min.js"></script>
<script src="/resource/assets/js/bootstrap.min.js"></script>
<script src="/resource/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/resource/assets/js/jquery.easing.1.3.min.js"></script>
<script src="/resource/assets/js/html5.js"></script>
<script src="/resource/assets/js/twitter/jquery.tweet.js"></script>
<script src="/resource/assets/js/jflickrfeed.min.js"></script>
<script src="/resource/assets/js/jquery.inview.min.js"></script>
<script src="/resource/assets/js/jquery.tipsy.js"></script>
<script src="/resource/assets/js/tabs.js"></script>
<script src="/resource/assets/js/jquery.flexslider.js"></script>
<script src="/resource/assets/js/jquery.prettyPhoto.js"></script>
<script src="/resource/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script src="/resource/assets/js/jquery.scrollTo.js"></script>
<script src="/resource/assets/js/jquery.nav.js"></script>
<script src="/resource/assets/js/tags.js"></script>
<script src="/resource/assets/js/jquery.bxslider.min.js"></script>
<script src="/resource/assets/js/custom.js"></script>
<script src="/resource/assets/js/jquery.toastmessage.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>

<!-- End js -->
<script>
    var studentNameList = [];
    $(document).ready(function () {
        var student = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: 'http://localhost:8080/findAllStudentNotInClass/${classroom.id}/%QUERY'
            }
        });
        student.initialize();
        var elt1 = $('#tagsuggest1');
        var hiddenTag = $('#hiddenTag1');
        elt1.tagsinput({
            itemValue: 'studentId',
            itemText: 'studentName',
            typeaheadjs: {
                name: 'student',
                displayKey: 'studentName',
                source: student.ttAdapter()
            }
        });
        elt1.on('itemAdded', function (event) {
            var studentId = event.item.id;
            hiddenTag.append("<input type='hidden' name='tagId' value=" + studentId + " id=tag" + studentId + ">");
        });
        elt1.on('itemRemoved', function (event) {
            var tagId = "#tag" + event.item.id;
            $(tagId).remove();
        });

        /*short test for list of posts - MinhKH*/
        $(".short-text").each(function () {
            text = $(this).text();
            if (text.length > 400) {
                $(this).html(text.substr(0, 400) + '.......');
            }
        });
    });
    function joinClass(id){
        var url = "/requestJoinClass/"+id;
        $.ajax({
            type: "GET",
            url: url,
//            data: "username="+username+"&password="+password,
            success: function(data){
                if(data == "OK"){
                    $("#join").text("Request sent!").attr("href", "#");
//                    $().toastmessage('showSuccessToast', 'Join class request sent!');
                }else{
                    $().toastmessage('showErrorToast', "Join class request fail! Please try again late!");
                }

            }
        });
    }
    function inviteStudent(id){
        var url = "/inviteJoinClass/"+id;
        var name = $("#tagsuggest1").val();
        $.ajax({
            type: "POST",
            url: url,
            data: "studentName="+name,
            success: function(data){
//                if(data == "OK"){
//                    $().toastmessage('showSuccessToast', 'Invatition Sent!');
//                }else{
//                    $().toastmessage('showErrorToast', "Invatition Fails!");
//                }
            }
        });
    }
    function getStudentList(id){
        var url = "/findAllStudentNotInClass/"+id;
        $.ajax({
            type: "POST",
            url: url,
//            data: "studentName="+name,
            success: function(data, callback){
                if(data != null && data.length >0){
                    makeTag(data)
                }else{
                    $().toastmessage('showErrorToast', "Get student name fail! Please try again late!");
                }
            }
        });
    }
    function acceptRequest(el, studentId, requestId){
        var url = "/acceptRequest";
        var id = $("#requestId"+requestId).val();
        var ownerClassroomId = $("#ownerClassroomId"+requestId).val();
        var currentClassroomId = $("#currentClassroomId"+requestId).val();
        $.ajax({
            type: "POST",
            url: url,
            data: "requestId="+id+"&ownerClassroomId="+ownerClassroomId+"&currentClassroomId="+currentClassroomId,
            success: function(data){
                if(data != null && data.status == "OK"){
                    $("#"+el).remove();
                    reloadStudent(studentId);
                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }
    function ignoreRequest(el, requestId){
        var url = "/ignoreRequest";
        var id = $("#requestId"+requestId).val();
        var ownerClassroomId = $("#ownerClassroomId"+requestId).val();
        var currentClassroomId = $("#currentClassroomId"+requestId).val();
        $.ajax({
            type: "POST",
            url: url,
            data: "requestId="+id+"&ownerClassroomId="+ownerClassroomId+"&currentClassroomId="+currentClassroomId,
            success: function(data){
                if(data != null && data.status == "OK"){
                    $("#"+el).remove();

                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }
    function reloadStudent(studentId, requestId){
        var url = "/getUserById";
        $.ajax({
            type: "POST",
            url: url,
            data: "id="+studentId,
            success: function(data){
                if(data != null){
                    var  html ="<div class='about-author clearfix' id='student"+studentId+"'>"+
                            "<div class='author-image'>"+
                            "<a href='#' original-title='' class='tooltip-n'><img alt='' src='http://2code.info/demo/html/ask-me/images/demo/admin.jpeg'></a>"+
                            "</div><a class='' href='javascript:removeStudent("+ studentId +")' style='float: right'>Remove</a><div class='author-bio' style='margin-top: 25px'>"+
                            "<h4><a href='#'>"+data.studentName+"</a></h4></div></div>";
                    var location = $("#studentTag").find('.about-author').last();

                    $(html).insertAfter(location);
                    $("#no-student").remove();
                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }
    function removeStudent(studentId){
        var url = "/removeStudent";
        var classId = ${classroom.id};
        var ownerId = ${classroom.ownerUserId.id}
        $.ajax({
            type: "POST",
            url: url,
            data: "studentId="+studentId +"&classId="+classId+"&ownerId="+ownerId,
            success: function(data){
                if(data != null && data.status == "OK"){
                    $("#student"+studentId).remove();

                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }
    function handleClass(id, type){
        var url = "/handleClass";
        $.ajax({
            type: "POST",
            url: url,
            data: "classId="+id +"&type="+ type,
            success: function(data){
                if(data != null && data.status == "OK"){
                    if(type == 3){
                        var btn = "<a href='javascript:joinClass(${classroom.id})' class='button small color' id='join'>Join</a>";
                        $("#link-btn").html(btn);
                    }else if(type==2){
                        var btn = "<a href='javascript:handleClass('${classroom.id}', 3)' class='button small color' id='join'>Leave</a>";
                        $("#link-btn").html(btn);
                    }

                }else if(data != null && data.status == "NG" && data.id == 0){
                    window.location.href="/";
                }else if(data != null && data.status == "NG" && data.id != 0){
                    window.location.href="/classroom/"+data.id;
                }
            }
        });
    }
    function closeClass(classId, type) {
        var url = "/openCloseClass";
        $.ajax({
            type: "POST",
            url: url,
            data: "classId=" + classId+"&type="+ type,
            success: function (data) {
                if (data != null && data.status == "OK") {
                    <%--var createPost = "<a href='/post/create/${classroom.id}' class='button medium green-button' style='float: right'><i class='icon-pencil'></i> Create post</a>";--%>
                    <%--$("#createPost").html(createPost);--%>
                    <%----%>
                    window.location.href = "/classroom/" + data.id;
                } else if (data != null && data.status == "NG" && data.id == 0) {
                    window.location.href = "/";
                } else if (data != null && data.status == "NG" && data.id != 0) {
                    window.location.href = "/classroom/" + data.id;
                }
            }
        });
    }
    function loadMoreStudent(classroomId){
    var url = "/classroom/loadMoreStudent/"+classroomId;
    $.ajax({
        type: "POST",
        url: url,
//        data: "classId=" + classId+"&type="+ type,
        success: function (data) {
            if (data != null) {
                for( i = 0; i< data.length; i++){
                    var html1 = $($("#studentTag").find(".tab-inner")[0]).clone();
                    html1.find(".load-questions").remove();
//                    html.find(".about-author").attr("id", "student"+data[i].studentId);
//                    html.find(".removeBtn").attr("href", "javascript:removeStudent("+data[i].studentId+")");
//                    html.find(".author-bio").html("<h4><a href='#'>"+data[i].studentName+"</a></h4>");

                    var  html ="<div class='about-author clearfix' id='student"+data[i].studentId+"'>"+
                            "<div class='author-image'>"+
                            "<a href='#' original-title='' class='tooltip-n'><img alt='' src='http://2code.info/demo/html/ask-me/images/demo/admin.jpeg'></a>"+
                            "</div><a class='' href='javascript:removeStudent("+ data[i].studentId+")' style='float: right'>Remove</a><div class='author-bio' style='margin-top: 25px'>"+
                            "<h4><a href='#'>"+data[i].studentName+"</a></h4></div></div>";
                    if(i==0){
                        $("#studentTag").html("");
                    }
                    $("#studentTag").append($(html));
                }
            } else if (data != null && data.status == "NG" && data.id == 0) {
                window.location.href = "/";
            } else if (data != null && data.status == "NG" && data.id != 0) {
                window.location.href = "/classroom/" + data.id;
            }
        }
    });
}

</script>
</body>
</html>