using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebFriendbook
{
    public partial class DetailsUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Page.IsPostBack==false)
            {
                lblNomMembre.Text = Session["NomUser"].ToString();

                SqlConnection mycon = new SqlConnection();
                mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
                mycon.Open();

                string sql = "SELECT * FROM Membres WHERE Id=@id";

                SqlCommand mycmd = new SqlCommand(sql,mycon);
                mycmd.Parameters.AddWithValue("@id", Request.QueryString["UserId"].ToString());

                SqlDataReader myreader= mycmd.ExecuteReader();
                if (myreader.Read()==true)
                {
                    lblNomComplet.Text ="Nom Complet: " + myreader["Nom"].ToString() + " " + myreader["Prenom"].ToString();
                    lblEmail.Text = "Email: " + myreader["Email"].ToString();
                    lblEthnie.Text = "Ethnie: " + myreader["Ethnie"].ToString();
                    lblRaison.Text = "Raison: " + myreader["Raison"].ToString();
                    lblSexe.Text = "Sexe: " + (myreader["Sexe"].ToString() == "F" ? "Feminin" : "Masculin");
                    lblAge.Text = "Age: "+myreader["Age"].ToString();
                  
                }
            }
        }

        protected void btnEcrireMsg_Click(object sender, EventArgs e)
        {
            Response.Redirect("EcrireMessage.aspx?IdTransfere="+ Request.QueryString["UserId"].ToString());
        }

        protected void btnRetourAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccueilFriendbook.aspx");
        }
    }
}