namespace Split2021.Entities
{
    class PaymentMethod : Entity
    {
        public new static readonly string SingleName = "payment_method";
        public new static readonly string CollectionName = "payment_methods";

        public PaymentMethod()
            : base(SingleName, CollectionName)
        { }
    }
}
