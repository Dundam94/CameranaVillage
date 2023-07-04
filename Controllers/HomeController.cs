using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using CameranaVillage.DB;
using CameranaVillage.DB.Entities;
using CameranaVillage.Models;
using System;
using System.Linq;
using System.Diagnostics;
using System.Threading.Tasks;
using CameranaVillage.Common;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace CameranaVillage.Controllers
{

    public class HomeController : Controller
    {
        private SignInManager<User> signInManager;
        private UserManager<User> userManager;
        private DBContext dbContext;

        private Repository repository;

        private readonly ILogger<HomeController> logger;
        public HomeController(SignInManager<User> signInManager,
            UserManager<User> userManager,
            DBContext dbContext,
            Repository repository,
            ILogger<HomeController> logger)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
            this.dbContext = dbContext;
            this.repository = repository;
            this.logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Contacts()
        {
            return View();
        }

        public IActionResult GestioneAttivita()
        {
            return View();
        }

        //[Authorize]
        //public IActionResult HiddenPage()
        //{

        //    List<PrenotazioneAttivitaModel> model

        //        = repository.GetAttivitaPrenotabili()

        //    return View();
        //}

        //[Authorize(Roles = "Admin")]
        //public IActionResult GestioneUtenti()
        //{
        //    return View();
        //}


        [Authorize(Roles = "Admin")]
        public IActionResult GestioneUtenti([FromServices] DBContext dBContext, string userName, string email)
        {
            UsersAndRolesViewModel model = new UsersAndRolesViewModel();
            model.Users = dBContext.Users.Where(u =>
            (string.IsNullOrEmpty(userName) ? u.UserName != null : u.UserName.Contains(userName))
            &&
            (string.IsNullOrEmpty(email) ? true : u.Email != null && u.Email.Contains(email))
            ).Select(u => new User()
            {
                Id = u.Id,
                Email = u.Email,
                UserName = u.UserName,
                UserRoles = (from r in dBContext.Roles
                             join ur in dBContext.UserRoles.Where(ur => ur.UserId == u.Id) on r.Id equals ur.RoleId
                             select new Role()
                             {
                                 IdentityRole = r,
                                 RoleClaims = dBContext.RoleClaims.Where(rc => rc.RoleId == r.Id).ToList()
                             }).ToList(),
                UserClaims = dBContext.UserClaims.Where(uc => uc.UserId == u.Id).ToList()
            }).ToList();
            return View(model);
        }


        //[Authorize(Roles = "Admin")]
        //public IActionResult GestioneAttivitaAdmin(string idUser)
        //{
        //    repository.GetAttivitaPrenotateAdmin(idUser);

        //    return View();
        //}


        //test AttivitaPrenotate
        public IActionResult GestioneAttivitaAdmin()
        {

            List<PrenotazioneAttivitaUtenteModel> attivitaPrenotate = repository.GetAttivitaPrenotateAdmin();
            List<PrenotazioneAttivitaUtenteModel> model = new List<PrenotazioneAttivitaUtenteModel>();

            foreach (PrenotazioneAttivitaUtenteModel a in attivitaPrenotate)
            {
                PrenotazioneAttivitaUtenteModel result = new PrenotazioneAttivitaUtenteModel()
                {
                    IdAttivita = a.IdAttivita,
                    NomeAttivita = a.NomeAttivita,
                    DescrizioneAttivita = a.DescrizioneAttivita,
                    DataInizio = a.DataInizio,
                    DataFine = a.DataFine,
                    NumeroPosti = a.NumeroPosti,
                    PrezzoAttivita = a.PrezzoAttivita,
                    IdPrenotazioneAttivita = a.IdPrenotazioneAttivita,
                    IdUtente = a.IdUtente,
                    UserName = a.UserName

                };

                model.Add(result);
            }

            return View(model);

        }

        public IActionResult Credits()
        {
            return View();
        }




        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginModel loginModel)
        {
            try
            {
                User user = await userManager.FindByNameAsync(loginModel.UserName); //l'utente esiste?
                if (user != null) //se l'utente esiste allora lo posso loggare
                {
                    var result = await signInManager.PasswordSignInAsync(loginModel.UserName, loginModel.Password, false, lockoutOnFailure: true);
                    if (result.Succeeded)
                    {
                        //se è loggato allora fai qualcosa
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return Redirect("Index");
        }

        public IActionResult Register()
        {
            return View();
        }


        [Authorize]
        public async Task<IActionResult> Logout()
        {
            try
            {
                if (signInManager.IsSignedIn(User)) // se è loggato...
                {
                    await signInManager.SignOutAsync(); //...sloggalo
                }
            }
            catch (Exception ex)
            {
            }
            return Redirect("Index");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }



        public IActionResult Attivita()
        {

            List<Attivita> resultRow = repository.GetAttivitaPrenotabili();
            List<AttivitaModel> model = new List<AttivitaModel>();

            foreach (Attivita a in resultRow)
            {
                AttivitaModel result = new AttivitaModel()
                {
                    IdAttivita = a.IdAttivita,
                    NomeAttivita = a.NomeAttivita,
                    DescrizioneAttivita = a.DescrizioneAttivita,
                    DataInizio = a.DataInizio,
                    DataFine = a.DataFine,
                    NumeroPosti = a.NumeroPosti,
                    PrezzoAttivita = a.PrezzoAttivita

                };

                model.Add(result);
            }

            return View(model);

        }


        //test AttivitaPrenotate
        public IActionResult AttivitaPrenotate(string idUtente)
        {

            List<PrenotazioneAttivitaUtenteModel> attivitaPrenotate = repository.GetAttivitaPrenotate(idUtente);
            List<PrenotazioneAttivitaUtenteModel> model = new List<PrenotazioneAttivitaUtenteModel>();

            foreach (PrenotazioneAttivitaUtenteModel a in attivitaPrenotate)
            {
                PrenotazioneAttivitaUtenteModel result = new PrenotazioneAttivitaUtenteModel()
                {
                    IdAttivita = a.IdAttivita,
                    NomeAttivita = a.NomeAttivita,
                    DescrizioneAttivita = a.DescrizioneAttivita,
                    DataInizio = a.DataInizio,
                    DataFine = a.DataFine,
                    NumeroPosti = a.NumeroPosti,
                    PrezzoAttivita = a.PrezzoAttivita,
                    IdPrenotazioneAttivita = a.IdPrenotazioneAttivita


                };

                model.Add(result);
            }

            return View(model);

        }






        [HttpPost]
        public async Task<IActionResult> CreateUser([FromServices] UserManager<User> userManager, [FromBody] UsersAndRolesViewModel usersViewModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    User user = await userManager.FindByEmailAsync(usersViewModel.Email);
                    if (user == null)
                    {
                        user = new User
                        {
                            UserName = usersViewModel.UserName,
                            Email = usersViewModel.Email,
                        };
                        IdentityResult result = await userManager.CreateAsync(user, usersViewModel.Password);
                        if (result.Succeeded)
                            return Json("OK");

                        string errors = string.Empty;
                        foreach (IdentityError error in result.Errors)
                            errors += error.Code + ": " + error.Description + "\n";
                        return Json(errors);
                    }
                    else
                        return Json("Email is already taken");
                }
            }
            catch (Exception ex)
            {
                logger.LogError(ex, ex.Message);
            }
            return Json("Invalid request");
        }


        [HttpPost]
        public async Task<IActionResult> DeleteUser([FromServices] DBContext dBContext, [FromServices] UserManager<User> userManager, string userId)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    User user = await userManager.FindByIdAsync(userId);
                    if (user != null)
                    {
                        List<IdentityUserClaim<string>> userClaims = dBContext.UserClaims.Where(uc => uc.UserId == user.Id).ToList();
                        dBContext.UserClaims.RemoveRange(userClaims);

                        List<IdentityUserRole<string>> userRoles = dBContext.UserRoles.Where(ur => ur.UserId == user.Id).ToList();
                        dBContext.UserRoles.RemoveRange(userRoles);

                        await dBContext.SaveChangesAsync();

                        IdentityResult result = await userManager.DeleteAsync(user);

                        if (result.Succeeded)
                            return Json("OK");

                        string errors = string.Empty;
                        foreach (IdentityError error in result.Errors)
                            errors += error.Code + ": " + error.Description;
                        return Json(errors);
                    }
                }
            }
            catch (Exception ex)
            {
                logger.LogError(ex, ex.Message);
            }
            return Json("Invalid request");
        }

        [HttpPost]
        public async Task<IActionResult> AddRoleToUser([FromServices] UserManager<User> userManager, string userID, string roleName)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    User user = await userManager.FindByIdAsync(userID);
                    await userManager.AddToRoleAsync(user, roleName);
                    await userManager.UpdateSecurityStampAsync(user);
                    return Json(ConstantValues.OK);
                }
            }
            catch (Exception ex)
            {
                logger.LogError(ex, ex.Message);
            }
            return Json("Invalid request");
        }
        [HttpPost]
        public async Task<IActionResult> RemoveRoleFromUser([FromServices] UserManager<User> userManager, string userID, string roleName)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    User user = await userManager.FindByIdAsync(userID);
                    await userManager.RemoveFromRoleAsync(user, roleName);
                    await userManager.UpdateSecurityStampAsync(user);
                    return Json(ConstantValues.OK);
                }
            }
            catch (Exception ex)
            {
                logger.LogError(ex, ex.Message);
            }
            return Json("Invalid request");
        }
        [HttpPost]
        public async Task<IActionResult> AddClaimToUser([FromServices] DBContext dBContext, [FromServices] UserManager<User> userManager, string userID, string claimType, string claimValue)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (!string.IsNullOrEmpty(claimType) && !string.IsNullOrEmpty(claimValue))
                    {
                        dBContext.UserClaims.Add(new IdentityUserClaim<string>()
                        {
                            UserId = userID,
                            ClaimType = claimType,
                            ClaimValue = claimValue
                        });
                        await dBContext.SaveChangesAsync();

                        User user = await userManager.FindByIdAsync(userID);
                        await userManager.UpdateSecurityStampAsync(user);

                        return Json("OK");
                    }
                    else
                        return Json("Values cant be null");
                }
            }
            catch (Exception ex)
            {
                logger.LogError(ex, ex.Message);
            }
            return Json("Invalid request");
        }
        [HttpPost]
        public async Task<IActionResult> RemoveClaimFromUser([FromServices] DBContext dBContext, [FromServices] UserManager<User> userManager, string userID, string claimType, string claimValue)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    List<IdentityUserClaim<string>> claims = dBContext.UserClaims.Where(uc => uc.UserId == userID && uc.ClaimType == claimType && uc.ClaimValue == claimValue).ToList();
                    if (claims.Count > 0)
                    {
                        foreach (IdentityUserClaim<string> claim in claims)
                            dBContext.UserClaims.Remove(claim);
                        await dBContext.SaveChangesAsync();

                        User user = await userManager.FindByIdAsync(userID);
                        await userManager.UpdateSecurityStampAsync(user);

                        return Json("OK");
                    }
                }
            }
            catch (Exception ex)
            {
                logger.LogError(ex, ex.Message);
            }
            return Json("Invalid request");
        }


        public async Task<IActionResult> EditUser([FromServices] UserManager<User> userManager, [FromServices] DBContext DBContext, UsersAndRolesViewModel model)
        {
            try
            {
                User user = await DBContext.Users.Where(u => u.Id == model.UserID).FirstOrDefaultAsync();
                if (ModelState.IsValid)
                {
                    string response = string.Empty;
                    if (!string.IsNullOrEmpty(model.UserName))
                    {
                        if (await DBContext.Users.Where(u => u.UserName == model.UserName).FirstOrDefaultAsync() == null)
                        {
                            IdentityResult result = await userManager.SetUserNameAsync(user, model.UserName);
                            if (result.Succeeded)
                            {
                                response += "The UserName has been changed. The user has been automatically logged out" + "\n";
                            }
                            else
                            {
                                foreach (IdentityError error in result.Errors)
                                    response += error.Code + ": " + error.Description + "\n";
                            }
                        }
                        else
                            response += "Email " + model.Email + " is already taken" + "\n";
                    }
                    if (!string.IsNullOrEmpty(model.Email))
                    {
                        if (await DBContext.Users.Where(u => u.Email == model.Email).FirstOrDefaultAsync() == null)
                        {
                            IdentityResult result = await userManager.SetEmailAsync(user, model.Email);
                            if (result.Succeeded)
                            {
                                response += "The email has been changed. The user has been automatically logged out" + "\n";
                            }
                            else
                            {

                                foreach (IdentityError error in result.Errors)
                                    response += error.Code + ": " + error.Description + "\n";
                            }
                        }
                        else
                            response += "Email " + model.Email + " is already taken" + "\n";
                    }
                    if (!string.IsNullOrEmpty(model.Password))
                    {
                        string token = await userManager.GeneratePasswordResetTokenAsync(user);
                        IdentityResult result = await userManager.ResetPasswordAsync(user, token, model.Password);
                        if (result.Succeeded)
                        {
                            await userManager.UpdateSecurityStampAsync(user);
                            response += "The password has been changed" + "\n";
                        }
                        else
                        {
                            foreach (IdentityError error in result.Errors)
                                response += error.Code + ": " + error.Description + "\n";
                        }
                    }
                    if (string.IsNullOrEmpty(model.Email) && string.IsNullOrEmpty(model.Password))
                        response += "Nothing to do" + "\n";
                    return Json(response);
                }
                /*model.TotalEntitiesNumber = userManager.Users.Count();
                model.CurrentPage = 0;
                model.Users = model.Users.Take(ConstantValues.searchPageSize).ToList();*/
                return Json("Invalid request");
            }
            catch (Exception ex)
            {
                logger.LogError(ex, ex.Message);
            }
            return View("Index", new UsersAndRolesViewModel());
        }


    }
}

