<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>HOME</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	<link href="views/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="views/bootstrap/css/custome-casual.css" rel="stylesheet">
</head>
<body>
	<div class="brand">CAPS</div>
    <div class="address-bar">ISS</div>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               
                <a class="navbar-brand" href=" ">CAPS</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href=" ">Home</a>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                    <li>
                        <a href="login.jsp">LogIn</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="box">
                <div class="col-lg-12 text-center">
                    <div id="carousel-example-generic" class="carousel slide">
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive img-full" src="img/sl1.jpg" alt="1">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/sl2.jpg" alt="2">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/sl3.jpg" alt="3">
                            </div>
                        </div>
                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                    <h2 class="brand-before">
                        <small>Welcome to</small>
                    </h2>
                    <h1 class="brand-name">CAPS project</h1>
                    <hr class="tagline-divider">
                    <h2>
                        <small>By
                            <strong>TEAM 10</strong>
                        </small>
                    </h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Executive Education
                        <strong>worth studying</strong>
                    </h2>
                    <hr>
                    <img class="img-responsive img-border img-left" src="img/intro.jpg" alt="omg">
                    <hr class="visible-xs">
                    <p>Keep abreast of technological trends and stay relevant in the competitive business landscape</p>
                    <p>Our courses offer in-demand skills and knowledge according to technological and business trends. </p>
                    <p>They are designed and delivered by our teaching staff with over 20 years of industry experience. Gain practical insights and applications to stay ahead in a competitive landscape.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Collaboration
                        <strong>to develop your organisation's internal leadership </strong>
                    </h2>
                    <hr>
                    <p>Work with us to solve your challenges.</p>
                    <p>We provide tailored solutions to support leaders and organisations in developing your internal leadership and digital capabilities, so you can excel amidst the demands of an evolving technology landscape.</p>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; TEAM 10 - 2016</p>
                </div>
            </div>
        </div>
    </footer>
    <script src="views/bootstrap/js/jquery.js"></script>
    <script src="views/bootstrap/js/bootstrap.min.js"></script>
    <script>
    $('.carousel').carousel({
        interval: 5000 
    })
    </script>
</body>
</html>