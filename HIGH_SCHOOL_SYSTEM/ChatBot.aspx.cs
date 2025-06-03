using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HIGH_SCHOOL_SYSTEM
{
    public partial class ChatBot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AddMessageToChat("bot", "Welcome to Menzi High School's virtual assistant! How can I help you today?");
            }
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            string userMessage = userMessageInput.Text.Trim();
            if (!string.IsNullOrEmpty(userMessage))
            {
                // Add user message (purple)
                AddMessageToChat("user", userMessage);

                // Get bot response (blue)
                string botResponse = GetBotResponse(userMessage);
                AddMessageToChat("bot", botResponse);

                userMessageInput.Text = string.Empty;
            }
        }

        private void AddMessageToChat(string sender, string message)
        {
            string messageClass = sender == "user" ? "user-message" : "bot-message";
            string timestamp = DateTime.Now.ToString("h:mm tt");

            string messageHtml = $@"
        <div class='message {messageClass}'>
            {message}
            <div class='messageTime'>{timestamp}</div>
        </div>";

            chatLiteral.Text += messageHtml;
            ScriptManager.RegisterStartupScript(this, GetType(), "scrollToBottom", "scrollToBottom();", true);
        }

        private string GetBotResponse(string userMessage)
        {
            string lowerMessage = userMessage.ToLower();

            if (lowerMessage.Contains("admission") || lowerMessage.Contains("apply"))
            {
                return "You can apply online through our admissions page. Requirements include school reports and birth certificate.";
            }
            else if (lowerMessage.Contains("fee") || lowerMessage.Contains("cost"))
            {
                return "Annual tuition is R25,000. Payment plans are available.";
            }
            // ... rest of your response logic ...
            else
            {
                return "I didn't understand. Please ask about admissions, subjects, or school information.";
            }
        }
    }
}