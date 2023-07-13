using M1_CHAN.Controllers.Database;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.IdentityModel.Tokens;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace M1_CHAN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private IConfiguration _config;
        private ISqlDataAccess _db;
        private DBConnections _connection = new DBConnections();
        public CustomerController(IConfiguration config, ISqlDataAccess db)
        {
            _config = config;
            _db = db;
            _connection = new DBConnections();

        }
        [AllowAnonymous]
        [HttpPost]
        [Route("Register")]
        public ActionResult Register([FromBody] CustomerModel customer)
        {

            try
            {

                _db.SaveData<dynamic>("dbo.spCustomer_Registration",
                new { customer.UserName, customer.FirstName, customer.LastName, customer.Nickname, customer.EmailAddress, customer.Password },
                connectionStringName: "SqlDb",
                true);
                return Ok();

            }
            catch (Exception e)
            {

                Console.WriteLine("Customer Registration Error: " + e.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);

            }

        }
        [AllowAnonymous]
        [HttpPost]
        [Route("login")]
        public ActionResult Login([FromBody] CustomerModel customer)
        {

            try
            {

                CustomerModel c = _db.LoadData<CustomerModel, dynamic>("dbo.spCustomer_Login",
                                                    new { customer.UserName, customer.Password },
                                                    connectionStringName: "SqlDb",
                                                    true).FirstOrDefault();

                if (c != null)
                {
                    var token = GenerateToken(c);
                    return Ok(token);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Customer Login Error: " + e.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
        private string GenerateToken(CustomerModel customer)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            string customerIdStr = customer.Id.ToString();
            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier, customerIdStr),
            };
            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
            _config["Jwt:Audience"],
            claims,
            expires: DateTime.Now.AddMinutes(15),
            signingCredentials: credentials);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
