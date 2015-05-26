<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/21/2015
  Time: 8:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en"> <!--<![endif]-->
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

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">

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

<header id="header">
    <section class="container clearfix">
        <div class="logo"><a href="/"><img alt="" src="/resource/assets/images/logo.png"></a></div>
        <nav class="navigation">
            <ul>
                <li class="current_page_item"><a href="index.html">News feed</a></li>
                <li class="ask_question"><a href="ask_question.html">Dashboard</a></li>
                <li><a href="#">Your profile</a></li>
                <li><a href="contact_us.html">About Us</a></li>
                <li><a href="#"><i class="icon-globe" style="font-size: 22px;"></i><span style="color: #ff7361"> 15</span></a></li>
            </ul>
        </nav>
    </section><!-- End container -->
</header><!-- End header -->

<div class="breadcrumbs">
    <section class="container" style="height:70px">
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
<input type="text" aria-required="true" value="Search here" onfocus="if(this.value=='Search here')this.value='';"
       onblur="if(this.value=='')this.value='Search here';" style="width: 100%">
<div class="tabs-warp question-tab">
<ul class="tabs">
    <li class="tab"><a href="#" class="current">Questions</a></li>
    <li class="tab"><a href="#">Article</a></li>
    <li class="tab"><a href="#">Material</a></li>

</ul>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <article class="question question-type-normal">
            <h2>
                <a href="single_question.html">This is my first Question</a>
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
                <span class="question-category"><a href="#"><i class="icon-user"></i>Teacher: Mr.Nguyen</a></span>
                <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                <div class="clearfix"></div>
            </div>
        </article>
        <article class="question question-type-normal">
            <h2>
                <a href="single_question.html">This is my 2nd Question</a>
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
                <span class="question-category"><a href="#"><i class="icon-user"></i>Teacher: Mr.Nguyen</a></span>
                <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                <div class="clearfix"></div>
            </div>
        </article>
        <article class="question question-type-normal">
            <h2>
                <a href="single_question.html">This is my 3rd Question</a>
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
                <span class="question-category"><a href="#"><i class="icon-user"></i>Teacher: Mr.Nguyen</a></span>
                <span class="question-comment"><a href="#"><i class="icon-comment"></i>5 Answer</a></span>
                <div class="clearfix"></div>
            </div>
        </article>
        <a href="single_post.html" class="post-read-more button color small" style="margin-bottom: 20px;">Continue reading</a>
    </div>
</div>
<div class="tab-inner-warp">
    <div class="tab-inner">
        <article class="post clearfix">
            <div class="post-inner">
                <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="single_post.html">Post Without Image.</a></h2>
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
                <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="single_post.html">Post Without Image.</a></h2>
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
                <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="single_post.html">Post Without Image.</a></h2>
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
                <h2 class="post-title"><span class="post-type"><i class="icon-file-alt"></i></span><a href="single_post.html">Post Without Image.</a></h2>
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
        <a href="single_post.html" class="post-read-more button color small" style="margin-bottom: 20px;">Continue reading</a>
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
                <th>Download</th>
            </tr>
            <tr>
                <td>1</td>
                <td>Introduction to AJ</td>
                <td>22-05-2015</td>
                <td>1 MB</td>
                <td></td>
            </tr>
        </table>
    </div>
</div>
</div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">

    <div class="widget widget_highest_points">
        <h3 class="widget_title">Class Ownerr</h3>
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

    <div class="widget">
        <h3 class="widget_title">About class</h3>
        <ul class="related-posts">
            <li class="related-item">
                <p>This is introductio about class. This is introductio about class.
                    This is introductio about class. </p>
                <div class="clear"></div><span>Feb 22, 2014</span>
            </li>
        </ul>
    </div>

    <div class="widget widget_stats">
        <h3 class="widget_title">Stats</h3>
        <div class="ul_list ul_list-icon-ok">
            <ul>
                <li><i class="icon-question-sign"></i>Question ( <span>20</span> )</li>
                <li><i class="icon-file-alt"></i>Article ( <span>50</span> )</li>
            </ul>
        </div>
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

<footer id="footer">
    <section class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="widget widget_contact">
                    <h3 class="widget_title">Where We Are ?</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu.</p>
                </div>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</footer><!-- End footer -->
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<script src="/resource/assets/js/jquery.min.js"></script>
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

</body>
</html>