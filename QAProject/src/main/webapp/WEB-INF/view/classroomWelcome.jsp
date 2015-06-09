<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 6/9/2015
  Time: 4:25 PM
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

<div class="panel-pop" id="addMaterial">
    <h2>Upload Material<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/upload" enctype="multipart/form-data">
            <div class="form-inputs clearfix">
                <p>
                    <input type="file" name="fileUpload" size="50">
                </p>
            </div>
            <p class="form-submit">
                <input type="submit" value="Upload" class="button color small submit">
                <input type="hidden" name="classId" value="1">
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End upload material -->

<div class="panel-pop" id="add-to-folder">
    <h2>Add to folder<i class="icon-remove"></i></h2>
    <div style="height: auto; max-height: 300px; overflow-x: hidden;">

        <a href="/library/add/1/4" class="list-group-item">
            <h4 class="list-group-item-heading">Java </h4>
        </a>
        <a href="#" class="list-group-item">
            <h4 class="list-group-item-heading">C# </h4>
        </a>
        <a href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Document 4</h4>
        </a>
        <a href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Piture 5</h4>
        </a>

    </div>
</div><!-- End add to folder -->



<%@include file="header.jsp" %>

<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>AJ Class</h3>
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
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <a href="/createClass">
                    <div class="page-content page-shortcode">
                        <div class="box_icon">
                            <span class="t_center icon_i"><span class="icon_circle" icon_size="50" span_bg="#1abc9c" span_hover="#34495e" style="height: 50px; width: 50px; font-size: 25px; line-height: 50px; background-color: rgb(52, 73, 94);"><i class="icon-pencil"></i></span></span>
                            <div class="t_center">
                                <h3>Create your first post</h3>
                                <p>This class haven't had any post yet. Create first post now.</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget">
        <h3 class="widget_title">About class</h3>
        <ul class="related-posts">
            <li class="related-item">
                <p>This is introductio about class. This is introductio about class.
                    This is introductio about class. </p>
                <div class="clear"></div><span>Feb 22, 2014</span>
            </li>
        </ul>
        <a href="javascript:joinClass(1)" class="button small color">Join</a>
    </div>
    <div class="widget widget_login">
        <h3 class="widget_title">Invite someone</h3>
        <div class="form-style form-style-2">
            <form>
                <div style="display: flex;height: 42px;">
                    <p style="width: 18% !important;">
                        <label class="required">Tag<span>*</span></label>
                    </p>

                    <div style="width: 82%">
                        <input type="text" class="input" name="tag" id="tagsuggest"/>
                    </div>
                    <div id="hiddenTag"></div>
                </div>
                <div class="form-inputs clearfix">
                    <i class="icon-user"></i>
                    <p class="login-text">
                        <input type="text" aria-required="true" placeholder="Enter username..." style="width: 80%" id="studentName" data-role="tagsinput">
                        <a href="javascript:inviteStudent(1)" class="button small color" style="float: right;">Invite</a>
                    </p>
                    <p>

                    </p>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="widget widget_highest_points">
        <h3 class="widget_title">Class Owner</h3>
        <ul>
            <li>
                <div class="author-img">
                    <a href="#"><img width="60" height="60" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg" alt=""></a>
                </div>
                <h6><a href="#">Mr. Thang</a></h6>
                <span class="comment">This is short instroduction of this teacher</span>
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

<!-- End js -->
<script>
    var studentNameList = [];
    $(document).ready(function () {
        makeTag(1);

    });
    function joinClass(id){
        var url = "/requestJoinClass/"+id;
        $.ajax({
            type: "GET",
            url: url,
//            data: "username="+username+"&password="+password,
            success: function(data){
                if(data == "OK"){
                    $().toastmessage('showSuccessToast', 'Join class request sent!');
                }else{
                    $().toastmessage('showErrorToast', "Join class request fail! Please try again late!");
                }

            }
        });
    }
    function inviteStudent(id){
        var url = "/inviteJoinClass/"+id;
        var name = $("#studentName").val();
        $.ajax({
            type: "POST",
            url: url,
            data: "studentName="+name,
            success: function(data){
                if(data == "OK"){
                    $().toastmessage('showSuccessToast', 'Join class request sent!');
                }else{
                    $().toastmessage('showErrorToast', "Join class request fail! Please try again late!");
                }
            }
        });
    }
    function getStudentList(id){
        var url = "/findAllStudentNotInClass/"+id;
        $.ajax({
            type: "POST",
            url: url,
//            data: "studentName="+name,
            success: function(data, callback){
                if(data != null && data.length >0){
                    makeTag(data)
                }else{
                    $().toastmessage('showErrorToast', "Get student name fail! Please try again late!");
                }
            }
        });
    }
    function makeTag(studentNameList){
        var tag = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: 'http://localhost:8080/findAllStudentNotInClass/1/%QUERY'
            }
        });
        tag.initialize();
        elt = $('#tagsuggest');
        var hiddenTag = $('#hiddenTag');
        elt.tagsinput({
            itemValue: 'id',
            itemText: 'name',
            typeaheadjs: {
                name: 'tag',
                displayKey: 'name',
                source: tag.ttAdapter()
            }
        });
        elt.on('itemAdded', function (event) {
            var idTag = event.item.id;
            hiddenTag.append("<input type='hidden' name='tagId' value=" + idTag + " id=tag" + idTag + ">");
        });
        elt.on('itemRemoved', function (event) {
            var tagId = "#tag" + event.item.id;
            $(tagId).remove();
        });
    }
</script>
</body>
</html>
