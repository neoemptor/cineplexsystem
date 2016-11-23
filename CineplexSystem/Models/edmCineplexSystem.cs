namespace CineplexSystem.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class edmCineplexSystem : DbContext
    {
        public edmCineplexSystem()
            : base("name=edmCineplexSystem")
        {
        }

        public virtual DbSet<Customer30022962> Customer30022962 { get; set; }
        public virtual DbSet<MovieOrders30022962> MovieOrders30022962 { get; set; }
        public virtual DbSet<Orders30022962> Orders30022962 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
