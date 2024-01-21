<%@ include file="common/header.jspf" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!------ Include the above in your HEAD tag ---------->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Activitar | Template</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery and Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Your Custom Styles -->
    <style>
        /* Đặt chiều dài tối đa cho input */
        .custom-input {
            width: 100%; /* Chiều rộng 100% của phần cha */
            height: 100%; /* Bỏ giới hạn chiều rộng */
        }
    </style>

    <!-- Your Custom Scripts -->
    <script>
        function previewFile() {
            var preview = document.getElementById('previewImage');
            var fileInput = document.getElementById('uploadInput');
            var file = fileInput.files[0];

            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            };

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "http://ssl.gstatic.com/accounts/ui/avatar_2x.png";
            }
        }
    </script>
</head>

<body>
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
<%--    <header class="header-section header-normal">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="logo">--%>
<%--                <a href="./index.html">--%>
<%--                    <img src="img/logo.png" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="top-social">--%>
<%--                <a href="#"><i class="fa fa-pinterest-p"></i></a>--%>
<%--                <a href="#"><i class="fa fa-linkedin"></i></a>--%>
<%--                <a href="#"><i class="fa fa-pinterest-p"></i></a>--%>
<%--                <a href="#"><i class="fa fa-youtube-play"></i></a>--%>
<%--                <a href="#"><i class="fa fa-instagram"></i></a>--%>
<%--            </div>--%>
<%--            <div class="container">--%>
<%--                <div class="nav-menu">--%>
<%--                    <nav class="mainmenu mobile-menu">--%>
<%--                        <ul>--%>
<%--                            <li><a href="./index.html">Home</a></li>--%>
<%--                            <li><a href="./about-us.html">About us</a></li>--%>
<%--                            <li><a href="./schedule.html">Schedule</a></li>--%>
<%--                            <li class="active"><a href="./gallery.html">Gallery</a></li>--%>
<%--                            <li><a href="./blog.html">Blog</a>--%>
<%--                                <ul class="dropdown">--%>
<%--                                    <li><a href="./about-us.html">About Us</a></li>--%>
<%--                                    <li><a href="./blog-single.html">Blog Details</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li><a href="./contact.html">Contacts</a></li>--%>
<%--                        </ul>--%>
<%--                    </nav>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div id="mobile-menu-wrap"></div>--%>
<%--        </div>--%>
<%--    </header>--%>
    <hr>
<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-10"><h1>User name</h1></div>
    	<div class="col-sm-2"><a href="/users" class="pull-right"></a></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

            <div class="text-center">
                <img id="previewImage" src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                
                <input type="file" class="text-center center-block file-upload" id="uploadInput" onchange="previewFile()">
            </div>

               
          
          
          
          
          
        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
                <li><a data-toggle="tab" href="#messages">Certificate</a></li>
                
              </ul>

              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
<%--                  <form class="form" action="##" method="post" id="registrationForm">--%>
<%--                      <div class="form-group">--%>
<%--                          --%>
<%--                          <div class="col-xs-6">--%>
<%--                              <label for="first_name"><h4>Name</h4></label>--%>
<%--                              <input type="text" class="form-control" name="name" id="name" placeholder="first name" title="enter your name.">--%>
<%--                          </div>--%>
<%--                      </div>--%>
<%--                      <div class="form-group">--%>
<%--                          --%>
<%--                        <div class="col-xs-6">--%>
<%--                            <label for="phone"><h4>Bank name</h4></label>--%>
<%--                            <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your Bank name">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                      <div class="form-group">--%>
<%--                          --%>
<%--                        <div class="col-xs-6">--%>
<%--                          <label for="last_name"><h4>bank Number</h4></label>--%>
<%--                            <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your Bank Number.">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                      --%>
<%--                    --%>
<%--                      <div class="form-group">--%>
<%--                          --%>
<%--                          <div class="col-xs-6">--%>
<%--                              <label for="phone"><h4>Phone</h4></label>--%>
<%--                              <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">--%>
<%--                          </div>--%>
<%--                      </div>--%>
<%--                      --%>
<%--                      <div class="form-group">--%>
<%--                          <div class="col-xs-6">--%>
<%--                             <label for="mobile"><h4>Mobile</h4></label>--%>
<%--                              <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">--%>
<%--                          </div>--%>
<%--                      </div>--%>
<%--                      <div class="form-group">--%>
<%--                        <div class="col-xs-6">--%>
<%--                           <label for="mobile"><h4> Weight </h4></label>--%>
<%--                            <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <div class="col-xs-6">--%>
<%--                           <label for="mobile"><h4> Height </h4></label>--%>
<%--                            <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                      <div class="form-group">--%>
<%--                          --%>
<%--                          <div class="col-xs-6">--%>
<%--                              <label for="email"><h4>Email</h4></label>--%>
<%--                              <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">--%>
<%--                          </div>--%>
<%--                      </div>--%>
<%--                      <div class="form-group">--%>
<%--                          --%>
<%--                        <div class="col-xs-6">--%>
<%--                            <label for="email"><h4>Day of birth</h4></label>--%>
<%--                            <input type="date" class="form-control" id="location" placeholder="somewhere" title="enter a location">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                      <div class="form-group">--%>
<%--                          --%>
<%--                          <div class="col-xs-6">--%>
<%--                              <label for="email"><h4>Location</h4></label>--%>
<%--                              <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">--%>
<%--                          </div>--%>
<%--                      </div>--%>
<%--                      <div class="form-group">--%>
<%--                          --%>
<%--                        <div class="col-xs-6">--%>
<%--                            <label for="email"><h4>SEX</h4></label>--%>
<%--                            <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                          --%>
<%--                        <div class="col-xs-6">--%>
<%--                            <label for="email"><h4>Price</h4></label>--%>
<%--                            <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <div class="col-xs-12">--%>
<%--                            <label for="email"><h4>Description</h4></label>--%>
<%--                            <!-- Đặt maxlength="-1" để không giới hạn ký tự -->--%>
<%--                            <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email." maxlength="-1">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    --%>
<%--                      --%>
<%--                      --%>
<%--                      <div class="form-group">--%>
<%--                           <div class="col-xs-12">--%>
<%--                                <br>--%>
<%--                              	<button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>--%>
<%--                               	<!-- <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button> -->--%>
<%--                            </div>--%>
<%--                      </div>--%>
<%--              	</form>--%>
                <form:form method="post" modelAttribute="personalTrainer" action="/personal-trainer/profile/update-profile">
                    <form:hidden path="id"/>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <form:input type="text" id="name" path="name" class="form-control" required="required"/>
                        <form:errors path="name" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="bankName" class="form-label">Bank Name</label>
                        <form:input type="text" id="bankName" path="bankName" class="form-control" required="required"/>
                        <form:errors path="bankName" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="bankNumber" class="form-label">Bank Number</label>
                        <form:input type="text" id="bankNumber" path="bankNumber" class="form-control" required="required"/>
                        <form:errors path="bankNumber" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <form:input type="text" id="phone" path="phone" class="form-control" required="required"/>
                        <form:errors path="phone" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="weight" class="form-label">Weight</label>
                        <form:input type="number" id="weight" path="weight" class="form-control" required="required"/>
                        <form:errors path="weight" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="height" class="form-label">Height</label>
                        <form:input type="number" id="dayOfBirth" path="height" class="form-control" required="required"/>
                        <form:errors path="height" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <form:input type="text" id="dayOfBirth" path="email" class="form-control" required="required"/>
                        <form:errors path="email" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="dayOfBirth" class="form-label">Day of birth</label>
                        <form:input type="date" id="dayOfBirth" path="dayOfBirth" class="form-control" required="required"/>
                        <form:errors path="dayOfBirth" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="location" class="form-label">Location</label>
                        <form:input type="text" id="location" path="location" class="form-control" required="required"/>
                        <form:errors path="location" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="sex" class="form-label">Sex</label>
                        <form:select path="sex" class="form-control" required="required">
                            <form:option value="" label="-- Select --" />
                            <form:option value="Male" label="Male" />
                            <form:option value="Female" label="Female" />
                        </form:select>
                        <form:errors path="sex" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label">Price $</label>
                        <form:input type="price" id="price" path="price" class="form-control" required="required"/>
                        <form:errors path="price" cssClass="text-warning"></form:errors>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <form:textarea id="description" path="description" class="form-control" required="required"></form:textarea>
                        <form:errors path="description" cssClass="text-warning"></form:errors>
                    </div>

                    <button type="submit" class="btn btn-primary">Update Profile</button>
                </form:form>



                <hr>
              
             </div><!--/tab-pane-->
             <div class="tab-pane" id="messages">
                <div class="col-sm-6">
                    <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons"></i> <span>Add New Certificate </span></a>
					
                </div>
               <h2></h2>
               


               
               <hr>
                  <form class="form" action="##" method="post" id="registrationForm">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="p-2 px-3 text-uppercase">Image</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Decription</div>
                                </th>
                                
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Edit</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o">
                                <tr>
                                    <th scope="row">
                                        <div class="p-2">
                                            <img src="#" alt="" width="70" class="img-fluid rounded shadow-sm">
                                            
                                        </div>
                                    </th>
                                    <td class="align-middle"><strong>  </strong></td>
                                    
                                    <td class="align-middle"><a href="#" class="text-dark">
                                            <button type="button" class="btn btn-danger">Delete</button>
                                        </a>
                                    </td>
                                </tr> 
                            </c:forEach>
                        </tbody>
                    </table>
                     
              	</form>
               
             </div><!--/tab-pane-->
             
               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->

    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-logo-item">
                        <div class="f-logo">
                            <a href="#"><img src="../../theme1/img/logo.png" alt=""></a>
                        </div>
                        <p>Despite growth of the Internet over the past seven years, the use of toll-free phone numbers
                            in television advertising continues.</p>
                        <div class="social-links">
                            <h6>Follow us</h6>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Our Blog</h5>
                        <div class="footer-blog">
                            <a href="#" class="fb-item">
                                <h6>Most people who work</h6>
                                <span class="blog-time"><i class="fa fa-clock-o"></i> Jan 02, 2019</span>
                            </a>
                            <a href="#" class="fb-item">
                                <h6>Freelance Design Tricks How </h6>
                                <span class="blog-time"><i class="fa fa-clock-o"></i> Jan 02, 2019</span>
                            </a>
                            <a href="#" class="fb-item">
                                <h6>have a computer at home have had </h6>
                                <span class="blog-time"><i class="fa fa-clock-o"></i> Jan 02, 2019</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>Program</h5>
                        <ul class="workout-program">
                            <li><a href="#">Bodybuilding</a></li>
                            <li><a href="#">Running</a></li>
                            <li><a href="#">Streching</a></li>
                            <li><a href="#">Weight Loss</a></li>
                            <li><a href="#">Gym Fitness</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="footer-widget">
                        <h5>Get Info</h5>
                        <ul class="footer-info">
                            <li>
                                <i class="fa fa-phone"></i>
                                <span>Phone:</span>
                                (12) 345 6789
                            </li>
                            <li>
                                <i class="fa fa-envelope-o"></i>
                                <span>Email:</span>
                                Colorlib.info@gmail.com
                            </li>
                            <li>
                                <i class="fa fa-map-marker"></i>
                                <span>Address</span>
                                Iris Watson, Box 283 8562, NY
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="ct-inside"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/masonry.pkgd.min.js"></script>
    <script src="js/main.js"></script>
</body>



                                                      