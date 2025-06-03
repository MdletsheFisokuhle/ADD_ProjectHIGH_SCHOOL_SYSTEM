<%@ Page Title="School Chatbot" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="ChatBot.aspx.cs" Inherits="HIGH_SCHOOL_SYSTEM.ChatBot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Modern color scheme */
        :root {
            --user-color: #6c63ff;  /* Purple for user messages */
            --bot-color: #4a89dc;   /* Blue for bot messages */
            --light: #f8f9fa;
            --dark: #212529;
            --white: #ffffff;
            --gray: #e9ecef;
        }

        /* Main chat container */
        .chat-container {
            max-width: 800px;
            margin: 2rem auto;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background: var(--white);
            display: flex;
            flex-direction: column;
            height: 80vh;
        }

        /* Chat header */
        .chat-header {
            background: linear-gradient(135deg, #4361ee, #3f37c9);
            color: var(--white);
            padding: 1.5rem;
            text-align: center;
            position: relative;
        }

        /* Chat messages area */
        .chat-messages {
            flex: 1;
            padding: 1.5rem;
            overflow-y: auto;
            background-color: #f5f7fb;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        /* Message bubbles */
        .message {
            max-width: 75%;
            padding: 0.75rem 1.25rem;
            border-radius: 1rem;
            line-height: 1.5;
            position: relative;
            animation: fadeIn 0.3s ease-out;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        /* User message styling (questions) */
        .user-message {
            background: var(--user-color);
            color: var(--white);
            border-bottom-right-radius: 0.25rem;
            align-self: flex-end;
            border: 1px solid darken(var(--user-color), 5%);
        }

        /* Bot message styling (answers) */
        .bot-message {
            background: var(--bot-color);
            color: var(--white);
            border-bottom-left-radius: 0.25rem;
            align-self: flex-start;
            border: 1px solid darken(var(--bot-color), 5%);
        }

        /* Message time */
        .message-time {
            display: block;
            font-size: 0.7rem;
            opacity: 0.8;
            margin-top: 0.5rem;
            text-align: right;
            color: rgba(255,255,255,0.7);
        }

        /* Input area */
        .chat-input {
            display: flex;
            padding: 1rem;
            background: var(--white);
            border-top: 1px solid var(--gray);
        }

        .chat-input input {
            flex: 1;
            padding: 0.75rem 1rem;
            border: 1px solid var(--gray);
            border-radius: 2rem;
            font-size: 1rem;
            outline: none;
            transition: all 0.3s ease;
        }

        .chat-input button {
            margin-left: 0.75rem;
            padding: 0.75rem 1.5rem;
            background: var(--user-color);
            color: white;
            border: none;
            border-radius: 2rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        /* Animation and responsive styles remain the same */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .chat-container {
                height: 90vh;
                margin: 0;
                border-radius: 0;
            }
            .message {
                max-width: 85%;
            }
        }
    </style>

    <div class="chat-container">
        <div class="chat-header">
            <h2>Menzi High School Assistant</h2>
            <p>How can I help you today?</p>
        </div>
        
        <div id="chatBox" runat="server" class="chat-messages">
            <asp:Literal ID="chatLiteral" runat="server"></asp:Literal>
        </div>
        
        <div class="chat-input">
            <asp:TextBox ID="userMessageInput" runat="server" 
                placeholder="Ask about admissions, programs, events..." />
            <asp:Button ID="sendButton" runat="server" Text="Send" 
                OnClick="sendButton_Click" />
        </div>
    </div>

    <script type="text/javascript">
        // JavaScript remains the same
        function scrollToBottom() {
            var chatBox = document.getElementById("<%= chatBox.ClientID %>");
            chatBox.scrollTop = chatBox.scrollHeight;
        }
        window.onload = scrollToBottom;
        document.getElementById("<%= userMessageInput.ClientID %>").addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                document.getElementById("<%= sendButton.ClientID %>").click();
            }
        });
    </script>
</asp:Content>