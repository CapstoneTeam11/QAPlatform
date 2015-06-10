<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/21/2015
  Time: 8:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h3>${classroom.classroomName}</h3>
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
        <input type="text" aria-required="true" value="Search in ${classroom.classroomName} class" onfocus="if(this.value=='Search in ${classroom.classroomName} class')this.value='';"
               onblur="if(this.value=='')this.value='Search in ${classroom.classroomName} class';" style="width: 100%">
    </div>
    <div class="col-md-6 col-sm-6">
        <a href="/post/create/1" class="button medium green-button" style="float: right"><i class="icon-pencil"></i> Create post</a>
    </div>

    </div>


<div class="tabs-warp question-tab">
<ul class="tabs">
    <li class="tab"><a href="#" class="current">Questions</a></li>
    <li class="tab"><a href="#">Articles</a></li>
    <li class="tab"><a href="#">Material</a></li>
</ul>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <article class="question question-type-normal">
            <h2>
                <a href="/question">This is my first Question</a>
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
                <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                <div class="clearfix"></div>
            </div>
        </article>
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
                <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                <div class="clearfix"></div>
            </div>
        </article>
        <article class="question question-type-normal">
            <h2>
                <a href="/question">This is my 3rd Question</a>
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
                <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                <div class="clearfix"></div>
            </div>
        </article>
        <a href="#" class="post-read-more button color small" style="margin-bottom: 20px;">Continue reading</a>
    </div>
</div>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <article class="post clearfix">
            <div class="post-inner">
                <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="/article">Post Without Image.</a></h2>
                <div class="post-meta">
                    <span class="meta-author"><i class="icon-user"></i><a href="#">Teacher: Mr.Thang</a></span>
                    <span class="meta-date"><i class="icon-time"></i>September 30 , 2013</span>
                    <span class="meta-comment"><i class="icon-comments-alt"></i><a href="#">15 comments</a></span>
                    <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
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
                    <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
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
                    <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
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
                    <span class="question-category"><a href="#"><i class="icon-group"></i>Class: Advance Java</a></span>
                </div>
                <div class="post-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.</p>
                </div><!-- End post-content -->
            </div><!-- End post-inner -->
        </article>
        <a href="#" class="post-read-more button color small" style="margin-bottom: 20px;">Continue reading</a>
    </div>
</div>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <div class="col-md-3 col-sm-6" style="float: right">
            <a href="/post/create/1" class="button medium green-button" style="float: right;margin-top: -25px;margin-right: -10px;" id="addMaterial-click"><i class="icon-upload"></i> Upload</a>
        </div>
        <table class="table table-hover">
            <tr>
                <th>No</th>
                <th>File name</th>
                <th>Uploaded Date</th>
                <th>File size</th>
                <th>Save to</th>
            </tr>
            <tr>
                <td>1</td>
                <td>Introduction to AJ</td>
                <td>22-05-2015</td>
                <td>1 MB</td>
                <td><a id="add-to-folder-click" href="#">Folder</a> / <a href="/download/4"> Computer</a></td>
            </tr>
        </table>
    </div>
</div>
</div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget">
        <h3 class="widget_title">About class</h3>
        <ul class="related-posts">
            <li class="related-item">
                <p>${classroom.classroomDescription}</p>
                <div class="clear"></div><span>Feb 22, 2014</span>
            </li>
        </ul>
        <a href="javascript:joinClass(${classroom.id})" class="button small color" id="join">Join</a>
    </div>
    <div class="widget widget_login" style="  min-height: 130px;">
        <h3 class="widget_title">Invite student</h3>
        <div class="pull-right" style="width: 100%;">
            <a href="#" id="create-folder-click" class="button medium color" style="width: 100%;text-align: center;"><i class="icon-plus-sign"></i> Invite</a>
        </div>
    </div>
    <div class="widget widget_highest_points">
        <h3 class="widget_title">Class Owner</h3>
        <ul>
            <li>
                <div class="author-img">
                    <a href="#"><img width="60" height="60" src="${userOwner.profileImageURL}" alt=""></a>
                </div>
                <h6><a href="#">${userOwner.displayName}</a></h6>
                <span class="comment">${userOwner.aboutMe}</span>
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
<div class="panel-pop" id="create-folder">
    <h2>Invite student join to class<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form method="post" action="/folder/create">
            <div class="form-inputs clearfix">
                <div style="display: flex;height: 42px;">
                    <p style="width: 18% !important;">
                        <label class="required">Student<span>*</span></label>
                    </p>
                    <div style="width: 82%">
                        <input type="text" class="input" name="tag" id="tagsuggest1"/>
                    </div>
                    <div id="hiddenTag1"></div>
                </div>
            </div>
            <p class="form-submit">
                <a href="javascript:inviteStudent(${classroom.id})" class="button color small submit">Invite</a>
            </p>
        </form>
        <div class="clearfix"></div>
    </div>
</div><!-- End create folder -->
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
        var student = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: 'http://localhost:8080/findAllStudentNotInClass/${classroom.id}/%QUERY'
            }
        });
        student.initialize();
        var elt1 = $('#tagsuggest1');
        var hiddenTag = $('#hiddenTag1');
        elt1.tagsinput({
            itemValue: 'studentId',
            itemText: 'studentName',
            typeaheadjs: {
                name: 'student',
                displayKey: 'studentName',
                source: student.ttAdapter()
            }
        });
        elt1.on('itemAdded', function (event) {
            var studentId = event.item.id;
            hiddenTag.append("<input type='hidden' name='tagId' value=" + studentId + " id=tag" + studentId + ">");
        });
        elt1.on('itemRemoved', function (event) {
            var tagId = "#tag" + event.item.id;
            $(tagId).remove();
        });

    });
    function joinClass(id){
        var url = "/requestJoinClass/"+id;
        $.ajax({
            type: "GET",
            url: url,
//            data: "username="+username+"&password="+password,
            success: function(data){
                if(data == "OK"){
                    $("#join").text("Request sent!").attr("href", "#");
                    $().toastmessage('showSuccessToast', 'Join class request sent!');
                }else{
                    $().toastmessage('showErrorToast', "Join class request fail! Please try again late!");
                }

            }
        });
    }
    function inviteStudent(id){
        var url = "/inviteJoinClass/"+id;
        var name = $("#tagsuggest1").val();
        $.ajax({
            type: "POST",
            url: url,
            data: "studentName="+name,
            success: function(data){
//                if(data == "OK"){
//                    $().toastmessage('showSuccessToast', 'Invatition Sent!');
//                }else{
//                    $().toastmessage('showErrorToast', "Invatition Fails!");
//                }
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

</script>
</body>
</html>