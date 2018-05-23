<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
        var Helper = function (lb, dde) {
            this.textSeparator = ";";
            this.lb = lb;
            this.dde = dde;
        }
        Helper.prototype.updateValue = function () {
            var selectedItems = this.lb.GetSelectedItems();
            this.dde.SetText(this.getSelectedItemsValues(selectedItems, true));
            this.dde.SetKeyValue(this.getSelectedItemsValues(selectedItems, false));
        };
        Helper.prototype.getSelectedItemsValues = function (items, isText) {
            var values = [];
            for (var i = 0; i < items.length; i++)
                values.push((isText) ? items[i].text : items[i].value);
            return values.join(this.textSeparator);
        };
        Helper.prototype.synchronizeListBoxValues = function () {
            this.lb.UnselectAll();
            var texts = this.dde.GetText().split(this.textSeparator);
            var values = this.getValuesByTexts(texts);
            this.lb.SelectValues(values);
            this.updateValue();
        };
        Helper.prototype.getValuesByTexts = function (texts) {
            var actualValues = [];
            var item;
            for (var i = 0; i < texts.length; i++) {
                item = this.lb.FindItemByText(texts[i]);
                if (item != null)
                    actualValues.push(item.value);
            }
            return actualValues;
        };
        Helper.prototype.buttonClick = function () {
            this.dde.HideDropDown();
        };

        function onListInit(s, e) {
            var dde = ASPxClientControl.GetControlCollection().GetByName(s.cp_dropDownClientName);
            var btn = ASPxClientControl.GetControlCollection().GetByName(s.cp_dropDownClientName + "btn");
            var helper = new Helper(s, dde);
            s.SelectedIndexChanged.AddHandler(helper.updateValue.bind(helper));
            dde.TextChanged.AddHandler(helper.synchronizeListBoxValues.bind(helper));
            dde.DropDown.AddHandler(helper.synchronizeListBoxValues.bind(helper));
            btn.Click.AddHandler(helper.buttonClick.bind(helper));
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
                            <dx:ASPxListBox Width="100%" ID="listBox" ClientInstanceName="checkListBox1" SelectionMode="CheckColumn" Height="165"
                                runat="server" SkinID="CheckComboBoxListBox" OnCustomJSProperties="listBox_CustomJSProperties" EnableSelectAll="true">
                                <FilteringSettings ShowSearchUI="true" />
                                <ClientSideEvents Init="onListInit" />
                                <Items>
                                    <dx:ListEditItem Text="Chrome" Value="0" />
                                    <dx:ListEditItem Text="Firefox" Value="1" />
                                    <dx:ListEditItem Text="IE" Value="2" />
                                    <dx:ListEditItem Text="Opera" Value="3" />
                                    <dx:ListEditItem Text="Safari" Value="4" />
                                </Items>
                            </dx:ASPxListBox>
                            <table style="width: 100%">
                                <tr>
                                    <td align="right">
                                        <dx:ASPxButton ID="ASPxButton1" AutoPostBack="False" runat="server" Text="Close" OnInit="ASPxButton1_Init">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </DropDownWindowTemplate>
                    </dx:ASPxDropDownEdit>
                </td>
            </tr>
            <tr>
                <td>Some text</td>
                <td>
                    <dx:ASPxDropDownEdit ClientInstanceName="checkComboBox2" ID="ASPxDropDownEdit2"
                        SkinID="CheckComboBox" Width="210px" runat="server" EnableAnimation="False">
                        <DropDownWindowTemplate>
                            <dx:ASPxListBox Width="100%" ID="listBox2" ClientInstanceName="checkListBox2" SelectionMode="CheckColumn" Height="300"
                                runat="server" SkinID="CheckComboBoxListBox" OnCustomJSProperties="listBox_CustomJSProperties" EnableSelectAll="true">
                                <FilteringSettings ShowSearchUI="true" />
                                <ClientSideEvents Init="onListInit" />
                                <Items>
                                    <dx:ListEditItem Text="text 1" Value="1" />
                                    <dx:ListEditItem Text="text 2" Value="2" />
                                    <dx:ListEditItem Text="text 3" Value="3" />
                                    <dx:ListEditItem Text="text 4" Value="4" />
                                    <dx:ListEditItem Text="text 5" Value="5" />
                                    <dx:ListEditItem Text="text 6" Value="6" />
                                    <dx:ListEditItem Text="text 7" Value="7" />
                                    <dx:ListEditItem Text="text 8" Value="8" />
                                    <dx:ListEditItem Text="text 9" Value="9" />
                                    <dx:ListEditItem Text="text 10" Value="10" />
                                </Items>
                            </dx:ASPxListBox>
                            <table style="width: 100%">
                                <tr>
                                    <td align="right">
                                        <dx:ASPxButton ID="ASPxButton1" AutoPostBack="False" runat="server" Text="Close" OnInit="ASPxButton1_Init">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </DropDownWindowTemplate>
                    </dx:ASPxDropDownEdit>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
