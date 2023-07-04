using System;
using System.ComponentModel.DataAnnotations;

namespace CameranaVillage.DB.Entities
{
    public class Attivita 
    {
        [Key]
       public Guid IdAttivita { get; set; }
        public string NomeAttivita { get; set; }
        public string DescrizioneAttivita { get; set; }
        public DateTime DataInizio { get; set; }
        public DateTime DataFine { get; set; }
        public int NumeroPosti { get; set; }
        public decimal PrezzoAttivita { get;set; }

    }
}