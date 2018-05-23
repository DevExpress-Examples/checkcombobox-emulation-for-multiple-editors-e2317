using System;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {

    protected void listBox_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e) {
        var list = sender as ASPxListBox;
        var container = list.NamingContainer as TemplateContainerBase;
        var dropDown = container.NamingContainer.NamingContainer as ASPxDropDownEdit;
        dropDown.ClientInstanceName = dropDown.UniqueID;
        e.Properties["cp_dropDownClientName"] = dropDown.ClientInstanceName;
    }
    protected void ASPxButton1_Init(object sender, EventArgs e) {
        var btn = sender as ASPxButton;
        var container = btn.NamingContainer as TemplateContainerBase;
        var dropDown = container.NamingContainer.NamingContainer as ASPxDropDownEdit;
        btn.ClientInstanceName = dropDown.UniqueID + "btn";
    }
}
