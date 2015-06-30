<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<div class="loader">
    <div class="loader_html"></div>
</div>

<div id="wrap">

<div class="panel-Confirm" id="leave-classroom">
    <h2>Leave classroom</h2>
    <div>
        <p class="panelMessage">Do you want to leave this classroom?</p>
        <p>
            <input type="submit" value="Cancel"  class="button color small cancel panelButton" >
            <input type="submit" value="OK"  class="button color small OK panelButton" style="margin-left: 3%;">
        </p>
        <div class="clearfix"></div>
    </div>
</div>

<%@include file="header.jsp" %>

<div class="breadcrumbs">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Student dashboard</h3>
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
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <input type="text" aria-required="true" value="Search in your dashboard"
                           onfocus="if(this.value=='Search in your dashboard')this.value='';"
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
                    <div class="tab-inner" id="joinedClassrooms">
                        <c:if test="${not empty joinedClassrooms}">
                            <c:if test="${fn:length(joinedClassrooms)>10}">
                                <c:forEach var="joinedClassroom" items="${joinedClassrooms}" end="9">
                                    <div class="about-author clearfix" id="classroom${joinedClassroom.id}">
                                        <div class="" style="float: left;padding-right: 20px;">
                                            <a href="#" original-title="admin" class=""><img alt=""
                                                                                             src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>
                                        </div>
                                        <a class="leaveClassroom" onclick="leaveClassroom(this); return false;"
                                           style="float: right; cursor:pointer" id="${joinedClassroom.id}">Leave</a>

                                        <div class="author-bio">
                                            <h4><a href="/classroom/${joinedClassroom.id}">
                                                    ${joinedClassroom.classroomName}
                                            </a>
                                            </h4>
                                            ${joinedClassroom.classroomDescription}
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${fn:length(joinedClassrooms)<=10}">
                                <c:forEach var="joinedClassroom" items="${joinedClassrooms}">
                                    <div class="about-author clearfix" id="classroom${joinedClassroom.id}">
                                        <div class="" style="float: left;padding-right: 20px;">
                                            <a href="#" original-title="admin" class=""><img alt=""
                                                                                             src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>
                                        </div>
                                        <a class="leaveClassroom" onclick="leaveClassroom(this); return false;"
                                           style="float: right; cursor:pointer" id="${joinedClassroom.id}">Leave</a>

                                        <div class="author-bio">
                                            <h4><a href="/classroom/${joinedClassroom.id}">
                                                    ${joinedClassroom.classroomName}
                                                </a>
                                            </h4>
                                                ${joinedClassroom.classroomDescription}
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                        <c:if test="${empty joinedClassrooms}">
                            <div class="about-author clearfix">
                                No joined classroom
                            </div>
                        </c:if>
                    </div>
                    <c:if test="${fn:length(joinedClassrooms) > 10}">
                        <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                                id="loadMoreClassroom">Load more</a></div>
                    </c:if>
                </div>
                <div class="tab-inner-warp">
                    <div class="tab-inner" id="followedTeachers">
                        <c:if test="${not empty followedTeachers}">
                            <c:if test="${fn:length(followedTeachers)>10}">
                                <c:forEach var="followedTeacher" items="${followedTeachers}" end="9">
                                    <div class="about-author clearfix" id="teacher${followedTeacher.teacherId}">
                                        <div class="author-image">
                                            <a href="/profile/view/${followedTeacher.teacherId}"
                                               original-title="${followedTeacher.teacherName}" class="tooltip-n"><img alt=""
                                                                                                                      src="${followedTeacher.profileImageURL}"></a>
                                        </div>
                                        <a id="${followedTeacher.teacherId}" class="unFollow"
                                           style="float: right; cursor: pointer" onclick="unFollow(this);return false;">Unfollow</a>

                                        <div class="author-bio">
                                            <h4><a href="/profile/view/${followedTeacher.teacherId}">${followedTeacher.teacherName}</a></h4>
                                            <c:if test="${empty followedTeacher.aboutTeacher}">
                                                ${followedTeacher.teacherName} has not introduced about himself or herself yet.
                                            </c:if>
                                                ${followedTeacher.aboutTeacher}
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${fn:length(followedTeachers) <= 10}">
                                <c:forEach var="followedTeacher" items="${followedTeachers}">
                                    <div class="about-author clearfix" id="teacher${followedTeacher.teacherId}">
                                        <div class="author-image">
                                            <a href="/profile/view/${followedTeacher.teacherId}"
                                               original-title="${followedTeacher.teacherName}" class="tooltip-n"><img alt=""
                                                                                                                      src="${followedTeacher.profileImageURL}"></a>
                                        </div>
                                        <a id="${followedTeacher.teacherId}" class="unFollow"
                                           style="float: right; cursor: pointer" onclick="unFollow(this);return false;">Unfollow</a>

                                        <div class="author-bio">
                                            <h4><a href="/profile/view/${followedTeacher.teacherId}">${followedTeacher.teacherName}</a></h4>
                                            <c:if test="${empty followedTeacher.aboutTeacher}">
                                                ${followedTeacher.teacherName} has not introduced about himself or herself yet.
                                            </c:if>
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
                                    <div class="about-author clearfix" id="invitation${invitation.id}">
                                        <div class="" style="float: left;padding-right: 20px;">
                                            <a href="#" original-title="admin" class=""><img alt=""
                                                                                             src="http://consultoriaparacolegios.com/wp-content/uploads/2014/08/Classroom-Learning-Icon-150x150-e1427087330238.png"></a>
                                        </div>
                                        <a class="ignoreInvitation" style="float: right; cursor:pointer"
                                           onclick="ignoreInvitation(this); return false;"
                                           id="${invitation.id}">Ignore</a>
                                        <a class="confirmInvitation"
                                           style="float: right; margin-right: 15px; cursor: pointer"
                                           onclick="confirmInvitation(this); return false;"
                                           id="${invitation.id}">Confirm</a>
                                        <div class="author-bio">
                                            <h4>
                                                <a href="/classroom/${invitation.classroomId}">${invitation.classroomName}</a>
                                            </h4>
                                            You are invited to join this class by <a
                                                href="/profile/view/${invitation.teacherId}">${invitation.teacherName}</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${fn:length(invitations)<=10}">
                                <c:forEach var="invitation" items="${invitations}" end="9">
                                    <div class="about-author clearfix" id="invitation${invitation.id}">
                                        <div class="" style="float: left;padding-right: 20px;">
                                            <a href="#" original-title="admin" class=""><img alt=""
                                                                                             src="http://consultoriaparacolegios.com/wp-content/uploads/2014/08/Classroom-Learning-Icon-150x150-e1427087330238.png"></a>
                                        </div>
                                        <a class="ignoreInvitation" style="float: right; cursor:pointer"
                                           onclick="ignoreInvitation(this); return false;"
                                            id="${invitation.id}">Ignore</a>
                                        <a class="confirmInvitation"
                                           style="float: right; margin-right: 15px; cursor: pointer"
                                           onclick="confirmInvitation(this); return false;"
                                           id="${invitation.id}">Confirm</a>
                                        <div class="author-bio">
                                            <h4>
                                                <a href="/classroom/${invitation.classroomId}">${invitation.classroomName}</a>
                                            </h4>
                                            You are invited to join this class by <a
                                                href="/profile/view/${invitation.teacherId}">${invitation.teacherName}</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                        <c:if test="${empty invitations}">
                            <div class="about-author clearfix">
                                No invitation
                            </div>
                        </c:if>
                    </div>
                    <c:if test="${fn:length(invitations) > 10}">
                        <div><a class="post-read-more button color small" style="margin-bottom: 20px;"
                                id="loadMoreInvitation">Load more</a></div>
                    </c:if>
                </div>
            </div>
            <!-- End page-content -->
        </div>
        <!-- End main -->
        <aside class="col-md-3 sidebar">
            <div class="widget widget_highest_points">
                <h3 class="widget_title">Hi, ${sessionScope.user.displayName}</h3>
                <ul>
                    <li>
                        <div class="author-img">
                            <a href="/profile/view/${sessionScope.user.id}"><img width="60" height="60"
                                             src="${sessionScope.user.profileImageURL}" alt=""></a>
                        </div>
                        <h6><a href="/profile/update">Edit profile</a></h6>
                    </li>
                </ul>
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
    /*$(document).ready(function () {*/
        var nextFromFollowedTeacher = 10;
        var nextFromJoinedClassroom = 10;
        var nextFromInvitation = 10;
        $('#loadMoreTeacher').click(function (e) {
            var url = "dashboard/followedTeacher/" + nextFromFollowedTeacher;
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
                        var component = '<div class="about-author clearfix" id="teacher'+
                                followedTeachers[i].teacherId +
                                '"> <div class="author-image"> <a href="/profile/view/' +
                                '' + followedTeachers[i].teacherId +
                                '" original-title="' + followedTeachers[i].teacherName +
                                '" class="tooltip-n"><img alt="" ' +
                                'src="'+  followedTeachers[i].profileImageURL +'"></a> </div>' +
                                ' <a id="'+
                                followedTeachers[i].teacherId +
                                '" class="unFollow" style="float: right; cursor: pointer" ' +
                                'onclick="unFollow(this);return false;">Unfollow</a>' +
                                ' <div class="author-bio"> <h4><a href="/profile/view/' +
                                + followedTeachers[i].teacherId + '">' +
                                followedTeachers[i].teacherName +
                                '</a></h4> ' + followedTeachers[i].aboutTeacher
                        if (followedTeachers[i].aboutTeacher===undefined || followedTeachers[i].aboutTeacher===""){
                            component = component + followedTeachers[i].teacherName
                                    + ' has not introduced about himself or herself yet.'
                        }
                        component = component + ' </div> </div>';
                        $('#followedTeachers').append(component);
                        $(".tooltip-n").tipsy({fade:true,gravity:"s"});
                    }
                    nextFromFollowedTeacher=nextFromFollowedTeacher+10;
                }
            })
        });
        $('#loadMoreClassroom').click(function (e) {
            var url = "dashboard/joinedClassroom/" + nextFromJoinedClassroom;
            $.ajax({
                type: "GET",
                url: url,
                success: function (data) {
                    var joinedClassrooms = new Array();
                    joinedClassrooms = data;
                    var length = joinedClassrooms.length;
                    if (length > 10) {
                        length = joinedClassrooms.length - 1;
                    } else {
                        $('#loadMoreClassroom').hide();
                    }
                    for (var i = 0; i < length; i++) {
                        $('#joinedClassrooms').append('<div class="about-author clearfix" id="classroom'+
                                joinedClassrooms[i].id +'">' +
                                '<div class="" style="float: left;padding-right: 20px;">' +
                                '<a href="#" original-title="admin" class=""><img alt="" ' +
                                'src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>' +
                                '</div>' +
                                '<a class="leaveClassroom" onclick="leaveClassroom(this); return false;" ' +
                                'style="float: right; cursor:pointer" id="'+ joinedClassrooms[i].id +'">Leave</a>' +
                                '<div class="author-bio">' +
                                '<h4><a href="/classroom/'+ joinedClassrooms[i].id +'">' +
                                joinedClassrooms[i].classroomName +
                                '</a>' +
                                '</h4>' +
                                joinedClassrooms[i].classroomDescription +
                                '</div>' +
                                '</div>');
                    }
                    nextFromJoinedClassroom= nextFromJoinedClassroom +10;
                }
            })
        });
        $('#loadMoreInvitation').click(function (e) {
            var url = "dashboard/classroomInvitation/" + nextFromInvitation;
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
                        $('#invitations').append('<div class="about-author clearfix" id=invitation' +
                                invitations[i].id + '>' +
                                '<div class="" style="float: left;padding-right: 20px;">' +
                                '<a href="#" original-title="admin" class=""><img alt="" ' +
                                'src="http://consultoriaparacolegios.com/wp-content/uploads/2014/08/Classroom-Learning-Icon-150x150-e1427087330238.png"></a>' +
                                '</div>' +
                                '<a class="ignoreInvitation" style="float: right; cursor:pointer" '+
                                'onclick="ignoreInvitation(this); return false;" id="'+ invitations[i].id +'">Ignore</a>'+
                                '<a class="confirmInvitation" '+
                                'style="float: right; margin-right: 15px; cursor: pointer" '+
                                'onclick="confirmInvitation(this); return false;" id="'+ invitations[i].id
                                +'">Confirm</a>'+
                                '<div class="author-bio">' +
                                '<h4>' +
                                '<a href="/classroom/'+ invitations[i].classroomId +
                                '">' +  invitations[i].classroomName +'</a>' +
                                '</h4>' +
                                'You are invited to join this class by ' +
                                '<a href="/profile/view/'+ invitations[i].teacherId +'">'+ invitations[i].teacherName
                                +'</a>' +
                                '</div>' +
                                '</div>');
                    }
                    nextFromInvitation= nextFromInvitation + 10;
                }
            })
        });
        var unFollow = function (e) {
            var teacherId = $(e).attr('id');
            $.ajax({
                type: "POST",
                url: "/unfollowTeacher/",
                data: "teacherId="+ teacherId,
                success: function (data){
                    if(data === "OK"){
                        nextFromFollowedTeacher--;
                        var followedTeacher = $('#teacher'+teacherId);
                        var teacherName = followedTeacher.find("h4").find("a").text();
                        followedTeacher.html('You have unfollowed <a href="/profile/view/'+ teacherId +'">'+
                                teacherName+'</a>.');
                        followedTeacher.attr("style","background-color: #FFFFEA")
                    }
                }
            });
        };
        var ignoreInvitation = function (e){
            var invitationId = $(e).attr('id');
            $.ajax({
                type: "POST",
                url: "/ignoreInvitation",
                data: "invitationId="+ invitationId,
                success: function (data){
                    if(data === "OK"){
                        nextFromInvitation--;
                        var invitation = $('#invitation'+invitationId);
                        var classroomName = invitation.find("h4").find("a").text();
                        var classroomHref = invitation.find("h4").find("a").attr("href");
                        invitation.html('You have ignored the invitation to join <a href="'+
                                classroomHref +'">'+
                                classroomName+'</a>.');
                        invitation.attr("style","background-color: #FFFFEA")
                    }
                }
            });
        };
        var confirmInvitation = function (e){
            var invitationId = $(e).attr('id');
            $.ajax({
                type: "POST",
                url: "/confirmInvitation",
                data: "invitationId="+ invitationId,
                success: function (data){
                    if(data !== ""){
                        nextFromInvitation--;
                        nextFromJoinedClassroom++;
                        var invitation = $('#invitation'+invitationId);
                        var classroomName = invitation.find("h4").find("a").text();
                        var classroomHref = invitation.find("h4").find("a").attr("href");
                        var classroomId = classroomHref.split("/")[2];
                        var classroomDescription = data;
                        invitation.html('You have joined <a href="'+
                                classroomHref +'">'+
                                classroomName+'</a>.');
                        invitation.attr("style","background-color: #e5ffe5")
                        var newJoinedClassroom = '<div class="about-author clearfix" id="classroom'+
                                classroomId +'">' +
                                '<div class="" style="float: left;padding-right: 20px;">' +
                                '<a href="#" original-title="admin" class=""><img alt="" ' +
                                'src="http://steinhardt.nyu.edu/scmsAdmin/media/users/il30/icons_facultyresources/classroom-01.png"></a>' +
                                '</div>' +
                                '<a class="leaveClassroom" onclick="leaveClassroom(this); return false;" ' +
                                'style="float: right; cursor:pointer" id="'+ classroomId +'">Leave</a>' +
                                '<div class="author-bio">' +
                                '<h4><a href="/classroom/'+ classroomId +'">' +
                                classroomName +
                                '</a>' +
                                '</h4>' +
                                classroomDescription +
                                '</div>' +
                                '</div>'
                        $('#joinedClassrooms').prepend(newJoinedClassroom);
                    }
                }
            });
        };
        var leaveClassroom = function(e) {
            var classroomId = $(e).attr('id');
            $(".panel-Confirm").animate({"top":"-100%"},10).hide();
            $("#leave-classroom").show().animate({"top":"34%"},500);
            $("body").prepend("<div class='wrap-pop'></div>");
            wrap_pop();
            var flagPanel =  $('.panelButton').click(function(e) {
                if ($(e.currentTarget).hasClass('OK')) {
                    $.ajax({
                        type: "POST",
                        url: "/leaveClassroom",
                        data: 'classroomId=' + classroomId,
                        success: function (data) {
                            if(data != "NG" ){
                                nextFromJoinedClassroom--;
                                var classroom = $('#classroom'+classroomId);
                                var classroomName = classroom.find("h4").find("a").text();
                                var classroomHref = classroom.find("h4").find("a").attr("href");
                                classroom.html('You have left classroom <a href="'+
                                        classroomHref +'">'+
                                        classroomName+'</a>.');
                                classroom.attr("style","background-color: #FFFFEA")
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
        };
        function wrap_pop() {
            $(".wrap-pop").click(function () {
                $(".panel-Confirm").animate({"top":"-100%"},500).hide(function () {
                    $(this).animate({"top":"-100%"},500);
                });
                $(this).remove();
            });
        }
    /*});*/
</script>
<!-- End js -->

</body>
</html>