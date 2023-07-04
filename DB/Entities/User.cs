using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace CameranaVillage.DB.Entities
{
    public class User : IdentityUser
    {
        [NotMapped]
        public List<Role> UserRoles { get; set; }
        [NotMapped]
        public List<IdentityUserClaim<string>> UserClaims { get; set; }

        //public string FirstName { get; set; }
        //public string LastName { get; set; }
    }
}
