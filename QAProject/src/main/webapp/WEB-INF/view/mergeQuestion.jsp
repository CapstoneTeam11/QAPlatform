<%--&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: Minh--%>
<%--Date: 6/30/2015--%>
<%--Time: 9:07 AM--%>
<%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>

<%--<!-- Basic Page Needs -->--%>
<%--<meta charset="utf-8">--%>
<%--<title>Ask me – Responsive Questions and Answers Template</title>--%>
<%--<meta name="description" content="Ask me Responsive Questions and Answers Template">--%>
<%--<meta name="author" content="2code.info">--%>



<%--<!-- Mobile Specific Metas -->--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>

<%--<!-- Main Style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/style.css">--%>

<%--<!-- Skins -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/skins/skins.css">--%>

<%--<!-- Responsive Style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/responsive.css">--%>

<%--<!-- Boostrap Style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/bootstrap.min.css">--%>

<%--<!-- Notification Style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/notification.css">--%>

<%--<!-- Favicons -->--%>
<%--<link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">--%>
<%--<!-- Toast message Style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/jquery.toastmessage.css">--%>
<%--<!--TagInput-->--%>
<%--<link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">--%>
<%--<link rel="stylesheet" href="/resource/assets/css/tag.css">--%>
<%--</head>--%>

<%--<body>--%>

<%--<div class="loader"><div class="loader_html"></div></div>--%>
<%@include file="css.jsp" %>
<div id="wrap">


    <%@include file="header.jsp" %>

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <h3>Merge question </h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">
                <div style="display: flex;">
                <input type="range" min="0" max="100" step="10" value="${range}" style="width: 40%" id="rangeMerge">
                <a class="button color small submit" href="/post/merge/${classroom.id}/${range}" id="suggestMergehref" style="margin-left: 5px">Group</a>
                </div>
                <span style="font-weight: bold">Group posts have similar title over</span><span id="range" class="button color small submit" style="color: white;padding: 3px 5px;margin-left: 5px;">${range} %</span>
                <form action="/post/merge" method="GET">
                <input type="hidden" name="id" value="${classroom.id}">
                <table class="table table-hover">
                    <tr>
                        <th>Post name</th>
                        <th></th>
                    </tr>
                    <c:forEach var="post" items="${posts}">
                        <tr>
                            <td><a href="/post/view/${post.id}">${post.title}</a></td>
                            <td><input type="checkbox" class="checkbox" name="postMerges" value="${post.id}"></td>
                        </tr>
                    </c:forEach>
                </table>
                <input type="submit" class="button color small submit" value="merge checked questions">
                </form>
                <div id="respond" class="comment-respond page-content clearfix">
                    <div class="boxedtitle page-title"><h2>Leave a reply</h2></div>
                    <form action="/post/add/all" id="commentform" method="POST" class="comment-form">
                        <div id="hiddenId"></div>
                        <input type="hidden" name="classroomId" value="${classroom.id}">
                        <input type="hidden" name="detail" id="detail">
                        <div id="form-textarea">
                            <textarea id="question-details" aria-required="true" cols="58" rows="8"></textarea>
                        </div>
                        <p class="form-submit" style="width: 100%">
                            <input name="submit" type="submit" id="submit" value="Submit your answer"
                                   class="button small color">
                        </p>
                    </form>
                </div>
            </div><!-- End main -->
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
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>

<!-- End js -->
<script type="text/javascript">
    $(document).ready(function () {
    CKEDITOR.replace('question-details');
        $('#rangeMerge').change(function(e){
            var classroomId = ${classroom.id};
            $('#range').html($(e.currentTarget).val() +'%')
            var href = '/post/merge/'+classroomId+'/'+$(e.currentTarget).val();
            $('#suggestMergehref').attr('href',href);
        })
        $('.checkbox').change(function(e){
            if($(e.currentTarget).is(':checked')) {
                $('#hiddenId').append('<input type="hidden" name="ids" value="'+$(e.currentTarget).val() +'"id="hiddenCheck'+ $(e.currentTarget).val() +'">');
            } else {
                var remove = '#hiddenCheck'+$(e.currentTarget).val();
                $(remove).remove();
            }
        })
        $('#submit').click(function(e){
            var detail = CKEDITOR.instances['question-details'].getData()
            $('#detail').val(detail);
            $('#commentform').submit();
        })
    })
</script>
</body>
</html>
