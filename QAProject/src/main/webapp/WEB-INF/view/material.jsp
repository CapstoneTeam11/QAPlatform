<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 6/2/2015
  Time: 9:26 AM
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

<div class="panel-pop" id="create-folder">
    <h2>Create folder<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form>
            <div class="form-inputs clearfix">
                <p>
                    <label class="required">Folder name<span></span></label>
                    <input type="text">
                </p>
            </div>
            <p class="form-submit">
                <input type="submit" value="Create new folder" class="button color small submit">
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End create folder -->


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
                <li class="parent-list"><a href="cat_question.html">Hi, Peter Chu <span class="menu-nav-arrow"></span></a>
                    <ul style="overflow: hidden; height: auto; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; display: none;">
                        <li><a href="/studentdashboard">Dashboard</a></li>
                        <li><a href="/material">Material</a></li>
                        <li><a href="/profile">Profile</a></li>
                        <li><a href="#">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </section><!-- End container -->
</header><!-- End header -->

<div class="breadcrumbs">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Manage material</h3>
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
                </div>
                <div class="col-md-6 col-sm-6">
                    <a href="#" id="create-folder-click" class="button medium green-button" style="float: right"><i class="icon-plus-sign"></i> Create folder</a>
                </div>
            </div>

            <div class="tabs-warp question-tab">
                <ul class="tabs">
                    <li class="tab"><a href="#" class="current">Library</a></li>
                </ul>
                <div class="tab-inner-warp">
                    <div class="tab-inner">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="page-content page-shortcode">
                                    <div class="box_icon">
                                        <span class="t_center icon_i"><span icon_size="120"><i i_color="#1abc9c" i_hover="#34495e" class="icon-folder-open-alt color_default" style="font-size: 60px; color: rgb(52, 73, 94);"></i></span></span>
                                        <div class="t_center">
                                            <h3>Java</h3>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix gap"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="page-content page-shortcode">
                                    <div class="box_icon">
                                        <span class="t_center icon_i"><span icon_size="120"><i i_color="#1abc9c" i_hover="#34495e" class="icon-folder-open-alt color_default" style="font-size: 60px; color: rgb(52, 73, 94);"></i></span></span>
                                        <div class="t_center">
                                            <h3>Java</h3>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix gap"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="page-content page-shortcode">
                                    <div class="box_icon">
                                        <span class="t_center icon_i"><span icon_size="120"><i i_color="#1abc9c" i_hover="#34495e" class="icon-folder-open-alt color_default" style="font-size: 60px; color: rgb(52, 73, 94);"></i></span></span>
                                        <div class="t_center">
                                            <h3>Java</h3>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix gap"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="page-content page-shortcode">
                                    <div class="box_icon">
                                        <span class="t_center icon_i"><span icon_size="120"><i i_color="#1abc9c" i_hover="#34495e" class="icon-folder-open-alt color_default" style="font-size: 60px; color: rgb(52, 73, 94);"></i></span></span>
                                        <div class="t_center">
                                            <h3>Java</h3>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix gap"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="page-content page-shortcode">
                                    <div class="box_icon">
                                        <span class="t_center icon_i"><span icon_size="120"><i i_color="#1abc9c" i_hover="#34495e" class="icon-folder-open-alt color_default" style="font-size: 60px; color: rgb(52, 73, 94);"></i></span></span>
                                        <div class="t_center">
                                            <h3>Java</h3>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix gap"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="page-content page-shortcode">
                                    <div class="box_icon">
                                        <span class="t_center icon_i"><span icon_size="120"><i i_color="#1abc9c" i_hover="#34495e" class="icon-folder-open-alt color_default" style="font-size: 60px; color: rgb(52, 73, 94);"></i></span></span>
                                        <div class="t_center">
                                            <h3>Java</h3>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix gap"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- End page-content -->
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

<footer id="footer">
    <section class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="widget widget_contact">
                    <h3 class="widget_title">Where We Are ?</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu.</p>
                </div>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</footer><!-- End footer -->
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
