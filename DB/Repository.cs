using CameranaVillage.DB.Entities;
using CameranaVillage.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CameranaVillage.DB
{

    //

    public class Repository
    {
        private DBContext DBContext;
        public Repository(DBContext DBContext)
        {
            this.DBContext = DBContext;
        }

        // x Utente

        public List<Attivita> GetAttivitaPrenotabili()
        {
            DateTime today = DateTime.Today;

            List<Attivita> attivitaPrenotabili = this.DBContext.Attivita
                .Where(attivita => attivita.DataInizio >= today)
                .Select(attivita => new Attivita
                {
                    IdAttivita = attivita.IdAttivita,
                    NomeAttivita = attivita.NomeAttivita,
                    DescrizioneAttivita = attivita.DescrizioneAttivita,
                    DataInizio = attivita.DataInizio,
                    DataFine = attivita.DataFine,
                    NumeroPosti = attivita.NumeroPosti - this.DBContext.PrenotazioneAttivita.Count(p => p.IdAttivita == attivita.IdAttivita),
                    PrezzoAttivita = attivita.PrezzoAttivita
                })
                .ToList();

            return attivitaPrenotabili;
        }


        public void AddPrenotazione(string userId, Guid attivitaId)
        {
            PrenotazioneAttivita prenotazione = new PrenotazioneAttivita
            {
                IdPrenotazioneAttivita = Guid.NewGuid(), // Genera un nuovo ID per la prenotazione
                IdUtente = userId,
                IdAttivita = attivitaId
            };

            this.DBContext.PrenotazioneAttivita.Add(prenotazione);
            this.DBContext.SaveChanges();

        }

        //public List<Attivita> GetAttivitaPrenotate(string userId)
        //{
        //    var attivitaPrenotate = from prenotazione in DBContext.PrenotazioneAttivita
        //                            join attivita in DBContext.Attivita on prenotazione.IdAttivita equals attivita.IdAttivita
        //                            where prenotazione.IdUtente == userId
        //                            select attivita;

        //    return attivitaPrenotate.ToList();
        //}

        public List<PrenotazioneAttivitaUtenteModel> GetAttivitaPrenotate(string userId)
        {
            var attivitaPrenotate = from prenotazione in DBContext.PrenotazioneAttivita
                                    join attivita in DBContext.Attivita on prenotazione.IdAttivita equals attivita.IdAttivita
                                    where prenotazione.IdUtente == userId
                                    select new PrenotazioneAttivitaUtenteModel
                                    {
                                        IdAttivita = attivita.IdAttivita,
                                        NomeAttivita = attivita.NomeAttivita,
                                        DescrizioneAttivita = attivita.DescrizioneAttivita,
                                        DataInizio = attivita.DataInizio,
                                        DataFine = attivita.DataFine,
                                        NumeroPosti = attivita.NumeroPosti,
                                        PrezzoAttivita = attivita.PrezzoAttivita,
                                        IdPrenotazioneAttivita = prenotazione.IdPrenotazioneAttivita,
                                        IdUtente = prenotazione.IdUtente
                                    };

            return attivitaPrenotate.ToList();
        }


        public List<PrenotazioneAttivitaUtenteModel> GetAttivitaPrenotateAdmin()
        {
            var attivitaPrenotate = from prenotazione in DBContext.PrenotazioneAttivita
                                    join attivita in DBContext.Attivita on prenotazione.IdAttivita equals attivita.IdAttivita
                                    join users in DBContext.AspNetUsers on prenotazione.IdUtente equals users.Id
                                    select new PrenotazioneAttivitaUtenteModel
                                    {
                                        IdAttivita = attivita.IdAttivita,
                                        NomeAttivita = attivita.NomeAttivita,
                                        DescrizioneAttivita = attivita.DescrizioneAttivita,
                                        DataInizio = attivita.DataInizio,
                                        DataFine = attivita.DataFine,
                                        NumeroPosti = attivita.NumeroPosti,
                                        PrezzoAttivita = attivita.PrezzoAttivita,
                                        IdPrenotazioneAttivita = prenotazione.IdPrenotazioneAttivita,
                                        IdUtente = prenotazione.IdUtente,
                                        UserName = users.UserName,
                                    };

            return attivitaPrenotate.ToList();
        }


        //public List<PrenotazioneAttivitaUtenteModel> GetAttivitaPrenotateAdmin()
        //{
        //    var attivitaPrenotate = from prenotazione in DBContext.PrenotazioneAttivita
        //                            join attivita in DBContext.Attivita on prenotazione.IdAttivita equals attivita.IdAttivita
        //                            select new PrenotazioneAttivitaUtenteModel
        //                            {
        //                                IdAttivita = attivita.IdAttivita,
        //                                NomeAttivita = attivita.NomeAttivita,
        //                                DescrizioneAttivita = attivita.DescrizioneAttivita,
        //                                DataInizio = attivita.DataInizio,
        //                                DataFine = attivita.DataFine,
        //                                NumeroPosti = attivita.NumeroPosti,
        //                                PrezzoAttivita = attivita.PrezzoAttivita,
        //                                IdPrenotazioneAttivita = prenotazione.IdPrenotazioneAttivita,
        //                                IdUtente = prenotazione.IdUtente
        //                            };

        //    return attivitaPrenotate.ToList();
        //}




        public void DeletePrenotazioneAttivita(Guid idPrenotazioneAttivita)
        {
            PrenotazioneAttivita toDelete = this.DBContext.PrenotazioneAttivita
                    //.Where(p => p.ID != null && p.ID.Value.ToString() == ID) nel caso fosse nullable
                    .Where(p => p.IdPrenotazioneAttivita == idPrenotazioneAttivita)
                    .FirstOrDefault();
            this.DBContext.PrenotazioneAttivita.Remove(toDelete);
            this.DBContext.SaveChanges();
        }




        // x Admin
        public List<Attivita> GetAttivita()
        {
            //select * from persons
            List<Attivita> result = this.DBContext.Attivita.ToList();
            return result;
        }

        public List<User> GetUsers()
        {
            //select * from persons
            List<User> result = this.DBContext.Users.ToList();
            return result;
        }

        //public void InsertAutore(Autore autore)
        //{
        //    this.DBContextLibreria.Autori.Add(autore);
        //    this.DBContextLibreria.SaveChanges();
        //}

        //public List<Libro> GetLibro()
        //{
        //    //select * from persons
        //    List<Libro> result = this.DBContextLibreria.Libri.ToList();
        //    return result;
        //}


        //public void InsertLibro(Libro libro)
        //{
        //    this.DBContextLibreria.Libri.Add(libro);
        //    this.DBContextLibreria.SaveChanges();
        //}

    }
}
