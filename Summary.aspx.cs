using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Summary : System.Web.UI.Page
{
    private double total = 0; // For calculating order total.

    protected void Page_Load(object sender, EventArgs e)
    {
        // If no session object exists, redirect to home page.
        if (Session["userShoppingSession"] == null || Session["customerDetails"] == null || Session["shippingAddress"] == null) {
            Response.Redirect("Home.aspx");
        }

        // Extracts product array from session object.
        ArrayList productArray = (ArrayList)Session["userShoppingSession"];
        int arrayLength = productArray.Count;

        // Extracts customer and shipping address objects from session object.
        Customer customer = (Customer)Session["customerDetails"];
        Customer shippingAddress = (Customer)Session["shippingAddress"];

        // If no items are present in the cart, redirect to home page.
        if (productArray.Count <= 0) {
            Response.Redirect("Home.aspx");
        }

        //----------------------
        // Page population Logic
        //----------------------

        // Populate page with items being purchased.
        for (int i = 0; i < arrayLength; i++) {
            // Examines product object at each index of the array.
            Product product = (Product)productArray[i];

            // Container
            HtmlGenericControl itemContainer = new HtmlGenericControl("div");
            itemContainer.ID = "itemContainer" + i;

            // Product Image
            Image imgProduct = new Image();
            imgProduct.ID = "imgProduct" + i;
            imgProduct.ImageUrl = "Images/" + product.GetImage();
            imgProduct.CssClass = "cartImg";

            // Product Name
            Label lblProductName = new Label();
            lblProductName.ID = "lblProductName" + i;
            lblProductName.Text = product.GetName();
            lblProductName.CssClass = "cartItems" + " " + "summaryCartItemName";

            // Product Price
            Label lblProductPrice = new Label();
            lblProductPrice.ID = "lblProductPrice" + i;
            double itemTotal = product.GetPrice() * product.GetQuantity();
            lblProductPrice.Text = itemTotal.ToString("C2");
            lblProductPrice.CssClass = "cartItems" + " " + "cartItemPrice";

            // Product Quantity
            Label lblQuantity = new Label();
            lblQuantity.ID = "lblQuantity" + i;
            lblQuantity.Text = product.GetQuantity().ToString();
            lblQuantity.CssClass = "cartQuantity";

            // Populates page with controls.
            controlsContainerSummary.Controls.Add(itemContainer);
            itemContainer.Controls.Add(imgProduct);
            itemContainer.Controls.Add(lblProductName);
            itemContainer.Controls.Add(lblQuantity);
            itemContainer.Controls.Add(lblProductPrice);
        }

        // Calculates order total, including flat rate shipping cost of $9.99;
        for(int i = 0; i < productArray.Count; i++) {
            Product product = (Product)productArray[i];
            total += product.GetPrice() * product.GetQuantity() + 9.99;
        }
        lblGrandTotal.Text += total.ToString("C2");

        // Payment Details
        lblCardType.Text = customer.getCardType();
        lblNameOnCard.Text = customer.getNameOnCard();
        lblCardNumber.Text = customer.getCardNumber();
        lblExpiry.Text = customer.getCardExp();
        lblCVN.Text = customer.getCardCvn();

        // Billing Details
        lblBillingName.Text = customer.getFullName();
        lblBillingAddress.Text = customer.getFullAddress();
        lblBillingContact.Text = customer.getFullContact();

        //Shipping Details
        lblShippingName.Text = shippingAddress.getFullName();
        lblShippingAddress.Text = shippingAddress.getFullAddress();
        lblShippingContact.Text = shippingAddress.getFullContact();
     }

    //--------------------------------
    // On Click Event Handler Methods
    //--------------------------------

    protected void btnContShop_Click(object sender, EventArgs e) {
        Response.Redirect("ShoppingCart.aspx");
    }

    //----------------
    // Button for handling the finalising of the order, pushing data to the database and displaying thank you for shopping message.
    //----------------
    protected void btnFinaliseOrder_Click(object sender, EventArgs e) {
        // Extracts customer and shipping address objects from session object.
        Customer customer = (Customer)Session["customerDetails"];
        Customer shippingAddress = (Customer)Session["shippingAddress"];

        // Extracts product array from session object.
        ArrayList productArray = (ArrayList)Session["userShoppingSession"];
        int arrayLength = productArray.Count;

        // Creates new DataBase object.
        DataBase db = new DataBase();

        // Inserts customer and product data into the database.
        try {
            db.ConnectToDB();

            // --------------
            // Customer table
            // --------------
            // Looks at current number of rows in the database table, stores value and creates a new row.
            int rowCountCust = db.RowCount("CustID", "Customer");
            db.CreateRow("Customer", rowCountCust);

            // Looks at the current maximum value in the specified column.
            int countCust = db.ColumnMaxValue("CustID", "Customer");

            // Uses the above count to ensure that new data is inserted at the bottom of the data table.
            db.InsertStringData("Customer", "CustID", countCust, "Title", customer.getTitle());
            db.InsertStringData("Customer", "CustID", countCust, "FName", customer.getFirstName());
            db.InsertStringData("Customer", "CustID", countCust, "MName", customer.getMiddleName());
            db.InsertStringData("Customer", "CustID", countCust, "Surname", customer.getSurname());
            db.InsertStringData("Customer", "CustID", countCust, "PropertyName", customer.getPropertyName());
            db.InsertIntData("Customer", "CustID", countCust, "StreetNum", Int32.Parse(customer.getStreetNumber()));
            db.InsertStringData("Customer", "CustID", countCust, "StreetName", customer.getStreetName());
            db.InsertStringData("Customer", "CustID", countCust, "StreetType", customer.getStreetType());
            db.InsertStringData("Customer", "CustID", countCust, "Suburb", customer.getSuburb());
            db.InsertStringData("Customer", "CustID", countCust, "City", customer.getCity());
            db.InsertStringData("Customer", "CustID", countCust, "State", customer.getState());
            db.InsertIntData("Customer", "CustID", countCust, "PostCode", Int32.Parse(customer.getPostCode()));
            db.InsertStringData("Customer", "CustID", countCust, "Country", customer.getCountry());
            db.InsertStringData("Customer", "CustID", countCust, "Email", customer.getEmail());
            db.InsertStringData("Customer", "CustID", countCust, "CountryCode", customer.getCountryCode());
            db.InsertStringData("Customer", "CustID", countCust, "AreaCode", customer.getAreaCode());
            db.InsertStringData("Customer", "CustID", countCust, "Landline", customer.getLandline());
            db.InsertStringData("Customer", "CustID", countCust, "Mobile", customer.getMobile());

            // --------------
            // Shipping Details Table
            // --------------
            // Looks at current number of rows in the database table, stores value and creates a new row.
            int rowCountShip = db.RowCount("ShippingID", "ShippingDetails");
            db.CreateRow("ShippingDetails", rowCountShip);

            // Loks at the current maximum value in the specified column.
            int countShip = db.ColumnMaxValue("ShippingID", "ShippingDetails");

            // Uses the above count to ensure that new data is inserted at the bottom of the data table.
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "Title", shippingAddress.getTitle());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "FName", shippingAddress.getFirstName());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "MName", shippingAddress.getMiddleName());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "Surname", shippingAddress.getSurname());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "PropertyName", shippingAddress.getPropertyName());
            db.InsertIntData("ShippingDetails", "ShippingID", countShip, "StreetNum", Int32.Parse(shippingAddress.getStreetNumber()));
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "StreetName", shippingAddress.getStreetName());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "StreetType", shippingAddress.getStreetType());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "Suburb", shippingAddress.getSuburb());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "City", shippingAddress.getCity());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "State", shippingAddress.getState());
            db.InsertIntData("ShippingDetails", "ShippingID", countShip, "PostCode", Int32.Parse(shippingAddress.getPostCode()));
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "Country", shippingAddress.getCountry());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "Email", shippingAddress.getEmail());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "CountryCode", shippingAddress.getCountryCode());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "AreaCode", shippingAddress.getAreaCode());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "Landline", shippingAddress.getLandline());
            db.InsertStringData("ShippingDetails", "ShippingID", countShip, "Mobile", shippingAddress.getMobile());

            // --------------
            // Payment Details Table
            // --------------
            // Looks at current number of rows in the database table, stores value and creates a new row.
            int rowCountPay = db.RowCount("PaymentID", "PaymentDetails");
            db.CreateRow("PaymentDetails", rowCountPay);

            // Loks at the current maximum value in the specified column.
            int countPay = db.ColumnMaxValue("PaymentID", "PaymentDetails");

            // Uses the above count to ensure that new data is inserted at the bottom of the data table.
            db.InsertStringData("PaymentDetails", "PaymentID", countPay, "CardType", customer.getCardType());
            db.InsertStringData("PaymentDetails", "PaymentID", countPay, "NameOnCard", customer.getNameOnCard());
            db.InsertStringData("PaymentDetails", "PaymentID", countPay, "CardNum", customer.getCardNumber());
            db.InsertIntData("PaymentDetails", "PaymentID", countPay, "ExpMonth", Int32.Parse(customer.getCardExpMonth()));
            db.InsertIntData("PaymentDetails", "PaymentID", countPay, "ExpYear", Int32.Parse(customer.getCardExpYear()));
            db.InsertStringData("PaymentDetails", "PaymentID", countPay, "CVN", customer.getCardCvn());

            // --------------
            // Orders Table
            // --------------
            // Looks at current number of rows in the database table, stores value and creates a new row.
            int rowCountOrder = db.RowCount("OrderID", "Orders");
            // Uses CreateOrder method as Orders table is reliant on Cutomer data being present, therefore the column number must match a customer id.
            db.CreateOrderRow("Orders", "CustID", countCust);

            // Loks at the current maximum value in the specified column.
            int countOrder = db.ColumnMaxValue("OrderID", "Orders");

            // Gets and stores current date in format that will work with microsoft access.
            DateTime date = DateTime.Now;
            string dateNow = date.ToShortDateString();

            // Uses the above count to ensure that new data is inserted at the bottom of the data table.
            db.InsertIntData("Orders", "OrderID", countOrder, "CustID", countCust);
            db.InsertStringData("Orders", "OrderID", countOrder, "OrderDate", dateNow);
            db.InsertDoubleData("Orders", "OrderID", countOrder, "OrderTotal", total);

            // --------------
            // Order Details Table
            // --------------
            // Looks at current number of rows in the database table, stores value and creates a new row.
            for (int i = 0; i < arrayLength; i++) {
                Product product = (Product)productArray[i];

                string prodCode = product.GetCode();
                int rowCountOrderDetails = db.RowCount("OrderID", "OrderDetails");
                // Uses CreateOrderDetails method as OrderDetails table is reliant on Order data being present, therefore each columns number must match an associated id.
                db.CreateOrderDetailsRow("OrderDetails", "OrderID", "ProductID", "ShippingID", "PaymentID", countOrder, prodCode, countShip, countPay);

                // Loks at the current maximum value in the specified column.
                int countOrderDetails = db.ColumnMaxValue("OrderID", "OrderDetails");

                // Uses the above count to ensure that new data is inserted at the bottom of the data table.
                db.InsertIntData("OrderDetails", "OrderID", countOrderDetails, "OrderID", countOrder);
                db.InsertIntData("OrderDetails", "OrderID", countOrderDetails, "ShippingID", countShip);
                db.InsertIntData("OrderDetails", "OrderID", countOrderDetails, "PaymentID", countPay);
            }

            db.CloseDB();

            // Clears session data and redirects to thanks for shopping page.
            Session.Clear();
            Response.Redirect("ThanksForShopping.aspx");
        }
        catch (Exception exception) {
            lblGrandTotal.Text += total.ToString("C2"); // Prevents duplicating total label on an exception.
            lblExceptionHandler.Text = "Database failure: " + exception.ToString();
            db.CloseDB();
        }
    }

}