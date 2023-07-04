using System;

namespace CameranaVillage.Models
{
    public class PrenotazioneAttivitaUtenteModel
    {
        public Guid IdAttivita { get; set; }
        public string NomeAttivita { get; set; }
        public string DescrizioneAttivita { get; set; }
        public DateTime DataInizio { get; set; }
        public DateTime DataFine { get; set; }
        public int NumeroPosti { get; set; }
        public decimal PrezzoAttivita { get; set; }

        // Proprietà aggiuntive da PrenotazioneAttivita
        public Guid IdPrenotazioneAttivita { get; set; }
        public string IdUtente { get; set; }
        public string UserName { get; set; }
    }

}
