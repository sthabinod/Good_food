<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loyalty.aspx.cs" Inherits="New_Online_Good_Food.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LOYALTY&quot; WHERE &quot;LOYALTY_ID&quot; = :LOYALTY_ID" InsertCommand="INSERT INTO &quot;LOYALTY&quot; (&quot;LOYALTY_ID&quot;, &quot;LOYALTY_POINTS&quot;, &quot;END_DATE&quot;) VALUES (:LOYALTY_ID, :LOYALTY_POINTS, :END_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LOYALTY&quot;" UpdateCommand="UPDATE &quot;LOYALTY&quot; SET &quot;LOYALTY_POINTS&quot; = :LOYALTY_POINTS, &quot;END_DATE&quot; = :END_DATE WHERE &quot;LOYALTY_ID&quot; = :LOYALTY_ID">
    <DeleteParameters>
        <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
        <asp:Parameter Name="LOYALTY_POINTS" Type="Decimal" />
        <asp:Parameter Name="END_DATE" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="LOYALTY_POINTS" Type="Decimal" />
        <asp:Parameter Name="END_DATE" Type="DateTime" />
        <asp:Parameter Name="LOYALTY_ID" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" style="margin-top:40px;" DataKeyNames="LOYALTY_ID" DataSourceID="SqlDataSource1">
      
        <EditItemTemplate>
            LOYALTY_ID:
            <asp:Label ID="LOYALTY_IDLabel1" runat="server" Text='<%# Eval("LOYALTY_ID") %>' />
            <br />
            LOYALTY_POINTS:
            <asp:TextBox ID="LOYALTY_POINTSTextBox" runat="server" Text='<%# Bind("LOYALTY_POINTS") %>' />
            <br />
            END_DATE:
            <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
      
        <InsertItemTemplate>
            <label style="margin-right:50px;">
                Loyalty Id
            </label>
            <asp:TextBox ID="LOYALTY_IDTextBox" runat="server" Text='<%# Bind("LOYALTY_ID") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="LOYALTY_IDTextBox" ErrorMessage="Point Id required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <label style="margin-right:75px;">
                Points
            </label>
            <asp:TextBox ID="LOYALTY_POINTSTextBox" runat="server" Text='<%# Bind("LOYALTY_POINTS") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="LOYALTY_POINTSTextBox" ErrorMessage="Loyality Points is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
             <label style="margin-right:52px;">
                End Date
            </label>
            <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="END_DATETextBox" ErrorMessage="Duration is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" CssClass="btn btn-primary" runat="server" style="margin-top:30px;" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-warning" style="margin-top:30px;" CausesValidation="False"  CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           
           
           
           
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CssClass="btn btn-success" CommandName="New" Text="Add New Points" />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView1" CssClass="table table-striped table-dark" style="margin-top:50px; " runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="LOYALTY_ID" DataSourceID="SqlDataSource1" Height="319px" Width="1150px">
        <Columns >
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="LOYALTY_ID" HeaderText="Loyalty Id" ReadOnly="True" SortExpression="LOYALTY_ID" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="LOYALTY_POINTS" HeaderText="Points" SortExpression="LOYALTY_POINTS" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
            <asp:BoundField DataField="END_DATE" HeaderText="Duration" SortExpression="END_DATE" >
            <HeaderStyle ForeColor="#009933" />
            </asp:BoundField>
        </Columns>
</asp:GridView>

    <br />
    <br />

</asp:Content>
