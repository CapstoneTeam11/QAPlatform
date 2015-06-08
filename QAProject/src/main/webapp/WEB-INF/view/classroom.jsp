<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/21/2015
  Time: 8:31 AM
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
    <link rel="stylesheet" href="/resource/assets/css/notification.css">jquery.toastmessage.css

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
                    <label class="required">Upload Material<span></span></label>
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
</div><!-- End create folder -->

<div class="panel-pop" id="add-to-folder">
    <h2>Add to folder<i class="icon-remove"></i></h2>
    <div style="height: auto; max-height: 300px; overflow-x: hidden;">
        <div class="list-group">
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 1</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 2</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 3</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 4</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 5</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 6</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 7</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 8</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 9</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 10</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 11</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 12</h4>
            </a>
            <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">Folder 13</h4>
            </a>
        </div>
    </div>
</div><!-- End lost-password -->


<%@include file="header.jsp" %>

<div class="breadcrumbs">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Advance Java Class</h3>
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
        <input type="text" aria-required="true" value="Search in Advance Java class" onfocus="if(this.value=='Search in Advance Java class')this.value='';"
               onblur="if(this.value=='')this.value='Search in Advance Java class';" style="width: 100%">
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
        <table class="table table-hover">
            <tr>
                <th>No</th>
                <th>File name</th>
                <th>Uploaded Date</th>
                <th>File size</th>
                <th>Add to folder</th>
                <th>Download</th>
            </tr>
            <tr>
                <td>1</td>
                <td>Introduction to AJ</td>
                <td>22-05-2015</td>
                <td>1 MB</td>
                <td><a id="add-to-folder-click" href="#">Add</a></td>
                <td></td>
            </tr>
        </table>
        <div class="col-md-3 col-sm-6" style="float: right">
            <a href="/post/create/1" class="button medium green-button" style="float: right" id="addMaterial-click"><i class="icon-upload"></i> Upload</a>
        </div>
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