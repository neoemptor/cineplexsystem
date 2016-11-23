using CineplexSystem.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;

namespace CineplexSystem
{
    public partial class Movies : BasePage
    {
        List<int> chosenMovieIDs = new List<int>();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // have to refresh the data in the listview otherwise it's blank even though it's set in the page?
                //lvMovies.DataSourceID = "odsMovies";
                //lvMovies.DataBind();

                //// get all the movies that were chosen before user left the page.
                //foreach (var item in shoppingCart)
                //{

                //    foreach (var row in lvMovies.Items)
                //    {
                //        Label MovieIdLabel = (Label)row.FindControl("MovieIdLabel");
                //        CheckBox SelectCategoryButton = (CheckBox)row.FindControl("SelectCategoryButton");
                //        int itemMovieId = Convert.ToInt32(MovieIdLabel.Text.ToString());

                //        if (itemMovieId == item.MovieId)
                //        {
                //            SelectCategoryButton.Checked = true;
                //        }
                //    }
                //}
            }
        }

        private List<Movie> GetMovies()
        {
            var allMovies = from eachMovie in BasePage.movies
                            orderby eachMovie.Name
                            select eachMovie;
            return allMovies.ToList();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // empty cart before reloading chosen movies.
            foreach (ListViewDataItem item in lvMovies.Items)
            {
                CheckBox SelectCategoryButton = (CheckBox)item.FindControl("SelectCategoryButton");
                if (SelectCategoryButton != null)
                {
                    Label MovieIdLabel = (Label)item.FindControl("MovieIdLabel");
                    int movieId = Convert.ToInt32(MovieIdLabel.Text.ToString());
                    AddToCart(movieId, SelectCategoryButton.Checked);
                }
            }
        }
        protected void AddToCart(int movieId, bool isChecked)
        {
            // update Status Bar
            Label lblStatus = (Label)this.FindControl("ctl00$ContentPlaceHolder1$lblStatus");
            //lblStatus.ForeColor = Color.Green;
            //lblStatus.Text = "Status Bar:";

            // find the product record
            Movie thisMovie = BasePage.movies.Find(x => x.MovieId.Equals(movieId));

            // if it isn't found add item to cart
            if (thisMovie != null && isChecked)
            {
                bool noDuplicates = ShoppingCart.AddCartItemQuantity(thisMovie.MovieId, thisMovie.Name, thisMovie.Price, 1);

                if (noDuplicates)
                {
                    // show new item in cart
                    UpdateCartItemDisplay(ShoppingCart.Count());

                    // update Status Bar
                    lblStatus.ForeColor = Color.Green;
                    lblStatus.Text = "Status Bar: You have succesfully added this item to your cart.";
                }
                else
                {
                    // update Status Bar
                    lblStatus.ForeColor = Color.Red;
                    lblStatus.Text = "Status Bar: You tried to add a duplicate item to your cart.";
                }
            }
            lvMovies.DataSourceID = "odsMovies";
            lvMovies.DataBind();

            // get all the movies that were chosen before user left the page.
            foreach (var item in shoppingCart)
            {
                foreach (var row in lvMovies.Items)
                {
                    CheckBox SelectCategoryButton = (CheckBox)row.FindControl("SelectCategoryButton");

                    SelectCategoryButton.Checked = false;
                }
            }
        }


        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // only go to checkout if something is in the cart otherwise show an error.
            int shoppingCartCount = shoppingCart.Count;
            if (shoppingCartCount > 0)
            {
                Response.Redirect("~/CheckoutFolder/Checkout.aspx");
            }
            else
            {
                Label lblStatus = (Label)FindControl("ctl00$ContentPlaceHolder1$lblStatus");
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Status: You need to select movies before you can go to checkout.";
            }
        }
    }
}
