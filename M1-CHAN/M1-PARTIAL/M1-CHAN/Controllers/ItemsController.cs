using M1_CHAN.Controllers.Database;
using M1_CHAN.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace M1_CHAN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemsController : ControllerBase
    {
        private ISqlDataAccess _db;
        private DBConnections _connection = new DBConnections();
        public ItemsController(ISqlDataAccess db)
        {
            _db = db;
            _connection = new DBConnections();
            _db.SaveData("dbo._CustomerItems_Value", new { }, connectionStringName: "SqlDb", true);
        }
        [Authorize]
        [HttpPost]
        [Route("add")]
        public ActionResult AddItem([FromBody] ItemModel item)
        {
            try
            {
                _db.SaveData("dbo.spAdd_Item", new { item.ItemId, item.ItemCode, item.ItemName, item.ItemBrand, item.UnitPrice, item.ItemSize, item.ItemType, item.ItemVariant, item.ItemRemarks, item.CustomerId }, connectionStringName: "SqlDb", true);
                return Ok();
            }
            catch (Exception e)
            {
                Console.WriteLine("Adding Item Error: " + e.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
        [AllowAnonymous]
        [HttpDelete]
        [Route("delete/{ItemId}")]
        public ActionResult DeleteItem(int ItemId)
        {
            try
            {
                _db.DeleteData("dbo.spDelete_Item", new { ItemId }, connectionStringName: "SqlDb", true);
                return Ok();
            }
            catch (Exception e)
            {
                Console.WriteLine("Deleting Item Error: " + e.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
        [AllowAnonymous]
        [HttpPut]
        [Route("Update")]
        public ActionResult UpdateItem([FromBody] DetailsModel details)
        {
            try
            {
                var itemId = details.ItemId;
                var itemCode = details.ItemCode;
                var itemName = details.ItemName;
                var itemBrand = details.ItemBrand;
                var unitPrice = details.UnitPrice;
                var customerId = details.CustomerId;

                _db.SaveData("dbo.spUpdate_Item", new { itemId, itemCode, itemName, itemBrand, unitPrice, customerId }, connectionStringName: "SqlDb", true);
                return Ok();
            }
            catch (Exception e)
            {
                Console.WriteLine("Updating Item Error: " + e.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
        [AllowAnonymous]
        [HttpGet]
        [Route("List/{itemId}")]
        public ActionResult ListItemId(int ItemId)
        {
            try
            {
                DetailsModel details = _db.LoadData<DetailsModel, dynamic>("dbo.spItem_Details", new { ItemId }, connectionStringName: "SqlDb", true).FirstOrDefault();
                if (details != null)
                {
                    return Ok(details);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Listing ItemID Error: " + e.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
        [AllowAnonymous]
        [HttpGet]
        [Route("ShowAll")]
        public ActionResult ShowAllItem()
        {
            try
            {
                List<DetailsModel> details = _db.LoadData<DetailsModel, dynamic>("dbo.spShow_All_Item", new { }, connectionStringName: "SqlDb", true).ToList();
                if (details.Count > 0)
                {
                    return Ok(details);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Listing ItemID Error: " + e.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
