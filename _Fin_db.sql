delete from [dbo].[iiWeb_Module]
go

INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'BaseData', N'iiWeb', N'基础资料维护', NULL, NULL, 4, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'VendorMaintain', N'BaseData', N'厂商主档', NULL, N'BaseData/VendorMaintain.aspx', 1, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'CustomerMaintain', N'BaseData', N'客户主档', NULL, N'BaseData/CustomerMaintain.aspx', 2, N'A', N'Admin', getdate())
GO

INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'Contract', N'iiWeb', N'合同管理', NULL, NULL, 1, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'ContractMaintain', N'Contract', N'合同维护', NULL, N'Web/Contract.aspx?pageType=1', 1, N'A', N'Admin', getdate())
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'DirectInvoice', N'Contract', N'直接开票', NULL, N'Web/Contract.aspx?pageType=2', 2, N'A', N'Admin', getdate())
GO