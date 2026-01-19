using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebFriendbook
{
    public partial class EcrireMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack==false)
            {
                lblNomMembre.Text = Session["NomUser"].ToString();
                if (Request.QueryString["IdTransfere"] != null)
                {
                    remplirLeDestinataire();
                }
                else {
                    remplirCboDestinataire();
                }
            }
        }

        private void remplirCboDestinataire()
        {
            SqlConnection mycon = new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            string sql = "SELECT Nom,Prenom,Id FROM Membres ";
            SqlCommand mycmd = new SqlCommand(sql,mycon);

            SqlDataReader myreader= mycmd.ExecuteReader();
            while (myreader.Read()==true) {
                cboDestinataire.Items.Add(new ListItem(myreader["Nom"].ToString() + " " + myreader["Prenom"].ToString(), myreader["Id"].ToString()));
            }
            myreader.Close();
            mycon.Close();
        }

        private void remplirLeDestinataire()
        {
            if (Request.QueryString["IdTransfere"]!=null)
            {
                SqlConnection mycon = new SqlConnection();
                mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
                mycon.Open();

                string sql = "SELECT Nom,Prenom,Id FROM Membres WHERE Id=@id ";
                SqlCommand mycmd = new SqlCommand(sql, mycon);
                mycmd.Parameters.AddWithValue("@id", Request.QueryString["IdTransfere"]?.ToString());
                SqlDataReader myreader = mycmd.ExecuteReader();
                while (myreader.Read() == true)
                {
                    cboDestinataire.Items.Add(new ListItem(myreader["Nom"].ToString() + " " + myreader["Prenom"].ToString(), myreader["Id"].ToString()));
                }
                myreader.Close();
                mycon.Close();
            }
            
        }

        protected void btnEnvoyer_Click(object sender, EventArgs e)
        {
            SqlConnection mycon= new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            string titre = txtSujet.Text.ToString();
            string contenu=txtMessage.Text.ToString();
            string idReceveur=cboDestinataire.SelectedItem.Value.ToString();
            string idEnvoyeur = Session["IdMembre"].ToString();
            string sql = "INSERT INTO Messages (Titre,Contenu,Date,Envoyeur,Receveur,Nouveau) VALUES (@titre,@contenu,@date,@envoyeur,@recev,'true')";

            SqlCommand mycmd = new SqlCommand(sql,mycon);
            mycmd.Parameters.AddWithValue("@titre", titre);
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
            Response.Redirect("AccueilFriendbook.aspx");
        }
    }
}