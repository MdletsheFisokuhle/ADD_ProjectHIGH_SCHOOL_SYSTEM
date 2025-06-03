<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Banner Styles with Grey Effect */
        .banner-container {
            position: relative;
            width: 100%;
            height: 500px;
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .banner-slide {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }
        
        .banner-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: grayscale(80%) brightness(70%);
        }
        
        .banner-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            width: 100%;
            z-index: 10;
        }
        
        .banner-text h2 {
            color: white;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            font-size: 3em;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 15px;
            border-radius: 8px;
        }

        /* ChatBot Styles (unchanged) */
        #chatBotIcon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 60px;
            height: 60px;
            background-image: url('https://cdn-icons-png.flaticon.com/512/3062/3062634.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            cursor: pointer;
            z-index: 1000;
        }

        #chatBotIcon:hover {
            transform: scale(1.1);
        }

        .chatBotTooltip {
            position: fixed;
            bottom: 90px;
            right: 20px;
            background-color: #8B0000;
            color: #fff;
            padding: 10px 15px;
            border-radius: 8px;
            font-size: 14px;
            font-family: Arial, sans-serif;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 999;
            transition: opacity 0.3s ease;
            opacity: 0;
        }

        #chatBotIcon:hover + .chatBotTooltip {
            opacity: 1;
        }
    </style>

    <!-- Image Banner Section with Grey Effect -->
    <div class="banner-container">
        <!-- Banner images -->
        <div class="banner-slide">
            <img src="images/1.jpg" alt="Menzi High School Image 1">
        </div>
        <div class="banner-slide">
            <img src="images/2.jpg" alt="Menzi High School Image 2">
        </div>
        <div class="banner-slide">
            <img src="images/3.jpg" alt="Menzi High School Image 3">
        </div>
        <div class="banner-slide">
            <img src="images/4.jpg" alt="Menzi High School Image 4">
        </div>
        
        <!-- Welcome text overlay -->
        <div class="banner-text">
            <h2>Welcome to Menzi High School</h2>
        </div>
    </div>

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">MENZI HIGH SCHOOL</h1>
            <h5 id="IntroTitle">Empowering Future Leaders Through Quality Education</h5>
            <p class="lead"> 
                At MENZI HIGH SCHOOL, we are committed to providing a nurturing environment where every learner is given the opportunity to grow, explore, and succeed. 
                Our dedicated educators and modern facilities create a space where academic excellence and character development go hand in hand.
                Menzi high situated at Umlazi N is undoubtedly one of the best schools to come out of KwaZulu-Natal in the last decade or so. 
                Menzi High School is situated at Umlazi N. The School is known for best results and music.
            </p>
            <p><a href="/About" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Academic Excellence</h2>
                <p>
                    Our rigorous curriculum and dedicated faculty ensure students receive a world-class education that prepares them for university and beyond.
                </p>
                <p><a href="/Academics" class="btn btn-default">Learn more &raquo;</a></p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle">Extracurricular Activities</h2>
                <p>
                    From sports to arts to debate, we offer diverse programs that help students develop their talents and interests outside the classroom.
                </p>
                <p><a href="/Activities" class="btn btn-default">Learn more &raquo;</a></p>
            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle">Admissions</h2>
                <p>
                    Learn about our admissions process, requirements, and how to apply to become part of the Menzi High School family.
                </p>
                <p><a href="/Pages/Application" class="btn btn-default">Learn more &raquo;</a></p>
            </section>
        </div>
    </main>

    <!-- ChatBot Implementation (unchanged) -->
    <div class="chatBotTooltip">Hello, Chat with me for help!</div>
    <div id="chatBotIcon" onclick="window.location.href='/ChatBot';"></div>

    <!-- JavaScript for the banner carousel -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const slides = document.querySelectorAll('.banner-slide');
            let currentSlide = 0;

            // Show first slide
            if (slides.length > 0) {
                slides[currentSlide].style.opacity = '1';

                // Rotate slides every 3 seconds
                setInterval(function () {
                    // Hide current slide
                    slides[currentSlide].style.opacity = '0';

                    // Move to next slide
                    currentSlide = (currentSlide + 1) % slides.length;

                    // Show next slide
                    slides[currentSlide].style.opacity = '1';
                }, 3000);
            }
        });
    </script>
</asp:Content>