using System;
using System.Globalization;
using System.Linq;

namespace CineplexSystem
{
    public partial class PurchaseOrder : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // show todays date on the purchase order
            CultureInfo culture = new CultureInfo("en-AU");
            lblDate.Text = DateTime.Today.ToString("d",culture);


            // show the purchase order number on the purchase order
            string theOrderID = Session["OrderID"].ToString();
            lblPurchaseOrderNo.Text = theOrderID;
            int numericOrderID = Convert.ToInt32(theOrderID);

            // get the order details
            var orderDetails = from eachOrder in dbeCineplex.Orders30022962
                               join eachCustomer in dbeCineplex.Customer30022962 on eachOrder.CustomerId equals eachCustomer.CustomerId
                               join each_Movie_Order in dbeCineplex.MovieOrders30022962 on eachOrder.OrderId equals each_Movie_Order.OrderId
                               where eachOrder.OrderId == numericOrderID
                               select new
                               {
                                   FullName = eachCustomer.Name,
                                   eachCustomer.Phone,
                                   eachCustomer.CType,
                                   eachCustomer.CardNo,
                                   eachCustomer.Email,
                                   eachOrder.Date,
                                   each_Movie_Order.MovieId
                               };

            // had to break it up. It was getting to complex.
            var orderResult = from eachMovie in BasePage.movies
                              join eachMovieId in orderDetails on eachMovie.MovieId equals eachMovieId.MovieId
                              select new
                              {
                                  eachMovieId.FullName,
                                  eachMovieId.Phone,
                                  eachMovieId.CType,
                                  eachMovieId.CardNo,
                                  eachMovieId.Email,
                                  eachMovieId.Date,
                                  eachMovie.Name,
                                  eachMovie.Description,
                                  eachMovie.Price,
                                  Total = eachMovie.Price
                              };


            // set up the customer info to show.
            var orderRecord = orderResult.ToList().ElementAt(0);
            lblFullName.Text = orderRecord.FullName;
            lblPhone.Text = orderRecord.Phone;
            lblEmail.Text = orderRecord.Email;

            // convert to correct date format.
            lblDeliveryDate.Text = orderRecord.Date.ToString("d",culture);
            float subTotal = 0;

            // calculate cost subtotal
            foreach (var record in orderResult)
            {
                subTotal = subTotal + record.Total;
            }

            // calculate total cost after tax
            float tax = subTotal * 0.1f;
            float netTotal = subTotal + tax;

            // format and display totals
            lblSubTotal.Text = String.Format("{0:C2}", subTotal);
            lblTax.Text = String.Format("{0:C2}", tax);
            lblNetTotal.Text = String.Format("{0:C2}", netTotal);

            // show the purchased items.
            lvPOItems.DataSource = orderResult.ToList();
            lvPOItems.DataBind();
        }
    }
}