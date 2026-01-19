using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebFriendbook
{
    public partial class LoginFriendbook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack==false)
            {
                
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {


            string emailMembre = txtEmail.Text.Trim();
            string mdpMembre = txtMdp.Text.Trim();

            if (emailMembre==""|| mdpMembre=="")
            {
                lblValidationMsgError.Text = "Remplir tous les champs du formulaire!";

            }
            else{
                SqlConnection mycon = new SqlConnection();
                mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
                mycon.Open();

                string sql = "SELECT Email,Id FROM Membres WHERE Email=@email AND MotDePasse=@mdp";
                SqlCommand myCommand = new SqlCommand(sql, mycon);
                myCommand.Parameters.AddWithValue("@email",emailMembre);
                myCommand.Parameters.AddWithValue("@mdp",mdpMembre);

                SqlDataReader myreader = myCommand.ExecuteReader();

                if (myreader.Read() == true)
                {
                    Session["EmailMembre"] = myreader["Email"].ToString();
                    Session["IdMembre"] = myreader["Id"].ToString();
                    Response.Redirect("AccueilFriendbook.aspx");
                }
                else
                {
                    lblValidationMsgError.Text = "Email ou mot de passe incorrect. Essayer a nouveau!!";
                    myreader.Close();
                    mycon.Close();
                }

                myreader.Close();
                mycon.Close();
            }
        }

        protected void btnInscrire_Click(object sender, EventArgs e)
        {
            Response.Redirect("InscriptionFriendbook.aspx");
        }
    }
}