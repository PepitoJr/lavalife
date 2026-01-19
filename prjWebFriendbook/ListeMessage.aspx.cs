using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebFriendbook
{
    public partial class ListeMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                lblNomMembre.Text = Session["NomUser"].ToString();
                remplirListeMessage();
            }
        }

        private void remplirListeMessage()
        {
            SqlConnection mycon = new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            string sql = "SELECT Messages.*,Membres.Nom, Membres.Prenom FROM Messages, Membres  WHERE Messages.Receveur=@recev AND Messages.Envoyeur=Membres.Id";
            SqlCommand mycmd = new SqlCommand(sql,mycon);
            mycmd.Parameters.AddWithValue("@recev", Session["IdMembre"]);
            SqlDataReader myreader= mycmd.ExecuteReader();

            //ici on passe a la creation du tableau

            TableRow ligne = new TableRow();
            //Creer une cellule 
            TableCell macell = new TableCell();
            macell.Text = "Titres Messages";
            ligne.Cells.Add(macell);

            macell = new TableCell();
            macell.Text = "Envoyeurs";
            ligne.Cells.Add(macell);

            //cellule dediee a la date d'evoie de message
            macell = new TableCell();
            macell.Text = "Date d'envoi";
            ligne.Cells.Add(macell);

            //cellule dediee a l'action
            macell = new TableCell();
            macell.Text = "Actions";
            ligne.Cells.Add(macell);

            //Ajouter une ligne au tableau
            tabMessages.Rows.Add(ligne);

            while (myreader.Read()) {

                TableRow maligne= new TableRow();

                TableCell cell=new TableCell();
                cell.CssClass = "table_cell";
                cell.Text = myreader["Titre"].ToString();
                maligne.Cells.Add(cell);

                cell= new TableCell();
                cell.Text = myreader["Prenom"].ToString() + " " + myreader["Nom"].ToString() ;
                maligne.Cells.Add(cell);

                cell = new TableCell();
                cell.Text = Convert.ToDateTime(myreader["Date"]).ToString();
                maligne.Cells.Add(cell);

                cell = new TableCell();
                string msgID = myreader["MessageID"].ToString();
                cell.Text = "<a class='btn_lire' href='lireMessage.aspx?IDtransfere=" + msgID + "' >Lire</a>";
                cell.Text += "  |  <a class='btn_erase' href='DeleteMsg.aspx?IDtransfere=" + msgID + "'>Effacer</a>";
                cell.Text += "|  <a  class='btn_ecrire' href='ReponseAuMsg.aspx?IDmsg=" + myreader["MessageID"] + "'>Repondre</a>";
                maligne.Cells.Add(cell);

                if (myreader["Nouveau"].ToString()=="True")
                {
                    maligne.BackColor = Color.LimeGreen;
                }
                tabMessages.Rows.Add(maligne);

            }

            if (tabMessages.Rows.Count<=1)
            {
                TableRow maligne= new TableRow();
                TableCell cell = new TableCell();
                cell.ColumnSpan = 4;
                cell.Text = "Vous n' avez aucun message pour le moment";
                maligne.Cells.Add(cell);
               tabMessages.Rows.Add(maligne);
            }
            myreader.Close();
            mycon.Close();

            
        }

        protected void ecrireMsg_Click(object sender, EventArgs e)
        {
            Response.Redirect("EcrireMessage.aspx");
        }

        protected void btnRetourAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccueilFriendbook.aspx");
        }
    }
}