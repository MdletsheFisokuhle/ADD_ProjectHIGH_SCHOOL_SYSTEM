using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace HIGH_SCHOOL_SYSTEM
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                // Check user role and set the dropdown label
                if (Context.User.IsInRole("Student"))
                {
                    lblOptions.Text = "Student Dashboard";
                }
                else if (Context.User.IsInRole("Admin"))
                {
                    lblOptions.Text = "Admin Dashboard";
                }
                else if (Context.User.IsInRole("Teachers"))
                {
                    lblOptions.Text = "Teachers Dashboard";
                }
                else
                {
                    lblOptions.Text = ""; // Default for other roles
                }
            }
            else
            {
                lblOptions.Text = "";
            }

            liStudent.Visible = true;
            /* Hide all menu items initially
            liCustomer.Visible = false;
            liManageUser.Visible = false;
            liViewOrders.Visible = false;
            liProductTable.Visible = false;
            liOrderManage.Visible = false;
            liReports.Visible = false;
            liRoles.Visible = false;
            liLogs.Visible = false;
            liDelivery.Visible = false;
            liDeliveryEmployee.Visible = false;*/

            // Role-based menu visibility
            if (Context.User.IsInRole("Student"))
            {
                liStudent.Visible = true;
                /*liCustomer.Visible = true;
                liManageUser.Visible = true;
                liViewOrders.Visible = true;
                liDelivery.Visible = true; // Customers can track deliveries*/
            }
            if (Context.User.IsInRole("Admin"))
            {
                /*liProductTable.Visible = true;
                liOrderManage.Visible = true;
                liCustomer.Visible = true; // Employee can also shop*/
            }
    
            if (Context.User.IsInRole("Teachers"))
            {
                /*liProductTable.Visible = true;
                liOrderManage.Visible = true;
                liReports.Visible = true;
                liCustomer.Visible = true; // Owner can also shop
                liRoles.Visible = true;
                liLogs.Visible = true;*/
            }

        }


        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }

}