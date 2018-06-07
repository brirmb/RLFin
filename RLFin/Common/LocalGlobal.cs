using Plusii.iiWeb;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace RLFin.Common
{
    public class LocalGlobal : iiGlobal
    {
        public const char ListSeparator = ',';
        public static readonly string DateTimeFormat = LocalGlobal.DateFormat + " " + LocalGlobal.TimeFormat;

        public static readonly string UploadPhysicalPath = LocalGlobal.PhysicalPath + "\\Upload";
        public static readonly string UploadVirtualPath = LocalGlobal.VirtualPath + "/Upload";

        public static string GenerateGuid()
        {
            string id = System.Guid.NewGuid().ToString();
            return id;
        }

        public static void BindDropDownList(DropDownList control, Dictionary<string, string> dataSource, bool createBlankItem)
        {
            control.DataSource = dataSource;
            control.DataTextField = "Value";
            control.DataValueField = "Key";
            control.DataBind();
            if (createBlankItem)
            {
                control.Items.Insert(0, string.Empty);
            }
        }
        public static void BindDropDownList(DropDownList control, Dictionary<string, string> dataSource)
        {
            LocalGlobal.BindDropDownList(control, dataSource, true);
        }
    }
}