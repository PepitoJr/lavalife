<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginFriendbook.aspx.cs" Inherits="prjWebFriendbook.LoginFriendbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <style>
        body{
            background-color:rgb(249, 249, 249);
        }
        header img {
            height:35px;
        }
        .form {
            max-width:550px;
            min-width:320px;
            padding:25px;
            border-radius:10px;
            margin:auto;
           
           margin-block:75px;
           display:flex;
           flex-direction:column;
           justify-content:space-around;
        }
        .inputTexte {
            border:1px solid red;
            border-radius:10px;
            height:25px;
            padding:5px;
            width:100%;
        }
        .inputTexte:focus {
            outline: 2px solid red;
            font-size:20px;
        }
        .btnLogin {
            padding:10px;
            border-radius:25px;
            border:1px solid red;
            font-size:20px;
            font-weight:400;
            background:red;
            margin-block: 25px;
            cursor:pointer;
        }
        .btnLogin:hover {
            color:white;
            opacity:75%;
            transition: all 0.3s ease;
        }
        .espaceEntreLabel {
            margin-block:5px;
        }
        .titreSignIn {
            font-size:30px;
        }
        .choixSexe {
            display:flex;
            justify-content:space-around;
        }
        .msgValidationError {
            color:red;
            text-align:center;
            font-size:20px;
            font-weight:400;
        }
        .lien {
            font-size:20px;
            font-weight:400;
            color:red;
            text-decoration:none;
            margin:15px;
        }
       #imgInscription {
            background-image:url("mesimages/imgLogo.png");
            background-repeat:no-repeat;
            background-position:center;
            background-size:cover;
            width:100%;
            height:50vh;
        }
        #container {
            display:flex;
            max-width:1000px;
            min-width:320px;
            height:70vh;
            justify-content:center;
            align-items:center;
            border-radius:10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15) ;
            margin:auto;
            margin-top:25px;
        }
            #container .container_image {
                background-image:url("mesimages/imgLogo.png");
                width:100%;
                height:100%;
                border-top-left-radius:10px;
                border-bottom-left-radius:10px;
            }
        .container_formulaire {
            height:100%;
            position:relative;

        }
        .container_formulaire .form {
                
          margin:0px;
          top:0px;
        }
       .container_lien_inscription {
            display:flex;
            flex-direction:row;
            justify-content:center;
            align-items:center;
        }
       .separateur{
           width:100%;
           
        
       }
        #form1 p {
            max-width:1200px;
            margin-inline:auto;
            text-align:center;
        }
        header {
            background-color:rgb(245, 245, 245);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <img src="mesimages/lavalifelogo.png" alt="Alternate Text" />
        </header>
        <div id="container">
            <div class="container_image"></div>
            <div class="container_formulaire">
                <div class="form">
                    <h2 class="titreSignIn">Login</h2>
                    <div class="espaceEntreLabel">
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtEmail" CssClass="inputTexte" runat="server"></asp:TextBox>
                    </div>
                    <div class="espaceEntreLabel">
                        <asp:Label ID="lblMdp" runat="server" Text="Mot de Passe:"></asp:Label>
                        <asp:TextBox ID="txtMdp" CssClass="inputTexte" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnLogin" OnClick="btnLogin_Click" Text="Se Connecter" CssClass="btnLogin" runat="server" />
                    <hr class="separateur" />
                    <div class="container_lien_inscription">
                        <span>Don't have an account?</span><asp:LinkButton ID="btnInscrire" OnClick="btnInscrire_Click" CssClass="lien" runat="server">Sign up</asp:LinkButton>
                    </div>
                    
                    <asp:Label ID="lblValidationMsgError" CssClass="msgValidationError" runat="server" />
                </div>
            </div>
        </div>
        <p>All images design and other intellectual materials and copyrights © 2025 Lavalife Ltd. 
    All Rights Reserved. This is an adult service. 
    By selecting any of the options above and/or creating your Lavalife profile, 
    you are confirming that you are 18 years of age or older. 
    Please be sure you have read and agree to our Privacy Policy and Terms of Use.</p>

    </form>
</body>
</html>
