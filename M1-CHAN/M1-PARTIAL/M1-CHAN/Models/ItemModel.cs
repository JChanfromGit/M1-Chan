namespace M1_CHAN.Models
{
    public class ItemModel
    {
        public int Id { get; set; }
        public int ItemId { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string ItemBrand { get; set; }
        public decimal UnitPrice { get; set; }
        public string ItemSize { get; set; }
        public string ItemType { get; set; }
        public string ItemVariant { get; set; }
        public string ItemRemarks { get; set; }
        public string CustomerId { get; set; }
    }
}
