<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="/resource/assets/css/tag.css">

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

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <h3>Class</h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">

                <div class="page-content ask-question">
                    <div class="boxedtitle page-title"><h2>Create class</h2></div>

                    <div class="form-style form-style-3" id="question-submit">
                        <form>
                            <div class="form-inputs clearfix">
                                <p>
                                    <label class="required">Class name<span>*</span></label>
                                    <input type="text" id="question-title">
                                    <span class="form-description">Please enter name of class you want to create.</span>
                                </p>
                                <%--<p>--%>
                                    <%--<label>Tags</label>--%>
                                    <%--<input type="text" class="input" name="question_tags" id="question_tags" data-seperator=",">--%>
                                    <%--<span class="form-description">Please choose  suitable Keywords Ex : <span class="color">question , poll</span> .</span>--%>
                                <%--</p>--%>

                                <div style="display: flex;height: 42px;">
                                    <p style="width: 18% !important;">
                                        <label class="required">Tag<span>*</span></label>
                                    </p>
                                    <div style="width: 82%">
                                        <input type="text" class="input" name="tag" id="tagsuggest"/>
                                    </div>
                                    <div id="hiddenTag"></div>
                                </div>
                                <p><span class="form-description form-inputs">Please choose an tag for class to find easier.</span></p>
                                <div style="display: flex;height: 42px;">
                                    <p style="width: 18% !important;">
                                        <label class="required">Student<span>*</span></label>
                                    </p>
                                    <div style="width: 82%">
                                        <input type="text" class="input" name="tag" id="tagsuggest1"/>
                                    </div>
                                    <div id="hiddenTag1"></div>
                                </div>
                                <p><span class="form-description form-inputs">Please choose select students to join in class.</span></p>
                                <p>
                                    <label class="required">Category<span>*</span></label>
									<span class="styled-select">
										<select id="professional">
                                            <option value="">Select a type</option>
                                            <c:forEach var="category" items="${categories}">
                                                <option value="${category.id}">${category.categoryName}</option>
                                            </c:forEach>
                                        </select>
									</span>
                                    <span class="form-description">Please select category os this class.</span>
                                </p>
                                <div id="form-textarea">
                                    <p>
                                        <label class="required">Class's Description<span>*</span></label>
                                        <textarea id="class-description" aria-required="true" cols="58" rows="8" style="width: 82%;"></textarea>
                                        <span class="form-description">Type the description thoroughly and in detail .</span>
                                    </p>
                                </div>
                                <p class="form-submit">
                                    <a href="javascript:createClass();" id="publish-question" class="button color small submit text-center">Create Your Class</a>
                                </p>
                            </div>

                        </form>
                    </div>
                </div><!-- End page-content -->
            </div><!-- End main -->
            <aside class="col-md-3 sidebar">
                <div class="widget widget_highest_points">
                    <h3 class="widget_title">Class Owner</h3>
                    <ul>
                        <li>
                            <div class="author-img">
                                <a href="#"><img width="60" height="60" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg" alt=""></a>
                            </div>
                            <h6><a href="#">${user.displayName}</a></h6>
                            <span class="comment">${user.aboutMe}</span>
                        </li>
                    </ul>
                </div>
                <%--<div class="widget widget_login">
                    <h3 class="widget_title">Invite student</h3>
                    <div class="form-style form-style-2">
                        <form>
                            <div class="form-inputs clearfix">
                                <p class="login-text">
                                    <input type="text" aria-required="true" value="Enter username..." onfocus="if(this.value=='Enter username...')this.value='';"
                                           onblur="if(this.value=='')this.value='Enter username...';" style="width: 100%">
                                    <i class="icon-user"></i>
                                </p>

                            </div>
                        </form>
                        <div class="clearfix"></div>
                    </div>
                </div>--%>

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
<!-- End wrap -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.min.js"></script>
<script src="/resource/assets/js/bootstrapValidator.js"></script>
<script src="/resource/assets/js/validator.js"></script>
<!-- End js -->
//Create Class

<script>
    $(document).ready(function () {
        var tag = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: 'http://localhost:8080/tag/%QUERY'
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
        ///////////////////////////////////////////////
        var student = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: 'http://localhost:8080/findAllStudent/%QUERY'
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
        ///////////////////////////////////////
        var student1 = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
                url: 'http://localhost:8080/findAllStudentNotInClass/3/%QUERY'
            }
        });
        student1.initialize();
        var elt2 = $('#tagsuggest2');
        var hiddenTag = $('#hiddenTag2');
        elt2.tagsinput({
            itemValue: 'studentId',
            itemText: 'studentName',
            typeaheadjs: {
                name: 'student',
                displayKey: 'studentName',
                source: student.ttAdapter()
            }
        });
        elt2.on('itemAdded', function (event) {
            var studentId = event.item.id;
            hiddenTag.append("<input type='hidden' name='tagId' value=" + studentId + " id=tag" + studentId + ">");
        });
        elt2.on('itemRemoved', function (event) {
            var tagId = "#tag" + event.item.id;
            $(tagId).remove();
        });
    });
    function createClass(){
        var classname = $("#question-title").val();
        var tag = $("#tag").val();
        var cate = $("#professional option:selected").val();
        var classDescription = $("#class-description").val();
//        var classroom = {classroomName: classname,classroomDescription: classDescription, categoryId: 1, tag: [{id: 1}, {id: 2}]};
//        var li = $(".taglist li.tag");
        var tagList = $("#tagsuggest").val();
        var student = $('#tagsuggest1').val();
//        for(i=0; i< li.length; i++){
//            tagList+=($($(li[i]).find("span")[0]).text());
//            tagList+=",";
//        }
        var url = "/createClass1";
        $.ajax({
            type: "GET",
            url: url,
            data: "classroomName="+ classname + "&classroomDescription="+classDescription+"&categoryId="+cate+"&tag="+tagList+"&studentList="+student,
            success: function (data) {
                if(data.status == "OK"){
                    window.location.href = "/classroom/"+data.id;
                }else{
                    window.location.href = "/";
                }

            },
            contentType: "application/json"
        });

    }
</script>
</body>
</html>