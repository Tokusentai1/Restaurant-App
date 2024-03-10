<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMeal.aspx.cs" Inherits="Pr2_Project.AddMeal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Meal</title>
    <style> body{ 
            background-image:url("mealPictures/bg5.jpg");
            background-size:cover;
            background-repeat:no-repeat;
            background-attachment:fixed;
    }
    ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: none;
    }

    li {
      float: left;
    }

    li a {
      display: block;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    li a:hover:not(.active) {
      background-color: #cc9900;
    }

    .active {
      background-color: darkgoldenrod;
    }
        .auto-style1 {
            height: 68px;
        }
        .auto-style2 {
            height: 29px;
        }
    </style>
</head>
<body><ul>
        <li><a href="/">Home</a></li>
        <li><a class="active" href="/AddMeal">Add Meal</a></li>
    </ul>
    <center>
        <br />
    <form id="form1" runat="server">
        <asp:Label ID="LabelIntro" runat="server" Text="Add New Meal" ForeColor="#FF9900"></asp:Label>
        <br />
        <br />
    <table>
        <tr>
            <td>
            <asp:Label ID="Labelname" runat="server" Text="Enter Meal Name :" ForeColor="#FF9900"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBoxname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">            
            <asp:Label ID="LabelIngredients" runat="server" Text="Enter Meal Ingredients :" ForeColor="#FF9900"></asp:Label>
            </td>
            <td class="auto-style1">
            <asp:TextBox ID="TextBoxIngredients" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
            <asp:Label ID="LabelCategory" runat="server" Text="Enter Meal Category :" ForeColor="#FF9900"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownListCategory" runat="server">
                    <asp:ListItem Value="BreakFast">BreakFast</asp:ListItem>
                    <asp:ListItem Value="Desserts">Desserts</asp:ListItem>
                    <asp:ListItem Value="MainCourse">MainCourse</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="LabelPrice" runat="server" Text="Enter Meal Price :" ForeColor="#FF9900"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="LabelImg" runat="server" Text="Enter Meal Picture :" ForeColor="#FF9900"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="mealPicture" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="LabelQnt" runat="server" Text="Enter Meal Quantity :" ForeColor="#FF9900"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="mealQnt" runat="server" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorQnt" ControlToValidate="mealQnt" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            <asp:Button ID="ButtonCreate" runat="server" Text="ADD Meal" OnClick="ButtonCreate_Click" BackColor="#CC9900" BorderStyle="None" Width="195px" />
            </td>
        </tr>
    </table>
    </form>
   </center>
</body>
</html>
