<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Left Notification style -->
    <link rel="stylesheet" href="/resource/assets/css/jquery.growl.css"/>

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
                <h3>This is my question</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
<div class="row">
<div class="col-md-9">
<article class="question single-question question-type-normal">
    <h2>
        <a href="single_question.html">${post.title}</a>
    </h2>
    <div class="question-inner">
        <div class="clearfix"></div>
        <div class="question-desc">
            <p>${post.body}</p>
        </div>
        <c:if test="${post.acceptedAnswerId != null}">
        <div class="question-details">
            <span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
        </div>
        </c:if>
        <span class="question-date"><i class="icon-time"></i>${post.lastEditedDate}</span>
        <span class="question-category"><a href="#"><i class="icon-group"></i>Class: ${post.ownerClassId.classroomName}</a></span>
        <span class="question-category"><a href="#"><i class="icon-user"></i>Teacher: ${post.ownerClassId.ownerUserId.displayName}</a></span>
        <div class="clearfix"></div>
    </div>
</article>

<div class="share-tags page-content">
    <div class="question-tags"><i class="icon-tags"></i>
        <c:forEach var="tag" items="${post.tagPostList}">
        <a href="#">${tag.tagId.tagName},</a>
        </c:forEach>
    </div>
    <div class="clearfix"></div>
</div><!-- End share-tags -->


<div id="commentlist" class="page-content">
    <div class="boxedtitle page-title"><h2>Answers ( <span class="color">5</span> )</h2></div>
    <ol class="commentlist clearfix" id="commentList">
        <li class="comment">
            <div class="comment-body comment-body-answered clearfix">
                <div class="avatar"><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></div>
                <div class="comment-text">
                    <div class="author clearfix">
                        <div class="comment-author"><a href="#">admin</a></div>
                        <div class="comment-meta">
                            <div class="date"><i class="icon-time"></i>January 15 , 2014 at 10:00 pm</div>
                        </div>
                        <a class="comment-reply" href="#"><i class="icon-reply"></i>Reply</a>
                    </div>
                    <div class="text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat.</p>
                    </div>
                    <div class="question-answered question-answered-done"><i class="icon-ok"></i>Best Answer</div>
                </div>
            </div>
            <ul class="children">
                <li class="comment">
                    <div class="comment-body clearfix">
                        <div class="avatar"><img alt="" src="../ask-me/images/demo/avatar.png"></div>
                        <div class="comment-text">
                            <div class="author clearfix">
                                <div class="comment-author"><a href="#">vbegy</a></div>
                                <div class="comment-meta">
                                    <div class="date"><i class="icon-time"></i>January 15 , 2014 at 10:00 pm</div>
                                </div>
                                <a class="comment-reply" href="#"><i class="icon-reply"></i>Reply</a>
                            </div>
                            <div class="text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat.</p>
                            </div>
                        </div>
                    </div>
                    <ul class="children">
                        <li class="comment">
                            <div class="comment-body clearfix">
                                <div class="avatar"><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg"></div>
                                <div class="comment-text">
                                    <div class="author clearfix">
                                        <div class="comment-author"><a href="#">admin</a></div>
                                        <div class="comment-meta">
                                            <div class="date"><i class="icon-time"></i>January 15 , 2014 at 10:00 pm</div>
                                        </div>
                                        <a class="comment-reply" href="#"><i class="icon-reply"></i>Reply</a>
                                    </div>
                                    <div class="text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat.</p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul><!-- End children -->
                </li>
                <li class="comment">
                    <div class="comment-body clearfix">
                        <div class="avatar"><img alt="" src="../ask-me/images/demo/avatar.png"></div>
                        <div class="comment-text">
                            <div class="author clearfix">
                                <div class="comment-author"><a href="#">ahmed</a></div>
                                <div class="comment-meta">
                                    <div class="date"><i class="icon-time"></i>January 15 , 2014 at 10:00 pm</div>
                                </div>
                                <a class="comment-reply" href="#"><i class="icon-reply"></i>Reply</a>
                            </div>
                            <div class="text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat.</p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul><!-- End children -->
        </li>
        <li class="comment">
            <div class="comment-body clearfix">
                <div class="avatar"><img alt="" src="../ask-me/images/demo/avatar.png"></div>
                <div class="comment-text">
                    <div class="author clearfix">
                        <div class="comment-author"><a href="#">2code</a></div>
                        <div class="comment-meta">
                            <div class="date"><i class="icon-time"></i>January 15 , 2014 at 10:00 pm</div>
                        </div>
                        <a class="comment-reply" href="#"><i class="icon-reply"></i>Reply</a>
                    </div>
                    <div class="text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat.</p>
                    </div>
                </div>
            </div>
        </li>
    </ol><!-- End commentlist -->
</div><!-- End page-content -->

<div id="respond" class="comment-respond page-content clearfix">
    <div class="boxedtitle page-title"><h2>Leave a reply</h2></div>
    <form action="#" id="commentform" class="comment-form">
        <div id="form-textarea">
            <textarea id="question-details" aria-required="true" cols="58" rows="8"></textarea>
        </div>
        <p class="form-submit">
            <input name="submit" type="submit" id="submit" value="Post your answer" class="button small color">
        </p>
    </form>
</div>

</div><!-- End main -->
<aside class="col-md-3 sidebar">

    <div class="widget widget_highest_points">
        <h3 class="widget_title">Question Author</h3>
        <ul>
            <li>
                <div class="author-img">
                    <a href="#"><img width="60" height="60" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg" alt=""></a>
                </div>
                <h6><a href="#">${post.ownerUserId.displayName}</a></h6>
            </li>
        </ul>
    </div>

    <div class="widget">
        <h3 class="widget_title">Related Questions</h3>
        <ul class="related-posts">
            <li class="related-item">
                <a href="#">This is my first Question</a>
            </li>
            <li class="related-item">
                <a href="#">This Is My Second Poll Question</a>
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
<script>
    CKEDITOR.replace('question-details');
</script>
<script>
    //Create stomp client over sockJS protocol
    var socket = new SockJS("/ws");
    var stompClient = Stomp.over(socket);

    // Callback function to be called when stomp client is connected to server
    var connectCallback = function() {
        stompClient.subscribe('/topic/addPost', post);
    };

    // Callback function to be called when stomp client could not connect to server
    var errorCallback = function(error) {
        alert(error.headers.message);
    };

    function post(post) {
        var post = JSON.parse(post.body);
        var currentCount = $('#countNotifi').html() * 1;
        $('#countNotifi').html(currentCount + 1);
        $('#commentList').append('<li class="comment">'+
                '<div class="comment-body clearfix">'+
                '<div class="avatar"><img alt="" src="../ask-me/images/demo/avatar.png"></div>'+
                '<div class="comment-text">'+
                '<div class="author clearfix">'+
                '<div class="comment-author"><a href="#">2code</a></div>'+
                '<div class="comment-meta">'+
                '<div class="date"><i class="icon-time"></i>January 15 , 2014 at 10:00 pm</div>'+
                '</div>'+
                '<a class="comment-reply" href="#"><i class="icon-reply"></i>Reply</a>'+
                '</div>'+
                '<div class="text"><p>'+post.detail+'</p>'+
                '</div></div></div> </li>');
        MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
        $.growl.notice({
            message: '<div class="activity-item"> <i class="fa fa-heart text-danger"></i> <div class="activity"> Khang <a href="#">Create post</a> in <a href="#">ABC Class</a> <span>few seconds ago</span> </div> </div>',
            location: "bl"
        });

    }
    // Connect to server via websocket
    stompClient.connect("guest", "guest", connectCallback, errorCallback);

    $(document).ready(function() {
        MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
        $('#submit').click(function(e){
            e.preventDefault();
            var detail = CKEDITOR.instances['question-details'].getData()
            var jsonstr = JSON.stringify({ 'creator': 'khang', 'detail': detail });
            stompClient.send("/app/addPost", {}, jsonstr);
            return false;
        });
    });
</script>
<!-- End js -->

</body>
</html>
