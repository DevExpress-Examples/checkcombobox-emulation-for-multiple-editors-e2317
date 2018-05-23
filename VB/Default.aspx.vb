Option Infer On

Imports System
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub listBox_CustomJSProperties(ByVal sender As Object, ByVal e As DevExpress.Web.CustomJSPropertiesEventArgs)
        Dim list = TryCast(sender, ASPxListBox)
        Dim container = TryCast(list.NamingContainer, TemplateContainerBase)
        Dim dropDown = TryCast(container.NamingContainer.NamingContainer, ASPxDropDownEdit)
        dropDown.ClientInstanceName = dropDown.UniqueID
        e.Properties("cp_dropDownClientName") = dropDown.ClientInstanceName
    End Sub
    Protected Sub ASPxButton1_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn = TryCast(sender, ASPxButton)
        Dim container = TryCast(btn.NamingContainer, TemplateContainerBase)
        Dim dropDown = TryCast(container.NamingContainer.NamingContainer, ASPxDropDownEdit)
        btn.ClientInstanceName = dropDown.UniqueID & "btn"
    End Sub
End Class
