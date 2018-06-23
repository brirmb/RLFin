-- --------------------------------------------------
-- Framework 初始化脚本（第一行必须为空）
-- --------------------------------------------------

/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_GetUserDetail]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_GetUserDetail]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_UpdateAuthority]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_UpdateAuthority]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_UpdateConfig]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_UpdateConfig]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_UpdateUser]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_UpdateUser]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_UpdateUserPassword]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_UpdateUserPassword]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_CreateConfig]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_CreateConfig]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_CreateUser]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_CreateUser]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_DeleteConfig]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_DeleteConfig]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_DeleteUser]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_DeleteUser]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_GetModule]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_GetModule]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_GetUser]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_GetUser]
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_GetConfig]    Script Date: 07/16/2011 14:41:41 ******/
DROP PROCEDURE [dbo].[iiWeb_Framework_GetConfig]
GO

/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_GetConfig]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110420
-- Description:	获取配置
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_GetConfig]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),	--必须有
	@Key		nvarchar(50)=null,
	@Name		nvarchar(1000)=null,
	@Value		nvarchar(2000)=null,
	@Remark		nvarchar(2000)=null
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @SQL nvarchar(4000)
	set @SQL='	select
					*
				from
					iiWeb_Config
				where
					[Status]<>''D'' --未删除
					and [ID]='''+@ID+''''
	
	--条件
	if (len(@Key)>0)
		set @SQL=@SQL+' and [Key]=N'''+@Key+''''
	if (len(@Name)>0)
		set @SQL=@SQL+' and [Name] like N''%'+@Name+'%'''
	if (len(@Value)>0)
		set @SQL=@SQL+' and [Value] like N''%'+@Value+'%'''
	if (len(@Remark)>0)
		set @SQL=@SQL+' and [Remark] like N''%'+@Remark+'%'''

	set @SQL=@SQL+' order by [Name],[Key]'
	exec(@SQL)
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_GetUser]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110416
-- Description:	获取用户
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_GetUser]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50)=null,
	@Name		nvarchar(50)=null,
	@Remark		nvarchar(100)=null,
	@Property1	nvarchar(1000)=null,
	@Property2	nvarchar(1000)=null,
	@Property3	nvarchar(1000)=null,
	@Property4	nvarchar(1000)=null,
	@Property5	nvarchar(1000)=null,
	@RIDList	nvarchar(2000)=null,	--角色ID列表（例如：R001|R002|R003）
	@Separator	nvarchar(1)='|'			--分隔符（默认：|）
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @SQL nvarchar(4000)
	set @SQL='	select
					*
				from
					iiWeb_User
				where
					[Status]<>''D''' --未删除
					
	--条件
	if (len(@ID)>0)
		set @SQL=@SQL+' and [ID]='''+@ID+''''
	if (len(@Name)>0)
		set @SQL=@SQL+' and [Name] like ''%'+@Name+'%'''
	if (len(@Remark)>0)
		set @SQL=@SQL+' and Remark like ''%'+@Remark+'%'''
	if (len(@Property1)>0)
		set @SQL=@SQL+' and Property1 like ''%'+@Property1+'%'''
	if (len(@Property2)>0)
		set @SQL=@SQL+' and Property2 like ''%'+@Property2+'%'''
	if (len(@Property3)>0)
		set @SQL=@SQL+' and Property3 like ''%'+@Property3+'%'''
	if (len(@Property4)>0)
		set @SQL=@SQL+' and Property4 like ''%'+@Property4+'%'''
	if (len(@Property5)>0)
		set @SQL=@SQL+' and Property5 like ''%'+@Property5+'%'''
	if (len(@RIDList)>0)
		set @SQL=@SQL+' and [ID] in (
									select distinct UR.[UID]
									from iiWeb_UserRole as UR,iiWeb_Config as C
									where
										C.[ID]=''Role'' and C.[Status]<>''D''	--有效角色
										and UR.RID=C.[Key]
										and UR.RID in ('''+replace(@RIDList,@Separator,''',''')+''')	--in语句格式
									)'

	set @SQL=@SQL+' order by [Name] asc,[ID] desc'
	exec(@SQL)
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_GetModule]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110424
-- Description:	获取模块
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_GetModule]
	-- Add the parameters for the stored procedure here
	@MPID		nvarchar(50),
	@Authority	nvarchar(1),	--U：用户方式；R：角色方式
	@ID			nvarchar(50)
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    --常量
    declare @UserGrant	nvarchar(1),
			@RoleGrant	nvarchar(1),
			@AdminRID	nvarchar(50)
	set @UserGrant='U'	--权限来自用户
	set @RoleGrant='R'	--权限来自角色
	set @AdminRID='Admins'	--管理员角色ID
    
    
    --结果临时表
    if (object_id('tempdb..#Result_Framework_GetModule') is not null)
		drop table #Result_Framework_GetModule
    create table #Result_Framework_GetModule
    (
		[ID] [nchar](50) PRIMARY KEY,
		[PID] [nchar](50),
		[Name] [nvarchar](50),
		[Remark] [nvarchar](100),
		[URL] [nvarchar](2000),
		[SEQ] [int],
		[Status] [nchar](1),
		[Grant] [nchar](1)	--获得授权的方式：U-用户；R-角色；(null)-无
	)
	
	--本级有效的所有模块
	INSERT INTO #Result_Framework_GetModule
		([ID]
		,[PID]
		,[Name]
		,[Remark]
		,[URL]
		,[SEQ]
		,[Status])
		select
			[ID]
			,[PID]
			,[Name]
			,[Remark]
			,[URL]
			,[SEQ]
			,[Status]
		from
			iiWeb_Module as M
		where
			[Status]<>'D'
			and
			[PID]=@MPID --本级模块
	
	if (@Authority='U') --用户查询方式，@ID表示用户ID，要同时考虑用户和角色赋权的情况
	begin
		if exists(select top 1 * from iiWeb_UserRole where [UID]=@ID and [RID]=@AdminRID) --当前用户是管理员角色
		begin
			update #Result_Framework_GetModule
			set [Grant]=@RoleGrant
		end
		else
		begin
			--用户权限
			update #Result_Framework_GetModule
			set
				[Grant]=@UserGrant
			where
				[Grant] is null
				and
				[ID] in (	select distinct MID
							from iiWeb_Authority
							where
								Authority='U'
								and
								[ID]=@ID --本用户
						)

			--角色权限（会覆盖用户权限）
			update #Result_Framework_GetModule
			set
				[Grant]=@RoleGrant
			where
				[ID] in (	select distinct A.MID
							from iiWeb_Authority as A,iiWeb_UserRole as UR
							where
								A.Authority='R'
								and
								A.[ID]=UR.[RID]
								and
								UR.[UID]=@ID --本用户
						)
		end
	end
	else if (@Authority='R') --角色查询方式，@ID表示角色ID
	begin
		if (@ID=@AdminRID) --管理员角色
		begin
			update #Result_Framework_GetModule
			set [Grant]=@RoleGrant
		end
		else
		begin
			update #Result_Framework_GetModule
			set
				[Grant]=@RoleGrant
			where
				[ID] in (	select distinct MID
							from iiWeb_Authority
							where
								Authority='R'
								and
								[ID]=@ID --本角色
						)
		end
	end
	
	--返回
	select *
	from #Result_Framework_GetModule
	order by SEQ
	
	drop table #Result_Framework_GetModule
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_DeleteUser]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110416
-- Description:	删除用户
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_DeleteUser]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),
	@MUser		nvarchar(50)
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update iiWeb_User
	set
		[Status]='D', --已删除
		MUser=@MUser,
		MTime=GETDATE()		
	where
		[ID]=@ID
		and
		[Status]<>'S' --系统
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_DeleteConfig]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110420
-- Description:	删除配置
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_DeleteConfig]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),
	@Key		nvarchar(50),
	@MUser		nvarchar(50)
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update iiWeb_Config
	set
		[Status]='D', --已删除
		MUser=@MUser,
		MTime=GETDATE()		
	where
		[ID]=@ID
		and
		[Key]=@Key
		and
		[Status]<>'S' --系统
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_CreateUser]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110416
-- Description:	新增用户
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_CreateUser]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),
	@Name		nvarchar(50),
	@Password	nvarchar(50),
	@Remark		nvarchar(100),
	@MUser		nvarchar(50),
	@Property1	nvarchar(1000),
	@Property2	nvarchar(1000),
	@Property3	nvarchar(1000),
	@Property4	nvarchar(1000),
	@Property5	nvarchar(1000),
	@RIDList	nvarchar(2000),		--角色ID列表（例如：R001|R002|R003）
	@Separator	nvarchar(1)='|'		--分隔符（默认：|）
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    --用户
	INSERT INTO [iiWeb_User]
           ([ID]
           ,[Name]
           ,[Password]
           ,[Remark]
           ,[Status]
           ,[MUser]
           ,[MTime]
           ,[Property1]
           ,[Property2]
           ,[Property3]
           ,[Property4]
           ,[Property5])
     VALUES
           (@ID
           ,@Name
           ,@Password
           ,@Remark
           ,'A'	--有效
           ,@MUser
           ,GETDATE()
           ,@Property1
           ,@Property2
           ,@Property3
           ,@Property4
           ,@Property5)
           
	--角色
	delete from iiWeb_UserRole
	where [UID]=@ID
	
	declare @SQL nvarchar(4000)
	set @SQL='	INSERT INTO [iiWeb_UserRole]
					([UID]
					,[RID]
					,[MUser]
					,[MTime])
					select
						'''+@ID+''',
						[Key],
						'''+@MUser+''',
						GETDATE()
					from
						iiWeb_Config
					where
						[ID]=''Role'' and [Status]<>''D''	--有效角色
						and
						[Key] in ('''+replace(@RIDList,@Separator,''',''')+''')'	--in语句格式
	exec(@SQL)
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_CreateConfig]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110420
-- Description:	新增配置
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_CreateConfig]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),
	@Key		nvarchar(50),
	@Name		nvarchar(1000),
	@Remark		nvarchar(2000),
	@MUser		nvarchar(50)
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [iiWeb_Config]
           ([ID]
           ,[Key]
           ,[Name]
           ,[Remark]
           ,[Status]
           ,[MUser]
           ,[MTime])
     VALUES
           (@ID
           ,@Key
           ,@Name
           ,@Remark
           ,'A'	--有效
           ,@MUser
           ,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_UpdateUserPassword]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110416
-- Description:	更新用户密码
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_UpdateUserPassword]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),
	@Password	nvarchar(50)
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update iiWeb_User
	set [Password]=@Password
	where [ID]=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_UpdateUser]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110416
-- Description:	更新用户
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_UpdateUser]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),
	@Name		nvarchar(50),
	@Remark		nvarchar(100),
	@MUser		nvarchar(50),
	@Property1	nvarchar(1000),
	@Property2	nvarchar(1000),
	@Property3	nvarchar(1000),
	@Property4	nvarchar(1000),
	@Property5	nvarchar(1000),
	@RIDList	nvarchar(2000),		--角色列表（例如：R001|R002|R003）
	@Separator	nvarchar(1)='|'		--分隔符（默认：|）
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    --用户
	UPDATE [iiWeb_User]
	SET
		[Name] = @Name
		,[Remark] = @Remark
		,[MUser] = @MUser
		,[MTime] = GETDATE()
		,[Property1] = @Property1
		,[Property2] = @Property2
		,[Property3] = @Property3
		,[Property4] = @Property4
		,[Property5] = @Property5
	WHERE
		[ID] = @ID
	
	--角色
	delete from iiWeb_UserRole
	where [UID]=@ID
	
	declare @SQL nvarchar(4000)
	set @SQL='	INSERT INTO [iiWeb_UserRole]
					([UID]
					,[RID]
					,[MUser]
					,[MTime])
					select
						'''+@ID+''',
						[Key],
						'''+@MUser+''',
						GETDATE()
					from
						iiWeb_Config
					where
						[ID]=''Role'' and [Status]<>''D''	--有效角色
						and
						[Key] in ('''+replace(@RIDList,@Separator,''',''')+''')'	--in语句格式
	exec(@SQL)
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_UpdateConfig]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110420
-- Description:	更新配置
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_UpdateConfig]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),
	@Key		nvarchar(50),
	@Name		nvarchar(1000),
	@Remark		nvarchar(2000),
	@MUser		nvarchar(50)
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [iiWeb_Config]
	SET
		[Name] = @Name
		,[Remark] = @Remark
		,[MUser] = @MUser
		,[MTime] = getdate()
	WHERE
		[ID]=@ID
		and
		[Key]=@Key
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_UpdateAuthority]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110424
-- Description:	更新权限
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_UpdateAuthority]
	-- Add the parameters for the stored procedure here
	@Authority	nvarchar(1),	--U：用户方式；R：角色方式
	@ID			nvarchar(50),
	@MIDList	nvarchar(2000),	--模块ID列表（例如：M001|M002|M003）
	@MUser		nvarchar(50),
	@Separator	nvarchar(1)='|'	--分隔符（默认：|）
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    --清除
    delete from iiWeb_Authority
	where
		Authority=@Authority
		and
		[ID]=@ID

    --添加
	declare @SQL nvarchar(4000)
	set @SQL='	INSERT INTO [iiWeb_Authority]
					([Authority]
					,[ID]
					,[MID]
					,[MUser]
					,[MTime])
					select
						'''+@Authority+''',
						'''+@ID+''',
						[ID],
						'''+@MUser+''',
						GETDATE()
					from
						iiWeb_Module
					where
						[Status]<>''D''	--有效
						and
						[ID] in ('''+replace(@MIDList,@Separator,''',''')+''')'	--in语句格式
	exec(@SQL)
END
GO
/****** Object:  StoredProcedure [dbo].[iiWeb_Framework_GetUserDetail]    Script Date: 07/16/2011 14:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hedda@Plusii.com
-- Create date: 20110423
-- Description:	获取用户详情
-- =============================================
CREATE PROCEDURE [dbo].[iiWeb_Framework_GetUserDetail]
	-- Add the parameters for the stored procedure here
	@ID			nvarchar(50),
	@Separator	nvarchar(1)='|'	--分隔符（默认：|）
	WITH ENCRYPTION
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    --角色ID列表
    declare @RIDList nvarchar(2000)
    set @RIDList=''
    
    select @RIDList=@RIDList+rtrim(UR.RID)+@Separator
	from iiWeb_UserRole as UR,iiWeb_Config as C
	where
		C.[ID]='Role' and C.[Status]<>'D' --有效角色
		and UR.RID=C.[Key]
		and UR.[UID]=@ID

	--去掉两端的分隔符
	while (len(@RIDList)>0 and substring(@RIDList,1,len(@Separator))=@Separator)
		set @RIDList=substring(@RIDList,1+len(@Separator),len(@RIDList)-len(@Separator))
	while (len(@RIDList)>0 and substring(@RIDList,len(@RIDList)-len(@Separator)+1,len(@Separator))=@Separator)
		set @RIDList=substring(@RIDList,1,len(@RIDList)-len(@Separator))
	
    --用户详情合并角色列表
	select
		*,
		@RIDList as RIDList
	from
		iiWeb_User
	where
		[Status]<>'D' --未删除
		and
		[ID]=@ID
END
GO

----------------------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'iiWeb_User', N'COLUMN',N'Status'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'iiWeb_User', @level2type=N'COLUMN',@level2name=N'Status'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'iiWeb_Authority', N'COLUMN',N'Authority'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'iiWeb_Authority', @level2type=N'COLUMN',@level2name=N'Authority'

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_UserRole_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_UserRole] DROP CONSTRAINT [DF_iiWeb_UserRole_MTime]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_User_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_User] DROP CONSTRAINT [DF_iiWeb_User_MTime]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_User_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_User] DROP CONSTRAINT [DF_iiWeb_User_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Authority_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Authority] DROP CONSTRAINT [DF_iiWeb_Authority_MTime]
END

GO
/****** Object:  Table [dbo].[iiWeb_UserRole]    Script Date: 2013/8/26 22:32:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_UserRole]') AND type in (N'U'))
DROP TABLE [dbo].[iiWeb_UserRole]
GO
/****** Object:  Table [dbo].[iiWeb_User]    Script Date: 2013/8/26 22:32:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_User]') AND type in (N'U'))
DROP TABLE [dbo].[iiWeb_User]
GO
/****** Object:  Table [dbo].[iiWeb_Authority]    Script Date: 2013/8/26 22:32:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_Authority]') AND type in (N'U'))
DROP TABLE [dbo].[iiWeb_Authority]
GO
/****** Object:  Table [dbo].[iiWeb_Authority]    Script Date: 2013/8/26 22:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_Authority]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iiWeb_Authority](
	[Authority] [nchar](1) NOT NULL,
	[ID] [nchar](50) NOT NULL,
	[MID] [nchar](50) NOT NULL,
	[MUser] [nvarchar](50) NOT NULL,
	[MTime] [datetime] NOT NULL,
 CONSTRAINT [PK_iiWeb_Authority] PRIMARY KEY CLUSTERED 
(
	[Authority] ASC,
	[ID] ASC,
	[MID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[iiWeb_User]    Script Date: 2013/8/26 22:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iiWeb_User](
	[ID] [nchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](100) NULL,
	[Status] [nchar](1) NOT NULL,
	[MUser] [nvarchar](50) NOT NULL,
	[MTime] [datetime] NOT NULL,
	[Property1] [nvarchar](1000) NULL,
	[Property2] [nvarchar](1000) NULL,
	[Property3] [nvarchar](1000) NULL,
	[Property4] [nvarchar](1000) NULL,
	[Property5] [nvarchar](1000) NULL,
 CONSTRAINT [PK_iiWeb_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[iiWeb_UserRole]    Script Date: 2013/8/26 22:32:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_UserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iiWeb_UserRole](
	[UID] [nchar](50) NOT NULL,
	[RID] [nchar](50) NOT NULL,
	[MUser] [nvarchar](50) NOT NULL,
	[MTime] [datetime] NOT NULL,
 CONSTRAINT [PK_iiWeb_UserRole] PRIMARY KEY CLUSTERED 
(
	[UID] ASC,
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[iiWeb_Authority] ([Authority], [ID], [MID], [MUser], [MTime]) VALUES (N'R', N'Users                                             ', N'Password                                          ', N'Admin', CAST(0x00009F2200DDCB83 AS DateTime))
GO
INSERT [dbo].[iiWeb_User] ([ID], [Name], [Password], [Remark], [Status], [MUser], [MTime], [Property1], [Property2], [Property3], [Property4], [Property5]) VALUES (N'Admin                                             ', N'管理员', N'MQ==', N'系统管理员具备所有权限', N'S', N'Admin', CAST(0x00009F2200DAFDF2 AS DateTime), N'', N'', N'', N'', N'')
GO
INSERT [dbo].[iiWeb_User] ([ID], [Name], [Password], [Remark], [Status], [MUser], [MTime], [Property1], [Property2], [Property3], [Property4], [Property5]) VALUES (N'Test                                              ', N'测试用户', N'MQ==', N'测试用户', N'A', N'Admin', CAST(0x00009F2200DAF03B AS DateTime), N'', N'', N'', N'', N'')
GO
INSERT [dbo].[iiWeb_UserRole] ([UID], [RID], [MUser], [MTime]) VALUES (N'Admin                                             ', N'Admins                                            ', N'Admin', CAST(0x00009F2200DAFDF4 AS DateTime))
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Authority_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Authority] ADD  CONSTRAINT [DF_iiWeb_Authority_MTime]  DEFAULT (getdate()) FOR [MTime]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_User_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_User] ADD  CONSTRAINT [DF_iiWeb_User_Status]  DEFAULT (N'A') FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_User_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_User] ADD  CONSTRAINT [DF_iiWeb_User_MTime]  DEFAULT (getdate()) FOR [MTime]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_UserRole_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_UserRole] ADD  CONSTRAINT [DF_iiWeb_UserRole_MTime]  DEFAULT (getdate()) FOR [MTime]
END

GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'iiWeb_Authority', N'COLUMN',N'Authority'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'U-User; R-Role' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'iiWeb_Authority', @level2type=N'COLUMN',@level2name=N'Authority'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'iiWeb_User', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A-Active; D-Delete; S-System' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'iiWeb_User', @level2type=N'COLUMN',@level2name=N'Status'
GO


---------------------------------------------------------------------------------------------------------------------------------------
--iiWeb Framework SP 结束
---------------------------------------------------------------------------------------------------------------------------------------
--Config & Module

IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'iiWeb_Module', N'COLUMN',N'Status'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'iiWeb_Module', @level2type=N'COLUMN',@level2name=N'Status'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'iiWeb_Config', N'COLUMN',N'Status'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'iiWeb_Config', @level2type=N'COLUMN',@level2name=N'Status'

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Module_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Module] DROP CONSTRAINT [DF_iiWeb_Module_MTime]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Module_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Module] DROP CONSTRAINT [DF_iiWeb_Module_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Module_SEQ]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Module] DROP CONSTRAINT [DF_iiWeb_Module_SEQ]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Config_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Config] DROP CONSTRAINT [DF_iiWeb_Config_MTime]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Config_Status1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Config] DROP CONSTRAINT [DF_iiWeb_Config_Status1]
END

GO
/****** Object:  Table [dbo].[iiWeb_Module]    Script Date: 2013/8/31 21:53:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_Module]') AND type in (N'U'))
DROP TABLE [dbo].[iiWeb_Module]
GO
/****** Object:  Table [dbo].[iiWeb_Config]    Script Date: 2013/8/31 21:53:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_Config]') AND type in (N'U'))
DROP TABLE [dbo].[iiWeb_Config]
GO
/****** Object:  Table [dbo].[iiWeb_Config]    Script Date: 2013/8/31 21:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_Config]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iiWeb_Config](
	[ID] [nchar](50) NOT NULL,
	[Key] [nchar](50) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[Value] [nvarchar](2000) NULL,
	[Remark] [nvarchar](2000) NULL,
	[Status] [nchar](1) NOT NULL,
	[MUser] [nvarchar](50) NOT NULL,
	[MTime] [datetime] NOT NULL,
 CONSTRAINT [PK_iiWeb_Config_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[iiWeb_Module]    Script Date: 2013/8/31 21:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iiWeb_Module]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iiWeb_Module](
	[ID] [nchar](50) NOT NULL,
	[PID] [nchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](100) NULL,
	[URL] [nvarchar](2000) NULL,
	[SEQ] [int] NOT NULL,
	[Status] [nchar](1) NOT NULL,
	[MUser] [nvarchar](50) NOT NULL,
	[MTime] [datetime] NOT NULL,
 CONSTRAINT [PK_iiWeb_Module] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Config_Status1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Config] ADD  CONSTRAINT [DF_iiWeb_Config_Status1]  DEFAULT (N'A') FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Config_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Config] ADD  CONSTRAINT [DF_iiWeb_Config_MTime]  DEFAULT (getdate()) FOR [MTime]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Module_SEQ]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Module] ADD  CONSTRAINT [DF_iiWeb_Module_SEQ]  DEFAULT ((1)) FOR [SEQ]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Module_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Module] ADD  CONSTRAINT [DF_iiWeb_Module_Status]  DEFAULT (N'A') FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_iiWeb_Module_MTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iiWeb_Module] ADD  CONSTRAINT [DF_iiWeb_Module_MTime]  DEFAULT (getdate()) FOR [MTime]
END

GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'iiWeb_Config', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A-Active; D-Delete; S-System' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'iiWeb_Config', @level2type=N'COLUMN',@level2name=N'Status'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'iiWeb_Module', N'COLUMN',N'Status'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A-Active; D-Delete; S-System' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'iiWeb_Module', @level2type=N'COLUMN',@level2name=N'Status'
GO


INSERT [dbo].[iiWeb_Config] ([ID], [Key], [Name], [Value], [Remark], [Status], [MUser], [MTime]) VALUES (N'Role                                              ', N'Admins                                            ', N'管理员', NULL, N'具备所有权限', N'S', N'Admin', CAST(0x00009F2200DCC104 AS DateTime))
GO
INSERT [dbo].[iiWeb_Config] ([ID], [Key], [Name], [Value], [Remark], [Status], [MUser], [MTime]) VALUES (N'Role                                              ', N'Users                                             ', N'普通用户', NULL, N'具备常规权限', N'A', N'Admin', CAST(0x00009F2200DCC86F AS DateTime))
GO
INSERT [dbo].[iiWeb_Config] ([ID], [Key], [Name], [Value], [Remark], [Status], [MUser], [MTime]) VALUES (N'Status                                            ', N'A                                                 ', N'A-有效', NULL, NULL, N'S', N'Hedda                                             ', CAST(0x00009ECB0165FF0C AS DateTime))
GO
INSERT [dbo].[iiWeb_Config] ([ID], [Key], [Name], [Value], [Remark], [Status], [MUser], [MTime]) VALUES (N'Status                                            ', N'D                                                 ', N'D-已删除', NULL, NULL, N'S', N'Hedda                                             ', CAST(0x00009ECB0165FF0C AS DateTime))
GO

IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

DELETE FROM [dbo].[iiWeb_Module]
GO

INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'Config', N'Data', N'基础数据配置', N'基础数据配置', N'Framework/Config.aspx', 2, N'A', N'admin', CAST(0x0000A30701002A74 AS DateTime))
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'Password', N'System', N'密码修改', N'密码修改', N'Framework/Password.aspx', 8, N'S', N'admin', CAST(0x0000A30000000000 AS DateTime))
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'System', N'iiWeb', N'系统', N'系统管理', NULL, 9, N'S', N'admin', CAST(0x0000A30000000000 AS DateTime))
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'User', N'System', N'用户管理', N'用户管理', N'Framework/User.aspx', 2, N'S', N'admin', CAST(0x0000A30000000000 AS DateTime))
GO
INSERT [dbo].[iiWeb_Module] ([ID], [PID], [Name], [Remark], [URL], [SEQ], [Status], [MUser], [MTime]) VALUES (N'Data', N'iiWeb', N'基础数据', N'基础数据', NULL, 8, N'A', N'admin', CAST(0x0000A301010E5EEC AS DateTime))
GO