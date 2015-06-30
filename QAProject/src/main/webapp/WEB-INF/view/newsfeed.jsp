<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/23/2015
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                        <div class="tab-inner" id="questions">
                            <c:if test="${not empty questions}">
                                <c:if test="${fn:length(questions)>10}">
                                    <c:forEach var="question" items="${questions}" end="9">
                                        <article class="question question-type-normal">
                                            <h2>
                                                <a href="/post/view/${question.id}">${question.title}</a>
                                            </h2>
                                            <div class="question-author">
                                                <a href="/profile/view/${question.ownerId}"
                                                   original-title="${question.ownerName}"
                                                   class="tooltip-n"><span></span><img alt=""
                                                   src="${question.ownerProfileImageURL}"></a>
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
                                                <span class="question-date"><i
                                                        class="icon-time"></i>${question.lastEditedDate}</span>
                                                <span class="question-category"><a
                                                        href="/classroom/${question.classId}"><i
                                                        class="icon-group"></i>Class: ${question.className}</a></span>
                                                <span class="question-comment"><a href="#"><i
                                                        class="icon-comment"></i>${question.answerCount} Answer(s)</a></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </article>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${fn:length(questions)<=10}">
                                    <c:forEach var="question" items="${questions}">
                                        <article class="question question-type-normal">
                                            <h2>
                                                <a href="/post/view/${question.id}">${question.title}</a>
                                            </h2>
                                            <div class="question-author">
                                                <a href="/profile/view/${question.ownerId}"
                                                   original-title="${question.ownerName}"
                                                   class="tooltip-n"><span></span><img alt=""
                                                   src="${question.ownerProfileImageURL}"></a>
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
                                                <span class="question-date"><i
                                                        class="icon-time"></i>${question.lastEditedDate}</span>
                                                <span class="question-category"><a
                                                        href="/classroom/${question.classId}"><i
                                                        class="icon-group"></i>Class: ${question.className}</a></span>
                                                <span class="question-comment"><a href="#"><i
                                                        class="icon-comment"></i>${question.answerCount} Answer(s)</a></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </article>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                        </div>
                        <c:if test="${fn:length(questions)>10}">
                            <a class="post-read-more button color small"
                               style="margin-bottom: 5px;" id="loadMoreQuestion">Load more</a>
                        </c:if>
                    </div>
                </div>


            </div><!-- End question -->

            <div class="divider"><span></span></div>

            <div id="article" class="row">
                <div class="col-md-12">
                    <div class="boxedtitle page-title"><h2>Article</h2></div>
                    <div class="" style="display: block;">
                        <div class="tab-inner" id="articles">
                            <c:if test="${not empty articles}">
                                <c:if test="${fn:length(articles)>10}">
                                    <c:forEach var="article" items="${articles}" end="9">
                                        <article class="post clearfix">
                                            <div class="post-inner">
                                                <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a
                                                        href="/post/view/${article.id}">${article.title}</a></h2>
                                                <div class="post-meta">
                                                    <span class="meta-author"><i class="icon-user"></i><a href="#">Author: ${article.ownerName}</a></span>
                                                    <span class="meta-date"><i class="icon-time"></i>${article.lastEditedDate}</span>
                                <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">${article.answerCount}
                                    comment(s)</a></span>
                                <span class="question-category"><a href="/classroom/${article.classId}"><i
                                        class="icon-group"></i>Class: ${article.className}</a></span>
                                                </div>
                                                <div class="post-content short-text">
                                                    <p>${article.body}</p>
                                                </div><!-- End post-content -->
                                            </div><!-- End post-inner -->
                                        </article>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${fn:length(articles)<=10}">
                                    <c:forEach var="article" items="${articles}">
                                        <article class="post clearfix">
                                            <div class="post-inner">
                                                <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a
                                                        href="/post/view/${article.id}">${article.title}</a></h2>
                                                <div class="post-meta">
                                                    <span class="meta-author"><i class="icon-user"></i><a href="#">Author: ${article.ownerName}</a></span>
                                                    <span class="meta-date"><i class="icon-time"></i>${article.lastEditedDate}</span>
                                <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">${article.answerCount}
                                    comment(s)</a></span>
                                <span class="question-category"><a href="/classroom/${article.classId}"><i
                                        class="icon-group"></i>Class: ${article.className}</a></span>
                                                </div>
                                                <div class="post-content short-text">
                                                    <p>${article.body}</p>
                                                </div><!-- End post-content -->
                                            </div><!-- End post-inner -->
                                        </article>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                        </div>
                        <c:if test="${fn:length(articles)>10}">
                            <a class="post-read-more button color small"
                               style="margin-bottom: 5px;" id="loadMoreArticle">Load more</a>
                        </c:if>
                    </div>
                </div>
            </div><!-- End #article -->

            <div class="divider"><span></span></div>

            <div id="material" class="row">
                <div class="col-md-12">
                    <div class="boxedtitle page-title"><h2>Material</h2></div>
                    <div class="" style="display: block;">
                        <div class="tab-inner">
                            <c:if test="${not empty materials}">
                                <table class="table table-hover" id="materials">
                                    <tr>
                                        <th>No</th>
                                        <th>File name</th>
                                        <th>Uploaded Date</th>
                                        <th>File size</th>
                                        <th>Save to</th>
                                    </tr>
                                    <c:if test="${fn:length(materials)>10}">
                                        <c:forEach var="material" items="${materials}" end="9" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${material.name}</td>
                                                <td>${material.creationDate}</td>
                                                <td>${material.size}</td>
                                                <td><a id="add-to-folder-click" href="#">Folder</a> / <a href="/download/${material.id}"> Computer</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${fn:length(materials)<=10}">
                                        <c:forEach var="material" items="${materials}" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${material.name}</td>
                                                <td>${material.creationDate}</td>
                                                <td>${material.size}</td>
                                                <td><a id="add-to-folder-click" href="#">Folder</a> / <a href="/download/${material.id}"> Computer</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </table>
                            </c:if>
                        </div>
                        <c:if test="${fn:length(materials)>10}">
                            <a class="post-read-more button color small"
                               style="margin-bottom: 5px;" id="loadMoreMaterial">Load more</a>
                        </c:if>
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
<script>
    $(document).ready(function(){
        /*short test for list of posts - MinhKH*/
        $(".short-text").each(function () {
            text = $(this).text();
            if (text.length > 400) {
                $(this).html(text.substr(0, 400) + '.......');
            }
        });
    });
    //Load more
    var questionPage = 2;
    var nextFromArticle = 10;
    var nextFromMaterial = 10;
    $('#loadMoreQuestion').click(function (e) {
        var url = "newsFeed/question/" + questionPage;
        $.ajax({
            type: "GET",
            url: url,
            success: function (data) {
                var newsFeedQuestion = new Array();
                newsFeedQuestion = data;
                var length = newsFeedQuestion.length;
                if (length > 10) {
                    length = newsFeedQuestion.length - 1;
                } else {
                    $('#loadMoreQuestion').hide();
                }
                for (var i = 0; i < length; i++) {
                    var component = '<article class="question question-type-normal">' +
                            '<h2>' +
                            '<a href="/post/view/'+ newsFeedQuestion[i].id + '">'+ newsFeedQuestion[i].title
                            +'</a>' +
                            '</h2>' +
                            '<div class="question-author">' +
                            '<a href="/profile/view/'+ newsFeedQuestion[i].ownerId + '"' +
                            'original-title="'+ newsFeedQuestion[i].ownerName +
                            '" class="tooltip-n">' +
                            '<span></span><img alt="" src="' + newsFeedQuestion[i].ownerProfileImageURL + '"></a>' +
                            '</div>' +
                            '<div class="question-inner">' +
                            '<div class="clearfix"></div>' +
                            '<div class="question-desc short-text">'+ newsFeedQuestion[i].body + '</div>' +
                            '<div class="question-details">' +
                            '<span class="question-answered question-answered-done">';
                    if (newsFeedQuestion[i].acceptedAnswerId===undefined) {
                        component = component + '<i class="icon-ok"></i>Resolved';
                    }
                    component = component + '</span>' +
                            '</div>' +
                            '<span class="question-date"><i ' +
                            'class="icon-time"></i>' + newsFeedQuestion[i].lastEditedDate + '</span>' +
                            '<span class="question-category"><a ' +
                            'href="/classroom/' + newsFeedQuestion[i].classId + '"><i ' +
                            'class="icon-group"></i>Class: ' + newsFeedQuestion[i].className + '</a></span>' +
                            '<span class="question-comment"><a href="#"><i ' +
                            'class="icon-comment"></i>' + newsFeedQuestion[i].answerCount +
                            ' Answer(s)</a></span>' +
                            '<div class="clearfix"></div>' +
                            '</div>' +
                            '</article>';
                    $('#questions').append(component);
                    $(".tooltip-n").tipsy({fade:true,gravity:"s"});
                }
                questionPage++;
            }
        })
    });
    $('#loadMoreArticle').click(function (e) {
        var url = "newsFeed/article/" + nextFromArticle;
        $.ajax({
            type: "GET",
            url: url,
            success: function (data) {
                var articles = new Array();
                articles = data;
                var length = articles.length;
                if (length > 10) {
                    length = articles.length - 1;
                } else {
                    $('#loadMoreArticle').hide();
                }
                for (var i = 0; i < length; i++) {
                    var component = '<article class="post clearfix">'+
                            '<div class="post-inner">'+
                            '<h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a '+
                            'href="/post/view/'+ articles[i].id +'">'+ articles[i].title +'</a></h2>'+
                            '<div class="post-meta">'+
                            '<span class="meta-author"><i class="icon-user"></i><a href="#">Author: ' +
                            articles[i].ownerName + '</a></span>'+
                            '<span class="meta-date"><i class="icon-time"></i>'+ articles[i].lastEditedDate +'</span>'+
                            '<span class="meta-comment"><i class="icon-comments-alt"></i><a' +
                            ' href="#">' + articles[i].answerCount +
                            ' comment(s)</a></span>'+
                            '<span class="question-category"><a href="/classroom/' + articles[i].classId + '"><i '+
                            'class="icon-group"></i>Class: '+ articles[i].className +'</a></span>'+
                            '</div>'+
                            '<div class="post-content short-text">'+
                            '<p>'+ articles[i].body +'</p>'+
                            '</div>'+
                            '</div>'+
                            '</article>';
                    $('#articles').append(component);
                }
                nextFromArticle = nextFromArticle + 10;
            }
        })
    });
    $('#loadMoreMaterial').click(function (e) {
        var url = "/newsFeed/material/" + nextFromMaterial;
        $.ajax({
            type: "GET",
            url: url,
            success: function (data) {
                var materials = new Array();
                materials = data;
                var length = materials.length;
                if (length > 10) {
                    length = materials.length - 1;
                } else {
                    $('#loadMoreMaterial').hide();
                }
                var counter = nextFromMaterial + 1;
                for (var i = 0; i < length; i++) {
                    var component = '<tr>' +
                            '<td>'+ counter + '</td>' +
                            '<td>'+ materials[i].name + '</td>' +
                            '<td>'+ materials[i].creationDate + '</td>' +
                            '<td>' + materials[i].size + '</td>' +
                            '<td><a id="add-to-folder-click" href="#">Folder</a> / <a href="/download/'+ materials[i].id +
                            '">Computer</a></td>' +
                            '</tr>';
                    $('#materials').append(component);
                    counter++;
                }
                nextFromMaterial = nextFromMaterial + 10;
            }
        })
    });
</script>

</body>
</html>