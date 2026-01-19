<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EcrireMessage.aspx.cs" Inherits="prjWebFriendbook.EcrireMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ecrire un Message</title>
    <style>
    :root {
        --red-main: #dc2626;
        --red-hover: #b91c1c;
        --red-light: #fee2e2;
        --gray-text: #374151;
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
        margin-bottom: 30px;
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

    /* ===== FORM CARD ===== */
    #form1 {
        max-width: 490px;
        min-width: 320px;
        margin: auto;
        padding: 30px;
        background: white;
        border-radius: 20px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        gap: 18px;
    }

    /* ===== LABELS ===== */
    p {
        margin: 0 0 6px 4px;
        font-size: 15px;
        font-weight: 600;
        color: var(--gray-text);
    }

    /* ===== INPUTS ===== */
    .input {
        width: 100%;
        padding: 10px 14px;
        font-size: 16px;
        border-radius: 12px;
        border: 2px solid #e5e7eb;
        transition: all 0.2s ease;
    }

    .input:focus {
        outline: none;
        border-color: var(--red-main);
        box-shadow: 0 0 0 3px var(--red-light);
    }

    textarea.input {
        resize: none;
    }

    .espaceEntreLabel {
        display: flex;
        flex-direction: column;
    }

    /* ===== BUTTONS ===== */
    .container_btn {
        display: flex;
        justify-content: space-between;
        gap: 15px;
        margin-top: 20px;
    }

    .btnEnvoyer,
    .btnAnnuler {
        flex: 1;
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        border-radius: 14px;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .btnEnvoyer {
        background: var(--red-main);
        color: white;
        border: 2px solid var(--red-main);
    }

    .btnEnvoyer:hover {
        background: var(--red-hover);
        transform: translateY(-2px);
    }

    .btnAnnuler {
        background: white;
        color: var(--red-main);
        border: 2px solid var(--red-main);
    }

    .btnAnnuler:hover {
        background: var(--red-main);
        color: white;
        transform: translateY(-2px);
    }

    /* ===== FEEDBACK MESSAGE ===== */
    #lblText {
        text-align: center;
        font-weight: 600;
        color: var(--red-main);
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
        <div>
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
            
                <asp:Button ID="btnEnvoyer" runat="server" OnClick="btnEnvoyer_Click" CssClass="btnEnvoyer" Text="Envoyer" />
            
            
                <asp:Button ID="btnAnnuler" runat="server" OnClick="btnAnnuler_Click" CssClass="btnAnnuler" Text="Annuler" />
            
        </div>

</div>
        </div>
    </form>
</body>
</html>
