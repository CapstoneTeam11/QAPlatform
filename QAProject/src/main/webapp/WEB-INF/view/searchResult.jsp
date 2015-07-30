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
                <h3>Search results for <span style="font-size: 20px; font-style: italic">${param.searchKey}</span></h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar" style="min-height: 260px">
<div class="row">
<div class="col-md-10 col-md-offset-1">

<div id="searchbar" class="row">
    <form method="GET" action="/search">
        <div class="" style="padding-left: 15px">
            <select name="filter" style="width: 15%; float: left; margin-top: 5px; padding-bottom: 6px">
                <option value="0">All</option>
                <option value="1">Question</option>
                <option value="2">Article</option>
                <option value="3">Material</option>
                <option value="4">Classroom</option>
                <option value="5">User</option>
            </select>
            <input name="searchKey" type="text" aria-required="true"
                   value="${param.searchKey}"
                   style="width: 72%; margin-top:5px; float: left;">
            <input href="#" class="button small color" style="padding-bottom: 9px; width: 12%;
                        text-align: center" type="submit" value="Search">
        </div>
    </form>
</div><!-- End #searchbar -->
<div id="result-count" style="margin-bottom: 5px;float: right;font-style: italic;">
    Found
    <c:if test="${countQuestion>0}">
        ${countQuestion} <a href="#question">question(s)</a>,
    </c:if>
    <c:if test="${countArticle>0}">
        ${countArticle} <a href="#article">article(s)</a>,
    </c:if>
    <c:if test="${countMaterial>0}">
        ${countMaterial} <a href="#material">material(s)</a>,
    </c:if>
    <c:if test="${countClassroom>0}">
        ${countClassroom} <a href="#classroom">classroom(s)</a>,
    </c:if>
    <c:if test="${countUser>0}">
        ${countUser} <a href="#user">user(s).</a>
    </c:if>
    <c:if test="${countQuestion==0 && countArticle==0 && countMaterial==0 && countClassroom ==0 && countUser==0}">
        no matched result.
    </c:if>
</div>
<div class="divider"><span></span></div>
<span class="anchor-result-page" id="question"></span>
<c:if test="${not empty questions}">
    <div class="row">
    <div class="col-md-12">
        <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
            <h2>
                Question
                <span style="font-size: 15px; text-transform: none"> (${fn:length(questions)} of
                ${countQuestion}) result</span>
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
        <form method="GET" action="/search">
            <input type="hidden" value="1" name="filter">
            <input type="hidden" value="${param.searchKey}" name="searchKey">
            <input class="post-read-more button color small"
                   style="margin: 5px 0px;" type="submit" value="View all question results">
        </form>
    </div>
    </div><!-- End question -->
    <div class="divider"><span></span></div>
</c:if>

    <span class="anchor-result-page" id="article"></span>
    <c:if test="${not empty articles}">
        <div  class="row">
            <div class="col-md-12">
                <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                    <h2>
                        Article
                        <span style="font-size: 15px; text-transform: none"> (${fn:length(articles)} of ${countArticle}
                        result)</span>
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
                <form method="GET" action="/search">
                    <input type="hidden" value="2" name="filter">
                    <input type="hidden" value="${param.searchKey}" name="searchKey">
                    <input class="post-read-more button color small"
                           style="margin: 5px 0px;" type="submit" value="View all article results">
                </form>
            </div>
        </div><!-- End articles -->
        <div class="divider"><span></span></div>
    </c:if>

    <span class="anchor-result-page" id="material"></span>
    <c:if test="${not empty materials}">
    <div  class="row">
    <div class="col-md-12">
        <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
            <h2>
                Material
                <span style="font-size: 15px; text-transform: none"> (${fn:length(materials)} of ${countMaterial}
                    result)</span>
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
            <form method="GET" action="/search">
                <input type="hidden" value="3" name="filter">
                <input type="hidden" value="${param.searchKey}" name="searchKey">
                <input class="post-read-more button color small"
                       style="margin: 5px 0px;" type="submit" value="View all material results">
            </form>
        </div>
    </div>
    </div><!-- End #material -->
        <div  class="divider"><span></span></div>
    </c:if>

    <span class="anchor-result-page" id="classroom"></span>
    <c:if test="${not empty classrooms}">
        <div class="row">
            <div class="col-md-12">
                <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                    <h2>
                        Classroom
                        <span style="font-size: 15px; text-transform: none"> (${fn:length(classrooms)} of ${countClassroom}
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
                <form method="GET" action="/search">
                    <input type="hidden" value="4" name="filter">
                    <input type="hidden" value="${param.searchKey}" name="searchKey">
                    <input class="post-read-more button color small"
                           style="margin: 5px 0px;" type="submit" value="View all classroom results">
                </form>
            </div>
        </div><!-- End classrooms -->
        <div class="divider"><span></span></div>
    </c:if>

<span class="anchor-result-page" id="user"></span>
<c:if test="${not empty users}">
    <div class="row">
        <div class="col-md-12">
            <div class="boxedtitle page-title" style="margin-bottom: 5px !important;">
                <h2>
                    User
                    <span style="font-size: 15px; text-transform: none"> (${fn:length(users)} of ${countUser}
                        result)</span>
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
            <form method="GET" action="/search">
                <input type="hidden" value="5" name="filter">
                <input type="hidden" value="${param.searchKey}" name="searchKey">
                <input class="post-read-more button color small"
                   style="margin: 5px 0px;" type="submit" value="View all user results">
            </form>
        </div>
    </div><!-- End users -->
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
            text = $(this).html();
            if (text.length > 400) {
                $(this).html(text.substr(0, 400) + '.......');
            }
        });
    });
</script>

</body>
</html>