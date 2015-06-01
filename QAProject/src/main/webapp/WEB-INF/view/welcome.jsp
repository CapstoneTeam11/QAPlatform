<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/25/2015
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/resource/assets/bootstrap-3.3.4/css/bootstrap.min.css">

    <!-- Boostrap Theme Style -->
    <link rel="stylesheet" href="/resource/assets/bootstrap-3.3.4/css/bootstrap-theme.min.css">

    <!-- Notification Style -->
    <link rel="stylesheet" href="/resource/assets/css/notification.css">

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">

    <!-- Validator -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrapValidator.css">
    <style>

    </style>

</head>

<body>

<div class="loader"><div class="loader_html"></div></div>

<div id="wrap">

<div class="panel-pop" id="signup">
    <h2>Register Now<i class="icon-remove"></i></h2>
    <div class="form-style form-style-3">
        <form >
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


<header id="header" class="index-no-box">
    <section class="container clearfix">

        <div class="row">
            <div class="col-md-3">
                <div class="logo"><a href="/"><img alt="" src="/resource/assets/images/logo.png"></a></div>
            </div>
            <div class="col-md-4"></div>
            <div class="col-md-2">
                <div class="row" style="color: #ffffff;padding-top: 10px;padding-left: 15px;">Username</div>
                <input type="text" style="height: 30px; margin-bottom: 5px" id="username1" data-toggle="tooltip">
                <div class="checkbox" style="color: white; margin-top: 5px;font-size: 13px;">
                    <label><input type="checkbox" value="" checked>Remember me</label>
                </div>
            </div>
            <div class="col-md-2">
                <div class="row" style="color: #ffffff;padding-top: 10px;padding-left: 15px;">Password</div>
                <input type="password" style="height: 30px; margin-bottom: 4px" id="password1" data-toggle="tooltip">
                <a href="#" style="color: white;font-size: 12px;" id="lost-password-click">
                    Forget ?
                </a>
            </div>
            <div class="col-md-1" style="padding-top: 25px">
                <a href="javascript:checkLogin();" class="button small color" style="height: 30px">Login</a>
            </div>
        </div>
    </section><!-- End container -->
</header><!-- End header -->



    <section class="container main-content">
        <div class="login">
            <div class="row">
                <div class="col-md-6">
                    <div class="page-content page-shortcode">
                        <div class="box_icon">
                            <span class="t_center icon_i"><span class="icon_circle" icon_size="50" span_bg="#1abc9c" span_hover="#34495e" style="height: 50px; width: 50px; font-size: 25px; line-height: 50px; background-color: rgb(26, 188, 156);"><i class="icon-bullhorn"></i></span></span>
                            <div class="t_center">
                                <h3>Welcome to Ask me</h3>
                                <p>This is website introduction. This is website introduction. This is website introduction. This is website introduction. This is website introduction.</p>
                            </div>
                        </div>
                    </div>
                </div><!-- End col-md-6 -->
                <div class="col-md-6">
                    <div class="page-content">
                        <h2>Register Now</h2>
                        <form class="form-style form-style-3 form-style-5" id="registrationForm">
                            <div class="form-inputs clearfix">
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Username<span>*</span></label>
                                        <div class="col-md-9">
                                            <input type="text" value="" aria-required="true" id="username" name="username" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Password<span>*</span></label>
                                        <div class="col-md-9">
                                            <input type="password" value="" aria-required="true" id="password" name="password" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Confirm password<span>*</span></label>
                                        <div class="col-md-9">
                                            <input type="password" value="" aria-required="true" name="confirm-password" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Email<span>*</span></label>
                                        <div class="col-md-9">
                                            <input type="text" value="" aria-required="true" id="email" name="email" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Professional<span>*</span></label>
                                        <div class="col-md-9">
                                            <select class="form-control" style="width: 82%;">
                                                <option value="">Select a type</option>
                                                <option value="1">Question</option>
                                                <option value="2">Article</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-md-3">
                                        <label class="required" style="width: auto">Your are<span>*</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="radio">
                                                    <label><input type="radio" name="role" style="width: auto;" value="student" checked>Student</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="radio">
                                                    <label><input type="radio" name="role" style="width: auto;" value="teacher">Teacher</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p class="form-submit">
                                <input name="submit" type="submit" value="Register" class="submit button medium color" style="width: 96%; float: left">
                                    <%--<a href="javascript:register();" class="submit button medium color text-center" style="width: 96%;">Register</a>--%>
                            </p>
                        </form>
                    </div><!-- End page-content -->
                </div><!-- End col-md-6 -->
            </div><!-- End row -->
        </div><!-- End login -->
    </section>

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
<!-- End wrap -->
<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<script src="/resource/assets/js/jquery.min.js"></script>
<script src="/resource/assets/bootstrap-3.3.4/js/bootstrap.min.js"></script>
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
<script src="/resource/assets/js/bootstrapValidator.js"></script>
<script src="/resource/assets/js/validator.js"></script>
<!-- End js -->
<script type="application/javascript">
    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip();
        $('#registrationForm').formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            err: {
                // You can set it to popover
                // The message then will be shown in Bootstrap popover
                container: 'tooltip'
            },
            fields: {
                username: {
                    validators: {
                        notEmpty: {
                            message: 'The username is required'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: 'The username must be more than 6 and less than 30 characters long'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: 'The username can only consist of alphabetical, number, dot and underscore'
                        }
                    }
                },
                email: {
                    err: 'tooltip',
                    validators: {
                        notEmpty: {
                            message: 'The email address is required'
                        },
                        emailAddress: {
                            message: 'The input is not a valid email address'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required'
                        },
                        different: {
                            field: 'username',
                            message: 'The password cannot be the same as username'
                        },
                        identical: {
                            field: 'confirm-password',
                            message: 'The password and its confirm must be the same'
                        }
                    }
                }
            }
        }).on('success.form.fv', function(e) {
            e.preventDefault();
            register();
        });
    });


    function register() {
        var username = $('#username').val();
        var password = $('#password').val();
        var email = $('#email').val();
        var role = $("input[name='role']:checked").val();
        var user = {username: username, password: password, email: email, role: role};
        var url = "/register";
        $.ajax({
            type: "POST",
            url: url,
            data: user,
            success: function () {
                window.location.href = "/getAllPost";
            }
//            dataType: dataType
        });
    }
    function checkLogin(){
        var username = $('#username1').val();
        var password = $('#password1').val();
        if(username == null || username == ""){
            $('#username1').attr('placeholder', "Enter username!");
            return;
        }
        if(password == null || password == ""){
            $('#username1').attr('placeholder', "Enter password!");
            return;
        }
        login();
    }
    function login(){
        var username = $('#username1').val();
        var password = $('#password1').val();
        var url = "/login";
        $.ajax({
            type: "POST",
            url: url,
            data: "username="+username+"&password="+password,
            success: function(data){
                if(data == "OK"){
                    window.location.href="/getAllPost";
                }else{
                    alert("Username or password is incorrect!");
                }

            }
        });
    }




</script>
</body>
</html>
