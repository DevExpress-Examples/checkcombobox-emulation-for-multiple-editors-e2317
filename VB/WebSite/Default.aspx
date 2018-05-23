<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
	<script type="text/javascript">
		var textSeparator = ";";
		function OnListBoxSelectionChanged(listBox, args, checkComboBox) {
			if (args.index == 0)
				args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
			UpdateSelectAllItemState(listBox);
			UpdateText(listBox, checkComboBox);
		}
		function UpdateSelectAllItemState(checkListBox) {
			IsAllSelected(checkListBox) ? checkListBox.SelectIndices([0]) : checkListBox.UnselectIndices([0]);
		}
		function IsAllSelected(checkListBox) {
			for (var i = 1; i < checkListBox.GetItemCount(); i++)
				if (!checkListBox.GetItem(i).selected)
				return false;
			return true;
		}
		function UpdateText(checkListBox, checkComboBox) {
			var selectedItems = checkListBox.GetSelectedItems();
			checkComboBox.SetText(GetSelectedItemsText(selectedItems));
		}
		function SynchronizeListBoxValues(dropDown, args, checkListBox) {
			checkListBox.UnselectAll();
			var texts = dropDown.GetText().split(textSeparator);
			var values = GetValuesByTexts(texts, checkListBox);
			checkListBox.SelectValues(values);
			UpdateSelectAllItemState(checkListBox);
			UpdateText(checkListBox, dropDown);  // for remove non-existing texts
		}
		function GetSelectedItemsText(items) {
			var texts = [];
			for (var i = 0; i < items.length; i++)
				if (items[i].index != 0)
				texts.push(items[i].text);
			return texts.join(textSeparator);
		}
		function GetValuesByTexts(texts, checkListBox) {
			var actualValues = [];
			var value = "";
			for (var i = 0; i < texts.length; i++) {
				value = GetValueByText(texts[i], checkListBox);
				if (value != null)
					actualValues.push(value);
			}
			return actualValues;
		}
		function GetValueByText(text, checkListBox) {
			for (var i = 0; i < checkListBox.GetItemCount(); i++)
				if (checkListBox.GetItem(i).text.toUpperCase() == text.toUpperCase())
				return checkListBox.GetItem(i).value;
			return null;
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<table style="margin-left: 10px; margin-top: 20px;">
		 <tr>
			 <td>Supported browsers:</td>
			 <td>
				 <dx:ASPxDropDownEdit ClientInstanceName="checkComboBox1" ID="ASPxDropDownEdit1" SkinID="CheckComboBox"
					 Width="210px" runat="server" EnableAnimation="False">
					 <DropDownWindowTemplate>
						 <dx:ASPxListBox Width="100%" ID="listBox" ClientInstanceName="checkListBox1" SelectionMode="CheckColumn"
							 runat="server" SkinID="CheckComboBoxListBox">
							 <Items>
								 <dx:ListEditItem Text="(Select all)" />
								 <dx:ListEditItem Text="Chrome" Value="1" />
								 <dx:ListEditItem Text="Firefox" Value="2" />
								 <dx:ListEditItem Text="IE" Value="3" />
								 <dx:ListEditItem Text="Opera" Value="4" />
								 <dx:ListEditItem Text="Safari" Value="5" />
							 </Items>
							 <ClientSideEvents SelectedIndexChanged="function(s,e) {OnListBoxSelectionChanged(s,e,checkComboBox1);}" />
						 </dx:ASPxListBox>
						 <table style="width: 100%">
							 <tr>
								 <td align="right">
									 <dx:ASPxButton ID="ASPxButton1" AutoPostBack="False" runat="server" Text="Close">
										 <ClientSideEvents Click="function(s, e){ checkComboBox1.HideDropDown(); }" />
									 </dx:ASPxButton>
								 </td>
							 </tr>
						 </table>
					 </DropDownWindowTemplate>
					 <ClientSideEvents TextChanged="function(s,e) {SynchronizeListBoxValues(s, e, checkListBox1);}" DropDown="function(s,e) {SynchronizeListBoxValues(s, e, checkListBox1);}" />
				 </dx:ASPxDropDownEdit>
			 </td>
		 </tr>
		<tr>
			<td>Some text</td>
			<td>
				<dx:ASPxDropDownEdit ClientInstanceName="checkComboBox2" ID="ASPxDropDownEdit2"
					SkinID="CheckComboBox" Width="210px" runat="server" EnableAnimation="False">
					<DropDownWindowTemplate>
						<dx:ASPxListBox Width="100%" ID="listBox2" ClientInstanceName="checkListBox2" SelectionMode="CheckColumn"
							runat="server" SkinID="CheckComboBoxListBox">
							<Items>
								<dx:ListEditItem Text="(Select all)" />
								<dx:ListEditItem Text="text 1" Value="1" />
								<dx:ListEditItem Text="text 2" Value="2" />
								<dx:ListEditItem Text="text 3" Value="3" />
								<dx:ListEditItem Text="text 4" Value="4" />
								<dx:ListEditItem Text="text 5" Value="5" />
							</Items>
							<ClientSideEvents SelectedIndexChanged="function(s,e) {OnListBoxSelectionChanged(s,e,checkComboBox2);}" />
						</dx:ASPxListBox>
						<table style="width: 100%">
							<tr>
								<td align="right">
									<dx:ASPxButton ID="ASPxButton1" AutoPostBack="False" runat="server" Text="Close">
										<ClientSideEvents Click="function(s, e){ checkComboBox2.HideDropDown(); }" />
									</dx:ASPxButton>
								</td>
							</tr>
						</table>
					</DropDownWindowTemplate>
					<ClientSideEvents TextChanged="function(s,e) {SynchronizeListBoxValues(s, e, checkListBox2);}" DropDown="function(s,e) {SynchronizeListBoxValues(s, e, checkListBox2);}" />
				</dx:ASPxDropDownEdit>
			</td>
		 </tr>
	 </table>
	</form>
</body>
</html>