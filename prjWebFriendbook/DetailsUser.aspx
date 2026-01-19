<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailsUser.aspx.cs" Inherits="prjWebFriendbook.DetailsUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Details utilisateur</title>
    <style>
        body {
            padding:0px;
            margin:0px;
        }
        .cardDetails {
            border:1px solid transparent;
            box-shadow:0 0px 20px rgba(0, 0, 0, 0.15);
            width:50%;

            border-radius:20px;
            display:flex;
            flex-direction:column;
            padding:20px;
            flex-shrink:0;

        }
        .cardDetails:hover {
           border-color:red;
        }
        #btnEcrireMsg {
           border:1px solid transparent;
           box-shadow:0 0px 20px rgba(0, 0, 0, 0.15);
            margin-top:20px;
            max-width:200px;
            margin-inline:auto;
            padding:10px;
            font-weight:600;
            background-color:red;
            color:white;
            border-radius:10px;
            cursor:pointer;
        }
        #btnEcrireMsg:hover {
            box-shadow:0 0px 20px rgba(255, 0, 0, 0.3);
        }
        .titreDetails{
            text-align:center;
            margin-bottom:25px;
            margin-top:5px;
        }
        #form1 {
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            max-width:1000px;
            max-height:1000px;
            min-width:320px;
            min-height:600px;
            margin-inline:auto
        }
        #btnRetourAcc{
            margin-block:20px;
            padding:10px;
            border-radius:10px;
            cursor:pointer;
            font-size:18px;
            color:red;
            border:1px solid red;
            background-color:white;
        }
        #btnRetourAcc:hover {
            box-shadow:0 0px 20px rgba(255, 0, 0, 0.3);
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
    
      <header>
          <div>
              <img src="mesimages/lavalifelogo.png" alt="Alternate Text" />
              <div>

              </div>
              <asp:Label ID="lblNomMembre" runat="server" />
          </div>
      </header>  
    
    <form id="form1" runat="server">
        
        <div class="cardDetails">
            <h2 class="titreDetails">Details de l'utilisateur: </h2>
            <asp:Label Text="" runat="server" ID="lblNomComplet"></asp:Label>
            <asp:Label Text="" runat="server" ID="lblEmail"></asp:Label>
            <asp:Label Text="" runat="server" ID="lblSexe"></asp:Label>
            <asp:Label Text="" runat="server" ID="lblEthnie"></asp:Label>
            <asp:Label Text="" runat="server" ID="lblAge"></asp:Label>
            <asp:Label Text="" runat="server" ID="lblRaison"></asp:Label>
            <asp:Button Text="Envoyer lui un message" ID="btnEcrireMsg" runat="server" OnClick="btnEcrireMsg_Click" />
        </div>
        <asp:Button Text="Retour" ID="btnRetourAcc" OnClick="btnRetourAcc_Click" runat="server" />
    </form>
</body>
</html>
