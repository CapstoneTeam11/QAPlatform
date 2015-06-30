<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 6/30/2015
  Time: 9:07 AM
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

    <!-- Notification Style -->
    <link rel="stylesheet" href="/resource/assets/css/notification.css">

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">
    <!-- Toast message Style -->
    <link rel="stylesheet" href="/resource/assets/css/jquery.toastmessage.css">
    <!--TagInput-->
    <link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="/resource/assets/css/tag.css">
</head>

<body>

<div class="loader"><div class="loader_html"></div></div>

<div id="wrap">


    <%@include file="header.jsp" %>

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <h3></h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">
                <div class="clearfix"></div>
                <div class="page-content page-shortcode">
                    <div class="row" style="margin-top: 65px; margin-bottom: 65px">
                        <div id="chartContainer" style="height: 300px; width: 100%;">
                        </div>
                    </div>
                </div><!-- End page-content -->
            </div><!-- End main -->
            <aside class="col-md-3 sidebar">
                <div class="widget">
                    <h3 class="widget_title">About class</h3>
                    <ul class="related-posts">
                        <li class="related-item">
                            <p></p>
                            <div class="clear"></div><span>Feb 22, 2014</span>
                        </li>
                    </ul>
                </div>
                <c:if test="">
                    <div class="widget widget_login" style="  min-height: 130px;">
                        <h3 class="widget_title">Invite student</h3>
                        <div class="pull-right" style="width: 100%;">
                            <a href="#" id="create-folder-click" class="button medium color" style="width: 100%;text-align: center;"><i class="icon-plus-sign"></i> Invite</a>
                        </div>
                    </div>
                </c:if>
                <div class="widget widget_highest_points">
                    <h3 class="widget_title">Class Owner</h3>
                    <ul>
                        <li>
                            <div class="author-img">
                                <a href="#"><img width="60" height="60" src="" alt=""></a>
                            </div>
                            <h6><a href="#"></a></h6>
                            <span class="comment"></span>
                        </li>
                    </ul>
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
<script src="/resource/assets/js/jquery.toastmessage.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
<script src="/resource/assets/js/jquery.canvasjs.min.js"></script>

<!-- End js -->
<script type="text/javascript">
    window.onload = function () {
        var chart = new CanvasJS.Chart("chartContainer",
                {
                    title:{
                        text: "Olympic Medals of all Times (till 2012 Olympics)"
                    },
                    data: [
                        {
                            type: "bar",
                            dataPoints: [
                                { y: 198, label: "Javascript"},
                                { y: 201, label: "PHP"},
                                { y: 202, label: "MVC"},
                                { y: 236, label: "C#"},
                                { y: 395, label: "Java"},
                                { y: 957, label: "Spring"}
                            ]
                        }
                    ]
                });

        chart.render();
    }
</script>
</body>
</html>
