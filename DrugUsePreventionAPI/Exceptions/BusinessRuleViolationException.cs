﻿namespace DrugUsePreventionAPI.Exceptions {
    public class BusinessRuleViolationException : Exception 
    { 
        public BusinessRuleViolationException(string message) : base(message) 
        { 
        } 
    }
}