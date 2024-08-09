
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real Estate System</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap" rel="stylesheet">
 
    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Lato:wght@700&display=swap"
        rel="stylesheet">
 
    <link rel="stylesheet" href="./style.css">
 
   <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css">
   
 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Lato:wght@700&display=swap"
    rel="stylesheet">
    
    <style>
    .footer{
  width:100%;
  bottom:0;
}
.socialIcon{
  display: flex;
  justify-content: center;
}
.socialIcon a{
  text-decoration: none;
  padding: 10px;
  margin: 10px;
  border-radius: 50%;
  background-color: rgb(192, 192, 216);
}
.socialIcon a i{
  font-size: 2em;
  color: rgb(7, 7, 6);
  opacity: 0.9;
 
}
.footerNav{
  margin:30px 0; 
}
.footerNav ul {
  display: flex;
  justify-content: center;
  list-style-type: none;
}
.footerNav ul li a{
  color: #fff;
  margin: 20px;
  text-decoration: none;
  font-size: 1.3em;
  opacity: 0.7;
}
.footerbottom{
  padding:10px;
  text-align: center;
}
.navbar
{
  top: 0;
  width: 100%;
}
.align
{
  margin-top: 50px;
  border-radius: 12px;
  background-color: white;
}
body {
  font-family: sans-serif;
  background-color: white;
}
 
.truncate-text {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  /* Number of lines to show */
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}
 
#carouselExampleIndicators {
  max-height: 70vh;
  /* Set the maximum height to 50% of the viewport height */
  overflow: hidden;
  /* Hide any content that overflows the carousel */
}
 
#carouselExampleIndicators img {
  height: 100%;
  /* Set the height of the images to 100% of the carousel container */
  object-fit: cover;
  /* Ensure the images cover the entire container */
}
 
.banner-text {
  font-size: 72px;
  font-weight: bold;
  color: white;
  font-family: 'Lato', sans-serif;
  margin: 0;
  padding: 0;
}
 
.banner-text-2 {
  font-size: 18px;
  font-weight: bold;
  color: white;
  font-family: 'Lato', sans-serif;
  display: block;
  margin: 0;
  padding: 0px 150px;
  text-align: center;
}
 
#banner-button {
  
 
  height: 45px;
  background: white;
  color: black;
  padding: 10px;
  transition: all 0.5s;
  margin-top: 18px;
  cursor: pointer;
}
 
#banner-button:hover {
   background: transparent;
  color: white;
  border: 1px solid white;
}
 
#products {
  margin-top: 50px;
}
 
/* font-family: 'Bacasime Antique', serif; */
 
/* font-family: 'Cinzel', serif; */
 
 
.info-box{
width: 100%;
/* height: 90vh; */
/* border: 1px solid black; */
}
 
.info-container{
width: 80%;
/* border: 2px solid green; */
margin: 80px auto;
display: flex;
}
 
.info-box1{
width: 50%;
height: 60vh;
position: relative;
padding:0px 50px;
}
 
.info-box2{
width: 50%;
padding:0px 50px;
}
 
.img-1{
position: absolute;
right: 0px;
bottom: 0px;
width: 70%;
z-index: 5;
}
.img-1 img{
width: 100%;
object-fit: cover;
height: 35vh;
box-shadow: 0 5px 15px rgba(0,0,0,0.3);
border-radius: 5%;
}
 
.img-2{
position: absolute;
left: 0px;
width: 60%;
}
.img-2 img{
width: 100%;
object-fit: cover;
height: 30vh;
box-shadow: 0 5px 15px rgba(0,0,0,0.3);
border-radius: 5%;
}
 
.info-box2{
/* border: 1px solid black; */
display: flex;
flex-direction: column;
align-items: center;
}
.info-box2 h1{
font-family: 'Cinzel', serif;
}
.info-box2 p{
font-family: 'Bacasime Antique', serif; 
font-size: 18px;
text-align: center;
padding: 0px 25px;
margin-top: 0;
font-weight: 500;
}
 
 
@media only screen and (max-width: 850px) {
 
  .footerNav ul li a{
    color: #fff;
    margin: 20px 10px;
    text-decoration: none;
    font-size: 12px;
    opacity: 0.9;
  }
 
.info-container{
width: 80%;
margin: 5vh auto;
display: flex;
 
flex-direction: column-reverse;
}
 
.info-box2{
width: 100%;
padding:0px 0px;
padding-bottom: 25px;
}
 
.info-box2{
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
}
.info-box2 h1{
font-family: 'Cinzel', serif;
font-size: 25px;
}
.info-box2 p{
font-family: 'Bacasime Antique', serif; 
}
 
 
.info-box1{
width: 100%;
height: 60vh;
position: relative;
padding:0px 0px;
display: none;
}
 
.img-1{
position: absolute;
right: 0px;
bottom: 0px;
width: 80%;
z-index: 5;
}
.img-1 img{
width: 100%;
object-fit: cover;
 
}
 
.img-2{
position: absolute;
left: 0px;
width: 60%;
}
.img-2 img{
width: 100%;
object-fit: cover;
}
 
.banner-text {
font-size: 42px;
font-weight: bold;
color: white;
margin: 0;
padding: 0;
}
 
.banner-text-2 {
font-size: 12px;
font-weight: bold;
color: white;
display: block;
margin: 0;
padding: 0;
}
 
}
 
 
.nav-pills .nav-link {
color: #092a37 ;
}
 
.nav-pills .nav-link.active,
.nav-pills .nav-link.active:focus,
.nav-pills .nav-link.active:hover {
color: white ;
background-color: #092a37;
}
 
/* Optional: Hover styles */
.nav-pills .nav-link:hover {
color: white ;
background-color: #092a37;
}
.btn-product{
background-color: #092a37;
color: white;
}
.btn-product:hover{
border: 1px solid #092a37;
color: #092a37;
}
 
.nav-link.active{
font-family: 'Lato', sans-serif;
}
.navbar-toggler-icon {
color: black; /* Set the color of the hamburger icon */
}
 
    </style>
</head>
 
<body>
   
     <div class="header">
        <h1>Real Estate Management System</h1>
        <div class="navigation">
            <div class="nav-left">
                <%-- <a href="<%= request.getContextPath() %>/index.jsp">Home</a> --%>
               
            </div>
            <div class="nav-right">
               
                    <a href="<%= request.getContextPath() %>/logout">Login</a>
              <a href="<%= request.getContextPath() %>/register">SignUp</a>
            </div>
        </div>
    </div>
   
 
 
    <div style="height: 90vh; position: relative;">
        <img src="./img/banner-index.jpg"
            style="height: 90vh; width: 100%; position: absolute; top: 0; object-fit: cover;" />
        <div style="height: 90vh; width: 100%; position: absolute; top: 0; background-color: black; opacity: 0.3;">
 
        </div>
        <div class="d-flex justify-content-center flex-column align-items-center"
            style="height: 90vh; z-index: 9; position: absolute; top: 0; width: 100%;">
            <p class="banner-text"  >Find Your Dream Home Today</p>
            <p class="banner-text-2">Discover a wide range of properties tailored to your needs and budget. Whether you're buying your first home or seeking a lucrative investment, our expert team is here to guide you every step of the way. Start your journey towards your perfect home with us.</p>
 
            <!-- <a id="banner-button" style="text-decoration: none;">View Properties</a> -->
        </div>
    </div>
 
    <div>
        <h3
            style="text-align: center; margin-top: 55px; font-size: 60px; font-family: 'Dancing Script', cursive;color: #092a37;">
            Welcome To Our Real Estate!
        </h3>
        <hr style="width: 20%;height: 2px;background-color: red;margin:25px auto;">
    </div>
 
    <section class="info-box">
        <div class="info-container" >
                <div class="info-box1" >
                    <div class="img-1" >
                        <img  src="./img/pexels-olly-3760067.jpg" />
                    </div>    
                    
                    
                    <div class="img-2" >
                        <img  src="./img/pexels-scottwebb-1029599.jpg" />
                    </div>
 
 
                </div>
 
                <div class="info-box2">
                    <h5 style="font-weight: bold;font-size: 28px;">Property Listings</h5>
                    <p class="card-text">Explore an extensive collection of residential and commercial properties. Our platform offers detailed listings with high-quality images, virtual tours, and comprehensive descriptions to help you find the perfect match.</p>
                        <br>
 
                        <h5 style="font-weight: bold;font-size: 28px;">Personalized Consultation</h5>
                        <p class="card-text">Receive expert advice tailored to your real estate needs. Our experienced agents provide personalized consultations to help you navigate the buying or selling process, ensuring a smooth and successful transaction</p>
                            <br> 
 
                            <h5 style="font-weight: bold;font-size: 28px;">Market Analysis</h5>
                            <p class="card-text">Stay ahead with our in-depth market analysis. We offer insights into the latest real estate trends, property values, and neighborhood statistics, empowering you to make informed decisions in today's competitive market.</p>
                            
                </div>
        </div>
    </section>
 
  
 
       
   
       
   
 
  
</body>
 
</html>


<%@ include file="footer/footer.jsp" %>
