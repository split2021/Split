namespace Split2021
{
    public class Token
    {
        private string _token = null;

        public Token(string token)
        {
            _token = token;
        }

        public override string ToString()
        {
            return _token;
        }
    }
}