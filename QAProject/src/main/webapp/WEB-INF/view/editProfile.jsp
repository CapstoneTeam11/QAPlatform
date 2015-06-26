<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/26/2015
  Time: 10:07 AM
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

    <!-- Boostrap Theme Style -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrap-theme.min.css">

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

<%@include file="header.jsp" %>

<div class="breadcrumbs" style="margin-top: 86px">
    <section class="container" style="height:70px; display: flex; align-items: center">
        <div class="row">
            <div class="col-md-12">
                <h3>Profile</h3>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content page-left-sidebar">
<div class="row">
<div class="col-md-9">
    <div class="row">
        <div class="user-profile">
            <div class="col-md-12">
                <div class="page-content">
                    <div class="boxedtitle page-title"><h2>Edit Profile</h2></div>

                    <div class="form-style form-style-4">
                        <div class="form-style form-style-2">
                            <div class="user-profile-img"><img src="${user.profileImageURL}" style="width: 80px;height: 80px"alt="admin" id="profilePicture"></div>
                            <p class="user-profile-p">
                                <label>Profile Picture</label>
                            <div>
                            <form id="uploadImage">
                                <input type="file" class="file" id="imageFile">
                            </form>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <form action="/profile/update" method="post" id="updateForm">
                            <input type="hidden" name="profileUrl" id="profileUrl" value="${user.profileImageURL}">
                            <div class="form-inputs clearfix">
                                <p>
                                    <label class="required">Display Name<span>*</span></label>
                                    <input type="text" name="displayName" value="${user.displayName}">
                                </p>
                                <p>
                                    <%--Blank space--%>
                                </p>
                                <p>
                                    <label class="required">Password<span>*</span></label>
                                    <input type="password" name="password" id="password" value="${user.password}">
                                </p>
                                <p>
                                    <label class="required">Confirm Password<span>*</span></label>
                                    <input type="password" id="confirmPassword" value="${user.password}">
                                </p>
                                <p>
                                    <label class="required">Your area<span>*</span></label>
                                    <span class="styled-select" style="width: 100%;">
                                    <select id="professional" name="cate" title="Please choose your knowledge" required>
                                        <option value="">Select a type</option>
                                        <c:forEach var="parent" items="${categories}">
                                            <c:if test="${parent.parentId==0}">
                                                <optgroup label="${parent.categoryName}">
                                                    <c:forEach var="child" items="${categories}">
                                                        <c:if test="${child.parentId==parent.id}">
                                                            <option value="${child.id}" ${user.categoryId.id == child.id ? 'selected="selected"' : ''}>${child.categoryName}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </optgroup>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                        </span>
                                </p>
                            </div>

                            <div class="form-style form-style-2">

                                <p>
                                    <label class="required">Know about<span>*</span></label>
                                    <c:forEach var="tag" items="${user.tagUserList}">
                                    <input type="hidden" name="tagUpdateId" value="${tag.tagId.id}">
                                    <input type="hidden" name="tagUpdateName" value="${tag.tagId.tagName}">
                                    </c:forEach>
                                    <input type="text" class="input" name="tag" id="tagsuggest"/>
                                <div id="hiddenTag"></div>
                                </p>
                                <p>
                                    <label>About Yourself</label>
                                    <textarea cols="58" rows="8" name="aboutMe">${user.aboutMe}</textarea>
                                </p>
                            </div>
                            <p class="form-submit">
                                <input type="submit" value="Update" id="submitForm" class="button color small login-submit submit">
                            </p>
                        </form>
                    </div>
                </div><!-- End page-content -->
            </div><!-- End col-md-12 -->
        </div><!-- End user-profile -->
    </div><!-- End row -->
    <div class="clearfix"></div>
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget widget_stats">
        <h3 class="widget_title">Stats</h3>
        <div class="ul_list ul_list-icon-ok">
            <ul>
                <li><i class="icon-question-sign"></i>Questions ( <span>20</span> )</li>
                <li><i class="icon-edit"></i>Article ( <span>50</span> )</li>
                <li><i class="icon-group"></i>Class ( <span>7</span> )</li>
            </ul>
        </div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.js"></script>
<script src="/resource/assets/js/bootstrap-tagsinput.min.js"></script>
<script src="/resource/assets/js/bootstrapValidator.js"></script>
<script src="/resource/assets/js/validator.js"></script>
<script src="/resource/assets/js/handlebars-v3.0.3.js"></script>
<script src="https://code.ospry.io/v1/ospry.js"></script>
<!-- End js -->
<script>
    var createTag = function(e){
        var flag = 0;
        for( var i = 0 ; i < elt.tagsinput('items').length ; i ++) {
            if($('.tt-input').val()==elt.tagsinput('items')[i].name) {
                flag = 1;
            }
        }
        if(flag==0) {
            $('#tagsuggest').tagsinput('add', { id: Math.round((Math.random()*10000))*-1, name: $('.tt-input').val() });
            $('.tt-input').val("");
        }
    };
    $(document).ready(function(){
        var ospry = new Ospry('pk-test-dl3a3dy6u9n2dd6rg8as5cyj');
        $('#imageFile').change(function(e) {
          $('#uploadImage').submit();
        })
        $('#uploadImage').submit(function(e){
            e.preventDefault();
            ospry.up({
                form: this,
                imageReady: function(err, metadata, i) {
                    if (err === null) {
                        console.log('Image uploaded to: ' + metadata.url);
                        $('#profilePicture').attr("src",metadata.url);
                        $('#profileUrl').val(metadata.url)
                    } else {

                    }
                }
            });
        });
        $('#submitForm').click(function(e){
            e.preventDefault;
            pass1 = $('#password').val();
            pass2= $('#confirmPassword').val()
            if(pass1!=pass2) {
                $().toastmessage('showErrorToast', "Password not match");
                return false;
            }
            else {
                $('#updateForm').submit();
            }

        })
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
                source: tag.ttAdapter(),
                templates: {
                    empty: [
                        '<div style="display: flex"><span class="unableFind"> unable to find tag</span> <span><a class="button color small" id="createTag" onclick="createTag()" style="margin-left: 5px">Create Now</a></span></div>'
                    ].join('\n'),
                    suggestion: Handlebars.compile('<div><span style="white-space: nowrap">{{name}}</span></div>')
                }
            }
        });
        elt.on('itemAdded', function (event) {
            var idTag = event.item.id;
            if(idTag < 0) {
                var name = event.item.name;
                hiddenTag.append("<input type='hidden' name='newTag' value=" + name + " id=tag" + idTag + ">");
            } else {
                hiddenTag.append("<input type='hidden' name='tagId' value=" + idTag + " id=tag" + idTag + ">");
            }
        });
        elt.on('itemRemoved', function (event) {
            var tagId = "#tag" + event.item.id;
            $(tagId).remove();
        });
        var tagIdUpdate = new Array();
        $("input[name=tagUpdateId]").each(function() {
            tagIdUpdate.push($(this).val());
        });
        var tagNameUpdate = new Array();
        $("input[name=tagUpdateName]").each(function() {
            tagNameUpdate.push($(this).val());
        });
        for(var i = 0 ; i < tagIdUpdate.length ; i++) {
            elt.tagsinput('add', { id: tagIdUpdate[i], name: tagNameUpdate[i] });
        }

    })

</script>
</body>
</html>
