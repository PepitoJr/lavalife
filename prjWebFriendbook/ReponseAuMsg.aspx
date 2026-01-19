<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReponseAuMsg.aspx.cs" Inherits="prjWebFriendbook.ReponseAuMsg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reponse au message</title>
    <style>
        body {
            padding:0;
            margin:0;
        }
#form1 {
     border:1px solid red;
     max-width:450px;
     min-width:320px;
     padding:25px;
     border-radius:10px;
     margin:auto;
     box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15) ;
     margin-block:15px;
     display:flex;
     flex-direction:column;
     justify-content:space-around;
}
 .input {
    border:1px solid red;
    border-radius:10px;
    padding:5px;
    width:100%;
    flex-shrink:0;
    font-size:20px;
 }
 .input:focus {
    outline: 2px solid red;
    font-size:20px;
 }
 .espaceEntreLabel {
    margin-block:3px;
    display:flex;
    flex-direction:column;
    justify-content:space-around;
 }
.btnEnvoyer {
     padding:5px;
     border-radius:10px;
     border:1px solid green;
     font-size:15px;
     font-weight:600;
     background:green;
     margin-block: 25px;
     cursor:pointer;
     color:white;
     padding-block:10px;
}
.btnEnvoyer:hover {
    color:white;
    opacity:75%;
    transition: all 0.3s ease;
}
.btnAnnuler {
     padding:5px;
     border-radius:10px;
     border:1px solid red;
     font-size:15px;
     font-weight:600;
     background:red;
     margin-block: 25px;
     cursor:pointer;
     color:white;
     padding-block:10px;
}
.btnAnnuler:hover {
    color:white;
    opacity:75%;
    transition: all 0.3s ease;
}
.container_btn {
    display:flex;
    justify-content:space-around;
}
p {
    font-size:20px;
}
 header div img {
     height:50px;
 }
 header div{
     max-width:1000px;
     margin:auto;
     display:flex;
     justify-content:space-around;
     align-content:center;
     align-items:center;
 }
 header {
     margin-top:0px;
     box-shadow: 0 0px 20px rgba(0, 0, 0, 0.15) ;
     padding:10px;
 }
    </style>
</head>
<body>
    <div>
      <header>
          <div>
              <img src="mesimages/lavalifelogo.png" alt="Alternate Text" />
              <div>

              </div>
              <asp:Label ID="lblNomMembre" runat="server" />
          </div>
      </header>  
</div>
    <form id="form1" runat="server">
        <div class="espaceEntreLabel">
            <asp:Label ID="lblText" Text="" runat="server" />
        <div>
        <div class="espaceEntreLabel">
            <p>Destinataire:</p>
            
                <asp:DropDownList ID="cboDestinataire" AutoPostBack="true" CssClass="input" runat="server"></asp:DropDownList>
        </div>
        <div class="espaceEntreLabel">
            <p>Sujet:</p>
            
                <asp:TextBox ID="txtSujet" CssClass="input" runat="server"></asp:TextBox>
            
        </div>
        <div class="espaceEntreLabel">
            <p>Messages:</p>
            
                <asp:TextBox ID="txtMessage" TextMode="MultiLine" Height="200px"  CssClass="input" runat="server"></asp:TextBox>
            
        </div>
        <div class="container_btn">
            
                <asp:Button ID="btnEnvoyer" runat="server" Onclick="btnEnvoyer_Click" CssClass="btnEnvoyer" Text="Envoyer" />
            
            
                <asp:Button ID="btnAnnuler" runat="server" Onclick="btnAnnuler_Click" CssClass="btnAnnuler" Text="Annuler" />
            
        </div>

</div>
        </div>
    </form>
</body>
</html>
