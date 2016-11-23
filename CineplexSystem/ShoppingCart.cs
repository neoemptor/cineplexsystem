
// the methods with a pending suffix are needed to get around the  sql exception caused by looping through records and saving them each time. I created overloaded methods for the collections.
using CineplexSystem.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace CineplexSystem
{
    public class ShoppingCart : ShoppingCartPage
    {
        // total movie item count
        private static int theTempOrderID;
        public static int Count()
        {
            try
            {
                int theTotalQuantity = 0;
                var cartRecords = from eachCartItem in BasePage.shoppingCart
                                  select eachCartItem;

                foreach (var record in cartRecords)
                {
                    theTotalQuantity += record.Quantity;
                }
                return theTotalQuantity;
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Debug.WriteLine(ex);
                return 0;
            }
        }

        public static IEnumerable<ShoppingCartData> GetAllRecords()
        {
            var result = from eachRecord in BasePage.shoppingCart select eachRecord;

            // the ToList() on the end fixes the incompatibility for paging in the Listview
            return result.ToList();
        }


        protected static void UpdateRecordPending(ShoppingCartData newRecord)
        {
            // Find the original cart record to update
            int movieId = newRecord.MovieId;
            ShoppingCartData oldRecord = BasePage.shoppingCart.Find(x => x.MovieId.Equals(movieId));

            // if the quantities are the same delete the cart item and replace stock items(which is in the addcartitem method).
            if (oldRecord != null && newRecord != null)
            {
                oldRecord.Quantity++;
            }
        }


        public static void UpdateRecord(ShoppingCartData newRecord)
        {
            UpdateRecordPending(newRecord);
        }

        public static void AddRecord(ShoppingCartData record)
        {
            BasePage.shoppingCart.Add(record);
        }

        //Delete record
        public static void DeleteRecord(ShoppingCartData record)
        {
            var result = from eachRecord in BasePage.shoppingCart
                         where eachRecord.TempOrderID == record.TempOrderID
                         select eachRecord;

            // delete movie item and quantity
            BasePage.shoppingCart.Remove(result.FirstOrDefault());
        }

        public static void DeleteRecords()
        {
            // delete all movie items

            BasePage.shoppingCart.Clear();
        }

        public static void UpdateRecord(IEnumerable<ShoppingCartData> newRecords)
        {
            foreach (var record in newRecords)
            {
                UpdateRecordPending(record);
            }
        }

        public static bool AddCartItemQuantity(int movieId, string theMovieName, float theUnitPrice, int theQuantity)
        {

            bool noDuplicate = false;
            var duplicateTest = from eachItem in BasePage.shoppingCart
                                where eachItem.MovieId == movieId
                                select eachItem;
            int duplicateCount = duplicateTest.Count();

            if (duplicateTest == null || duplicateCount == 0)
            {
                    // theTempOrderID = duplicateTest.FirstOrDefault().TempOrderID;
                    ShoppingCartData shoppingItem = new ShoppingCartData()
                    {
                        TempOrderID = ++theTempOrderID,
                        MovieId = movieId,
                        Name = theMovieName,
                        Price = theUnitPrice,
                        Quantity = theQuantity
                    };
                    // check that the same item isn't in the cart. 
                    // if it is get the Quantity and increment the Quantity.
                    // and remove Quantity from stock
                    AddRecord(shoppingItem);
                    noDuplicate = true;
            }
            return noDuplicate;
        }
        public static void Reset()
        {
            try
            {
                var allShoppingCart = from eachProduct in BasePage.shoppingCart
                                      select eachProduct;
                int allShoppingCartCount = allShoppingCart.Count();

                if (allShoppingCartCount > 0)
                {
                    // clear out Shopping Cart
                    ShoppingCart.DeleteRecords();
                }
            }
            catch (Exception e)
            {
                // Can skip code if loaded first.
                System.Console.Write(e.StackTrace);
            }
        }
    }
}
