namespace DrugUsePreventionAPI.Exceptions
{
    public class DuplicateEntityException : Exception
    {
        public DuplicateEntityException(string entityName, string field, string value) : base($"{entityName} with {field} '{value}' already exists.")
        { 
        }
    }
}