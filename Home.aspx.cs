using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Creates a new array for storing products that the user may add to the shopping cart, and adds to a session object.
        // Only creates session object if one does not exist.
        if (Session["userShoppingSession"] == null)
        {
            ArrayList productArray = new ArrayList();
            Session["userShoppingSession"] = productArray;
        }
    }
}