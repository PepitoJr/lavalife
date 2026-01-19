using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebFriendbook
{
    public partial class LireMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack==false)
            {
                lblNomMembre.Text = Session["NomUser"].ToString();
                int idTransfere=Convert.ToInt32(Request.QueryString["IDtransfere"]);
                SqlConnection mycon= new SqlConnection();
                mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
                mycon.Open();

                string sql = "SELECT Titre, Contenu, Date, Envoyeur, Membres.Nom,Membres.Prenom, Membres.Id FROM Messages, Membres WHERE MessageID=@idMsg AND Messages.Envoyeur=Membres.Id ";
                SqlCommand mycmd= new SqlCommand(sql, mycon);
                mycmd.Parameters.AddWithValue("@idMsg", idTransfere);
                SqlDataReader myreader= mycmd.ExecuteReader();
                if (myreader.Read()==true)
                {
                    lblTitre.Text = myreader["Titre"].ToString();
                    lblEnvoyeur.Text = myreader["Nom"].ToString();
                    lblContenu.Text = myreader["Contenu"].ToString();
                    lblDate.Text = myreader["Date"].ToString();
                }
                myreader.Close();

                //modifier la propriete nouveau du message a false

                sql = "UPDATE Messages SET Nouveau='False' WHERE Messages.MessageID=@msgI ";

                //Ajouter les parametres
                SqlCommand mycommand = new SqlCommand(sql, mycon);
                mycommand.Parameters.AddWithValue("@msgI", idTransfere);

                //Executer la commande car la requette update ne retourne  rien elle est comme la requette insert, donc on doit executer avec ExecuteNonQuery
                mycommand.ExecuteNonQuery();
                mycon.Close();
            }
        }

        protected void btnRetour_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListeMessage.aspx");
        }
    }
}