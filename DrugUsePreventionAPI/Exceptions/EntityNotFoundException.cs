namespace DrugUsePreventionAPI.Exceptions
{
    public class EntityNotFoundException : Exception
    {
        private string v;

        public EntityNotFoundException(string entityName, int id) : base($"{entityName} with ID {id} not found.")
        {
        }

        public EntityNotFoundException(string? message, string v) : base(message)
        {
            this.v = v;
        }
    }
}