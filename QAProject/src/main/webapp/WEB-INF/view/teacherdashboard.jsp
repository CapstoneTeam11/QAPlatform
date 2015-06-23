<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/26/2015
  Time: 8:34 AM
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

    <!-- Main Style -->
    <link rel="stylesheet" href="/resource/assets/css/style.css">

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

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">

</head>

<body>

<div class="loader"><div class="loader_html"></div></div>

<div id="wrap">

<div class="panel-pop" id="signup">
    <h2>Register Now<i class="icon-remove"></i></h2>
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
</div><!-- End signup -->

<div class="panel-pop" id="lost-password">
    <h2>Lost Password<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <p>Lost your password? Please enter your username and email address. You will receive a link to create a new password via email.</p>
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
</div><!-- End lost-password -->


<%@include file="header.jsp" %>

<div class="breadcrumbs">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Teacher dashboard</h3>
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
        <input type="text" aria-required="true" value="Search in your dashboard" onfocus="if(this.value=='Search in your dashboard')this.value='';"
               onblur="if(this.value=='')this.value='Search in your dashboard';" style="width: 100%">
    </div>
    <div class="col-md-6 col-sm-6">
            <a href="/createClass" class="button medium green-button" style="float: right"><i class="icon-group"></i> Create class</a>
    </div>
</div>

<div class="tabs-warp question-tab">
<ul class="tabs">
    <li class="tab"><a href="#" class="current">Your Classrooms</a></li>
    <li class="tab"><a href="#">Followed Teachers</a></li>
    <li class="tab"><a href="#">Invitations</a></li>
</ul>
<div class="tab-inner-warp">
        <div class="tab-inner" id="ownedClassrooms">
            <c:if test="${not empty ownedClassrooms}">
                <c:if test="${fn:length(ownedClassrooms)>10}">
                    <c:forEach var="ownedClassroom" items="${ownedClassrooms}" end="9">
                        <div class="about-author clearfix">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>
                            </div>
                            <a class="" href="#" style="float: right">Close class</a>
                            <div class="author-bio">
                                <h4><a href="/classroom/${ownedClassroom.id}">${ownedClassroom.classroomName}</a></h4>
                                    ${ownedClassroom.classroomDescription}
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(ownedClassrooms)<=10}">
                    <c:forEach var="ownedClassroom" items="${ownedClassrooms}">
                        <div class="about-author clearfix">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>
                            </div>
                            <a class="" href="#" style="float: right">Close class</a>
                            <div class="author-bio">
                                <h4><a href="/classroom/${ownedClassroom.id}">${ownedClassroom.classroomName}</a></h4>
                                    ${ownedClassroom.classroomDescription}
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${empty ownedClassrooms}">
                <div class="about-author clearfix">
                    No classroom.
                </div>
            </c:if>
        </div>
        <c:if test="${fn:length(ownedClassrooms) > 10}">
            <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                    id="loadMoreClassroom">Load more</a></div>
        </c:if>
    </div>
    <div class="tab-inner-warp">
        <div class="tab-inner" id="followedTeachers">
            <c:if test="${not empty followedTeachers}">
                <c:if test="${fn:length(followedTeachers)>10}">
                    <c:forEach var="followedTeacher" items="${followedTeachers}" end="9">
                        <div class="about-author clearfix">
                            <div class="author-image">
                                <a href="/profile/view/${followedTeacher.teacherId}"
                                   original-title="admin" class="tooltip-n"><img alt=""
                                                                                 src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></a>
                            </div>
                            <a class="" href="#" style="float: right">Unfollow</a>

                            <div class="author-bio">
                                <h4><a href="#">${followedTeacher.teacherName}</a></h4>
                                    ${followedTeacher.aboutTeacher}
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(followedTeachers) <= 10}">
                    <c:forEach var="followedTeacher" items="${followedTeachers}">
                        <div class="about-author clearfix">
                            <div class="author-image">
                                <a href="/profile/view/${followedTeacher.teacherId}"
                                   original-title="admin" class="tooltip-n"><img alt=""
                                                                                 src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></a>
                            </div>
                            <a class="" href="#" style="float: right">Unfollow</a>

                            <div class="author-bio">
                                <h4><a href="#">${followedTeacher.teacherName}</a></h4>
                                    ${followedTeacher.aboutTeacher}
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${empty followedTeachers}">
                <div class="about-author clearfix">
                    No followed teacher.
                </div>
            </c:if>
        </div>
        <c:if test="${fn:length(followedTeachers) > 10}">
            <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                    id="loadMoreTeacher">Load more</a></div>
        </c:if>
    </div>
<div class="tab-inner-warp">
        <div class="tab-inner" id="invitations">
            <c:if test="${not empty invitations}">
                <c:if test="${fn:length(invitations)>10}">
                    <c:forEach var="invitation" items="${invitations}" end="9">
                        <div class="about-author clearfix">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="https://askwarks.files.wordpress.com/2012/06/icon-conversation.png"></a>
                            </div>
                            <a class="" href="#" style="float: right">Remove</a>
                            <div class="author-bio">
                                <h4><a href="/post/view/${invitation.postId}">${invitation.postTitle}</a></h4>
                                You are invited to answer this question in <a
                                    href="/classroom/${invitation.classroomId}">${invitation.classroomName}</a> by <a
                                    href="/profile/view/${invitation.teacherId}">${invitation.teacherName}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(invitations)<=10}">
                    <c:forEach var="invitation" items="${invitations}">
                        <div class="about-author clearfix">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="https://askwarks.files.wordpress.com/2012/06/icon-conversation.png"></a>
                            </div>
                            <a class="" href="#" style="float: right">Remove</a>
                            <div class="author-bio">
                                <h4><a href="/post/view/${invitation.postId}">${invitation.postTitle}</a></h4>
                                You are invited to answer this question in <a
                                    href="/classroom/${invitation.classroomId}">${invitation.classroomName}</a> by <a
                                    href="/profile/view/${invitation.teacherId}">${invitation.teacherName}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${empty invitations}">
                <div class="about-author clearfix">
                    No invitation.
                </div>
            </c:if>
        </div>
        <c:if test="${fn:length(invitations) > 10}">
            <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                    id="loadMoreInvitation">Load more</a></div>
        </c:if>
    </div>
</div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget widget_highest_points">
        <h3 class="widget_title">Hi, ${sessionScope.user.displayName}</h3>
        <ul>
            <li>
                <div class="author-img">
                    <a href="#"><img width="60" height="60" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg" alt=""></a>
                </div>
                <h6><a href="#">Edit profile</a></h6>
            </li>
        </ul>
    </div>



    <div class="widget widget_tag_cloud">
        <h3 class="widget_title">Tags</h3>
        <a href="#">projects</a>
        <a href="#">Portfolio</a>
        <a href="#">Wordpress</a>
        <a href="#">Html</a>
        <a href="#">Css</a>
        <a href="#">jQuery</a>
        <a href="#">2code</a>
        <a href="#">vbegy</a>
    </div>

</aside><!-- End sidebar -->
</div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

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
<script>
    $(document).ready(function () {
        var followedTeacherPage = 2;
        var ownedClassroomPage = 2;
        var invitationPage = 2;
        $('#loadMoreTeacher').click(function (e) {
            var url = "dashboard/followedTeacher/" + followedTeacherPage;
            $.ajax({
                type: "GET",
                url: url,
                success: function (data) {
                    var followedTeachers = new Array();
                    followedTeachers = data;
                    var length = followedTeachers.length;
                    if (length > 10) {
                        length = followedTeachers.length - 1;
                    } else {
                        $('#loadMoreTeacher').hide();
                    }
                    for (var i = 0; i < length; i++) {
                        $('#followedTeachers').append('<div class="about-author clearfix"> <div class="author-image"> <a href="/profile/view/' + followedTeachers[i].teacherId + '" original-title="admin" class="tooltip-n"><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></a> </div> <a class="" href="#" style="float: right">Unfollow</a> <div class="author-bio"> <h4><a href="#">' + followedTeachers[i].teacherName + '</a></h4> ' + followedTeachers[i].aboutTeacher + ' </div> </div>');
                    }
                    followedTeacherPage++;
                }
            })
        });
        $('#loadMoreClassroom').click(function (e) {
            var url = "dashboard/ownedClassroom/" + ownedClassroomPage;
            $.ajax({
                type: "GET",
                url: url,
                success: function (data) {
                    var ownedClassrooms = new Array();
                    ownedClassrooms = data;
                    var length = ownedClassrooms.length;
                    if (length > 10) {
                        length = ownedClassrooms.length - 1;
                    } else {
                        $('#loadMoreClassroom').hide();
                    }
                    for (var i = 0; i < length; i++) {
                        $('#ownedClassrooms').append('<div class="about-author clearfix">'+
                                '<div class="" style="float: left;padding-right: 20px;">'+
                                '<a href="#" original-title="admin" class=""><img alt=""' +
                                ' src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>'+
                                '</div>'+
                                '<a class="" href="#" style="float: right">Close class</a>'+
                                '<div class="author-bio">'+
                                '<h4><a href="/classroom/'+
                                ownedClassrooms[i].id +'">'+ ownedClassrooms[i].classroomName +'</a></h4>'+
                                ownedClassrooms[i].classroomDescription +
                                '</div>'+
                                '</div>');
                    }
                    ownedClassroomPage++;
                }
            })
        });
        $('#loadMoreInvitation').click(function (e) {
            var url = "dashboard/postInvitation/" + invitationPage;
            $.ajax({
                type: "GET",
                url: url,
                success: function (data) {
                    var invitations = new Array();
                    invitations = data;
                    var length = invitations.length;
                    if (length > 10) {
                        length = invitations.length - 1;
                    } else {
                        $('#loadMoreInvitation').hide();
                    }
                    for (var i = 0; i < length; i++) {
                        $('#invitations').append('<div class="about-author clearfix">' +
                                '<div class="" style="float: left;padding-right: 20px;">' +
                                '<a href="#" original-title="admin" class=""><img alt="" ' +
                                ' src="https://askwarks.files.wordpress.com/2012/06/icon-conversation.png"></a>' +
                                '</div>' +
                                '<a class="" href="#" style="float: right">Remove</a>' +
                                '<div class="author-bio">' +
                                '<h4><a href="/post/view/'+ invitations[i].postId
                                +'">' + invitations[i].postTitle + '</a></h4>' +
                                'You are invited to answer this question in <a ' +
                                'href="/classroom/'+ invitations[i].classroomId
                                +'">' + invitations[i].classroomName + '</a> by <a ' +
                                'href="/profile/view/'+ invitations[i].teacherId + '">' +  invitations[i].teacherName
                                +'</a>' +
                                '</div>' +
                                '</div>');
                    }
                    invitationPage++;
                }
            })
        });
    });
</script>
<!-- End js -->

</body>
</html>