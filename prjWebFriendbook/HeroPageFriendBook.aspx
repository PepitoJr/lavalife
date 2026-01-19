<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HeroPageFriendBook.aspx.cs" Inherits="prjWebFriendbook.HeroPageFriendBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>

        body {
            padding:0;
            margin:0;
        }
        .btnLogin {
            padding:10px;
            border:none;
            border-radius:20px;
            background-color:red;
            color:white;
            width:100px;
            cursor:pointer;
        }
            .btnLogin:hover {
                background-color:rgb(255, 0, 0,0.8);
            }
        .btnStartNow {
            padding:10px;
            border:none;
            border-radius:20px;
            background-color:red;
            color:white;
            width:150px;
            font-size:18px;
             margin-inline:15px;
             margin-top:10px;
             margin-bottom:10px;
             cursor:pointer;
        }
            .btnStartNow:hover {

            }
        .btnSignup {
            padding:10px;
            border:2px solid red;
            border-radius:20px;
            background-color:white;
            color:red;
            width:100px;
        }
        .btnSignup:hover{
            background:red;
            color:white; 
            cursor:pointer;
        }
        .heroText {
            font-size:20px;
            font-family:sans-serif;
            font-weight:lighter;
            text-align:center;
            width:95%;
            margin:auto;
            color:white;
        }
        .heroWrapper {
            display:flex;
            flex-direction:column;
            clear:both;
        }
        .zoneBtnsAuthentification {
            background-image: url("mesimages/LL_right_bg.jpg");
            width:100%;
            height:80vh;
            background-repeat:no-repeat;
            background-position:bottom;
            background-size:cover;
            display:flex;
            flex-direction:column;
            justify-content:start;
            padding-inline:50px;

        }
        .container {
            display:flex;
            
        }

        .imgRight {
            border-bottom:1px solid white;
        }
        #heroContainer .containerBtn {
            width:50%;
            display:flex;
            flex-direction:row;
            justify-content:space-around;
            margin-inline:auto;
            margin-block:25px;

        }
        #heroContainer {
            height:30vh;
            display:flex;
            flex-direction:column;
            padding-top:65px;
            width:60%;
            margin-inline:auto;
        }
        /**
           je fais le style du container de gauche
        */
        .zoneStartNow {
            width:70%;
            background-image:url("mesimages/bgDelaFemmeGauche.jpg");
            background-repeat:no-repeat;
            background-position:center;
            background-size:cover;
            margin-right:10px;
        }

        .zoneStartNow .container {
            padding:20px;
            display:flex;
            flex-direction:column;
        }
            .zoneStartNow .container h2 {
                color:white;
                font-size:45px;
                width:230px;
                font-weight:200;
                font-family:sans-serif;
                margin-inline:15px;
                margin-top:25px;
                margin-bottom:10px;

            }
            .zoneStartNow .container .para_call {
                margin-inline:15px;
                margin-top:0px;
                margin-bottom:10px;
                color:red;
                font-size:25px;
            }
            .zoneStartNow .container .para_Action {
                 margin-inline:15px;
                 margin-top:0px;
                 margin-bottom:10px;
                color:white;
                font-size:22px;
            }
        /**
            separateur du milieu
        */
        #img_ll_gauche {
            max-width:300px;
            min-width:250px;
        }
        .redLogoLavaLife {
            position:absolute;
            left:70%;
            top:50%;
            transform:translate(-50%,-50%);
            z-index:10;
            width:200px;
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .logo_img {
            width: 180px;             
            height: 180px;                
            background-color: #ff3333;    
            border-radius: 50%;          
            border: 10px solid white;      
                object-fit:contain;
                shape-outside:content-box;
            display: flex;               
            align-items: center;          
            justify-content: center;
    
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        /**
            Ici je stylisie le separateur rouge
        */
        .separateur_rouge {
            width:100%;
            height:15vh;
            background-color:red; color:white;
            margin-top:10px;
            display:flex;
            justify-content:center;
            align-items:center;
        }
            .separateur_rouge .para_separateur {
                color:white;
                font-size:30px;
                font-weight:400;
                text-align:center;
                max-width:450px;
                margin-inline:auto;
            }
        .ll_fonctionnement {
            display:flex;
            flex-direction:column;
            justify-content:space-between;
            max-width:525px;
            margin-inline:auto;
            height:50px;
        }
            .ll_fonctionnement h3 {
                font-size:30px;
                text-align:center;
                font-weight:200;
                margin-bottom:5px;
                color:black;
            }
            .ll_fonctionnement p {
                margin-top:15px;
                font-size:20px;
                text-align:center;
                 color:black;
            }

        .container_fonction {
            display:flex;
            justify-content:space-around;
            flex-direction:row;
            align-items:center;
            margin-top:125px;
            padding:10px;
        }
            .container_fonction .signUp,.search,.nouveautes {
                width:350px;
                display:flex;
                flex-direction:column;
                justify-content:space-around;
                height:400px;
                align-items:center;

            }
        .img_fonctionnalites {
            width:75px;
            height:75px;
            margin-inline:auto;
        }
        .img-presentant-fonctionnalite {
            height:300px;
            border:1px solid gray;
            margin-inline:auto;
        }
        .text-description {
            text-align:center;
            height:35px;
            margin:5px;
            color:black;
        }

        /**
            Presentation de l'application mobile de lavalife
        */

        .presentation_mobile {
            height:75vh;
            width:100%;
            background-image:url("mesimages/ll_welcome_app_bg.jpg");
            background-repeat:no-repeat;
            background-position:center;
            background-size:cover;
            object-fit:cover;
            position:relative;
            margin-top:25px;
        }
        .glass {
            max-width:450px;
            padding:20px;
            backdrop-filter:blur(15px);
            background-color:rgba(0,0,0,0.2);
            border-radius:10px;
            max-height:300px;
            position:absolute;
            right:20px;
            top:20px;
        }
            .glass h2, p {
                color:white;
            }
            .glass h2 {
                font-size:30px;
            }
            .glass p {
                font-size:18px;
            }
        .container_plateforme_ll {
            margin-block:15px;
            display:flex;
            flex-direction:row;
            justify-content:space-between;
            width:300px;

        }

        /**
            section appel a l'action
        */
        .container_appel_action {
            display:flex;
            flex-direction:column;
            max-width:700px;
            margin:auto;

        }
            .container_appel_action div p {
                color:black;
                text-align:center;
               max-width:665px;
               font-family:sans-serif;
               font-size:20px;
               font-weight:lighter;
            }
            .container_appel_action div iframe {
                width:100%;
                height:315px;
            }
        .titre_intro h3 {
            font-size:35px;
            font-weight:100;
            margin-bottom:5px;
            text-align:center;
            font-family:sans-serif;
        }

        .titre_intro span {
            color:red;
             font-size:35px;
             font-weight:100;
             margin-bottom:5px;
             text-align:center;
             font-family:sans-serif;
             display:block;
        }
        .container_btn_signup2 {
            display:flex;
            justify-content:center;
            margin:15px;
        }
            .container_btn_signup2 .btnSignup2 {
                padding:10px;
                border:2px solid red;
                border-radius:20px;
                background-color:white;
                color:red;
                width:100px;
            }
        .container_btn_signup2 .btnSignup2:hover{
            background:red;
            color:white; 
            cursor:pointer;
        }
        /**
            footer
        */
        footer {
            background-color:rgb(128, 128, 128,0.3);
            display:flex;
            justify-content:space-between;
            align-items:center;
            align-content:center;
            padding:25px;
        }
            footer small {
                font-size:15px;
                font-weight:lighter;
                color:black;
                max-width:1100px;
                margin:auto;
            }

    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="heroWrapper">
        <div class="container">
            <div class="zoneStartNow">
                <div class="container">
                    <img id="img_ll_gauche" src="mesimages/ll_logo.png" alt="Logo lavaLife" />
                    <h2>MEET FUN SINGLES!</h2>
                    <p class="para_call">Call 1-866-546-5282 </p>
                    <p class="para_Action">CALL • CLICK • CONNECT TRY IT FREE!</p>
                    <asp:Button Text="Start now" CssClass="btnStartNow" runat="server" />
                </div>
            </div>
   
            <div class="zoneBtnsAuthentification">
                <div id="heroContainer">
                        <img src="mesimages/LL_right_text_header.png" alt="titre de la  Hero page" class="imgRight" />
                        <p class="heroText">
                            Lavalife wants to put the excitement back in dating. 
                            We match your interests to help you break the ice and give you online dating 
                            tips along the way to make sure you have the best experience possible.
                            Get started today.
                        </p>
                        <div class="containerBtn">
                            <asp:Button ID="btnLogin" Text="Login" CssClass="btnLogin" OnClick="btnLogin_Click" runat="server" />
                            <asp:Button ID="btnSignUp" Text="Sign up" CssClass="btnSignup" OnClick="btnSignUp_Click" runat="server" />
                        </div>
                </div>
           </div>
            
        </div>
        <div class="separateur_rouge">
            <p class="para_separateur">Meet more people, spark more conversations and have more fun!</p>
        </div>
          <div class="ll_fonctionnement">
              <h3>How LavaLife Works</h3>
              <p>Since 2001, Lavalife.com has been committed to helping its members find dates, relationships and soul mates its's all in our:</p>
          </div>
          <div class="container_fonction">
              <div class="signUp">
                  <img class="img_fonctionnalites" src="mesimages/ll_welcome_ic_profile.png" alt="image representant le temps" />
                  <p class="text-description">Quick sign up process—under 10 minutes!</p>
                  <img class="img-presentant-fonctionnalite" src="mesimages/ll_welcome_profile_img.png" alt="image de creation de compte" />
              </div>
              <div class="search">
                  <img class="img_fonctionnalites" src="mesimages/ll_welcome_ic_design.png" alt="image representant le temps" />
                   <p class="text-description">Easy-to-use search, messaging and notifications.</p>
                  <img class="img-presentant-fonctionnalite" src="mesimages/ll_welcome_design_img.png" alt="images de femmes dans une photo" />
               </div>
              <div class="nouveautes">
                <img class="img_fonctionnalites" src="mesimages/ll_welcome_ic_interest.png" alt="une image de fuol" />
                <p class="text-description">New “In Common” feature that shows you exactly what makes you click.</p>
                  <img class="img-presentant-fonctionnalite" src="mesimages/ll_welcome_Interest_img.png" alt="images de femmes souriantes" />
            </div>

          </div>
          <section class="presentation_mobile">
              <div class="glass">
                  <img src="mesimages/ll_logo.png" alt="logolavalife" />
                  <h2 class="titre_glass">Take the Fun with You.</h2>
                  <p class="para_glass">Take the fun with you with the Lavalife.com dating app for Android and iOS. 
                      The app offers all the same features as the website. Download the app now!

                  </p>
                  <div class="container_plateforme_ll">
                      <a href="https://apps.apple.com/ca/app/lavalife/id888082770?utm_source=website&utm_medium=web&utm_id=1">
                          <img src="mesimages/logoappstore.png" alt="logo app store" />
                      </a>
                      <a href="https://play.google.com/store/apps/details?id=com.lavalife.mobile&referrer=utm_source%3Dwebsite%26utm_medium%3Dweb&pli=1">
                          <img src="mesimages/logogoogleplay.png" alt="logo google play" />
                      </a>
                  </div>
              </div>
          </section>
          <section class="container_appel_action">     
              <div>
                      <div class="titre_intro">
                          <h3>We’re all about</h3>
                          <span>Fun, Pressure-Free Dating</span>
                      </div>
                      <p>
                          At Lavalife.com, we believe that dating should be fun. 
                          We also believe it should be stress-free! Kick the common dating myths to the curb and start meeting great new people today.

                      </p>
              </div>
              <div>
                  
                  <iframe 
                    width="560" 
                    height="315" 
                    src="https://www.youtube.com/embed/z7I1S43u_Tw" 
                    frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen>
                </iframe>
```
                  <div class="container_btn_signup2">
                     <asp:Button ID="btnSignup2" Text="Sign up" CssClass="btnSignup2" OnClick="btnSignUp_Click" runat="server" />
                  </div>
              </div>
          </section>
       </div>
         <!--  <div class="redLogoLavaLife">
             <img class="logo_img" src="mesimages/LL_seperator.png" alt="logoSeparateur" />
         </div>-->
        <footer>
            <img src="mesimages/ll_logo_gray_march2015.png" alt="imageFooter" />
            <small>All images design and other intellectual materials and copyrights © 2025 Lavalife Ltd. 
                All Rights Reserved. This is an adult service. By selecting any of the options above and/or creating your Lavalife profile, 
                you are confirming that you are 18 years of age or older. 
                Please be sure you have read and agree to our Privacy Policy and Terms of Use.</small>
        </footer>
    </form>
</body>
</html>

