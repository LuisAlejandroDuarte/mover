﻿
using FluentValidation.Results;
namespace Mover.API.Exceptions
{
    public class ValidationException : ApplicationException
    {
        public ValidationException() : base("Sé presentaron uno o mas errores de validación")
        {
            Errors = new Dictionary<string, string[]>();

        }
        public ValidationException(IEnumerable<ValidationFailure> failures) : this()
        {
            Errors = failures
                .GroupBy(e => e.PropertyName, e => e.ErrorMessage)
                .ToDictionary(failureGroup => failureGroup.Key, failureGroup => failureGroup.ToArray());
        }
        public IDictionary<string, string[]> Errors { get; }
    }
}
