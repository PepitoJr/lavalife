<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccueilFriendbook.aspx.cs" Inherits="prjWebFriendbook.AccueilFriendbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Accueil Lavalife</title>
    <style>
         :root {
  --red-main: #E10600;
  --red-dark: #A80000;
  --red-soft: #FFE5E5;
  --gray-text: #444;
  --bg-main: #F9F9F9;
}

* {
  box-sizing: border-box;
  font-family: "Segoe UI", Arial, sans-serif;
}

body {
  margin: 0;
  background: var(--bg-main);
  color: var(--gray-text);
}

/* HEADER */
header {
  background: white;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  padding: 14px 0;
}

header div {
  max-width: 1100px;
  margin: auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

header img {
  height: 48px;
}

#lblEmailMembre {
  font-weight: 600;
  color: var(--red-main);
}

/* CONTAINER */
.container {
  max-width: 1000px;
  margin: auto;
  padding: 40px 20px;
}

/* TITRE BIENVENUE */
.lblMotBienvenue {
  font-size: 36px;
  font-weight: 700;
  color: var(--red-main);
  margin-bottom: 30px;
  text-align: center;
}

/* FILTRES */
.container_filtre {
  background: white;
  padding: 20px;
  border-radius: 16px;
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  justify-content: center;
  align-items: center;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
}

.input {
  padding: 10px 14px;
  border-radius: 10px;
  border: 1px solid #ddd;
  font-size: 15px;
}

.input:focus {
  outline: none;
  border-color: var(--red-main);
  box-shadow: 0 0 0 2px var(--red-soft);
}

/* BOUTON RECHERCHE */
#btnSearch {
  padding: 10px 22px;
  border-radius: 12px;
  border: none;
  background: var(--red-main);
  color: white;
  font-size: 16px;
  cursor: pointer;
  transition: all 0.25s ease;
}

#btnSearch:hover {
  background: var(--red-dark);
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(225, 6, 0, 0.3);
}

/* NOTIFICATION */
.container_notification {
  text-align: right;
  margin: 20px 0;
}

#nbrMessages {
  font-weight: 600;
  color: var(--red-main);
}

/* USERS GRID */
.container_users {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
  gap: 24px;
  margin-top: 30px;
}

/* CARD USER */
.memberUser {
  background: white;
  border-radius: 20px;
  padding: 22px;
  transition: all 0.3s ease;
  border: 2px solid transparent;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
}

.memberUser:hover {
  transform: translateY(-6px);
  border-color: var(--red-main);
  box-shadow: 0 14px 30px rgba(225, 6, 0, 0.2);
}

.memberUser h5 {
  font-size: 18px;
  margin-bottom: 10px;
  color: var(--red-main);
}

.memberUser p {
  margin: 4px 0;
  font-size: 14px;
}

/* BOUTON DETAILS */
.btnDetails {
  display: inline-block;
  margin-top: 12px;
  padding: 8px 16px;
  border-radius: 10px;
  background: var(--red-soft);
  color: var(--red-main);
  font-weight: 600;
  text-decoration: none;
  transition: all 0.25s ease;
}

.btnDetails:hover {
  background: var(--red-main);
  color: white;
}

/* MESSAGE VIDE */
.msgNotFound {
  font-size: 22px;
  text-align: center;
  color: var(--red-dark);
  margin-top: 40px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <header>
                  <div>
                      <img src="mesimages/lavalifelogo.png" alt="Alternate Text" />
                      <div>

                      </div>
                      <asp:Label ID="lblEmailMembre" runat="server" />
                  </div>
              </header>  
        </div>
        <div class="container">
                <div class="container_mot_bienvenu">
                        <asp:Label ID="lblMotBienvenue" CssClass="lblMotBienvenue" runat="server" />
                </div>
                <div class="container_filtre">
                    <div>
                        <asp:DropDownList runat="server" ID="cboTrancheAge" CssClass="input"  AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:DropDownList runat="server" ID="cboEthnie" CssClass="input" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:DropDownList runat="server" ID="cboRaison" CssClass="input" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:DropDownList runat="server" ID="cboSexe" CssClass="input" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <asp:Button Text="Rechercher" runat="server"  ID="btnSearch" OnClick="btnSearch_Click" />
                </div>
                <div class="container_notification">
                    <asp:Label Text="" ID="nbrMessages" runat="server" />
                </div>
                    <asp:ListView ID="lstViewMembres" runat="server">
                        <LayoutTemplate>
                            <div class="container_users">
                                <asp:PlaceHolder runat="server" ID="itemPlaceholder"  />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="memberUser" >
                
                                    <div >
                                        <h5><%# Eval("Nom") %> <%#Eval("Prenom") %></h5>
                                        <p>Age: <%#Eval("Age") %></p>
                                        <p>Sexe: <%# Eval("Sexe").ToString() == "F" ? " Feminin " : " Masculin " %></p>
                                        <p>Ethnie:<%#Eval("Ethnie") %></p>
                                        <a class="btnDetails" href='<%#"DetailsUser.aspx?UserId=" + Eval("Id") %>'>Details </a>
                                    </div>
               
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
            <asp:Label Text="" ID="userNotFound" CssClass="msgNotFound" runat="server" />
         </div>
    </form>
</body>
</html>
