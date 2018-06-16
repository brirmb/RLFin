using Plusii.iiWeb;
using RLFin.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
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