using System;
using System.Collections.Generic;

namespace CineplexSystem.Models
{
    public partial class ShoppingCartData
    {
        public int TempOrderID { get; set; }
        public int MovieId { get; set; }
        public string Name { get; set; }
        public float Price { get; set; }
        public int Quantity { get; set; }
    }

}
