using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebFriendbook
{
    public partial class ReponseAuMsg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["IDmsg"]!=null)
            {
                lblNomMembre.Text = Session["NomUser"].ToString();
                SqlConnection mycon = new SqlConnection();
                mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
                mycon.Open();

                string sql = "SELECT Membres.Nom, Membres.Prenom,Messages.MessageID,Messages.Titre,Messages.Contenu, Messages.Envoyeur FROM Membres,Messages WHERE Messages.MessageID=@msgId AND Messages.Envoyeur=Membres.Id";
                SqlCommand mycmd=new SqlCommand(sql, mycon);
                mycmd.Parameters.AddWithValue("@msgId", Request.QueryString["IDmsg"].ToString());
                SqlDataReader myreader= mycmd.ExecuteReader();
                if (myreader.Read()) {
                    cboDestinataire.Items.Add(new ListItem(myreader["Nom"].ToString() + " " + myreader["Prenom"].ToString(), myreader["Envoyeur"].ToString()));
                    txtSujet.Text = myreader["Titre"].ToString();
                }

            }

        }

        protected void btnEnvoyer_Click(object sender, EventArgs e)
        {
            SqlConnection mycon = new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            string titre = txtSujet.Text.ToString();
            string contenu = txtMessage.Text.ToString();
            string idReceveur = cboDestinataire.SelectedItem.Value.ToString();
            string idEnvoyeur = Session["IdMembre"].ToString();
            string sql = "INSERT INTO Messages (Titre,Contenu,Date,Envoyeur,Receveur,Nouveau) VALUES (@titre,@contenu,@date,@envoyeur,@recev,'true')";

            SqlCommand mycmd = new SqlCommand(sql, mycon);
            mycmd.Parameters.AddWithValue("@titre", "Replied: "+titre);
            mycmd.Parameters.AddWithValue("@contenu", contenu);
            mycmd.Parameters.AddWithValue("@date", DateTime.Now);
            mycmd.Parameters.AddWithValue("@envoyeur", idEnvoyeur);
            mycmd.Parameters.AddWithValue("@recev", idReceveur);

            mycmd.ExecuteNonQuery();
            mycon.Close();

            Response.Redirect("AccueilFriendbook.aspx");
        }

        protected void btnAnnuler_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListeMessage.aspx");
        }
    }
}