<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pr2_Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pr2_Project</title>
    <style>       
     body{ 
            background-image:url("mealPictures/bg3.jpg");
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
            height: 29px;
        }
    </style>
</head>
<body>
    <ul>
        <li><a class="active" href="/">Home</a></li>
        <li><a href="/AddMeal">Add Meal</a></li>
    </ul>
    <form id="form1" runat="server">
        <center>
            <br />
            <asp:DropDownList ID="DropDownListCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListCategory_SelectedIndexChanged">
                <asp:ListItem value="*" Selected="True">All</asp:ListItem>
                <asp:ListItem Value="BreakFast">BreakFast</asp:ListItem>
                <asp:ListItem Value="Desserts">Desserts</asp:ListItem>
                <asp:ListItem Value="MainCourse">MainCourse</asp:ListItem>
            </asp:DropDownList>
            <br />
        <table>
            <tr>
                <td>
        <asp:GridView ID="GridViewMeal" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" GridLines="None" AutoGenerateColumns="False" ForeColor="Black" >
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
           <Columns>
               <asp:BoundField DataField="ID" HeaderText="Meal ID" />
               <asp:BoundField DataField="mealName" HeaderText="Meal Name" />
               <asp:BoundField DataField="mealIngredients" HeaderText="Meal Ingredients" />
               <asp:BoundField DataField="mealCategory" HeaderText="Meal Category" />
               <asp:BoundField DataField="mealPrice" HeaderText="Meal Price" />
               <asp:ImageField ControlStyle-Width="100" ControlStyle-Height = "100" DataImageUrlField="mealPicture" HeaderText ="Meal Picture">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
               </asp:ImageField>
               <asp:BoundField DataField="quantity" HeaderText="Meal Quantity" />
               <asp:TemplateField>
                   <ItemTemplate>
                       <asp:LinkButton ID="order" runat="server" Text="Make Order" OnClick="Order_click"></asp:LinkButton>
                       <asp:LinkButton ID="Edit" runat="server" Text="Edit" OnClick="Update_Click"></asp:LinkButton>
                   </ItemTemplate>
               </asp:TemplateField>
           </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
                    </td>
                </tr>
            <tr>
                <td>
                     <asp:TextBox ID="TextBoxAmount" placeholder="Enter amount" runat="server"></asp:TextBox>
                </td>
            </tr>
            </table>
            <asp:Label runat="server" ID="Purchase" ForeColor="#FF0000" Height="36px"></asp:Label>
            <asp:Label runat="server" ID="Order" ForeColor="#FF0000" Height="36px"></asp:Label>
            
    <table id="tableEdit" runat="server">
        <tr>
            <td class="auto-style1">
            <asp:Label ID="Labelname" runat="server" Text="Enter Meal Name :" ForeColor="#FF9900"></asp:Label>
            </td>
            <td class="auto-style1">
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
            <td>
            <asp:Label ID="LabelCategory" runat="server" Text="Enter Meal Category :" ForeColor="#FF9900"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownListCategory2" runat="server">
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox runat="server" hidden="true" ID="TextBoxID"></asp:TextBox>
            </td>
            <td>
            <asp:Button ID="ButtonUpdate" runat="server" Text="Update Meal" BackColor="#CC9900" BorderStyle="None" Width="195px" OnClick="ButtonUpdate_Click" />
            </td>
        </tr>
    </table>
    </center>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
