<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/26/2015
  Time: 8:06 AM
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

<%@include file="header.jsp" %>

<div class="breadcrumbs">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Student dashboard</h3>
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
        <div class="col-md-3 col-sm-1"></div>
        <div class="col-md-3 col-sm-5" style="padding-left: 65px">
        </div>
    </div>

    <div class="tabs-warp question-tab">
        <ul class="tabs">
            <li class="tab"><a href="#" class="current">Joined Classrooms</a></li>
            <li class="tab"><a href="#">Followed Teachers</a></li>
            <li class="tab"><a href="#">Invitations</a></li>
        </ul>
        <div class="tab-inner-warp">
            <div class="tab-inner">
                <c:if test="${not empty classrooms}">
                    <c:forEach var="classroom" items="${classrooms}">
                        <div class="about-author clearfix">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>
                            </div>
                            <a class="" href="#" style="float: right">Leave</a>
                            <div class="author-bio">
                                <h4><a href="#">${classroom.classroomName}</a></h4>
                                ${classroom.classroomDescription}
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty classrooms}">
                    <div class="about-author clearfix">
                        No classrooms joined yet
                    </div>
                </c:if>
            </div>
        </div>
        <div class="tab-inner-warp">
            <div class="tab-inner">
                <c:if test="${not empty followedTeachers}">
                    <c:forEach var="followedTeacher" items="${followedTeachers}">
                        <div class="about-author clearfix">
                            <div class="author-image">
                                <a href="/profile/view/ ${followedTeacher.teacherId.id}" original-title="admin" class="tooltip-n"><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></a>
                            </div>
                            <a class="" href="#" style="float: right">Unfollow</a>
                            <div class="author-bio">
                                <h4><a href="#">${followedTeacher.teacherId.displayName}</a></h4>
                                    ${followedTeacher.teacherId.aboutMe}
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty followedTeachers}">
                    <div class="about-author clearfix">
                        No follower yet
                    </div>
                </c:if>
            </div>
        </div>
        <div class="tab-inner-warp">
            <div class="tab-inner">
                <c:if test="${not empty invitations}">
                    <c:forEach var="invitation" items="${invitations}">
                        <div class="about-author clearfix">
                            <div class="" style="float: left;padding-right: 20px;">
                                <a href="#" original-title="admin" class=""><img alt="" src="http://consultoriaparacolegios.com/wp-content/uploads/2014/08/Classroom-Learning-Icon-150x150-e1427087330238.png"></a>
                            </div>
                            <a class="" href="#" style="float: right">Ignore</a>
                            <a class="" href="#" onclick="" style="float: right; margin-right: 15px">Confirm</a>
                            <div class="author-bio">
                                <h4><a href="/classroom/${invitation.classroomId.id}">${invitation.classroomId.classroomName}</a></h4>
                                You are invited to join this class by <a href="/profile/${invitation.userId.id}">${invitation.userId.displayName}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty invitations}">
                    <div class="about-author clearfix">
                        No invitations yet
                    </div>
                </c:if>
            </div>
        </div>
    </div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget widget_highest_points">
        <h3 class="widget_title">Hi, Student</h3>
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

<!-- End js -->

</body>
</html>