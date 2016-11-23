using CineplexSystem.Models;
using System.Collections.Generic;
using System.Linq;

namespace CineplexSystem
{
    public class CustomerModel
    {
        public static IEnumerable<Customer30022962> GetAllRecords()
        {
            var result = from eachCustomer in BasePage.dbeCineplex.Customer30022962 select eachCustomer;

            return result.ToList();
        }

        public static void UpdateRecord(Customer30022962 newCustomer)
        {
            // Find the original supplier record to update
            Customer30022962 oldCustomer = BasePage.dbeCineplex.Customer30022962.Find(newCustomer.CustomerId);

            // save to found supplier record
            oldCustomer.Name = newCustomer.Name;
            oldCustomer.Phone = newCustomer.Phone;
            oldCustomer.CType = newCustomer.CType;
            oldCustomer.CardNo = newCustomer.CardNo;
            oldCustomer.Email = newCustomer.Email;
            oldCustomer.ExpDate = newCustomer.ExpDate;
            BasePage.dbeCineplex.SaveChangesAsync();
        }

        public static void AddRecord(Customer30022962 newCustomer)
        {
            BasePage.dbeCineplex.Customer30022962.Add(newCustomer);

            BasePage.dbeCineplex.SaveChangesAsync();
        }

        //Delete record
        public static void DeleteRecord(Customer30022962 thisCustomer)
        {
            // this method deletes the related records in Order_Products it then deletes the Orders records and finally deletes the customer.

            // filter orders by customer id
            Orders30022962 order = BasePage.dbeCineplex.Orders30022962.Find(thisCustomer.CustomerId);

            // filter orders and products by order id
            var orderAndMovies = from eachOP in BasePage.dbeCineplex.MovieOrders30022962
                                   select eachOP;

            // delete each order and products link
            foreach (var theOrder in orderAndMovies)
            {
                if (theOrder.OrderId == order.OrderId)
                {
                    BasePage.dbeCineplex.MovieOrders30022962.Remove(theOrder);
                }
            }

            // delete the order
            BasePage.dbeCineplex.Orders30022962.Remove(order);

            // filter the customers by customer id
            var result = from eachCustomer in BasePage.dbeCineplex.Customer30022962 where eachCustomer.CustomerId == thisCustomer.CustomerId select eachCustomer;

            // delete the customer thisCustomer
            BasePage.dbeCineplex.Customer30022962.Remove(result.FirstOrDefault());
            BasePage.dbeCineplex.SaveChanges();
        }
    }
}
