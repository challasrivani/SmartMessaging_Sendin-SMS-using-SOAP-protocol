<% @ Page Title = "Registration" Language = "C#" MasterPageFile = "~ / Site.master" AutoEventWireup = "true" CodeBehind = "Register.aspx.cs" Inherits = "SmartMessaging.Account.Register"%>

<asp: Content runat = "server" ID = "BodyContent" ContentPlaceHolderID = "mainContent">
    <Hgroup class = "title">
        <h1> <%: Title%>. </h1>
        <h2> Please use the following form to create a new account. </h2>
    </ Hgroup>

    <asp: CreateUserWizard runat = "server" ID = "RegisterUser" ViewStateMode = "Disabled" OnCreatedUser = "RegisterUser_CreatedUser">
        <layoutTemplate>
            <asp: Placeholder runat = "server" ID = "wizardStepPlaceholder" />
            <asp: Placeholder runat = "server" ID = "navigationPlaceholder" />
        </ layoutTemplate>
        <wizardSteps>
            <asp: CreateUserWizardStep runat = "server" ID = "RegisterUserWizardStep">
                <contentTemplate>
                    <p class = "message-info">
                        The password length must be at least <%: Membership.MinRequiredPasswordLength%> characters.
                    </p>

                    <p class = "validation-summary-errors">
                        <asp: Literal runat = "server" ID = "ErrorMessage" />
                    </p>

                    <fieldset>
                        <legend> Registration Form </legend>
                        <ol>
                            <li>
                                <asp: Label runat = "server" AssociatedControlID = "UserName"> Username </ asp: Label>
                                <asp: TextBox runat = "server" ID = "UserName" />
                                <asp: RequiredFieldValidator runat = "server" ControlToValidate = "UserName"
                                    CssClass = "field-validation-error" ErrorMessage = "The User Name field is required." />
                            </li>
                            <li>
                                <asp: Label runat = "server" AssociatedControlID = "email"> Email address </ asp: Label>
                                <asp: TextBox runat = "server" ID = "Email" TextMode = "email" />
                                <asp: RequiredFieldValidator runat = "server" ControlToValidate = "Email"
                                    CssClass = "field-validation-error" ErrorMessage = "The field e-mail address is required." />
                            </li>
                            <li>
                                <asp: Label runat = "server" AssociatedControlID = "password"> Password </ asp: Label>
                                <asp: TextBox runat = "server" ID = "Password" TextMode = "Password" />
                                <asp: RequiredFieldValidator runat = "server" ControlToValidate = "Password"
                                    CssClass = "field-validation-error" ErrorMessage = "The Password field is required." />
                            </li>
                            <li>
                                <asp: Label runat = "server" AssociatedControlID = "ConfirmPassword"> Confirm Password </ asp: Label>
                                <asp: TextBox runat = "server" ID = "ConfirmPassword" TextMode = "Password" />
                                <asp: RequiredFieldValidator runat = "server" ControlToValidate = "ConfirmPassword"
                                     CssClass = "field-validation-error" Display = "Dynamic" ErrorMessage = "The Confirm Password field is required." />
                                <asp: CompareValidator runat = "server" ControlToCompare = "Password" ControlToValidate = "ConfirmPassword"
                                     CssClass = "field-validation-error" Display = "Dynamic" ErrorMessage = "The password and confirmation password do not match." />
                            </li>
                        </ol>
                        <asp: Button runat = "server" CommandName = "MoveNext" Text = "Run recording" />
                    </fieldset>
                </contentTemplate>
                <customNavigationTemplate />
            </ asp: CreateUserWizardStep>
        </wizardSteps>
    </ asp: CreateUserWizard>
</ asp: Content>