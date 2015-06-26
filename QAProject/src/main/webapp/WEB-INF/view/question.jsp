<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/25/2015
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
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



    <!-- Skins -->
    <link rel="stylesheet" href="/resource/assets/css/skins/skins.css">

    <!-- Responsive Style -->
    <link rel="stylesheet" href="/resource/assets/css/responsive.css">

    <!-- Boostrap Style -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrap.min.css">

    <!-- Boostrap Theme Style -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrap-theme.min.css">

    <!-- Notification Style -->
    <link rel="stylesheet" href="/resource/assets/css/notification.css">

    <!-- Left Notification style -->
    <link rel="stylesheet" href="/resource/assets/css/jquery.growl.css"/>

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">
    <!--TagInput-->
    <link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="/resource/assets/css/tag.css">
    <!-- Main Style -->
    <link rel="stylesheet" href="/resource/assets/css/style.css">
</head>

<body>

<div class="loader">
    <div class="loader_html"></div>
</div>

<div id="wrap">

<div class="panel-pop" id="signup">
    <h2>Register Now<i class="icon-remove"></i></h2>
    <input type="hidden" value="${sessionScope.user.id}" id="userIdFlag">
    <div class="form-style form-style-3">
        <form>
            <div class="form-inputs clearfix">
                <p>
                    <label class="required">Username<span>*</span></label>
                    <input type="text">
                </p>

                <p>
                    <label class="required">E-Mail<span>*</span></label>
                    <input type="email">
                </p>

                <p>
                    <label class="required">Password<span>*</span></label>
                    <input type="password" value="">
                </p>

                <p>
                    <label class="required">Confirm Password<span>*</span></label>
                    <input type="password" value="">
                </p>
            </div>
            <p class="form-submit">
                <input type="submit" value="Signup" class="button color small submit">
            </p>
        </form>
    </div>
</div>
<div class="panel-pop" id="invite-teacher">
    <h2>Invite Teacher<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/teacherInvitation">
            <div id="hiddenTeacher"></div>
            <input type="hidden" name="postId" value="${post.id}">
            <div style="display: flex;">
                <p style="width: 18% !important;margin-top: 3%">
                    <label class="required">Teacher<span>*</span></label>
                </p>
                <div style="width: 82%">
                    <input type="text" name="name" id="teacherSuggest">
                </div>
            </div>
            <p class="form-submit">
                <input type="submit" value="Invite" id="inviteTeacher-click" class="button color small submit">
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div>
<div class="panel-Confirm" id="delete-post">
        <h2>Delete Post</h2>
        <div>
            <p class="panelMessage">Do you want delete this post ?</p>
            <p>
                <input type="submit" value="Cancel"  class="button color small cancel panelButton" >
                <input type="submit" value="OK"  class="button color small OK panelButton" style="margin-left: 3%;">
            </p>
        <div class="clearfix"></div>
    </div>
</div>
<div class="panel-Confirm" id="delete-comment">
    <h2>Delete Comment</h2>
    <div>
        <p class="panelMessage">Do you want delete this Comment ?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelButton" >
            <input type="submit" value="OK"  class="button color small OK panelButton" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>
<!-- End create folder -->

<!-- End signup -->

<div class="panel-pop" id="lost-password">
    <h2>Lost Password<i class="icon-remove"></i></h2>

    <div class="form-style form-style-3">
        <p>Lost your password? Please enter your username and email address. You will receive a link to create a new
            password via email.</p>

        <form>
            <div class="form-inputs clearfix">
                <p>
                    <label class="required">Username<span>*</span></label>
                    <input type="text">
                </p>

                <p>
                    <label class="required">E-Mail<span>*</span></label>
                    <input type="email">
                </p>
            </div>
            <p class="form-submit">
                <input type="submit" value="Reset" class="button color small submit">
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div>
<!-- End lost-password -->


<%@include file="header.jsp" %>

<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Question</h3>
            </div>
        </div>
        <!-- End row -->
    </section>
    <!-- End container -->
</div>
<!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
    <div class="row">
        <div class="col-md-9">
            <article class="question single-question question-type-normal">
                <h2 class="post-title">${post.title}</h2>
                <span class="wantAnswer"><a id="wantNumber">${fn:length(post.wantAnswerPosts)}</a> Want answer(s)</span>
                <c:if test="${wantAnswer!=null && sessionScope.user!=null}">
                <a class="wantAnswer dontWantanswerId" href="#" style="right: 156px;" id="wantAnswer" ><i class="icon-check"></i></a>
                </c:if>
                <input type="hidden" id="wantAnswerId" value="${wantAnswer.id}">
                <c:if test="${wantAnswer==null && sessionScope.user!=null}">
                    <a class="wantAnswer wantAnswerId" href="#" style="right: 156px;" id="wantAnswer" ><i class="icon-check-empty"></i></a>
                </c:if>
                <div class="question-inner" id="prvId">
                    <div class="clearfix"></div>
                    <div class="question-desc">
                        <p>${post.body}</p>
                    </div>
                    <span class="question-date"><i class="icon-time"></i>${post.lastEditedDate}</span>
                    <span class="question-category"><a href="/classroom/${post.ownerClassId.id}"><i
                            class="icon-group"></i>Class: ${post.ownerClassId.classroomName}</a></span>
                    <span class="question-category"><a href="#"><i
                            class="icon-user"></i>Teacher: ${post.ownerClassId.ownerUserId.displayName}</a></span>
                    <span class="question-view"><i class="icon-eye-open"></i>${post.viewer} view(s)</span>
                    <span class="question-tags">
                        <form action="/post/deletePost" method="post" id="deletePostForm" hidden="true"><input type="hidden" name="id" value="${post.id}"></form>
                        <c:if test="${sessionScope.user.id==post.ownerUserId.id or sessionScope.user.id==post.ownerClassId.ownerUserId.id}">
                        <div class="btn-group">
                            <a data-toggle="dropdown" href="" aria-expanded="false"><i class="icon-cog" style="color: black;font-weight: bold;font-size: 20px;"></i><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu" style="left: -127px;">
                                <c:if test="${sessionScope.user.id==post.ownerUserId.id}">
                                    <li><a href="/post/update/${post.id}">Edit</a></li>
                                    <li><a href="#" id="deletePost">Delete</a></li>
                                </c:if>
                                <c:if test="${sessionScope.user.id==post.ownerClassId.ownerUserId.id}">
                                    <c:if test="${post.status!=0}">
                                        <form action="/post/closePost" method="post" id="closeOpenPostForm" hidden="true"><input type="hidden" name="id" value="${post.id}"></form>
                                        <li><a href="#" id="closeOpenPost">Close</a></li>
                                    </c:if>
                                    <c:if test="${post.status==0}">
                                        <form action="/post/openPost" method="post" id="closeOpenPostForm" hidden="true"><input type="hidden" name="id" value="${post.id}"></form>
                                        <li><a href="#" id="closeOpenPost">Open</a></li>
                                    </c:if>
                                </c:if>
                            </ul>
                        </div>
                        </c:if>
                    </span>
                    <div class="clearfix"></div>
                </div>
            </article>

            <%--<div class="share-tags page-content">--%>
                <%--<div class="question-tags"><i class="icon-tags"></i>--%>
                    <%--<c:forEach var="tag" items="${post.tagPostList}">--%>
                        <%--<a href="#">${tag.tagId.tagName},</a>--%>
                    <%--</c:forEach>--%>
                <%--</div>--%>
                <%--<div class="clearfix"></div>--%>
            <%--</div>--%>
            <!-- End share-tags -->
            <c:if test="${post.isComment==1}">
            <div id="respond" class="comment-respond page-content clearfix">
                <div class="boxedtitle page-title"><h2>Leave a reply</h2></div>
                <form action="#" id="commentform" class="comment-form">
                    <div id="form-textarea">
                        <textarea id="question-details" aria-required="true" cols="58" rows="8"></textarea>
                    </div>
                    <p class="form-submit">
                        <input name="submit" type="submit" id="submit" value="Post your answer"
                               class="button small color">
                    </p>
                </form>
            </div>
            </c:if>

            <div id="commentlist" class="page-content">
                <div class="boxedtitle page-title"><h2>Answers ( <span class="color">${fn:length(postAnswers)}</span> )
                </h2></div>
                <ol class="commentlist clearfix" id="commentListDetail">
                    <c:if test="${fn:length(postAnswers) > 10}">
                        <c:forEach var="postAnswer" items="${postAnswers}" end="9">
                            <li class="comment">
                                <div class="comment-body comment-body-answered clearfix">
                                    <div class="avatar"><img alt=""
                                                             src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg">
                                    </div>
                                    <div class="comment-text">
                                        <div class="author clearfix"  style="display: flex">
                                            <div style="width: 30%">
                                                <div class="comment-author"><a href="#">${postAnswer.ownerUserId.displayName}</a>
                                                </div>
                                                <div class="comment-meta">
                                                    <div class="date"><i class="icon-time"></i>${postAnswer.creationDate}</div>
                                                </div>
                                            </div>
                                            <div class="acceptAnswerIcon" id="answerIcon${postAnswer.id}">
                                                <c:if test="${postAnswer.acceptedAnswerId==1}">
                                                    <i class="icon-ok"></i>
                                                </c:if>
                                            </div>
                                                <%--Add javascript to chang "<i class="icon-thumbs-up"></i>Accept" to "Unaccept"--%>
                                            <div style="width: 75%;display: flex">
                                                <div style="width: 100%;float: right;">
                                                    <input type="hidden" name="postAnswerId" value="${postAnswer.id}">
                                                    <c:if test="${postAnswer.acceptedAnswerId !=1 && sessionScope.user.id==post.ownerUserId.id}">
                                                        <a class="button small color acceptAnswer answerFlag" style="float: right" onclick="answerFlag(this)">Accept</a>
                                                    </c:if>
                                                    <c:if test="${postAnswer.acceptedAnswerId==1 && sessionScope.user.id==post.ownerUserId.id}">
                                                        <a class="button small color unacceptAnswer answerFlag" style="float: right" onclick="answerFlag(this)">Unaccept</a>
                                                    </c:if>
                                                </div>
                                                <div style="float: right;margin-left: 2%;">
                                                    <c:if test="${sessionScope.user.id == postAnswer.ownerUserId.id}" >
                                                    <div class="btn-group">
                                                        <a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>
                                                        <ul class="actionAnswer dropdown-menu" role="menu" >
                                                            <li><a href="#" onclick="editAnswer(this);return false;">Edit</a></li>
                                                            <li><a href="#" onclick="deleteAnswer(this);return false;">Delete</a></li>
                                                            <li><a ></a></li>
                                                        </ul>
                                                    </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="textComment"><p class="textBody">${postAnswer.body}</p></div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(postAnswers) <= 10}">
                        <c:forEach var="postAnswer" items="${postAnswers}">
                            <li class="comment">
                                <div class="comment-body comment-body-answered clearfix">
                                    <div class="avatar"><img alt=""
                                                             src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg">
                                    </div>
                                    <div class="comment-text">
                                        <div class="author clearfix"  style="display: flex">
                                            <div style="width: 30%">
                                                <div class="comment-author"><a href="#">${postAnswer.ownerUserId.displayName}</a>
                                                </div>
                                                <div class="comment-meta">
                                                    <div class="date"><i class="icon-time"></i>${postAnswer.creationDate}</div>
                                                </div>
                                            </div>
                                            <div class="acceptAnswerIcon" id="answerIcon${postAnswer.id}">
                                                <c:if test="${postAnswer.acceptedAnswerId==1}">
                                                    <i class="icon-ok"></i>
                                                </c:if>
                                            </div>
                                                <%--Add javascript to chang "<i class="icon-thumbs-up"></i>Accept" to "Unaccept"--%>
                                            <div style="width: 75%;display: flex">
                                                <div style="width: 100%;float: right;">
                                                    <input type="hidden" name="postAnswerId" value="${postAnswer.id}">
                                                    <c:if test="${postAnswer.acceptedAnswerId !=1 && sessionScope.user.id==post.ownerUserId.id}">
                                                        <a class="button small color acceptAnswer answerFlag" style="float: right" onclick="answerFlag(this)">Accept</a>
                                                    </c:if>
                                                    <c:if test="${postAnswer.acceptedAnswerId==1 && sessionScope.user.id==post.ownerUserId.id}">
                                                        <a class="button small color unacceptAnswer answerFlag" style="float: right" onclick="answerFlag(this)">Unaccept</a>
                                                    </c:if>
                                                </div>
                                                <div style="float: right;margin-left: 2%;">
                                                    <c:if test="${sessionScope.user.id == postAnswer.ownerUserId.id}" >
                                                        <div class="btn-group">
                                                            <a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>
                                                            <ul class="actionAnswer dropdown-menu " role="menu" >
                                                                <li><a href="#" onclick="editAnswer(this);return false;">Edit</a></li>
                                                                <li><a onclick="deleteAnswer(this);return false;">Delete</a></li>
                                                                <li><a ></a></li>
                                                            </ul>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="textComment"><p class="textBody">${postAnswer.body}</p></div>
                                    </div>
                                </div>
                            </li>
                    </c:forEach>
                    </c:if>
                </ol>
                <!-- End commentlist -->
            </div>
            <c:if test="${fn:length(postAnswers) > 10}">
            <div><a class="post-read-more button color small" style="margin-bottom: 20px;" id="loadMore">Continue reading</a></div>
            </c:if>
            <!-- End page-content -->

        </div>
        <!-- End main -->
        <aside class="col-md-3 sidebar">

            <div class="widget widget_highest_points">
                <h3 class="widget_title">Question Author</h3>
                <ul>
                    <li>
                        <div class="author-img">
                            <a href="#"><img width="60" height="60"
                                             src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg" alt=""></a>
                        </div>
                        <h6><a href="#">${post.ownerUserId.displayName}</a></h6>
                    </li>
                </ul>
            </div>

            <c:if test="${not empty relatedPosts}">
                <div class="widget">
                    <h3 class="widget_title">Related Questions</h3>
                    <ul class="related-posts">
                        <c:forEach var="relatedPost" items="${relatedPosts}">
                            <li class="related-item">
                                <a href="${relatedPost.id}">${relatedPost.title}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <c:if test="${sessionScope.user.id==post.ownerClassId.ownerUserId.id}">
                <div class="widget">
                    <h3 class="widget_title">Ask Teacher</h3>
                    <a href="" id="InviteTagClick" class="button small color"> Ask Someone</a>
                </div>
            </c:if>

            <div class="widget widget_tag_cloud">
                <h3 class="widget_title">Tags</h3>
                <c:forEach var="tag" items="${post.tagPostList}">
                    <a href="#">${tag.tagId.tagName}</a>
                </c:forEach>
            </div>

        </aside>
        <!-- End sidebar -->
    </div>
    <!-- End row -->
</section>
<!-- End container -->

<%@include file="footer.jsp" %>
</div>
<!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<script src="/resource/assets/ckeditor/ckeditor.js"></script>
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
<script src="/resource/assets/js/stomp.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script src="/resource/assets/js/jquery.growl.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.min.js"></script>
<script src="/resource/assets/js/handlebars-v3.0.3.js"></script>
<script>
    CKEDITOR.replace('question-details');
</script>
<script>
    var page = 2;
    //Create stomp client over sockJS protocol
    var socket = new SockJS("/ws");
    var stompClient = Stomp.over(socket);

    // Callback function to be called when stomp client is connected to server
    var connectCallback = function () {
        stompClient.subscribe('/topic/addPost/${post.id}', post);
    };

    // Callback function to be called when stomp client could not connect to server
    var errorCallback = function (error) {
        alert(error.headers.message);
    };

    function post(post) {
        var post = JSON.parse(post.body);
        var currentCount = $('#countNotifi').html() * 1;
        $('#countNotifi').html(currentCount + 1);
        $('#commentListDetail').prepend('<li class="comment">' +
                '<div class="comment-body clearfix">' +
                '<div class="avatar"><img alt="" src="../ask-me/images/demo/avatar.png"></div>' +
                '<div class="comment-text">' +
                '<div class="author clearfix">' +
                '<div class="comment-author"><a href="#">' + post.ownerId + '</a></div>' +
                '<div class="comment-meta">' +
                '<div class="date"><i class="icon-time"></i>' + post.lastEditedDate + '</div>' +
                '</div>' +
                '</div>' +
                '<div class="text"><p>' + post.body + '</p>' +
                '</div></div></div> </li>');
        MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
        $.growl.notice({
            message: '<div class="activity-item"> <i class="fa fa-heart text-danger"></i> <div class="activity">' + post.ownerId + '<a href="#">Create post</a> in <a href="#">' + post.className + '</a> <span>few seconds ago</span> </div> </div>',
            location: "bl"
        });

    }
    // Connect to server via websocket
    stompClient.connect("guest", "guest", connectCallback, errorCallback);
    function wrap_pop() {
        $(".wrap-pop").click(function () {
            $(".panel-Confirm").animate({"top":"-100%"},500).hide(function () {
                $(this).animate({"top":"-100%"},500);
            });
            $(this).remove();
        });
    }
    var answerFlag = function(e){
        if($(e).hasClass('acceptAnswer')) {
            var acceptAnswer = $(e);
            var unacceptAnswer = $('.unacceptAnswer')
            var idUnaccept = unacceptAnswer.prev('input').val();
            var id =  $(e).prev('input').val();
            var url = "/post/acceptAnswer";
            var acceptAnswerDto = {id: id, idUnaccept: idUnaccept};
            $.ajax({
                type: "POST",
                url: url,
                data : acceptAnswerDto,
                success: function (data) {
                    if(data != "NG" ){
                        var iconDivUn ='#answerIcon'+idUnaccept;
                        $(iconDivUn).empty();
                        $(unacceptAnswer).removeClass('unacceptAnswer')
                        $(unacceptAnswer).addClass('acceptAnswer')
                        $(unacceptAnswer).text('Accept')
                        $(acceptAnswer).removeClass('acceptAnswer')
                        $(acceptAnswer).addClass('unacceptAnswer')
                        var iconDiv ='#answerIcon'+id;
                        $(iconDiv).prepend('<i class="icon-ok"></i>')
                        $(acceptAnswer).text('Unaccept')
                    } else {
                        console.log("Error");
                    }
                }
            });
        } else {
            var acceptAnswer = $(e);
            var id =  $(e).prev('input').val();
            var url = "/post/removeAcceptAnswer/"+id;
            $.ajax({
                type: "POST",
                url: url,
                success: function (data) {
                    if(data != "NG" ){
                        $(acceptAnswer).removeClass('unacceptAnswer')
                        $(acceptAnswer).addClass('acceptAnswer')
                        var iconDiv ='#answerIcon'+id;
                        $(iconDiv).empty();
                        $(acceptAnswer).text('Accept')
                    } else {
                        console.log("Error");
                    }
                }
            });
        }
    };
    var textBody = "";

    var cancelEdit = function(e) {
        var commentEditing = $('#editComment').parents('.comment-text').find('.textComment');
        commentEditing.empty();
        commentEditing.prepend(textBody);
        MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
    }

    var editAnswer = function(e) {
        if(textBody=="") {
            var commentText = $(e).parents('.comment-text').find('.textComment');
            var updateId = $(e).parents('.comment-text').find("[name='postAnswerId']").val();
            var url = "/post/updateAnswer/"+updateId;
            $.ajax({
                type: "GET",
                url: url,
                success: function (data) {
                    if(data != "" ){
                        var editComment = '<textarea id="editComment" aria-required="true" cols="58" rows="8">' + data +'</textarea>' + '<div style="text-align: left;font-size: 12px">Click <a href="#" onclick="cancelEdit(this);return false;">here</a> to cancel</div>'+
                                '<input name="submit" onclick="updateAnswer(this);return false;" value="Update your answer" style="width: 100%;text-align: center"class="button small color">'
                        commentText.empty();
                        commentText.prepend(editComment);
                        CKEDITOR.replace('editComment');
                        textBody = data;
                    } else {
                        console.log("Error");
                    }
                }
            });
            location.href = "#editComment";

        } else {
            var commentEditing = $('#editComment').parents('.comment-text').find('.textComment');
            commentEditing.empty();
            commentEditing.prepend(textBody);
            MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
            var commentText = $(e).parents('.comment-text').find('.textComment');
            var updateId = $(e).parents('.comment-text').find("[name='postAnswerId']").val();
            var url = "/post/updateAnswer/"+updateId;
            $.ajax({
                type: "GET",
                url: url,
                success: function (data) {
                    if(data != "" ){
                        var editComment = '<textarea id="editComment" aria-required="true" cols="58" rows="8">' + data +'</textarea>' + '<div style="text-align: left;font-size: 12px">Click <a href="#" onclick="cancelEdit(this);return false;">here</a> to cancel</div>'+
                                '<input name="submit" onclick="updateAnswer(this);return false;" value="Update your answer" style="width: 100%;text-align: center"class="button small color">'
                        commentText.empty();
                        commentText.prepend(editComment);
                        CKEDITOR.replace('editComment');
                        textBody = data;
                    } else {
                        console.log("Error");
                    }
                }
            });
            location.href = "#editComment";
        }

    }
    var updateAnswer = function(e) {
        var updateId = $(e).parents('.comment-text').find("[name='postAnswerId']").val();
        var updateBody = CKEDITOR.instances['editComment'].getData();
        var url = "/post/updateAnswer"
        var postDto = {'id' : updateId ,'body' : updateBody};
        var textAfterUpdate = '<p>'+ updateBody +'</p>' ;
        $.ajax({
            type: "POST",
            url: url,
            data: postDto,
            success: function (data) {
                if(data != "NG" ){
                    var commentText = $(e).parents('.comment-text').find('.textComment');
                    commentText.empty();
                    commentText.prepend(textAfterUpdate);
                    MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
                    textBody = "";
                } else {
                    console.log("Error");
                }
            }
        });

    }
    var deleteAnswer = function(e) {
        var deleteId = $(e).parents('.comment-text').find("[name='postAnswerId']").val();
        var deleteDiv = $(e).parents('.comment')
        var postDto = {'id' : deleteId };
        var url = '/post/deleteAnswer';
        $(".panel-Confirm").animate({"top":"-100%"},10).hide();
        $("#delete-comment").show().animate({"top":"34%"},500);
        $("body").prepend("<div class='wrap-pop'></div>");
        wrap_pop()
        var flagPanel =  $('.panelButton').click(function(e) {
            if ($(e.currentTarget).hasClass('OK')) {
                $.ajax({
                    type: "POST",
                    url: url,
                    data: postDto,
                    success: function (data) {
                        if(data != "NG" ){
                            deleteDiv.remove();
                            $('#commentListDetail').empty();
                            page = 1;
                            $('#loadMore').click();
                        } else {
                            console.log("Error");
                        }
                    }
                });
                $(".panel-Confirm").animate({"top":"-100%"},500);
                $(".wrap-pop").remove();
            } else {
                $(".panel-Confirm").animate({"top":"-100%"},500);
                $(".wrap-pop").remove();
            }
        })

    }
    $(document).ready(function () {


//        $('.answerFlag').delegate('click',function (e) {
//
//        });

        $('#wantAnswer').click(function (e) {
            if($('#wantAnswer').hasClass('wantAnswerId')) {
            var postId = ${post.id}
            var wantAnswerDto  = {postId: postId};
            var url = "/post/wantAnswer"
                $.ajax({
                type: "POST",
                url: url,
                data: wantAnswerDto,
                success: function (data) {
                    if(data != "NG" ){
                        var number = $('#wantNumber').html();
                        number = number*1+1;
                        $('#wantNumber').html(number);
                        $('#wantAnswer').removeClass('wantAnswerId')
                        $('#wantAnswer').addClass('dontWantanswerId')
                        $('#wantAnswerId').val(data)
                        var icon = $('.icon-check-empty');
                        icon.attr('class', 'icon-check')
                    } else {
                        console.log("Error");
                    }
                }
            });
            } else {
                var id = $('#wantAnswerId').val()
                var url = "/post/dontWantAnswer"
                var wantAnswerDto  = {id: id};
                $.ajax({
                    type: "POST",
                    url: url,
                    data : wantAnswerDto,
                    success: function (data) {
                        if(data == "OK" ){
                            var number = $('#wantNumber').html();
                            number = number*1-1;
                            $('#wantNumber').html(number);
                            $('#wantAnswer').removeClass('dontWantanswerId')
                            $('#wantAnswer').addClass('wantAnswerId')
                            var icon = $('.icon-check');
                            icon.attr('class', 'icon-check-empty')
                        } else {
                            console.log("Error");
                        }
                    }
                });
            }
        });
        $('#loadMore').click(function (e) {
            var url = "/post/view/${post.id}/"+page;
            //comply sequence of function div
            //1(required)
            function getCommentDiv(ownerName,lastEditDate) {
                var commentDiv = '<li class="comment">'+
                        '<div class="comment-body comment-body-answered clearfix">'+
                        '<div class="avatar"><img alt=""'+
                        'src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg">'+
                        '</div>'+
                        '<div class="comment-text">'+
                        '<div class="author clearfix"  style="display: flex">'+
                        '<div style="width: 30%">'+
                        '<div class="comment-author"><a href="#">' + ownerName +'</a>'+
                        '</div>'+
                        '<div class="comment-meta">'+
                        '<div class="date"><i class="icon-time"></i>' + lastEditDate +'</div>' +
                        '</div>' +
                        '</div>' ;
                return commentDiv;
            }
            //2
            function acceptAnswerIconDiv(id) {
                var answerIconDiv = '<div class="acceptAnswerIcon" id="answerIcon' + id +'">'+
                                    '<i class="icon-ok"></i>' +
                                    '</div>' +
                                    '<div style="width: 75%;display: flex">' + '<div style="width: 100%;float: right;">'+
                                    '<input type="hidden" name="postAnswerId" value="' + id +'">' ;
                return answerIconDiv;
            }
            //2 ( required one of acceptAnswerIconDiv or notAcceptAnswerIconDiv)
            function notAcceptAnswerIconDiv(id) {
                var answerIconDiv = '<div class="acceptAnswerIcon" id="answerIcon' + id +'">'+
                        '</div>' +
                        '<div style="width: 75%;display: flex">' + '<div style="width: 100%;float: right;">'+
                        '<input type="hidden" name="postAnswerId" value="' + id +'">' ;
                return answerIconDiv;
            }
            //3 ( optional )
            function unacceptAnswerDiv() {
                return '<a class="button small color unacceptAnswer answerFlag" style="float: right" onclick="answerFlag(this)">Unaccept</a>'
            }
            //3  ( optional )
            function acceptAnswerDiv() {
                return '<a class="button small color acceptAnswer answerFlag" style="float: right" onclick="answerFlag(this)">Accept</a>'
            }
            //Css for comment 4 (required)
            function acceptAnswerAction() {
                var acceptAnswerAction = '</div>' + '</div>' +
                                         '<div style="float: right;margin-left: 2%;">' ;
                return acceptAnswerAction;
            }
            //5 ( optional )
            function postActionUser() {
                var actionPost = '<div class="btn-group">'+
                                 '<a data-toggle="dropdown" href="" aria-expanded="false"><span class="caretBig"></span></a>' +
                                 '<ul class="actionAnswer dropdown-menu" role="menu">' +
                                 '<li><a onclick="editAnswer(this);return false">Edit</a></li>' +
                                 '<li><a onclick="deleteAnswer(this);return false;">Delete</a></li>' +
                                 '</ul>' +
                                 '</div>' ;
                return actionPost;
            }
            //6 (required)
            function answerBody(body) {
                var answerBody = '</div>' +
                                 '</div>' +
                                 '<div class="textComment"><p class="textBody">' + body +'</p>' +
                                 '</div>' +
                                 '</div>' +
                                 '</div>' +
                                 '</li>';
                return answerBody;
            }
            $.ajax({
                type : "GET",
                url : url,
                success : function(data) {
                    var post = new Array();
                    post = data;
                    var postOwnerId = ${post.ownerUserId.id}
                    var userId =$('#userIdFlag').val()
                    var length = post.length;
                    if(length > 10) {
                        length = post.length-1;
                    } else {
                        $('#loadMore').hide();
                    }
                    for(var i = 0 ; i < length ; i++ ) {
                        //if user is Question owner .
                        if(postOwnerId==userId) {
                            // if answer was accepted
                            if(post[i].acceptedAnswerId==1) {
                                //user is post Owner
                                if(userId==post[i].ownerId) {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate) +
                                                    acceptAnswerIconDiv(post[i].id) + unacceptAnswerDiv() +
                                                    acceptAnswerAction() + postActionUser() + answerBody(post[i].body)

                                    $('#commentListDetail').append(divAppend);
                                } else {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate) +
                                            acceptAnswerIconDiv(post[i].id) + unacceptAnswerDiv() +
                                            acceptAnswerAction() + answerBody(post[i].body)
                                    $('#commentListDetail').append(divAppend);
                                }

                            } else {
                                //user is post Owner
                                if(userId==post[i].ownerId) {
                                    var divAppend = getCommentDiv(post[i].ownerName, post[i].lastEditedDate) +
                                            notAcceptAnswerIconDiv(post[i].id) + acceptAnswerDiv() +
                                            acceptAnswerAction() + postActionUser() + answerBody(post[i].body)

                                    $('#commentListDetail').append(divAppend);
                                } else {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate) +
                                            notAcceptAnswerIconDiv(post[i].id) + acceptAnswerDiv() +
                                            acceptAnswerAction() + answerBody(post[i].body)
                                    $('#commentListDetail').append(divAppend);
                                }

                            }

                        } else {
                            // user isn't question owner and this answer was accepted
                            if(post[i].acceptedAnswerId==1) {
                                //user is post Owner
                                if(userId==post[i].ownerId) {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate) +
                                            acceptAnswerIconDiv(post[i].id) +
                                            acceptAnswerAction() + postActionUser() + answerBody(post[i].body)

                                    $('#commentListDetail').append(divAppend);
                                } else {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate) +
                                            acceptAnswerIconDiv(post[i].id)  +
                                            acceptAnswerAction() + answerBody(post[i].body)
                                    $('#commentListDetail').append(divAppend);
                                }
                                // user isn't question owner and this answer wasn't accepted
                            } else {
                                //user is post Owner
                                if(userId==post[i].ownerId) {
                                    var divAppend = getCommentDiv(post[i].ownerName, post[i].lastEditedDate) +
                                            notAcceptAnswerIconDiv(post[i].id) +
                                            acceptAnswerAction() + postActionUser() + answerBody(post[i].body)

                                    $('#commentListDetail').append(divAppend);
                                } else {
                                    var divAppend = getCommentDiv(post[i].ownerName,post[i].lastEditedDate) +
                                            notAcceptAnswerIconDiv(post[i].id) +
                                            acceptAnswerAction() + answerBody(post[i].body)
                                    $('#commentListDetail').append(divAppend);
                                }
                            }
                        }

                    }
                    page++;
                }
            });
        });
        MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
        $('#submit').click(function (e) {
            e.preventDefault();
            var detail = CKEDITOR.instances['question-details'].getData()
            var jsonstr = JSON.stringify({ 'ownerId': '${sessionScope.user.id}', 'body': detail, 'parentId': ${post.id} });
            stompClient.send("/app/addPost", {}, jsonstr);
            $('#commentListDetail').empty();
            page = 1;
            $('#loadMore').click();
            return false;
        });


        $('#deletePost').click(function (e) {
            e.preventDefault();
            $(".panel-Confirm").animate({"top":"-100%"},10).hide();
            $("#delete-post").show().animate({"top":"34%"},500);
            $("body").prepend("<div class='wrap-pop'></div>");
            wrap_pop()
            var flagPanel =  $('.panelButton').click(function(e) {
                if ($(e.currentTarget).hasClass('OK')) {
                    var form = $('#deletePostForm').submit();
                } else {
                    $(".panel-Confirm").animate({"top":"-100%"},500);
                    $(".wrap-pop").remove();
                }
            })
        });
        $('#closeOpenPost').click(function (e) {
            e.preventDefault();
            var form = $('#closeOpenPostForm').submit();
            return false;
        });
        var urlSuggest = 'http://localhost:8080/teacherInvitation/%QUERY/' +${post.id};
        var teacherSuggest = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: urlSuggest
            }
        });
        teacherSuggest.initialize();
        elt = $('#teacherSuggest');
        var hiddenTag = $('#hiddenTeacher');
        elt.tagsinput({
            itemValue: 'id',
            itemText: 'name',
            typeaheadjs: {
                name: 'teacherSuggest',
                displayKey: 'name',
                source: teacherSuggest.ttAdapter(),
                templates: {
                    empty: [
                        '<div class="empty-message">',
                        'unable to find any teacher',
                        '</div>'
                    ].join('\n'),
                    suggestion: Handlebars.compile('<div><span><img src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg" class="author-imgTag"></span> <span style="white-space: nowrap">{{name}}</span></div>')
                }
            }
        });
        elt.on('itemAdded', function (event) {
            var idTag = event.item.id;
            hiddenTag.append("<input type='hidden' name='userId' value=" + idTag + " id=userId" + idTag + ">");
        });
        elt.on('itemRemoved', function (event) {
            var tagId = "#userId" + event.item.id;
            $(tagId).remove();
        });

    });

</script>
<!-- End js -->

</body>
</html>
