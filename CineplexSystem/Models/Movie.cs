using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
namespace CineplexSystem.Models
{
    [DataContract]
    public class Movie
    {
        [DataMember]
        public int MovieId { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string Duration { get; set; }
        [DataMember]
        public string Genre { get; set; }
        [DataMember]
        public int Rating { get; set; }
        [DataMember]
        public float Price { get; set; }
        [DataMember]
        public string Description { get; set; }
    }
}