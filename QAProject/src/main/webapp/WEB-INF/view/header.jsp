<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 6/4/2015
  Time: 5:12 PM
  To change this template use File | Settings | File Templates.
--%>
<div class="navbar navbar-fixed-top">
    <header id="header">
        <section class="container clearfix">
            <div class="logo"><a href="/newsfeed"><img alt="" src="/resource/assets/images/logo.png"></a></div>
            <nav class="">
                <ul class="nav nav-pills notification" >
                    <li class="dropdown pull-right">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color : white;"><i class="icon-globe" style="font-size: 22px;"></i><span style="color: #ff7361" id="countNotifi">15</span></a>
                        <!--UPDATE ICON-->
                        <ul class="dropdown-menu" style="min-width : 414px;">
                            <li class="notification-li"><div class="notification-all"><div style="margin-left: 10px;"><a class="notification-user">Notification</a></div></div></li>
                            <ul class="scrollable-menu" style="min-width : 414px;">
                                <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                                <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                                <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                                <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Want To join <a class="notification-link" style="display : inline-block;">ABC Class</a></div><div></div><a href="#" class="button small blue-button" style="">Approve</a><a href="#" class="button small red-button" style="">Reject</a></div></div></li>
                                <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                                <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                                <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                                <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Want To join <a class="notification-link" style="display : inline-block;">ABC Class</a></div><div></div><a href="#" class="button small blue-button" style="">Approve</a><a href="#" class="button small red-button" style="">Reject</a></div></div></li>
                                <div class="notification-all"><div style="margin-left: 10px;"><a href="#" class="notification-user">See All</a></div></div>
                            </ul>
                        </ul>
                    </li>
                </ul>
            </nav>
            <nav class="navigation">
                <ul>
                    <li><a href="/newsfeed">News feed</a></li>
                    <li class="parent-list" style="margin-right: 5px"><a>Hi, ${sessionScope.user.displayName} <span class="menu-nav-arrow"></span></a>
                        <ul style="overflow: hidden; height: auto; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; display: none;">
                            <li><a href="/dashboard">Dashboard</a></li>
                            <li><a href="/material">Material</a></li>
                            <li><a href="/profile">Profile</a></li>
                            <li><a href="/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </section><!-- End container -->
    </header><!-- End header -->
</div> <!-- End fixed container for header-->

