using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HIGH_SCHOOL_SYSTEM
{
  public partial class FAQs : System.Web.UI.Page
  {
    public class FAQ
    {
      public string Question { get; set; }
      public string Answer { get; set; }
    }

    protected FAQ[] faqList = new FAQ[]
    {
            new FAQ { Question = "When is the application deadline?", Answer = "Applications close on the 30th of November each year. Late applications may be considered under special circumstances." },
            new FAQ { Question = "What are the requirements for applying?", Answer = "You will need your ID or birth certificate, latest report card, and proof of residence. A complete online application form is also required." },
            new FAQ { Question = "Can I apply online?", Answer = "Yes, our entire application process is available online. Visit the Application page and fill in all the required fields." },
            new FAQ { Question = "How do I know if my application was successful?", Answer = "After submitting your application, you will receive an email confirmation. You will also be contacted via phone or SMS once a decision is made." },
            new FAQ { Question = "Is there a registration fee?", Answer = "Yes, a once-off non-refundable registration fee of R500 is payable upon acceptance." },
            new FAQ { Question = "What subjects do you offer?", Answer = "We offer a broad range including Mathematics, Physical Science, Life Sciences, Accounting, History, Geography, English, isiZulu, and Life Orientation." },
            new FAQ { Question = "Are scholarships or bursaries available?", Answer = "Yes. Academic and financial need-based bursaries are available. Contact the school bursar for more details." },
            new FAQ { Question = "Can I visit the school before applying?", Answer = "Absolutely. We host open days every term. Alternatively, private tours can be scheduled by contacting the school office." }
    };

    protected void Page_Load(object sender, EventArgs e)
    {
      if(!IsPostBack)
      {
        faqRepeater.DataSource = faqList;
        faqRepeater.DataBind();
      }

    }
  }
}