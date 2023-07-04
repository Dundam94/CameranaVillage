using System;
using System.ComponentModel.DataAnnotations;

namespace CameranaVillage.DB.Entities
{
    public class PrenotazioneAttivita
    {
        [Key]
        public Guid IdPrenotazioneAttivita { get; set; }
        public string IdUtente { get; set; }
        public Guid IdAttivita { get; set; }


    }
}
