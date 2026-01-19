<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListeMessage.aspx.cs" Inherits="prjWebFriendbook.ListeMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Liste des messages</title>
<style>
    :root {
        --red-main: #dc2626;
        --red-light: #fee2e2;
        --red-hover: #b91c1c;
        --gray-text: #4b5563;
    }

    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: #f9fafb;
        color: #111827;
    }

    /* ===== HEADER ===== */
    header {
        background: white;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        padding: 12px;
    }

    header div {
        max-width: 1000px;
        margin: auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    header img {
        height: 50px;
    }

    /* ===== TITRE ===== */
    .lstMsg {
        text-align: center;
        font-size: 32px;
        font-weight: 700;
        color: var(--red-main);
        margin: 30px 0;
    }

    /* ===== TABLE ===== */
    .table {
        border-collapse: collapse;
        background: white;
        border-radius: 16px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
        width: 80%;
        margin: auto;
        overflow: hidden;
    }

    .table tr {
        transition: background 0.2s ease;
    }

    .table tr:hover {
        background: var(--red-light);
    }

    .table td,
    .table th {
        padding: 14px;
        text-align: center;
        border-bottom: 1px solid #e5e7eb;
        color: var(--gray-text);
    }

    .table th {
        background: #fef2f2;
        color: var(--red-main);
        font-weight: 700;
        text-transform: uppercase;
        font-size: 14px;
    }

    /* ===== ACTION BUTTONS (table) ===== */
    .btn_erase,
    .btn_lire,
    .btn_ecrire {
        padding: 6px 10px;
        text-decoration: none;
        font-weight: 600;
        border-radius: 6px;
        background: white;
        transition: all 0.2s ease;
        border: 1px solid transparent;
    }

    .btn_erase {
        color: var(--red-main);
        border-color: var(--red-main);
    }

    .btn_erase:hover {
        background: var(--red-main);
        color: white;
    }

    .btn_lire {
        color: #2563eb;
        border-color: #2563eb;
    }

    .btn_lire:hover {
        background: #2563eb;
        color: white;
    }

    .btn_ecrire {
        color: #16a34a;
        border-color: #16a34a;
    }

    .btn_ecrire:hover {
        background: #16a34a;
        color: white;
    }

    /* ===== BOTTOM BUTTONS ===== */
    .container_btn {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin: 40px 0;
    }

    #btnRetourAcc,
    #ecrireMsg {
        padding: 12px 22px;
        font-size: 16px;
        font-weight: 600;
        border-radius: 12px;
        cursor: pointer;
        background: white;
        transition: all 0.2s ease;
    }

    #btnRetourAcc {
        color: var(--red-main);
        border: 2px solid var(--red-main);
    }

    #btnRetourAcc:hover {
        background: var(--red-main);
        color: white;
        transform: translateY(-2px);
    }

    #ecrireMsg {
        color: white;
        background: var(--red-main);
        border: 2px solid var(--red-main);
    }

    #ecrireMsg:hover {
        background: var(--red-hover);
        transform: translateY(-2px);
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
                      <asp:Label ID="lblNomMembre" runat="server" />
                  </div>
              </header>  
        </div>
        <div>
            <h3 class="lstMsg">Liste de message: </h3>
            <asp:Table ID="tabMessages" GridLines="Both" CssClass="table"  runat="server">
     
            </asp:Table>
            <div class="container_btn">
                   <asp:Button Text="Retour" ID="btnRetourAcc" OnClick="btnRetourAcc_Click" runat="server" />
                   <asp:Button Text="Composer un message" ID="ecrireMsg" OnClick="ecrireMsg_Click" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
