using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using Plusii.iiWeb;

// General Information about an assembly is controlled through the following 
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
[assembly: AssemblyTitle("iiWeb")]
[assembly: AssemblyDescription(iiGlobal.Contact)]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany(iiGlobal.Company)]
[assembly: AssemblyProduct("iiWeb")]
[assembly: AssemblyCopyright("Copyright © " + iiGlobal.Company + " 2011")]
[assembly: AssemblyTrademark(iiGlobal.Product)]
[assembly: AssemblyCulture("")]

// Setting ComVisible to false makes the types in this assembly not visible 
// to COM components.  If you need to access a type in this assembly from 
// COM, set the ComVisible attribute to true on that type.
[assembly: ComVisible(false)]

// The following GUID is for the ID of the typelib if this project is exposed to COM
[assembly: Guid("8d087fab-9a0b-4780-b2e4-ccc1ff7626d7")]

// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers 
// by using the '*' as shown below:
[assembly: AssemblyVersion("2.1.*")]
[assembly: AssemblyFileVersion("2.1.0.0")]

#region History
/*
 * 2.0.0.0  20110409    基于Plusii 1.6.0.0重构，引入jQuery，支持多语言
 * 2.1.0.0  20110716    优化了数据表栏位类型，使数据库兼容SQL2000，调整了固定角色Key避免混淆，解决一个管理员与角色的BUG
 */
#endregion