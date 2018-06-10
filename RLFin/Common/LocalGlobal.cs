using Plusii.iiWeb;
using RLFin.Models;
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
        /// 生成新工令号
        /// </summary>
        /// <returns></returns>
        public static string NewOrno()
        {
            var dateModel = GetDateModel();

            string no = string.Empty;

            using (ContractProvider contProvider = new ContractProvider())
            {
                var ornoSys = contProvider.GetSysOrnoInfo(dateModel.YearStr);

                if (ornoSys != null && ornoSys.Rows.Count > 0)
                {
                    no = dateModel.YearMonStr + ornoSys.Rows[0]["val2"].ToString();
                }
                else
                {
                    no = dateModel.YearMonStr + "001";
                    contProvider.InsertSysOrnoInfo(dateModel.YearStr);
                }
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