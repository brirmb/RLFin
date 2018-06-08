using RLFin.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace RLFin.Models
{
    public class ContractProvider : LocalDbProvider
    {
        /// <summary>
        /// 获取工令号
        /// </summary>
        public DataTable GetOrnoList()
        {
            string sql = "SELECT ordno FROM contract  order by 1 ";

            return this.Query(sql);
        }

        /// <summary>
        /// 查询合同概况
        /// </summary>
        public DataTable GetContractHeadInfo(string no)
        {
            string sql = $" SELECT ORDNO,ORDNAME,CUSTNO,CUSTNAME,CURR,SIGNDATE, DELIVERYDATE,PROTECTTERM,SCH_YF,SCH_JD,SCH_TH,SCH_ZB,ORDAMT,REMARK  FROM contract WHERE OHID='Y' AND ORDNO = N'{no}'";

            return this.Query(sql);
        }

        /// <summary>
        /// 查询合同明细
        /// </summary>
        public DataTable GetContractDetailInfo(string no)
        {
            string sql = $" SELECT SEQ,ITEMNO,DRAWNO,ORDQTY,UM,UNITPRICE,AMT,REMARK FROM CONTRATDETAIL WHERE OLID='Y' AND ORDNO = N'{no}'";

            return this.Query(sql);
        }

        /// <summary>
        /// 查询客户（按姓名模糊）
        /// </summary>
        public DataTable GetCustomerByName(string name)
        {
            string sql = $" select * from salrcm where rcnam like N'%{name}%' order by rccust ";

            return this.Query(sql);
        }

        /// <summary>
        /// 查询工令号配置信息
        /// </summary>
        public DataTable GetSysOrnoInfo(string year)
        {
            string sql = $" SELECT val1,val2 FROM rbosys WHERE sid='Y' AND category='ORDNO' AND val1= N'{year}'";

            return this.Query(sql);
        }

        /// <summary>
        /// 更新工令号配置信息
        /// </summary>
        public DataTable UpdateSysOrnoInfo(string no, string year)
        {
            string sql = $" UPDATE rbosys SET val2=N'{no}' WHERE sid='Y' AND category='ORDNO' AND val1= N'{year}'";

            return this.Query(sql);
        }

        /// <summary>
        /// 新增工令号配置信息
        /// </summary>
        public DataTable InsertSysOrnoInfo(string year)
        {
            string sql = $" INSERT INTO rbosys VALUES('Y','ORDNO','{year}','002',' ',' ',' ') ";

            return this.Query(sql);
        }

    }
}