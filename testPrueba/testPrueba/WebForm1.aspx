<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="testPrueba.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        function scValidate() {
            var name = document.getElementById('tbUsuario').value;
            var pass = document.getElementById('tbContrasenia').value;
            var res = false;

            if (name == '') {
                alert("Debe ingresar el usuario");
            } else if (pass == '') {
                alert("Debe ingresar la contraseña");
            } else res = true;

            return res;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td colspan="4">
                    <asp:Label ID="Label3" runat="server" Text="Login test de prueba" Font-Size="X-Large"></asp:Label>
                </td>   
            </tr>
             <tr>
                <td colspan="4">
                    <br />
                </td>   
            </tr>
             <tr>
                <td colspan="4">
                    <br />
                </td>   
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>            
                </td>
                <td></td>
                <td>
                    <asp:TextBox ID="tbUsuario" runat="server" Width="270px" ></asp:TextBox>  
                </td>   
            </tr>
            <tr>
                <td></td>
                <td colspan="3">
                    <asp:Label ID="lblErrorUsuario" runat="server" Text="Debe ingresar el usuario." ForeColor="#CC3300" Visible="False"></asp:Label>
                </td>   
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:TextBox ID="tbContrasenia" runat="server" CssClass="auto-style1" TextMode="Password" Width="270px" ></asp:TextBox>
                </td>   
            </tr>
            <tr>
                <td></td>
                <td colspan="3">
                    <asp:Label ID="lblErrorContrasenia" runat="server" Text="Debe ingresar la contraseña." ForeColor="#CC3300" Visible="False"></asp:Label>
                </td>   
            </tr>
            <tr>
                <td></td>
                <td colspan="3">
                    <asp:Button ID="BtnLogin" runat="server" OnClick="BtnLogin_Click" Text="Button" OnClientClick="return scValidate()" />
                </td>   
            </tr>
            <tr>
                <td></td>
                <td colspan="3">
                    <asp:Label ID="lblExitoLog" runat="server" ForeColor="#009933" Text="Logueado exitosamente." Visible="False"></asp:Label>
                </td>   
            </tr>
        </table>
        
        
    </form>
</body>
</html>
