<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 7/6/2015
  Time: 8:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="css.jsp" %>
<div id="wrap">


<%@include file="header.jsp" %>

<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Search results for <span style="font-size: 20px; font-style: italic">${searchKey}</span></h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
<div class="row">
<div class="col-md-10 col-md-offset-1">

<div id="searchbar" class="row">
    <form method="POST" action="/search">
        <div class="" style="padding-left: 15px">
            <select name="filter" style="width: 15%; float: left; margin-top: 5px; padding-bottom: 4px">
                <option value="0">All</option>
                <option value="1">Question</option>
                <option value="2">Article</option>
                <option value="3">Material</option>
                <option value="4">User</option>
                <option value="5">Classroom</option>
            </select>
            <input name="searchKey" type="text" aria-required="true"
                   value="${searchKey}"
                   style="width: 72%; margin-top:5px; float: left;">
            <input href="#" class="button small color" style="padding-bottom: 9px; width: 12%;
                        text-align: center" type="submit" value="Search">
        </div>
    </form>
</div><!-- End #searchbar -->
<div id="result-count" style="margin-bottom: 5px;float: right;font-style: italic;">
    242 <a href="#question">questions</a>,
    334 <a href="#article">articles</a>,
    654 <a href="#material">materials</a>,
    4353 <a href="#classroom">classrooms</a>,
    43 <a href="#user">users</a> are found
</div>

<div class="divider"><span></span></div>
<c:if test="${not empty questions}">
    <div id="question" class="row">
    <div class="col-md-12">
        <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
            <h2>
                Question
                <span style="font-size: 15px; text-transform: none"> (${fn:length(questions)} of 222 result)</span>
            </h2>
        </div>

        <div class="page-content page-content-user">
            <div class="user-questions">
                <c:forEach var="question" items="${questions}">
                    <article class="question user-question">
                        <h3>
                            <a href="/post/view/${question.id}">${question.title}</a>
                        </h3>
                        <div class="question-type-main"><i class="icon-question-sign"></i>Question</div>
                        <div class="question-content">
                            <div class="question-bottom">
                                ${question.body}
                            </div>
                        </div>
                    </article>
                </c:forEach>
            </div>
        </div>
        <form method="POST" action="/search/question">
            <input type="hidden" value="${searchKey}" name="searchKey">
            <a class="post-read-more button color small"
               style="margin: 5px 0px;" >View all question results</a>
        </form>
    </div>


    </div><!-- End question -->
    <div class="divider"><span></span></div>
</c:if>


    <c:if test="${not empty articles}">
        <div id="article" class="row">
            <div class="col-md-12">
                <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                    <h2>
                        Article
                        <span style="font-size: 15px; text-transform: none"> (${fn:length(articles)} of 222 result)</span>
                    </h2>
                </div>

                <div class="page-content page-content-user">
                    <div class="user-questions">
                        <c:forEach var="article" items="${articles}">
                            <article class="question user-question">
                                <h3>
                                    <a href="/post/view/${article.id}">${article.title}</a>
                                </h3>
                                <div class="question-type-main"><i class="icon-edit"></i>Article</div>
                                <div class="question-content">
                                    <div class="question-bottom">
                                        ${article.body}
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </div>
                <form method="POST" action="/search/article">
                    <input type="hidden" value="${searchKey}" name="searchKey">
                    <a class="post-read-more button color small"
                       style="margin: 5px 0px;" >View all article results</a>
                </form>
            </div>
        </div><!-- End articles -->
        <div class="divider"><span></span></div>
    </c:if>

    <c:if test="${not empty materials}">
    <div id="material" class="row">
    <div class="col-md-12">
        <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
            <h2>
                Material
                <span style="font-size: 15px; text-transform: none"> (${fn:length(materials)} of 222 result)</span>
            </h2>
        </div>
        <div class="" style="display: block;">
            <div class="tab-inner">
                <table class="table table-hover" id="materials">
                    <tr>
                        <th>No</th>
                        <th>File name</th>
                        <th>Uploaded Date</th>
                        <th>File size</th>
                        <th>Save to</th>
                    </tr>
                        <c:forEach var="material" items="${materials}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${material.name}</td>
                                <td>${material.creationDate}</td>
                                <td>${material.size}</td>
                                <td><a id="add-to-folder-click" href="#">Folder</a> / <a href="/download/${material.id}"> Computer</a></td>
                            </tr>
                        </c:forEach>
                </table>
            </div>
            <form method="POST" action="/search/material">
                <input type="hidden" value="${searchKey}" name="searchKey">
                <a class="post-read-more button color small"
                   style="margin: 5px 0px;" >View all material results</a>
            </form>
        </div>
    </div>
    </div><!-- End #material -->
    <div class="divider"><span></span></div>
    </c:if>

    <c:if test="${not empty classrooms}">
        <div id="classroom" class="row">
            <div class="col-md-12">
                <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                    <h2>
                        Classroom
                        <span style="font-size: 15px; text-transform: none"> (${fn:length(classrooms)} of 222
                            result)</span>
                    </h2>
                </div>

                <div class="page-content page-content-user">
                    <div class="user-questions">
                        <c:forEach var="classroom" items="${classrooms}">
                            <article class="question user-question">
                                <h3>
                                    <a href="/classroom/${classroom.id}">${classroom.classroomName}</a>
                                </h3>
                                <div class="question-type-main"><i class="icon-group"></i>Classroom</div>
                                <div class="question-content">
                                    <div class="question-bottom">
                                            ${classroom.classroomDescription}
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </div>
                <form method="POST" action="/search/classroom">
                    <input type="hidden" value="${searchKey}" name="searchKey">
                    <a class="post-read-more button color small"
                       style="margin: 5px 0px;" >View all classroom results</a>
                </form>
            </div>
        </div><!-- End articles -->
        <div class="divider"><span></span></div>
    </c:if>

<c:if test="${not empty users}">
    <div id="user" class="row">
        <div class="col-md-12">
            <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                <h2>
                    User
                    <span style="font-size: 15px; text-transform: none"> (${fn:length(users)} of 222 result)</span>
                </h2>
            </div>

            <div id="commentlist" class="page-content" style="margin-bottom: 0px">
                <ol class="commentlist clearfix" id="commentListDetail">
                    <c:forEach var="user" items="${users}">
                        <li class="comment">
                            <div class="comment-body comment-body-answered clearfix">
                                <div class="avatar"><img alt="" src="${user.profileImageURL}">
                                </div>
                                <div class="comment-text">
                                    <div class="author clearfix" style="display: flex">
                                        <div style="width: 30%">
                                            <div class="comment-author"><a href="/profile/view/${user.id}">${user.displayName}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="textComment"><p class="textBody">${user.aboutMe}</p></div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ol>
            </div>
            <form method="POST" action="/search/user">
                <input type="hidden" value="${searchKey}" name="searchKey">
                <a class="post-read-more button color small"
                   style="margin: 5px 0px;" >View all user results</a>
            </form>
        </div>
    </div><!-- End articles -->
</c:if>

</div><!-- End main -->
</div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->
<!-- End wrap -->
<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>
<!-- End js -->
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