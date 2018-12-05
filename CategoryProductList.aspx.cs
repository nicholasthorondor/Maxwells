using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;

public partial class CategoryProductList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Only creates session object if one does not exist.
        if (Session["userShoppingSession"] == null)
        {
            ArrayList productArray = new ArrayList();
            Session["userShoppingSession"] = productArray;
        }

        // Captures query string and sends to xslt as a parameter for category.
        // As a result xlst file will populate the page.
        string categorySelection = Request.QueryString["category"];
        XsltArgumentList xslParam = new XsltArgumentList();
        xslParam.AddParam("category", "", categorySelection);
        XmlControl.TransformArgumentList = xslParam;
    }
}