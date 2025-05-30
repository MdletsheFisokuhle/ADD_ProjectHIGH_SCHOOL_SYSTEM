<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

      <section class="row" style="-moz-animation-play-state"  aria-labelledby="imgSection">
        <section class="row">
          <br />
          <asp:Image ID="menziHighImg" runat="server" ImageUrl="~/Pages/menzi_high.jpg" Width="1024px" Height="500px" />
          <br />
        </section>
      </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Discover Future Minds High School</h2>
                <p>
                    At Future Minds High School, we believe in unlocking every learner’s potential. 
                    Our inclusive environment, dedicated teachers, and innovative curriculum provide the perfect foundation for academic excellence and personal growth.
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle">Get more libraries</h2>
                <p>
                    NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle">Web Hosting</h2>
                <p>
                    You can easily find a web hosting company that offers the right mix of features and price for your applications.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
            </section>
        </div>
    </main>

</asp:Content>
