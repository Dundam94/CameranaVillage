using Microsoft.AspNetCore.Mvc;
using CameranaVillage.DB;
using CameranaVillage.DB.Entities;
using CameranaVillage.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using CameranaVillage.Models;
using System;
using Microsoft.AspNetCore.Identity;



namespace CameranaVillage.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttivitaController : ControllerBase
    {
        private readonly Repository repository;
        private readonly UserManager<User> userManager;

        public AttivitaController(Repository repository, UserManager<User> userManager)
        {
            this.repository = repository;
            this.userManager = userManager;
        }


        //[HttpGet("GetAttivita")]
        //public async Task<List<AttivitaModel>> GetAttivita()
        //{
        //    List<Attivita> resultRow = repository.GetAttivitaPrenotabili();
        //    List<AttivitaModel> result = new List<AttivitaModel>();

        //    foreach (Attivita a in resultRow)
        //    {
        //        AttivitaModel model = new AttivitaModel()
        //        {
        //            IdAttivita = a.IdAttivita,
        //            NomeAttivita = a.NomeAttivita,
        //            DescrizioneAttivita = a.DescrizioneAttivita,
        //            DataInizio = a.DataInizio,
        //            DataFine = a.DataFine,
        //            NumeroPosti = a.NumeroPosti,
        //            PrezzoAttivita = a.PrezzoAttivita
        //        };

        //        result.Add(model);
        //    }

        //    return result;
        //}

        //[HttpPost("PostPrenotazione")]
        //public async Task<List<PrenotazioneAttivitaModel>> PostPrenotazione( string userId, Guid idAttivita )
        //{
        //    List<PrenotazioneAttivita> resultRow = repository.AddPrenotazione(userId, idAttivita);
        //    List<PrenotazioneAttivitaModel> result = new List<PrenotazioneAttivitaModel>();

        //    return result;
        //}

        //[HttpPost("PostPrenotazione")]
        //public async Task<IActionResult> PostPrenotazione([FromBody] string userId, Guid idAttivita)
        //{
        //    //PrenotazioneAttivita prenotazione = new PrenotazioneAttivita();
        //    //prenotazione.IdUtente = userId;
        //    //prenotazione.IdAttivita = idAttivita;
        //    repository.AddPrenotazione(userId, idAttivita);
        //    return Ok(200);
        //}
        

        //[HttpPost("PrenotaAttivita")]
        //public async Task<IActionResult> PrenotaAttivita([FromBody] PrenotazioneAttivita prenotazione)
        //{
        //    PrenotazioneAttivita myprenotazione = new PrenotazioneAttivita();
        //    //prenotazione.IdUtente = userId;
        //    //prenotazione.IdAttivita = idAttivita;
        //    string userId = userManager.GetUserId(User);

        //    repository.AddPrenotazione(myprenotazione.IdUtente, myprenotazione.IdAttivita);
        //    return Ok(200);
        //}

        [HttpPost("PrenotaAttivita")]
        public async Task<IActionResult> PrenotaAttivita([FromBody] PrenotazioneAttivita prenotazione)
        {
            string userId = userManager.GetUserId(User);

            repository.AddPrenotazione(userId, prenotazione.IdAttivita);
            return Ok();
        }

        //da finire 
        [HttpDelete("PrenotazioneAttivita/{idPrenotazioneAttivita}")]
        public IActionResult DeletePrenotazioneAttivita(Guid idPrenotazioneAttivita)
        {
            try
            {
                DeletePrenotazioneAttivita(idPrenotazioneAttivita);
                return Ok();
            }
            catch (Exception ex)
            {
                // Gestisci l'eccezione come desideri
                return BadRequest("Errore durante la cancellazione della prenotazione.");
            }
        }

        [HttpPost("DeleteAttivita")]
        public async Task<IActionResult> DeleteAttivita([FromBody] PrenotazioneAttivita prenotazione)
        {
            //string userId = userManager.GetUserId(User);
            repository.DeletePrenotazioneAttivita(prenotazione.IdPrenotazioneAttivita);
            return Ok();
        }



    }
}