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
    <!--TagInput-->
    <link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="/resource/assets/css/tag.css">

</head>

<body>

<div class="loader">
    <div class="loader_html"></div>
</div>

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
    </div>
    <!-- End signup -->

    <div class="panel-pop" id="lost-password">
        <h2>Lost Password<i class="icon-remove"></i></h2>

        <div class="form-style form-style-3">
            <p>Lost your password? Please enter your username and email address. You will receive a link to create a new
                password via email.</p>

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
    </div>
    <!-- End lost-password -->


    <%@include file="header.jsp" %>

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <h3>Post</h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">

                <div class="page-content ask-question">
                    <div class="boxedtitle page-title"><h2>Create post</h2></div>

                    <div class="form-style form-style-3" id="question-submit">
                        <form method="post" action="/post/create">
                            <input type="hidden" name="classId" value="${classId}">

                            <div class="form-inputs clearfix">
                                <p>
                                    <label class="required">Title<span>*</span></label>
                                    <input type="text" id="question-title" name="postName">
                                    <span class="form-description">Please choose an appropriate title for the question to answer it even easier .</span>
                                </p>

                                <div style="display: flex;height: 42px;">
                                    <p style="width: 18% !important;">
                                        <label class="required">Tag<span>*</span></label>
                                    </p>

                                    <div style="width: 82%">
                                        <input type="text" class="input" name="tag" id="tagsuggest"/>
                                    </div>
                                    <div id="hiddenTag"></div>
                                </div>
                                <%--<input type="text" class="input" name="question_tags" id="question_tags" data-seperator=",">--%>
                                <p>
                                    <span class="form-description">Please choose  suitable Keywords Ex : <span
                                            class="color">question , poll</span> .</span>
                                </p>

                                <p>
                                    <label class="required">Type<span>*</span></label>
									<span class="styled-select" >
										<select name="postType">
                                            <option value="">Select a type</option>
                                            <option value="1">Question</option>
                                            <option value="2">Article</option>
                                        </select>
									</span>
                                    <span class="form-description">Please choose the appropriate section so easily search for your question .</span>
                                </p>
                                <%--<label>Attachment</label>--%>
                                <%--<div class="fileinputs">--%>
                                <%--<input type="file" class="file">--%>
                                <%--<div class="fakefile">--%>
                                <%--<button type="button" class="button small margin_0">Select file</button>--%>
                                <%--<span><i class="icon-arrow-up"></i>Browse</span>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="required">Details<span>*</span></label>
                                </div>
                                <div class="col-md-10">
                                    <div id="form-textarea">
                                        <textarea id="question-details" aria-required="true" cols="58"
                                                  rows="8"></textarea>
                                    </div>
                                    <input type="hidden" name="postDetail" id="postDetail">
                                </div>
                            </div>
                            <p class="form-submit">
                                <input type="submit" id="publish-question" value="Publish Your Post"
                                       class="button color small submit">
                            </p>
                        </form>
                    </div>
                </div>
                <!-- End page-content -->
            </div>
            <!-- End main -->
            <aside class="col-md-3 sidebar">
                <div class="widget">
                    <h3 class="widget_title">About class</h3>
                    <ul class="related-posts">
                        <li class="related-item">
                            <p>This is introductio about class. This is introductio about class.
                                This is introductio about class. </p>

                            <div class="clear"></div>
                            <span>Feb 22, 2014</span>
                        </li>
                    </ul>
                    <div class="row">
                        <div class="col-md-8"></div>
                        <div class="col-md-4">
                            <a href="#" class="button small color">Join</a>
                        </div>
                    </div>
                </div>
                <div class="widget widget_highest_points">
                    <h3 class="widget_title">Class Owner</h3>
                    <ul>
                        <li>
                            <div class="author-img">
                                <a href="#"><img width="60" height="60"
                                                 src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg" alt=""></a>
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

            </aside>
            <!-- End sidebar -->
        </div>
        <!-- End row -->
    </section>
    <!-- End container -->

    <footer id="footer">
        <section class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="widget widget_contact">
                        <h3 class="widget_title">Where We Are ?</h3>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit
                            amet suscipit risus ultrices eu.</p>
                    </div>
                </div>
            </div>
            <!-- End row -->
        </section>
        <!-- End container -->
    </footer>
    <!-- End footer -->
</div>
<!-- End wrap -->
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
<script>
    $(document).ready(function () {
        $('#publish-question').click(function (e) {
            var detail = CKEDITOR.instances['question-details'].getData()
            var postDetail = $('#postDetail')
            postDetail.val(detail) ;
            $('#question-submit').submit();
        });

        CKEDITOR.replace('question-details');
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
    });
</script>
<!-- End js -->

</body>
</html>