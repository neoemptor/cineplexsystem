using CineplexSystem.Models;
using System;
using System.Web.UI.WebControls;

namespace CineplexSystem.CheckoutFolder
{
    public partial class Checkout : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetFocus(ddlCardType);
                lblCheckoutStatus.Text = "";
                MaintainScrollPositionOnPostBack = true;
            }
        }
        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            // clear the shopping cart
            CineplexSystem.ShoppingCart.Reset();
            Response.Redirect("~/Default");
        }
        // the month is grabbed from the month drop down selected index and the year is grabbed from the selected item in the year drop down.
        protected void ServerValidateExpiryDate(object source, ServerValidateEventArgs args)
        {
            int intMonth = ddlExpiryMonth.SelectedIndex;
            string year = ddlExpiryYear.SelectedItem.ToString();

            int yearResult;
            int intYear = 0;

            if (int.TryParse(year, out yearResult) == true)
            {
                intYear = yearResult;

                if (intYear > DateTime.Now.Year)
                {
                    args.IsValid = true;
                }
                else if (intYear == DateTime.Now.Year && intMonth > DateTime.Now.Month)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = false;
            }
        }
        protected void ServerValidateCCType(object source, ServerValidateEventArgs args)
        {

            string ccCardType = ddlCardType.Text.ToString();
            int ccNoLength = txtCreditCardNo.Text.Length;
            int outValue;
            // check if Amex card and there are 15 digits

            if (ccNoLength == 0)
            {
                cvCreditCardNo.ErrorMessage = "A card number is required.";
                args.IsValid = false;
            }
            else if (!int.TryParse(txtCreditCardNo.Text.ToString(), out outValue))
            {
                cvCreditCardNo.ErrorMessage = "A number without other characters must be entered.";
                args.IsValid = false;
            }
            else if (ccCardType == "AMEX" && ccNoLength == 15)
            {
                args.IsValid = true;

            }
            else if ((ccCardType == "VISA" || ccCardType == "Master Card") && ccNoLength == 16)
            {
                args.IsValid = true;
            }
            else
            {
                cvCreditCardNo.ErrorMessage = "Enter a valid credit card number. 15 digits for Amex and 16 for other cards.";
                args.IsValid = false;
            }
        }
        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            // Add new customer
            Customer30022962 theCustomer = new Customer30022962();

            theCustomer.Name = txtFName.Text + " " + txtLName.Text;
            theCustomer.Phone = txtPhone.Text;
            theCustomer.CType = ddlCardType.SelectedValue;
            theCustomer.CardNo = txtCreditCardNo.Text;

            theCustomer.ExpDate = Convert.ToDateTime("01/" + ddlExpiryMonth.SelectedValue + "/" + ddlExpiryYear.SelectedValue + " 00:00:00.00");
            theCustomer.Email = txtEmail.Text;

            CineplexSystem.BasePage.dbeCineplex.Customer30022962.Add(theCustomer);
            CineplexSystem.BasePage.dbeCineplex.SaveChanges();



            // add new order
            Orders30022962 theOrder = new Orders30022962();
            theOrder.Date = DateTime.Today;

            // create delivery date
            DateTime theDeliveryDate;
            theDeliveryDate = theOrder.Date.AddDays(5);


            // store the delivery date in a session variable to show on the next pages
            Session["DeliveryDate"] = theDeliveryDate.ToShortDateString();

            theOrder.Date = theDeliveryDate;
            theOrder.CustomerId = theCustomer.CustomerId;

            CineplexSystem.BasePage.dbeCineplex.Orders30022962.Add(theOrder);
            CineplexSystem.BasePage.dbeCineplex.SaveChanges();

            // add order transaction information to database
            MovieOrders30022962 theOrderMovies;
            float totalSale;
            // loop through each product in the shopping cart and add to ordered products table

            foreach (var cartMovie in CineplexSystem.BasePage.shoppingCart)
            {
                theOrderMovies = new MovieOrders30022962();
                theOrderMovies.OrderId = theOrder.OrderId;

                // save the Order number in a session variable for the purchase order display page
                Session["OrderID"] = theOrder.OrderId;

                theOrderMovies.MovieId = cartMovie.MovieId;
                //theOrderMovies. = cartMovie.Quantity;
                
                totalSale = cartMovie.Price * cartMovie.Quantity; // Total Sale
                Session["TotalSale"] = totalSale;
                CineplexSystem.BasePage.dbeCineplex.MovieOrders30022962.Add(theOrderMovies);
            }

            // save all database changes
            CineplexSystem.BasePage.dbeCineplex.SaveChanges();

            // Clear shopping cart without returning products because the cart items have been purchased.
            ShoppingCart.Reset();

            Response.Redirect("~/PurchaseOrder.aspx");
        }
    }
}
