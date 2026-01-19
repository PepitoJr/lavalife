<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InscriptionFriendbook.aspx.cs" Inherits="prjWebFriendbook.InscriptionFriendbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inscription</title>
    <style>
          body{
              background-color:rgb(249, 249, 249);
          }
          header img {
            height:35px;
          }
        .form {
            border:1px solid red;
            max-width:450px;
            min-width:320px;
            padding:25px;
            border-radius:10px;
            margin:auto;
           box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15) ;
           margin-block:10px;
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
        .btnEnregistrer {
            padding:5px;
            border-radius:20px;
            border:1px solid red;
            font-size:15px;
            font-weight:600;
            background:red;
            margin-block: 25px;
            cursor:pointer;
            color:white;
            padding-block:10px;
        }
        .btnEnregistrer:hover {
            color:white;
            opacity:75%;
            transition: all 0.3s ease;
        }
        .espaceEntreLabel {
            margin-block:3px;
            display:flex;
            flex-direction:column;
            justify-content:space-around;
        }
        .titreSignUp {
            font-size:30px;
            color:red;
            text-align:center;
            margin-bottom:1px;
            padding-bottom:1px;
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
        #etape1 {
            padding-block:10px;
            padding-inline:15px;
            border-radius:20px;
            border:1px solid red;
            font-size:14px;
            font-weight:600;
            background:red;
            margin-block: 5px;
            cursor:pointer;
            font-weight:700;
            color:white;
        }

        #etape1:hover {
            color:white;
            opacity:75%;
            transition: all 0.3s ease;
        }

        .freeTrial {
            padding-block:15px;
            text-align:center;
            background-color:red;
            color:white;
        }
        #form2{
             border:1px solid red;
             max-width:450px;
             min-width:320px;
             padding:25px;
             border-radius:10px;
             margin:auto;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15) ;
            margin-block:25px;
            display:flex;
            flex-direction:column;
            justify-content:space-around;
        }
        .styleAgeRaison{
            font-size:15px;
            border:1px solid red;
            border-radius:7px;
            padding:5px;
        }
        .styleAgeRaison:focus {
            outline:1px solid red;
        }
        .espaceEthnie {
            display:flex;
            justify-content:start;
            align-items:start;
        }
        #lstGrpEthnique {
             border:1px solid red;
             border-radius:7px;
             padding:10px;
             width:100%;

        }
        #lstGrpEthnique:focus {
          outline:2px solid red;
          border-radius:7px;
        }
        .input {
            margin-block:7px;
        }
        #btnRetry {
            color:red; 
            font-weight:500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div >
             <header>
                 <img src="mesimages/lavalifelogo.png" alt="Alternate Text" />
             </header>

            <asp:MultiView ID="mvRegistration" runat="server">
                <asp:View ID="step1" runat="server">
                    <div class="form">
                        <h2 class="titreSignUp">Create Your Profile</h2>
                        <h3 class="freeTrial">And receive a 7-day free trial</h3>
                        <div class="espaceEntreLabel">
                            <asp:Label ID="lblNom" runat="server" Text="Nom:"></asp:Label>
                            <asp:TextBox ID="txtNom" runat="server" CssClass="inputTexte input"></asp:TextBox>
                        </div>
                        <div class="espaceEntreLabel">
                            <asp:Label ID="lblPrenom" runat="server" Text="Prenom:"></asp:Label>
                            <asp:TextBox ID="txtPrenom" runat="server" CssClass="inputTexte input"></asp:TextBox>
                        </div>
                        <div>
                            <div class="espaceEntreLabel">
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="inputTexte input"></asp:TextBox>
                            </div>
                            <div class="espaceEntreLabel">
                                <asp:Label ID="lblMdp" runat="server" Text="Mot de Passe:"></asp:Label>
                                <asp:TextBox ID="txtMdp" runat="server" TextMode="Password" CssClass="inputTexte input"></asp:TextBox>
                            </div>
                        </div>
                        <div class="espaceEntreLabel">
                            <asp:Label ID="lblSexe" runat="server" Text="Sexe:"></asp:Label>
                            <div >
                                    <asp:RadioButtonList AutoPostBack="true" ID="radLstChoixSexe" CssClass="input" runat="server"></asp:RadioButtonList>
                                 </div>
                        </div>

                        <asp:Button Text="Etape 2" ID="etape1" runat="server" Onclick="etape1_Click"  />
                        <asp:Label text="" ID="lblErrorEtp1" CssClass="msgValidationError" runat="server" />
                    </div>
                </asp:View>
                <asp:View ID="step2" runat="server">

                    <div id="form2">
                        <h2 class="titreSignUp">You're Almost There</h2>
                        <h3 class="freeTrial">Tell us some more about you.</h3>
                            <div class="espaceEntreLabel">
                                <asp:Label ID="lblAge" Text="Entrez votre Age: " runat="server" />
                                <asp:TextBox runat="server" TextMode="Date" CssClass="styleAgeRaison input" ID="txtAge"/>
                            </div>
                            <div class="espaceEntreLabel">
                                <div class="espaceEntreLabel">
                                    <asp:Label Text="Choisir le Groupe Ethnique: " runat="server" />
                                    <div>
                                        <asp:ListBox AutoPostBack="true" ID="lstGrpEthnique" OnSelectedIndexChanged="lstGrpEthnique_SelectedIndexChanged" CssClass="input" runat="server">
                                        </asp:ListBox>
                                    </div>
                                </div>
                                
                                <div class="espaceEntreLabel">
                                    <asp:Label ID="lblAutreGroupeEth" Text="Groupe Ethnique : " runat="server" />
                                    <asp:TextBox ID="txtAutreGroupeEth" CssClass="inputTexte input" Text="" runat="server"  />
                                </div>
                            </div>
                            <div class="espaceEntreLabel">
                                <asp:Label Text="Raison: " ID="lblRaison" runat="server" />
                                <asp:DropDownList ID="cboRaison" CssClass="styleAgeRaison input" runat="server">
                                </asp:DropDownList>
                            </div>
                            <asp:Button ID="btnEnregistrer" Text="Enregistrer" runat="server" OnClick="btnEnregistrer_Click" CssClass="btnEnregistrer" />

                            <asp:Label text="" ID="lblValidationMsgError" CssClass="msgValidationError" runat="server" />
                            <asp:LinkButton ID="btnRetry" Text="Reessayer" OnClick="btnRetry_Click" runat="server" />

                    </div>               

                </asp:View>
                  

            </asp:MultiView>
           </div>

    </form>
</body>
</html>
