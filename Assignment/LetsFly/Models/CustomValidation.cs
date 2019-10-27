using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LetsFly.Models
{
    public class CustomValidation
    {
        public class FileType : ValidationAttribute
        {
            public override bool IsValid(object value)
            {
                int MaxContentLength = 1024 * 1024 * 2;
                string[] allowedFileExtensions = new string[] { ".jpg", ".png"};

                var file = value as HttpPostedFileBase;

                if (file == null)
                    return false;
                else if (!allowedFileExtensions.Contains(file.FileName.Substring(file.FileName.LastIndexOf('.'))))
                {
                    ErrorMessage = "Please upload Your Photo of type: " + string.Join(", ", allowedFileExtensions);
                    return false;
                }
                else if (file.ContentLength > MaxContentLength)
                {
                    ErrorMessage = "File is too large, maximum size is : " + (MaxContentLength / 1024).ToString() + "MB";
                    return false;
                }
                else
                    return true;
            }
        }
    }
}