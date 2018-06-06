<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RLFin.Framework.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<frameset rows="90,*,20" frameborder="no">
    <frame src="Header.aspx" noresize="true" scrolling="no" />
    <frameset cols="190,10,*">
        <frame src="Navigator.aspx" noresize="true" />
        <frame src="Splitter.aspx" noresize="true" scrolling="no" />
        <frame name="MainFrame" src="Welcome.aspx" noresize="true" />
    </frameset>
    <frame src="Footer.aspx" noresize="true" scrolling="no" />
</frameset>
</html>
