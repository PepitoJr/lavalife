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
    public partial class AccueilFriendbook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack==false)
            {
                remplirListeSexe();
                remplirListeRaison();
                remplirListeEthnie();
                remplirListeTrancheAge();
                recupererLesMembresFiltres();
            }
            userNotFound.Visible = false;
            lblEmailMembre.Text = Session["EmailMembre"].ToString();
            //on cree la connection
            SqlConnection mycon = new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            //on cree la commande

            string sql = "SELECT Nom, Prenom FROM Membres WHERE Email=@email";

            SqlCommand mycommand = new SqlCommand(sql,mycon);
            mycommand.Parameters.AddWithValue("@email", Session["EmailMembre"].ToString());

            //on cree reader
            SqlDataReader myreader = mycommand.ExecuteReader();

            string nom = "";
            if (myreader.Read()==true)
            {
                lblEmailMembre.Text = myreader["Prenom"].ToString() +" "+ myreader["Nom"].ToString();
                nom = myreader["Prenom"].ToString()+" "+myreader["Nom"].ToString();
                Session["NomUser"] = nom;
                myreader.Close();
            }
            myreader.Close();

            string sql2 = "SELECT Sexe FROM Membres WHERE Email=@email";

            //on cree la commande
            SqlCommand mycommande2=new SqlCommand(sql2,mycon);
            mycommande2.Parameters.AddWithValue("@email", Session["EmailMembre"].ToString());
            
            // on cree le reader

            SqlDataReader myreader2 = mycommande2.ExecuteReader();

            //on declare ce qui va contenir la valeur du sexe
            string sexe = "";
            if (myreader2.Read()==true)
            {
                sexe = myreader2["Sexe"].ToString();
                myreader2.Close();
            }

            myreader2.Close();
            

            if (sexe == "M")
            {
                lblMotBienvenue.Text = "Bienvenue chez LavaLife Monsieur " + nom + ".";
            }
            else {
                lblMotBienvenue.Text = "Bienvenue chez LavaLife Madame " + nom + ".";
            }

            string sql3 = "SELECT MessageID FROM Messages WHERE Receveur=@recev";
            SqlCommand mycmd3= new SqlCommand(sql3,mycon);
            mycmd3.Parameters.AddWithValue("@recev", Session["IdMembre"]);
             SqlDataReader myreader3 = mycmd3.ExecuteReader();
            int nbrMsg = 0;
            while(myreader3.Read()==true){
                nbrMsg++;
            }
            string msgNotification = "";
            if (nbrMsg>0)
            {
                msgNotification+= "Vous avez recu "+nbrMsg+" message(s) ";
            }
            msgNotification += " <a href='ListeMessage.aspx' >Consulter vos messages </a>";
            nbrMessages.Text= msgNotification;
            mycon.Close();

        }

        private void recupererLesMembresFiltres()
        {
            string sexeSearch = cboSexe.SelectedItem.Value.ToString();
            string ageSearch = cboTrancheAge.SelectedItem.Value.ToString();
            string raisonSearch = cboRaison.SelectedItem.Value.ToString();
            string ethnieSearch = cboEthnie.SelectedItem.Value.ToString();

            SqlConnection mycon = new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            string sql3 = "SELECT Id,Nom,Prenom, Age, Sexe,Ethnie From Membres WHERE 1=1";


            if (cboSexe.SelectedIndex != 0 && cboSexe.SelectedIndex != -1)
            {
                sql3 += " AND Sexe = @sexe";
            }

            if (cboRaison.SelectedIndex != 0 && cboRaison.SelectedIndex != -1)
            {
                sql3 += " AND Raison = @raison";
            }

            if (cboEthnie.SelectedIndex != 0 && cboEthnie.SelectedIndex != -1)
            {
                sql3 += " AND Ethnie = @ethnie ";
            }

            if (cboTrancheAge.SelectedIndex != 0 && cboTrancheAge.SelectedIndex != -1)
            {
                if (cboTrancheAge.SelectedItem.Value.ToString() == "1")
                {
                    sql3 += " AND Age > 17 AND Age < 25 ";
                }

                if (cboTrancheAge.SelectedItem.Value.ToString() == "2")
                {
                    sql3 += " AND Age> 24 AND Age < 31 ";
                }

                if (cboTrancheAge.SelectedItem.Value.ToString() == "3")
                {
                    sql3 += " AND Age >30 AND Age < 41";
                }

                if (cboTrancheAge.SelectedItem.Value.ToString() == "4")
                {
                    sql3 += " AND Age > 40 AND Age < 51";
                }

                if (cboTrancheAge.SelectedItem.Value.ToString() == "5")
                {
                    sql3 += " AND Age > 50 AND Age < 61";
                }
            }

            SqlCommand mycmd3 = new SqlCommand(sql3, mycon);

            if (cboSexe.SelectedIndex != 0 && cboSexe.SelectedIndex != -1)
            {
                mycmd3.Parameters.AddWithValue("@sexe", sexeSearch);
            }

            if (cboRaison.SelectedIndex!=0 && cboRaison.SelectedIndex!= -1)
            {
                mycmd3.Parameters.AddWithValue("@raison", raisonSearch);
            }

            if (cboEthnie.SelectedIndex!=0 && cboEthnie.SelectedIndex!= -1)
            {
                mycmd3.Parameters.AddWithValue("@ethnie", ethnieSearch);
            }
            
            SqlDataReader myReader3 = mycmd3.ExecuteReader();

            //Ici je vais utiliser le dataBinding sur la ListeView
            lstViewMembres.DataSource = myReader3;
            lstViewMembres.DataBind();
            if (lstViewMembres.Items.Count()<1) {
                userNotFound.Visible = true;
                userNotFound.Text = "Aucun utilisateur n'a ete trouve!!";
            }
            mycon.Close();


        }

        private void remplirListeTrancheAge()
        {
            cboTrancheAge.Items.Add(new ListItem("Choisir une tranche d'age",""));
            cboTrancheAge.Items.Add(new ListItem("18 - 24","1"));
            cboTrancheAge.Items.Add(new ListItem("25 - 30","2"));
            cboTrancheAge.Items.Add(new ListItem("31 - 40","3"));
            cboTrancheAge.Items.Add(new ListItem("41 - 50","4"));
            cboTrancheAge.Items.Add(new ListItem("51 - 60","5"));

        }

        private void remplirListeEthnie()
        {
            SqlConnection mycon = new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            string sql = "SELECT * FROM Ethnies";
            SqlCommand mycmd = new SqlCommand(sql, mycon);

            SqlDataReader myreader = mycmd.ExecuteReader();
            cboEthnie.Items.Add(new ListItem("Groupe Ethnique ", ""));
            while (myreader.Read())
            {

                cboEthnie.Items.Add(new ListItem(myreader["Ethnie"].ToString(), myreader["Ethnie"].ToString()));
            }
            cboEthnie.SelectedIndex = 0;

            myreader.Close();
            mycon.Close();
        }

        private void remplirListeRaison()
        {
            cboRaison.Items.Add(new ListItem("Raison???", ""));
            cboRaison.Items.Add(new ListItem("Amour", "Amour"));
            cboRaison.Items.Add(new ListItem("Amitie", "Amitie"));
            cboRaison.Items.Add(new ListItem("Reseautage", "Reseautage"));
        }

        private void remplirListeSexe()
        {
            cboSexe.Items.Add(new ListItem("Choisir votre Sexe",""));
            cboSexe.Items.Add(new ListItem("Feminin", "F"));
            cboSexe.Items.Add(new ListItem("Masculin", "M"));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            recupererLesMembresFiltres();
        }

       
    }
}