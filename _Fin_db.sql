delete from [dbo].[iiWeb_Module]
go

INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'BaseData', N'iiWeb', N'基础资料维护', NULL, NULL, 4, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'VendorMaintain', N'BaseData', N'厂商主档', NULL, N'Web/Factory.aspx', 1, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'CustomerMaintain', N'BaseData', N'客户主档', NULL, N'Web/Customer.aspx', 2, N'A', N'Admin', getdate())
GO

INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'Contract', N'iiWeb', N'合同管理', NULL, NULL, 1, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'ContractMaintain', N'Contract', N'合同维护', NULL, N'Web/Contract.aspx?pageType=1', 1, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'DirectInvoice', N'Contract', N'直接开票', NULL, N'Web/Contract.aspx?pageType=2', 2, N'A', N'Admin', getdate())
GO

INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'Receivable', N'iiWeb', N'收款', NULL, NULL, 2, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'ReceivableMaintain', N'Receivable', N'收款', NULL, N'Web/Receivable.aspx', 1, N'A', N'Admin', getdate())
GO

INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'Invoice', N'iiWeb', N'开票', NULL, NULL, 3, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'MakeInvoice', N'Invoice', N'开票', NULL, N'Web/Invoice.aspx', 1, N'A', N'Admin', getdate())
GO

INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'ReportQuery', N'iiWeb', N'查询与报表', NULL, NULL, 5, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'ZBAlarm', N'ReportQuery', N'质保金到期提醒', NULL, N'Web/ZBAlarm.aspx', 1, N'A', N'Admin', getdate())
GO