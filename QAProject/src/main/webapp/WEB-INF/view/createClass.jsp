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

    <script src="/resource/assets/ckeditor/ckeditor.js"></script>

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
        <div class="logo"><a href="index.html"><img alt="" src="resource/assets/images/logo.png"></a></div>
        <nav class="navigation">
            <ul>
                <li class="current_page_item"><a href="index.html">Home</a></li>
                <li class="ask_question"><a href="ask_question.html">Ask Question</a></li>
                <li><a href="/classroom">Class</a></li>
                <li><a href="user_profile.html">Account</a>
                    <ul>
                        <li><a href="user_profile.html">Edit Profile</a></li>
                        <li><a href="user_questions.html">User Follower</a></li>
                        <li><a href="user_answers.html">User Class</a></li>
                        <li><a href="user_favorite_questions.html">User Favorite Questions</a></li>
                    </ul>
                </li>
                <li><a href="contact_us.html">About Us</a></li>
                <li>
                    <div class="header-search">
                        <form>
                            <input type="text" value="Search here ..." onfocus="if(this.value=='Search here ...')this.value='';" onblur="if(this.value=='')this.value='Search here ...';">
                            <button type="submit" class="search-submit"></button>
                        </form>
                    </div>
                </li>
            </ul>
        </nav>
    </section><!-- End container -->
</header><!-- End header -->

<div class="breadcrumbs">
    <section class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Create Your Class</h1>
            </div>
            <div class="col-md-12">
                <div class="crumbs">
                    <a href="#">Dashboard</a>
                    <span class="crumbs-span">/</span>
                    <span class="current">Create Class</span>
                </div>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->

<section class="container main-content">
    <div class="row">
        <div class="col-md-9">
            <div class="clearfix"></div>

            <div class="tabs-warp question-tab">
                <div class="page-content ask-question">
                    <div class="boxedtitle page-title"><h2>Create Class</h2></div>
                    <div class="form-style form-style-3" id="question-submit">
                        <form>
                            <div class="form-inputs clearfix">
                                <p>
                                    <label class="required">Title<span>*</span></label>
                                    <input type="text" id="question-title">
                                    <span class="form-description">Please choose an appropriate title for the question to answer it even easier .</span>
                                </p>
                                <p>
                                    <label>Tags</label>
                                    <input type="text" class="input" name="question_tags" id="question_tags" data-seperator="," style="display: none;"><ul class="taglist"><li class="input"><span style="display: none;"></span></li></ul>
                                <span class="form-description">Please choose  suitable Keywords Ex : <span class="color">question , poll</span> .</span>
                                </p>
                                <p>
                                    <label class="required">Category<span>*</span></label>
									<span class="styled-select" style="width: 40%;">
										<select>
                                            <option value="">Select Category</option>
                                            <option value="1">IT</option>
                                            <option value="2">Computer Science</option>
                                            <option value="2">finance and banking</option>
                                        </select>
									</span>
									<span class="styled-select " style="width: 40%;margin-left: 13px;">
										<select>
                                            <option value="">Select Sub Category</option>
                                            <option value="1">Java</option>
                                            <option value="2">C#</option>
                                            <option value="2">Linux</option>
                                        </select>
									</span>
                                    <span class="form-description">Please choose the appropriate section so easily search for your Class .</span>
                                </p>


                                <label>Attachment</label>
                                <div class="fileinputs">
                                    <input type="file" class="file">
                                    <div class="fakefile">
                                        <button type="button" class="button small margin_0">Select file</button>
                                        <span><i class="icon-arrow-up"></i>Browse</span>
                                    </div>
                                </div>

                            </div>
                            <div style="display : flex;">
                                <label class="required">Detail<span>*</span></label>
                                <div id="form-textarea" style="width: 82%;">
                                    <p>
                                        <textarea id="question-details" name="question-details" aria-required="true" rows="10" cols="80"></textarea>
                                        <script>
                                            CKEDITOR.replace( 'question-details' );
                                        </script>
                                        <span class="form-description">Type the description thoroughly and in detail .</span>
                                    </p>
                                </div>
                            </div>
                            <p class="form-submit">
                                <input type="submit" id="publish-question" value="Publish Your Class" class="button color small submit">
                            </p>
                        </form>
                    </div>
                </div>
            </div><!-- End page-content -->
        </div><!-- End main -->
        <aside class="col-md-3 sidebar">



            <div class="widget widget_stats">
                <h3 class="widget_title">Hi, Nhu Khang</h3>
                <div class="ul_list ul_list-icon-ok">
                    How to Ask

                    Is your question about programming?

                    We prefer questions that can be answered, not just discussed.

                    Provide details. Share your research.

                    If your question is about this website, ask it on meta instead.
                </div>
            </div>

            <div class="widget">
                <h3 class="widget_title">Recent class</h3>
                <ul class="related-posts">
                    <li class="related-item">
                        <h3><a href="#">This is my recent class 1</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <div class="clear"></div><span>Feb 22, 2014</span>
                    </li>
                    <li class="related-item">
                        <h3><a href="#">This is my recent class 2</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <div class="clear"></div><span>Feb 22, 2014</span>
                    </li>
                </ul>
                <a href="#" style="padding-left: 160px">View all</a>
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
                    <ul>
                        <li>
                            <span>Address :</span>
                            Ask Me Network, 33 Street, syada Zeinab, Cairo, Egypt.
                        </li>
                        <li>
                            <span>Support :</span>Support Telephone No : (+2)01111011110
                        </li>
                        <li>Support Email Account : info@example.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <div class="widget">
                    <h3 class="widget_title">Quick Links</h3>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="ask_question.html">Ask Question</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="cat_question.html">Questions</a></li>
                        <li><a href="user_profile.html">Users</a></li>
                        <li><a href="blog_1.html">Blog</a></li>
                        <li><a href="right_sidebar.html">Pages</a></li>
                        <li><a href="shortcodes.html">Shortcodes</a></li>
                        <li><a href="contact_us.html">Contact Us</a></li>
                        <li><a href="#">FAQs</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget">
                    <h3 class="widget_title">Popular Questions</h3>
                    <ul class="related-posts">
                        <li class="related-item">
                            <h3><a href="#">This is my first Question</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam.</p>
                            <div class="clear"></div><span>Feb 22, 2014</span>
                        </li>
                        <li class="related-item">
                            <h3><a href="#">This Is My Second Poll Question</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam.</p>
                            <div class="clear"></div><span>Feb 22, 2014</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget widget_twitter">
                    <h3 class="widget_title">Latest Tweets</h3>
                    <div class="tweet_1"></div>
                </div>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</footer><!-- End footer -->
<footer id="footer-bottom">
    <section class="container">
        <div class="copyrights f_left">Copyright 2014 Ask me | <a href="#">By 2code</a></div>
        <div class="social_icons f_right">
            <ul>
                <li class="twitter"><a original-title="Twitter" class="tooltip-n" href="#"><i class="social_icon-twitter font17"></i></a></li>
                <li class="facebook"><a original-title="Facebook" class="tooltip-n" href="#"><i class="social_icon-facebook font17"></i></a></li>
                <li class="gplus"><a original-title="Google plus" class="tooltip-n" href="#"><i class="social_icon-gplus font17"></i></a></li>
                <li class="youtube"><a original-title="Youtube" class="tooltip-n" href="#"><i class="social_icon-youtube font17"></i></a></li>
                <li class="skype"><a original-title="Skype" class="tooltip-n" href="skype:#?call"><i class="social_icon-skype font17"></i></a></li>
                <li class="flickr"><a original-title="Flickr" class="tooltip-n" href="#"><i class="social_icon-flickr font17"></i></a></li>
                <li class="rss"><a original-title="Rss" class="tooltip-n" href="#"><i class="social_icon-rss font17"></i></a></li>
            </ul>
        </div><!-- End social_icons -->
    </section><!-- End container -->
</footer><!-- End footer-bottom -->
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
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