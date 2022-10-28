using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testPrueba
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            this.limpiarLBL();
            if (this.tbUsuario.Text == "")
            {
                lblErrorUsuario.Visible = true;
            }
            else if (this.tbContrasenia.Text == "")
            {
                lblErrorContrasenia.Visible = true;
            }
            else { 
                 lblExitoLog.Visible = true;
            }
        }

        private void limpiarLBL() {
            lblErrorUsuario.Visible = false;
            lblErrorContrasenia.Visible = false;
            lblExitoLog.Visible = false;
        }
    }
}