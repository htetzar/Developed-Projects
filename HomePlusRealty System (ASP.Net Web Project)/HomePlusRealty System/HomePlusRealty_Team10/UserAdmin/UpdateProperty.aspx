<%@ Page Title="" Language="C#" MasterPageFile="UserAdmin.Master"  AutoEventWireup="true" CodeFile="UpdateProperty.aspx.cs" Inherits="UserAdmin_UpdateProperty"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <h2 class="headstyle">Property Update</h2> 
    <div class="container">  
        <div class="row">   
    <table class="col-md-4 table">
        <tr>
            <td >
                 <asp:Label ID="LabelName" runat="server" Text="Property Name" text-transform="uppercase"></asp:Label>
            </td>
            <td class="auto-style7" >
                 <asp:TextBox ID="TextBoxName"  runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Label ID="LabelType" runat="server" Text="Property Type"></asp:Label>
            </td>
            <td class="auto-style7">
                 <asp:DropDownList ID="DropDownListtype" runat="server" Width="195px">               
               <asp:ListItem Value="HDB">HDB</asp:ListItem>
               <asp:ListItem Value="Condo">Condo</asp:ListItem>
               <asp:ListItem Value="Landed">Landed</asp:ListItem>
           </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
               <asp:Label ID="LabelAddress" runat="server" Text="Address"></asp:Label>  
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBoxAddress" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr class="facilities">            
            <td class="auto-style1">
                 <asp:Label ID="LabelNearfacilities" runat="server" Text="NearFacilities" style="position: relative"></asp:Label>  
            </td>
            <td class="auto-style1" >            
                     <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" Height="30px" Width="390px" CellPadding="0" CellSpacing="0">
                  <asp:ListItem Value="MRT">MRT</asp:ListItem>
                  <asp:ListItem Value="School">School</asp:ListItem>
                  <asp:ListItem Value="Shopping Mall">Shopping Mall</asp:ListItem>
                  <asp:ListItem Value="Bus Stop">Bus Stop</asp:ListItem>
                  </asp:CheckBoxList>
               </td>
        </tr>
         <tr>
            <td>
                   <asp:Label ID="LabelRoom" runat="server" Text="No of Room"></asp:Label>
            </td>
            <td >
                   <asp:TextBox ID="TextBoxRoom" textmode="Number" runat="server" step="1" Width="195px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                  <asp:Label ID="LabelBathroom" runat="server" Text="No of Bathroom"></asp:Label>
            </td>
            <td >
                  <asp:TextBox ID="TextBoxBathroom" TextMode="Number" runat="server" step="1" Width="195px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                   <asp:Label ID="LabelSize" runat="server" Text="Floor Size"></asp:Label>
            </td>
            <td >
                   <asp:TextBox ID="TextBoxSize" runat="server" Width="195px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td >
                    <asp:Label ID="LabelTenure" runat="server" Text="Tenure"></asp:Label>
            </td>
            <td >
                    <asp:TextBox ID="TextBoxTenure" runat="server" Width="195px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                 <asp:Label ID="LabelDeveloper" runat="server" Text="Developer"></asp:Label>  
            </td>
            <td >
                  <asp:TextBox ID="TextBoxDeveloper" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                   <asp:Label ID="LabelPrice" runat="server" Text="Price"></asp:Label>
            </td>
            <td >
                  <asp:TextBox ID="TextBoxPrice" runat="server" Width="195px"></asp:TextBox>
            </td>
        </tr>
        <tr >
        <td  >
             <asp:Label ID="LabelImagepath" runat="server" CssClass="" Text="ImagePath" ></asp:Label>
      
        </td>
        <td  >           
            <asp:FileUpload ID="FileUploadImagepath" runat="server" Width="400px" />             
        </td>
          </tr>
        <tr>
            <td class="auto-style8" >
                  <asp:Label ID="LabelDescription" runat="server" Text="Description"></asp:Label>
            </td>
            <td class="auto-style9" >
                 <asp:TextBox ID="TextBoxDescription" runat="server" TextMode="MultiLine" Width="400px" Height="80px"></asp:TextBox>
            </td>
        </tr>
    </table>  
    <div class="summit">
    <asp:Button ID="ButtonUpdate" runat="server" Text="Update" Height="35px" Width="100px" OnClick="ButtonUpdate_Click1" />
        </div>           
            </div>
        </div>
</asp:Content>
