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
            string sql = string.Format(" SELECT ORDNO,ORDNAME,CUSTNO,CUSTNAME,CURR,SIGNDATE, DELIVERYDATE,PROTECTTERM,SCH_YF,SCH_JD,SCH_TH,SCH_ZB,ORDAMT,REMARK  FROM contract WHERE OHID='Y' AND ORDNO = N'{0}'", no);

            return this.Query(sql);
        }

        /// <summary>
        /// 删除合同
        /// </summary>
        public int DeleteContract(string no)
        {
            string sql = string.Format("DELETE FROM CONTRACT WHERE OHID='Y' AND ORDNO= N'{0}' ",
                no
                );
            return this.Execute(sql);
        }

        /// <summary>
        /// 查询合同明细
        /// </summary>
        public DataTable GetContractDetailInfo(string no)
        {
            string sql = string.Format(" SELECT SEQ,ITEMNO,DRAWNO,ORDQTY,UM,UNITPRICE,AMT,REMARK FROM CONTRATDETAIL WHERE OLID='Y' AND ORDNO = N'{0}'", no);

            return this.Query(sql);
        }

        /// <summary>
        /// 删除合同明细
        /// </summary>
        public int DeleteContractDetail(string no)
        {
            string sql = string.Format("DELETE FROM CONTRATDETAIL WHERE OLID='Y' AND ORDNO=N'{0}' ", no);
            return this.Execute(sql);
        }

        /// <summary>
        /// 删除收款进度头表
        /// </summary>
        public int UpdateArprocess(string no, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("UPDATE arprocess SET sid='SD',lastuser=N'{1}',lastudate=N'{2}',lastutime=N'{3}' WHERE sid='SI' and ORDNO=N'{0}' ", no, sysUsername, strDate, strTime);
            return this.Execute(sql);
        }

        /// <summary>
        /// 新增收款进度明细
        /// </summary>
        public int InsertArprocessDetail(string no, string Tflg, decimal Tamt, decimal Tper, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("Insert into arprocess_l( lid,lseq,ordno,lflag,lper,lsamt,createuser,createdate,createtime,lastuser, lastudate,lastutime ) Values( 'LI',1,N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{5}',N'{6}' ) ", no, Tflg, Tper, Math.Round(Tper * Tamt * 0.01m, 2), sysUsername, strDate, strTime, strDate, strTime);
            return this.Execute(sql);
        }

        /// <summary>
        /// 更新收款进度明细表
        /// </summary>
        public int UpdateArprocessDetail(string no, string Tflg, decimal Tamt, decimal Tper, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("UPDATE arprocess_l SET lper=N'{2}',lsamt=N'{3}',lastuser=N'{4}',lastudate=N'{5}',lastutime=N'{6}' WHERE lid='LI' and ORDNO=N'{0}' And lflag=N'{1}' And lseq='1' ", no, Tflg, Tper, Math.Round(Tper * Tamt * 0.01m, 2), sysUsername, strDate, strTime);
            return this.Execute(sql);
        }

        /// <summary>
        /// 删除收款进度明细表
        /// </summary>
        public int UpdateArprocessDetail(string no, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("UPDATE arprocess_l SET lid='LD',lastuser=N'{1}',lastudate=N'{2}',lastutime=N'{3}' WHERE lid='LI' and ORDNO=N'{0}' ", no, sysUsername, strDate, strTime);
            return this.Execute(sql);
        }

        /// <summary>
        /// 查询客户（按姓名模糊）
        /// </summary>
        public DataTable GetCustomerByName(string name)
        {
            string sql = string.Format(" select * from salrcm where rcnam like N'%{0}%' order by rccust ", name);

            return this.Query(sql);
        }

        /// <summary>
        /// 查询工令号配置信息
        /// </summary>
        public DataTable GetSysOrnoInfo(string year)
        {
            string sql = string.Format(" SELECT val1,val2 FROM rbosys WHERE sid='Y' AND category='ORDNO' AND val1= N'{0}'", year);

            return this.Query(sql);
        }

        /// <summary>
        /// 更新工令号配置信息
        /// </summary>
        public DataTable UpdateSysOrnoInfo(string no, string year)
        {
            string sql = string.Format(" UPDATE rbosys SET val2=N'{0}' WHERE sid='Y' AND category='ORDNO' AND val1= N'{1}'", no, year);

            return this.Query(sql);
        }

        /// <summary>
        /// 新增工令号配置信息
        /// </summary>
        public DataTable InsertSysOrnoInfo(string year)
        {
            string sql = string.Format(" INSERT INTO rbosys VALUES('Y','ORDNO','{0}','002',' ',' ',' ') ", year);

            return this.Query(sql);
        }

        /// <summary>
        /// 查询基础配置 UM单位 
        /// </summary>
        public DataTable GetBaseParam(string type)
        {
            string sql = string.Format(" select * from baseparameter where type=N'{0}'", type);

            return this.Query(sql);
        }
    }
}