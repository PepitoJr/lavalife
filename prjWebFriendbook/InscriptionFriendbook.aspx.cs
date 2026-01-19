using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebFriendbook
{
    public partial class InscriptionFriendbook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                lblAutreGroupeEth.Visible = false;
                btnRetry.Visible = false;
                lblErrorEtp1.Visible = false;
                txtAutreGroupeEth.Visible=false;
                lblValidationMsgError.Visible = false;
                mvRegistration.ActiveViewIndex = 0;
                remplirListeSexe();
                remplirListeGroupeEthnique();
                remplirListeRaison();
            }

        }

        private void remplirListeGroupeEthnique()
        {

           
            SqlConnection mycon =new SqlConnection();
            mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
            mycon.Open();

            string sql = "SELECT * FROM Ethnies";
            SqlCommand mycmd=new SqlCommand(sql, mycon);

            SqlDataReader myreader= mycmd.ExecuteReader();
            while (myreader.Read()) {

                lstGrpEthnique.Items.Add(new ListItem(myreader["Ethnie"].ToString(), myreader["Ethnie"].ToString()));

            }

            lstGrpEthnique.Items.Add(new ListItem("Autre", "Autre"));
            lstGrpEthnique.SelectedIndex = 0;

            myreader.Close();
            mycon.Close();


        }

        private void remplirListeRaison()
        {
            cboRaison.Items.Add(new ListItem("Amour","Amour"));
            cboRaison.Items.Add(new ListItem("Amitie","Amitie"));
            cboRaison.Items.Add(new ListItem("Reseautage", "Reseautage"));
        }

        private void remplirListeSexe()
        {
            radLstChoixSexe.Items.Add(new ListItem("Male", "M"));
            radLstChoixSexe.Items.Add(new ListItem("Female", "F"));
            radLstChoixSexe.SelectedIndex = 0;
        }

        protected void btnEnregistrer_Click(object sender, EventArgs e)
        {
            if (txtAge.Text.Trim() == "" || lstGrpEthnique.SelectedIndex == -1 || cboRaison.SelectedIndex == -1)
            {
                lblValidationMsgError.Visible = true;
                lblValidationMsgError.Text = "Veillez remplir tous les champs s'il vous plait!";
                return;
            }
            else
            {
                string emailMember = ViewState["email"]?.ToString();
                string prenomMember = ViewState["prenom"]?.ToString();
                string nomMember = ViewState["nom"]?.ToString();
                string mdpMember = ViewState["mdp"]?.ToString();
                string sexeMember = ViewState["sexe"]?.ToString();
                int anneeDeNaissance = Convert.ToDateTime(txtAge.Text.ToString()).Year;
                int anneeActuelle = Convert.ToDateTime(DateTime.Now).Year;
                int age = anneeActuelle- anneeDeNaissance;
                string grpEthniqueVoulu =txtAutreGroupeEth.Text.Trim().ToString()!=""? txtAutreGroupeEth.Text.Trim() : lstGrpEthnique.SelectedItem.Value.ToString(); ;
                string raisonVoulu = cboRaison.SelectedItem.Value.ToString();


                //On cree la connexion a la base de donnees
                SqlConnection mycon = new SqlConnection();
                mycon.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\PEPITO JUNIOR\\source\\repos\\2025\\automne\\420TW2TT\\prjWebFriendbook\\prjWebFriendbook\\App_Data\\FriendbookDB.mdf\";Integrated Security=True";
                mycon.Open();

                //On verifie si l'email entre par l'utilisateur existe deja
                string sql = "SELECT Nom FROM Membres WHERE Email=@email";
                SqlCommand myCommand = new SqlCommand(sql, mycon);
                myCommand.Parameters.AddWithValue("@email", emailMember);
                //on cree le reader
                SqlDataReader myreader1 = myCommand.ExecuteReader();
                if (myreader1.Read())
                {
                    lblValidationMsgError.Visible = true;
                    lblValidationMsgError.Text = "Un utilisateur ayant cette Email existe deja!!";
                    btnRetry.Visible = true;
                    myreader1.Close();
                    mycon.Close();
                    return;
                }
                //on ferme la connexion
                myreader1.Close();

                //on insert maintenant l'utilisateur a la table membre
                sql = "INSERT INTO Membres (Email,Nom,Prenom,MotDePasse,Sexe,Age,Ethnie,Raison) VALUES(@email,@nom,@prenom,@mdp,@sexe,@age,@eth,@raison)";

                //On cree la commande
                myCommand = new SqlCommand(sql, mycon);

                // on Ajoute les parametres

                myCommand.Parameters.AddWithValue("@email", emailMember);
                myCommand.Parameters.AddWithValue("@nom", nomMember);
                myCommand.Parameters.AddWithValue("@prenom", prenomMember);
                myCommand.Parameters.AddWithValue("@mdp", mdpMember);
                myCommand.Parameters.AddWithValue("@sexe", sexeMember);
                myCommand.Parameters.AddWithValue("@age", age);
                myCommand.Parameters.AddWithValue("@eth", grpEthniqueVoulu);
                myCommand.Parameters.AddWithValue("@raison", raisonVoulu);
                //on execute la commande
                myCommand.ExecuteNonQuery();
                mycon.Close();
                Response.Redirect("LoginFriendbook.aspx");
            }

        }

        protected void etape1_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text.Trim() == "" || txtMdp.Text.Trim() == "" || txtNom.Text.Trim() == "" || txtPrenom.Text.Trim() == "")
            {
                lblErrorEtp1.Visible = true;
                lblErrorEtp1.Text = "Veillez remplir tous les champs s'il vous plait!";
                return;
            }
            else
            {
                ViewState["email"] = txtEmail.Text.Trim();
                ViewState["prenom"] = txtPrenom.Text.Trim();
                ViewState["nom"] = txtNom.Text.Trim();
                ViewState["mdp"] = txtMdp.Text.Trim();
                ViewState["sexe"] = radLstChoixSexe.SelectedItem.Value.ToString();

                mvRegistration.ActiveViewIndex = 1;
            }
        }

        protected void lstGrpEthnique_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstGrpEthnique.SelectedItem.Value.ToString() == "Autre")
            {

                lblAutreGroupeEth.Visible = true;
                txtAutreGroupeEth.Visible = true;
            }
            else {
                lblAutreGroupeEth.Visible = false;
                txtAutreGroupeEth.Visible = false;
            }
        }

        protected void btnRetry_Click(object sender, EventArgs e)
        {
            mvRegistration.ActiveViewIndex = 0;
        }
    }
}