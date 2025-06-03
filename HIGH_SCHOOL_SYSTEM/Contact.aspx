<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your contact page.</h3>
        <address>
            One Microsoft Way<br />
            Redmond, WA 98052-6399<br />
            <abbr title="Phone">P:</abbr>
            425.555.0100
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
        </address>
    </main>
            <div class="row">
          <section aria-label="mapSection" class=" row">
            <div style="width: 100%; background-color: darkgray; height: 450px; display: flex; justify-content: center; align-items: center; padding: 0;">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4181.327868849989!2d30.87081317555051!3d-29.959752474966308!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1ef654a0265daa87%3A0xa05b3360ec8cefca!2sMenzi%20High%20School!5e1!3m2!1sen!2sza!4v1746761914082!5m2!1sen!2sza"
                style="border: 0; width: 100%; height: 100%;"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>


          </section>
        </div>
</asp:Content>
