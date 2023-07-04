using System;

namespace CameranaVillage.Models
{
    public class PrenotazioneAttivitaModel
    {
        //public string ID { get; set; }
        public Guid IdPrenotazioneAttivita { get; set; }
        public string IdUtente { get; set; }
        public Guid IdAttivita { get; set; }
    }
}
