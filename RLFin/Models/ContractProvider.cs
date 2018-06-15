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
        /// 新增合同sql
        /// </summary>
        public string InsertContractSql(string orNo, string orName, string custNo, string custName, string curr, string signDate, string deliverDate, string term, string yf, string jd, string th, string zb, string orAmt, string remark, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("INSERT INTO CONTRACT (ohid,ordno,ordname,custno,custname,curr,SignDate,DeliveryDate,ProtectTerm,sch_yf,sch_JD,sch_TH,sch_ZB,ordamt,Remark,createuser,createdate,createtime,lastuser,lastudate,lastutime) VALUES('Y',N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}',N'{8}',N'{9}',N'{10}',N'{11}',N'{12}',N'{13}',N'{14}',N'{15}',N'{16}',N'{17}',N'{18}',N'{19}' ",
                orNo, orName, custNo, custName, curr, signDate, deliverDate, term, yf, jd, th, zb, orAmt, remark, sysUsername, strDate, strTime, sysUsername, strDate, strTime
                );
            return sql;
        }

        /// <summary>
        /// 更新合同sql
        /// </summary>
        public string UpdateContractSql(string orNo, string orName, string custNo, string custName, string curr, string signDate, string deliverDate, string term, string yf, string jd, string th, string zb, string orAmt, string remark, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("UPDATE CONTRACT SET ORDNAME=N'{1}',CUSTNO=N'{2}',CUSTNAME=N'{3}',CURR=N'{4}',SIGNDATE=N'{5}',DELIVERYDATE=N'{6}',PROTECTTERM=N'{7}',SCH_YF=N'{8}',SCH_JD=N'{9}',SCH_TH=N'{10}',SCH_ZB=N'{11}',ORDAMT=N'{12}',REMARK=N'{13}',LASTUSER=N'{14}',LASTUDATE=N'{15}',LASTUTIME=N'{16}' WHERE OHID='Y' AND ORDNO=N'{0}' ",
                orNo, orName, custNo, custName, curr, signDate, deliverDate, term, yf, jd, th, zb, orAmt, remark, sysUsername, strDate, strTime
                );
            return sql;
        }

        /// <summary>
        /// 删除合同
        /// </summary>
        public string DeleteContractSql(string no)
        {
            string sql = string.Format("DELETE FROM CONTRACT WHERE OHID='Y' AND ORDNO= N'{0}' ",
                no
                );
            return sql;
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
        /// 新增合同明细sql
        /// </summary>
        public string InsertContractDetailSql(string orNo, string seq, string itemNo, string orQty, string drawNo, string um, string price, string amt, string remark)
        {
            string sql = string.Format("INSERT INTO contratdetail VALUES('Y',N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}',N'{8}' ",
                 orNo, seq, itemNo, orQty, drawNo, um, price, amt, remark
                );
            return sql;
        }

        /// <summary>
        /// 更新合同明细sql
        /// </summary>
        public string UpdateContractDetailSql(string orNo, string seq, string itemNo, string orQty, string drawNo, string um, string price, string amt, string remark)
        {
            string sql = string.Format("UPDATE contratdetail SET ITEMNO=N'{2}',ORDQTY=N'{3}',DRAWNO=N'{4}',UM=N'{5}',UNITPRICE=N'{6}',AMT=N'{7}',REMARK=N'{8}', WHERE ORDNO=N'{0}' AND SEQ=N'{1}' AND OLID='Y' ",
                 orNo, seq, itemNo, orQty, drawNo, um, price, amt, remark
                );
            return sql;
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
        /// 删除合同明细Sql
        /// </summary>
        public string DeleteContractDetailSql(string no)
        {
            string sql = string.Format("DELETE FROM CONTRATDETAIL WHERE OLID='Y' AND ORDNO=N'{0}' ", no);
            return sql;
        }

        /// <summary>
        /// 新增收款进度头表sql
        /// </summary>
        public string InsertArprocessSql(string orNo, string orName, string custNo, string custName, string curr, string orAmt, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("Insert into arprocess (sid,scust,scnme,ordno,scont,scurr,stotal,sref,createuser,createdate,createtime,lastuser,lastudate,lastutime) VALUES('SI',N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}',N'{8}',N'{9}',N'{10}',N'{11}',N'{12}' ",
                 custNo, custName, orNo, orName, curr, orAmt, " ", sysUsername, strDate, strTime, sysUsername, strDate, strTime
                );
            return sql;
        }

        /// <summary>
        /// 更新收款进度头表Sql
        /// </summary>
        public string UpdateArprocessSql(string orNo, string orName, string custNo, string custName, string curr, string orAmt, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("UPDATE arprocess SET scust=N'{1}',scnme=N'{2}',scont=N'{3}',scurr=N'{4}',stotal=N'{5}',sref=' ', createuser=N'{6}',createdate=N'{7}',createtime=N'{8}',lastuser=N'{9}',lastudate=N'{10}',lastutime=N'{11}' WHERE sid='SI' and ORDNO=N'{0}' ", orNo, custNo, custName, orName, curr, orAmt, sysUsername, strDate, strTime, sysUsername, strDate, strTime);
            return sql;  //this.Execute(sql);
        }

        /// <summary>
        /// 删除收款进度头表
        /// </summary>
        public string DeleteArprocessSql(string no, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("UPDATE arprocess SET sid='SD',lastuser=N'{1}',lastudate=N'{2}',lastutime=N'{3}' WHERE sid='SI' and ORDNO=N'{0}' ", no, sysUsername, strDate, strTime);
            return sql;
        }

        /// <summary>
        /// 新增收款进度明细Sql
        /// </summary>
        public string InsertArprocessDetailSql(string no, string Tflg, decimal Tamt, decimal Tper, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("Insert into arprocess_l( lid,lseq,ordno,lflag,lper,lsamt,createuser,createdate,createtime,lastuser, lastudate,lastutime ) Values( 'LI',1,N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{5}',N'{6}' ) ", no, Tflg, Tper, Math.Round(Tper * Tamt * 0.01m, 2), sysUsername, strDate, strTime, strDate, strTime);
            return sql;  //this.Execute(sql);
        }

        /// <summary>
        /// 更新收款进度明细表Sql
        /// </summary>
        public string UpdateArprocessDetailSql(string no, string Tflg, decimal Tamt, decimal Tper, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("UPDATE arprocess_l SET lper=N'{2}',lsamt=N'{3}',lastuser=N'{4}',lastudate=N'{5}',lastutime=N'{6}' WHERE lid='LI' and ORDNO=N'{0}' And lflag=N'{1}' And lseq='1' ", no, Tflg, Tper, Math.Round(Tper * Tamt * 0.01m, 2), sysUsername, strDate, strTime);
            return sql;  //this.Execute(sql);
        }

        /// <summary>
        /// 删除收款进度明细表
        /// </summary>
        public string DeleteArprocessDetailSql(string no, string sysUsername, string strDate, string strTime)
        {
            string sql = string.Format("UPDATE arprocess_l SET lid='LD',lastuser=N'{1}',lastudate=N'{2}',lastutime=N'{3}' WHERE lid='LI' and ORDNO=N'{0}' ", no, sysUsername, strDate, strTime);
            return sql;
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