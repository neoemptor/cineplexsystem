using System;
using System.Drawing;
using System.Web.UI.WebControls;


namespace CineplexSystem
{
    public partial class ShoppingCartPage : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                float theTotal = 0;
                lvShoppingCart.DataBind();
                foreach (var aRow in lvShoppingCart.Items)
                {
                    Label PriceLabel = (Label)aRow.FindControl("PriceLabel");
                    float retrievedTotal = Convert.ToSingle(PriceLabel.Text.Substring(1));
                    theTotal += retrievedTotal;
                }

                //Label lblTotal = (Label)lvShoppingCart.FindControl("lblTotal");
                lblTotal.Text = "Total:   $" + theTotal.ToString();
            }
            catch (NullReferenceException nre)
            {
                // do nothing.
            }

        }
        protected void lvShoppingCart_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            //UpdateCartItemDisplay(ShoppingCart.Count());

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // only go to checkout if there are items in the cart.
            int shoppingCartCount = shoppingCart.Count;
            if (shoppingCartCount > 0)
            {
                Response.Redirect("~/CheckoutFolder/Checkout.aspx");
            }
            else
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Status: You need to select movies before you can go to checkout.";
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // extract the selected index of the list view
            Button deleteButton = (Button)sender;
            string sClientID = deleteButton.ClientID;
            int lastCtrlPos = sClientID.LastIndexOf("ctrl");
            int lastUnderscorePos = sClientID.LastIndexOf("_");


            string sIndex = sClientID.Substring(lastCtrlPos + 4, (lastUnderscorePos - (lastCtrlPos + 4)));
            int theIndex = Convert.ToInt32(sIndex);

            ListViewDataItem currentRow = lvShoppingCart.Items[theIndex];

            Label MovieIdLabel = (Label)currentRow.FindControl("MovieIdLabel");

            int movieId = Convert.ToInt32(MovieIdLabel.Text.ToString());
            Models.ShoppingCartData foundMovie = BasePage.shoppingCart.Find(x => x.MovieId.Equals(movieId));
            BasePage.shoppingCart.Remove(foundMovie);

            float theTotal = 0;
            lvShoppingCart.DataBind();
            foreach (var aRow in lvShoppingCart.Items)
            {
                Label PriceLabel = (Label)aRow.FindControl("PriceLabel");
                float retrievedTotal = Convert.ToSingle(PriceLabel.Text.Substring(1));
                theTotal += retrievedTotal;
            }


            //Label lblTotal = (Label)FindControl("lblTotal");
            lblTotal.Text = "Total:   $" + theTotal.ToString();
            UpdateCartItemDisplay(ShoppingCart.Count());
        }
    }
}
