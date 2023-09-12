using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Productmanagement.App_Code
{
    public class Clsdefferentmethode
    {
        public bool checkexetion(FileUpload fileUpload1)
        {
            try
            {
                bool Status;

                string FileExt = Path.GetExtension(fileUpload1.FileName);



                if (FileExt.ToUpper() == "PNG" || FileExt.ToUpper() == "JPG" || FileExt.ToUpper() == "JPEG" || FileExt.ToUpper() == ".JPEG" || FileExt.ToUpper() == ".JPG" || FileExt.ToUpper() == ".PNG")
                {
                    Status = true;
                }
                else
                {
                    Status = false;
                }

                return Status;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}