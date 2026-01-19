using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebFriendbook
{
    public partial class DeleteMsg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Recuperer le id de message a lire envoye par la page accueilOmnivox
            int IDtransfere = Convert.ToInt32(Request.QueryString["IDtransfere"]);
            //se connecter a la d
            SqlConnection mycon = new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            //supprimier le message avec le numero envoye

            string sql = "DELETE Messages FROM Messages WHERE MessageID=@msgI ";


            SqlCommand mycmd = new SqlCommand(sql, mycon);

            //Ajouter les parametres

            mycmd.Parameters.AddWithValue("@msgI", IDtransfere);

            mycmd.ExecuteNonQuery();

            mycon.Close();
            Response.Redirect("AccueilFriendbook.aspx");
        }
    }
}