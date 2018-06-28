using Plusii.iiWeb;
using RLFin.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace RLFin.Common
{
    public class LocalGlobal : iiGlobal
    {
        public const char ListSeparator = ',';
        public static readonly string DateTimeFormat = LocalGlobal.DateFormat + " " + LocalGlobal.TimeFormat;

        public static readonly string UploadPhysicalPath = LocalGlobal.PhysicalPath + "\\Upload";
        public static readonly string UploadVirtualPath = LocalGlobal.VirtualPath + "/Upload";

        public static SqlConnection DbConnect()
        {
            SqlConnection con = new SqlConnection(iiGlobal.Base64Decrypt(ConfigurationManager.AppSettings["DB"]));
            return con;
        }


        public static string GenerateGuid()
        {
            string id = System.Guid.NewGuid().ToString();
            return id;
        }

        public static DateModel GetDateModel()
        {
            DateTime now = DateTime.Now;

            DateModel model = new DateModel();
            model.DateTimeStr = now.ToString("yyyyMMddHHmmss");
            model.DateStr = now.ToString("yyyyMMdd");
            model.TimeStr = now.ToString("HHmmss");
            model.YearMonStr = now.ToString("yyMM");
            model.YearStr = now.ToString("yy");
            return model;
        }

        /// <summary>
        /// 日期格式转换
        /// </summary>
        /// <param name="dateStr">yyyyMMdd格式</param>
        /// <returns></returns>
        public static DateTime ConvertDateFormat(string dateStr)
        {
            DateTime dt;
            DateTime.TryParse(dateStr, out dt);

            if (dt == DateTime.MinValue)
            {
                dt = DateTime.ParseExact(dateStr, "yyyyMMdd", System.Globalization.CultureInfo.CurrentCulture);
            }

            return dt; // dt.ToString("yyyyMMdd");
        }

        /// <summary>
        /// 生成新工令号
        /// </summary>
        /// <returns></returns>
        public static string NewOrno(bool isNew)
        {
            var dateModel = GetDateModel();

            string no = string.Empty;

            using (ContractProvider contProvider = new ContractProvider())
            {
                var ornoSys = contProvider.GetSysOrnoInfo(dateModel.YearStr);

                if (ornoSys != null && ornoSys.Rows.Count > 0)
                {
                    no = dateModel.YearMonStr + ornoSys.Rows[0]["val2"].ToString();
                    if (!isNew)
                    {
                        var val2 = Convert.ToInt32(ornoSys.Rows[0]["val2"].ToString()) + 1;
                        contProvider.UpdateSysOrnoInfo(val2.ToString().PadLeft(3, '0'), dateModel.YearStr);
                    }
                }
                else
                {
                    no = dateModel.YearMonStr + "001";
                    contProvider.InsertSysOrnoInfo(dateModel.YearStr);
                }
            }

            return no;
        }

        /// <summary>
        /// 生成新发货单号
        /// </summary>
        /// <returns></returns>
        public static string NewSTNo()
        {
            var dateModel = GetDateModel();

            string no = string.Empty;

            using (ContractProvider contProvider = new ContractProvider())
            {
                var param = contProvider.GetBaseParam("ST", "NO");

                if (param != null && param.Rows.Count > 0)
                {
                    string stno = param.Rows[0]["description"].ToString(); //ST1703997
                    string year = stno.Substring(2, 2);
                    string num = stno.Substring(4, 5);
                    if (dateModel.YearStr == year)
                    {
                        no = "ST" + year + (Util.ToInt(num) + 1).ToString().PadLeft(5, '0');
                    }
                    else
                    {
                        no = "ST" + dateModel.YearStr + (Util.ToInt(num) + 1).ToString().PadLeft(5, '0');
                    }
                }
                else
                {
                    no = "ST" + dateModel.YearStr + "00001";
                }

                contProvider.UpdateBaseParam("ST", "NO", no);
            }

            return no;
        }

        #region Excel
        public static void ToExcel(System.Web.UI.Control gv, string name)
        {
            HttpContext.Current.Response.AppendHeader("Content-Disposition", string.Format("attachment;filename={0}.xls", name));
            HttpContext.Current.Response.Charset = "GB2312";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            HttpContext.Current.Response.Write("<meta http-equiv=Content-Type content=\"text/html; charset=GB2312\">");
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            Page page = new Page();
            HtmlForm form = new HtmlForm();
            page.EnableEventValidation = false;
            gv.EnableViewState = false;
            page.DesignerInitialize();
            page.Controls.Add(form);
            form.Controls.Add(gv);
            page.RenderControl(hw);
            //gv.RenderControl(hw);
            HttpContext.Current.Response.Write(tw.ToString());
            HttpContext.Current.Response.End();
        }

        public static string TableToExcel(DataTable table)
        {
            string title = "";
            //string fileName = name + ".xls";
            string fileName = Guid.NewGuid() + ".xls";
            if (!Directory.Exists(TempPhysicalPath))
            {
                Directory.CreateDirectory(TempPhysicalPath);
            }
            string filePhysicalPath = string.Format("{0}\\{1}",
                TempPhysicalPath,
                fileName);
            string fileVirtualPath = string.Format("{0}/{1}",
                TempVirtualPath,
                fileName);
            FileStream fs = new FileStream(filePhysicalPath, FileMode.OpenOrCreate);
            //FileStream fs1 = File.Open(file, FileMode.Open, FileAccess.Read);
            StreamWriter sw = new StreamWriter(new BufferedStream(fs), System.Text.Encoding.Default);
            for (int i = 0; i < table.Columns.Count; i++)
            {
                title += table.Columns[i].ColumnName + "\t"; //栏位：自动跳到下一单元格
            }
            title = title.Substring(0, title.Length - 1) + "\n";  //换行
            sw.Write(title);
            foreach (DataRow row in table.Rows)
            {
                string line = "";
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    line += row[i].ToString().Trim() + "\t"; //内容：自动跳到下一单元格
                }
                line = line.Substring(0, line.Length - 1) + "\n";
                sw.Write(line);
            }
            sw.Close();
            fs.Close();
            return fileVirtualPath;
        }
        #endregion

    }

    /// <summary>
    /// 日期模型
    /// </summary>
    public class DateModel
    {
        /// <summary>
        /// 完整日期 2018-06-10 16:49:27 -> 20180610164927
        /// </summary>
        public string DateTimeStr { set; get; }

        /// <summary>
        /// 日期 20180610
        /// </summary>
        public string DateStr { set; get; }

        /// <summary>
        /// 时间 164927
        /// </summary>
        public string TimeStr { set; get; }

        /// <summary>
        /// 年月 1806
        /// </summary>
        public string YearMonStr { set; get; }

        /// <summary>
        /// 年份 18
        /// </summary>
        public string YearStr { set; get; }
    }
}