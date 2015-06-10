<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/23/2015
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<div class="panel-pop" id="suggested-classrooms">
    <input id="suggestedClassroomsVar" type="hidden" value="${suggestedClassrooms}"/>
    <h2>Join your first class now!<i class="icon-remove"></i></h2>
    <div style="height: auto; max-height: 300px; overflow-x: hidden;">
        <c:forEach var="suggestedClassroom" items="${suggestedClassrooms}">
            <a href="/classroom/${suggestedClassroom.id}" class="list-group-item">
                <h4 class="list-group-item-heading">${suggestedClassroom.classroomName}</h4>
            </a>
        </c:forEach>
    </div>
</div><!-- End add to folder -->


<%@include file="header.jsp" %>

<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>News feed</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
    <div class="row">
        <div class="col-md-9">

            <div id="searchbar" class="row">
                <div class="" style="padding-left: 15px">
                    <select style="width: 15%; float: left; margin-top: 5px; padding-bottom: 4px">
                        <option value="">All</option>
                        <option value="1">Question</option>
                        <option value="2">Article</option>
                        <option value="2">Material</option>
                        <option value="2">Teacher</option>
                    </select>
                    <input type="text" aria-required="true" value="Find article, question, class or teacher here..." onfocus="if(this.value=='Find article, question, class or teacher here...')this.value='';"
                           onblur="if(this.value=='')this.value='Find article, question, class or teacher here...';" style="width: 72%; margin-top:5px; float: left;">
                    <a href="#" class="button small color" style="padding-bottom: 9px; width: 12%; text-align: center">Search</a>
                </div>

            </div><!-- End #searchbar -->

            <div class="divider"><span></span></div>

            <div id="question" class="row">
                <div class="col-md-12">
                    <div class="boxedtitle page-title"><h2>Question</h2></div>
                    <div style="display: block;">
                        <div class="tab-inner">
                            <c:forEach items="${posts}" var="post">
                                <article class="question question-type-normal">
                                    <h2>
                                        <a href="/question">${post.title}</a>
                                    </h2>
                                    <div class="question-author">
                                        <a href="#" original-title="ahmed" class="question-author-img tooltip-n"><span></span><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/avatar.png"></a>
                                    </div>
                                    <div class="question-inner">
                                        <div class="clearfix"></div>
                                        <p class="question-desc">${post.body}</p>
                                        <div class="question-details">
                                            <span class="question-answered question-answered-done"><c:if test="${post.acceptedAnswerId} != null"><i class="icon-ok"></i>Resolved</c:if></span>
                                        </div>
                                        <span class="question-date"><i class="icon-time"></i>4 mins ago</span>
                                        <span class="question-category"><a href="/classroom"><i class="icon-group"></i>Class: Advance Java</a></span>
                                        <span class="question-comment"><a href="#"><i class="icon-comment"></i>${post.replyCount} Answer</a></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </article>
                            </c:forEach>
                            <%--<article class="question question-type-normal">--%>

                            <%--</article>--%>
                            <article class="question question-type-normal">
                                <h2>
                                    <a href="/question">This is my 2nd Question</a>
                                </h2>
                                <div class="question-author">
                                    <a href="#" original-title="ahmed" class="question-author-img tooltip-n"><span></span><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/avatar.png"></a>
                                </div>
                                <div class="question-inner">
                                    <div class="clearfix"></div>
                                    <p class="question-desc">Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit.</p>
                                    <div class="question-details">
                                        <span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
                                    </div>
                                    <span class="question-date"><i class="icon-time"></i>4 mins ago</span>
                                    <span class="question-category"><a href="/classroom"><i class="icon-group"></i>Class: Advance Java</a></span>
                                    <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                                    <div class="clearfix"></div>
                                </div>
                            </article>
                            <%--<article class="question question-type-normal">--%>
                                <%--<h2>--%>
                                    <%--<a href="/question">This is my 3rd Question</a>--%>
                                <%--</h2>--%>
                                <%--<div class="question-author">--%>
                                    <%--<a href="#" original-title="ahmed" class="question-author-img tooltip-n"><span></span><img alt="" src="http://2code.info/demo/html/ask-me/images/demo/avatar.png"></a>--%>
                                <%--</div>--%>
                                <%--<div class="question-inner">--%>
                                    <%--<div class="clearfix"></div>--%>
                                    <%--<p class="question-desc">Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit.</p>--%>
                                    <%--<div class="question-details">--%>
                                        <%--<span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>--%>
                                    <%--</div>--%>
                                    <%--<span class="question-date"><i class="icon-time"></i>4 mins ago</span>--%>
                                    <%--<span class="question-category"><a href="/classroom"><i class="icon-group"></i>Class: Advance Java</a></span>--%>
                                    <%--<span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>--%>
                                    <%--<div class="clearfix"></div>--%>
                                <%--</div>--%>
                            <%--</article>--%>
                            <a href="#" class="post-read-more button color small" style="margin-bottom: 5px;">Continue reading</a>
                        </div>
                    </div>
                </div>


            </div><!-- End #question -->

            <div class="divider"><span></span></div>

            <div id="article" class="row">
                <div class="col-md-12">
                    <div class="boxedtitle page-title"><h2>Article</h2></div>
                    <div class="" style="display: block;">
                        <div class="tab-inner">
                            <article class="post clearfix">
                                <div class="post-inner">
                                    <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="/article">Post Without Image.</a></h2>
                                    <div class="post-meta">
                                        <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                                        <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                                        <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                                        <span class="question-category"><a href="/classroom"><i class="icon-group"></i>Class: Advance Java</a></span>
                                    </div>
                                    <div class="post-content">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                                    </div><!-- End post-content -->
                                </div><!-- End post-inner -->
                            </article>
                            <article class="post clearfix">
                                <div class="post-inner">
                                    <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="/article">Post Without Image.</a></h2>
                                    <div class="post-meta">
                                        <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                                        <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                                        <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                                        <span class="question-category"><a href="/classroom"><i class="icon-group"></i>Class: Advance Java</a></span>
                                    </div>
                                    <div class="post-content">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                                    </div><!-- End post-content -->
                                </div><!-- End post-inner -->
                            </article>
                            <article class="post clearfix">
                                <div class="post-inner">
                                    <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="/article">Post Without Image.</a></h2>
                                    <div class="post-meta">
                                        <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                                        <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                                        <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                                        <span class="question-category"><a href="/classroom"><i class="icon-group"></i>Class: Advance Java</a></span>
                                    </div>
                                    <div class="post-content">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                                    </div><!-- End post-content -->
                                </div><!-- End post-inner -->
                            </article>
                            <article class="post clearfix">
                                <div class="post-inner">
                                    <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="/article">Post Without Image.</a></h2>
                                    <div class="post-meta">
                                        <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                                        <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                                        <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                                        <span class="question-category"><a href="/classroom"><i class="icon-group"></i>Class: Advance Java</a></span>
                                    </div>
                                    <div class="post-content">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                                    </div><!-- End post-content -->
                                </div><!-- End post-inner -->
                            </article>
                            <a href="#" class="post-read-more button color small" style="margin-bottom: 5px;">Continue reading</a>
                        </div>
                    </div>
                </div>
            </div><!-- End #article -->

            <div class="divider"><span></span></div>

            <div id="material" class="row">
                <div class="col-md-12">
                    <div class="boxedtitle page-title"><h2>Material</h2></div>
                    <div class="" style="display: block;">
                        <div class="tab-inner">
                            <table class="table table-hover">
                                <tr>
                                    <th>No</th>
                                    <th>File name</th>
                                    <th>Uploaded Date</th>
                                    <th>File size</th>
                                    <th>Download</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Introduction to AJ</td>
                                    <td>22-05-2015</td>
                                    <td>1 MB</td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div><!-- End #material -->


        </div><!-- End main -->
        <aside class="col-md-3 sidebar">
            <div class="widget widget_menu widget_menu_jquery" style="width: 220px">
                <ul>
                    <li><a href="#searchbar"><i class="icon-search"></i>Search</a></li>
                    <li><a href="#question"><i class="icon-question-sign"></i>Question</a></li>
                    <li><a href="#article"><i class="icon-edit"></i>Article</a></li>
                    <li><a href="#material"><i class="icon-file-alt"></i>Material</a></li>
                </ul>
            </div><!-- End widget_menu -->
        </aside><!-- End sidebar -->
    </div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->
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
<!-- End js -->
<c:if test="${not empty suggestedClassrooms}">
    <script>
        $(document).ready(function(){
                    jQuery(".panel-pop").animate({"top":"-100%"},10).hide();
                    jQuery("#suggested-classrooms").show().animate({"top":"50%"},500);
                    jQuery("body").prepend("<div class='wrap-pop'></div>");
                    wrap_pop();

        });
        function wrap_pop() {
            jQuery(".wrap-pop").click(function () {
                jQuery(".panel-pop").animate({"top":"-100%"},500).hide(function () {
                    jQuery(this).animate({"top":"-100%"},500);
                });
                jQuery(this).remove();
            });
        }
    </script>
</c:if>

</body>
</html>