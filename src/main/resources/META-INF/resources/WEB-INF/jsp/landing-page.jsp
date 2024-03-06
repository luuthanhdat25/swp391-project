<%@ include file="common/header.jspf" %>
<%@ include file="common/sidebar.jspf" %>

<body>

<div class="main-wrapper">

    <div class="header">

        <div class="header-left">
            <a href="#" class="logo">
                <img src="assets/img/logo.png" alt="Logo">
            </a>
            <a href="#" class="logo logo-small">
                <img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
            </a>
        </div>
        <div class="menu-toggle">
            <a href="javascript:void(0);" id="toggle_btn">
                <i class="fas fa-bars"></i>
            </a>
        </div>

        <div class="top-nav-search">
            <form>
                <input type="text" class="form-control" placeholder="Search here">
                <button class="btn" type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <ul class="nav user-menu">
            <button class="btn btn-rounded btn-outline-danger"><a href="/auth/login">Login</a></button>
            <button class="btn btn-rounded btn-outline-danger"><a href="/auth/registration">Sign up</a></button>
        </ul>

    </div>

    <div class="page-wrapper">
        <div class="card">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block img-fluid" src="assets/img/hero-1.jpg" alt="First slide">
                        <div class="col-lg-12">
                            <div class="hero-text">
                                <h2>Gym On</h2>
                                <h1>FITNESS & NUTRITION</h1>
                                <a href="#" class="primary-btn f-btn">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="assets/img/hero-2.jpg" alt="Second slide">
                        <div class="col-lg-12">
                            <div class="hero-text">
                                <h2>Gym On</h2>
                                <h1>FITNESS & NUTRITION</h1>
                                <a href="#" class="primary-btn f-btn">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="assets/img/hero-3.jpg" alt="Third slide">
                        <div class="col-lg-12">
                            <div class="hero-text">
                                <h2>Gym On</h2>
                                <h1>FITNESS & NUTRITION</h1>
                                <a href="#" class="primary-btn f-btn">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </a>
            </div>
        </div>

        <section class="feature-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div style="background-image: url(assets/img/feature-1.jpg);" class="feature-item set-bg"
                             data-setbg="assets/img/feature-1.jpg">
                            <h3>NUTRITION TRACKING</h3>
                            <p>Stay on top of your nutritional goals effortlessly.<br />Explore the world of
                                nutrition tracking with Gym On</p>
                            <a href="#" class="primary-btn f-btn">Read More</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div style="background-image: url(assets/img/feature-2.jpg);" class="feature-item set-bg"
                             data-setbg="/assets/img/feature-2.jpg">
                            <h3>PERSONAL TRAINING</h3>
                            <p>Achieve your fitness objectives with tailored workout plans <br /> designed by
                                certified personal trainers.</p>
                            <a href="#" class="primary-btn f-btn">Read More</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div style="background-image: url(assets/img/feature-3.jpg);" class="feature-item set-bg"
                             data-setbg="assets/img/feature-3.jpg">
                            <h3>EXERCISE & NUTRITION</h3>
                            <p>Seamlessly integrate your exercise and nutrition routines <br /> for a holistic
                                approach to well-being.</p>
                            <a href="#" class="primary-btn f-btn">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="chooseus-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>Why People Choose Us</h2>
                            <p>Our sport experts and latest sports equipment are the winning combination.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6">
                        <div class="choose-item">
                            <img src="assets/img/chose-icon-1.png" alt="">
                            <h5>Support 24/24</h5>
                            <p>One of the best ways to make a great vacation quickly horrible is to choose the wrong
                                accommodations for your trip. </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="choose-item">
                            <img src="assets/img/chose-icon-2.png" alt="">
                            <h5>Our trainer</h5>
                            <p>If you are an infrequent traveler you may need some tips to keep the wife happy while
                                you are
                                jet setting around the globe.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="choose-item">
                            <img src="assets/img/chose-icon-3.png" alt="">
                            <h5>Personalized sessions</h5>
                            <p>To succeed at any endeavor, you must stay the course…no matter what the cost! Here
                                are some
                                surefire tips to help you on your journey.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="choose-item">
                            <img src="assets/img/chose-icon-4.png" alt="">
                            <h5>Our equipment</h5>
                            <p>Rugby and Stratford-upon-Avon. Additionally, there are many things to see and do in
                                and
                                around Coventry itself.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="choose-item">
                            <img src="assets/img/chose-icon-5.png" alt="">
                            <h5>Classes daily</h5>
                            <p>We would just not have the will in us to go about our daily lives. Its motivation
                                that helps
                                us get through the most mundane.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="choose-item">
                            <img src="assets/img/chose-icon-6.png" alt="">
                            <h5>Focus on your health</h5>
                            <p>But there is only so far we can go within the constraints of a family budget in
                                building the
                                perfect telescopic operation.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="classes-section">
            <div style="background-image: url(assets/img/classes-title-bg.jpg);" class="class-title set-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 m-auto text-center">
                            <div class="section-title pl-lg-4 pr-lg-4 pl-0 pr-0">
                                <h2>Choose Your Goals</h2>
                                <p>Remember to set SMART goals: Specific, Measurable, Achievable, Relevant, and Time-bound.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div style="background-image: url(assets/img/class-1.jpg);" class="classes-item set-bg">
                            <h4>Crossfit Level 1</h4>
                            <p>Sufferers around the globe will be happy to hear that there are sleep apnea remedies.
                            </p>
                            <a href="#" class="primary-btn class-btn">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div style="background-image: url(assets/img/class-2.jpg);" class="classes-item set-bg">
                            <h4>BootCamp</h4>
                            <p>The oil, also called linseed oil, has many industrial uses – it is an important
                                ingredient
                            </p>
                            <a href="#" class="primary-btn class-btn">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div style="background-image: url(assets/img/class-3.jpg);" class="classes-item set-bg">
                            <h4>Energy Blast</h4>
                            <p>It is a very common occurrence like cold or fever depending upon your lifestyle. </p>
                            <a href="#" class="primary-btn class-btn">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div style="background-image: url(assets/img/class-4.jpg);" class="classes-item set-bg">
                            <h4>CLASSIC BODY BALANCE</h4>
                            <p>The procedure is usually a preferred alternative to photorefractive keratectomy,</p>
                            <a href="#" class="primary-btn class-btn">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<script>
    $(document).ready(function(){
        // Add a function to handle the carousel slide event
        $('#carouselExampleFade').on('slide.bs.carousel', function () {
            // Move the hero-text to the center of the active slide
            $('.carousel-item.active .hero-text').css('transform', 'translate(-50%, -50%)');
        });
    });
</script>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="assets/plugins/apexchart/chart-data.js"></script>
<script src="assets/js/script.js"></script>
</body>

</html>