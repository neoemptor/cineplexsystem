namespace CineplexSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Orders30022962
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Orders30022962()
        {
            MovieOrders30022962 = new HashSet<MovieOrders30022962>();
        }

        [Key]
        public int OrderId { get; set; }

        [Column(TypeName = "date")]
        public DateTime Date { get; set; }

        public int CustomerId { get; set; }

        public virtual Customer30022962 Customer30022962 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MovieOrders30022962> MovieOrders30022962 { get; set; }
    }
}
