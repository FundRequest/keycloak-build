<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginProfileTitle")}
    <#elseif section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <form id="kc-update-profile-form" class="form update-profile"
              action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="update-profile-field ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <label for="username">${msg("username")}</label>
                    <input type="text" id="username" name="username" value="${(user.username!'')}"
                           class="form-control"/>
                </div>
            </#if>
            <div class="update-profile-field ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <label for="email">${msg("email")}</label>
                <input type="text" id="email" name="email" value="${(user.email!'')}"
                       class="form-control"/>
            </div>

            <div class="update-profile-field ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <label for="firstName">${msg("firstName")}</label>
                <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}" class="form-control"/>
            </div>

            <div class="update-profile-field ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <label for="lastName">${msg("lastName")}</label>
                <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}" class="form-control"/>
            </div>

            <div class="row update-profile-button-container">
                <div id="kc-form-buttons" class="col-12 text-right">
                    <button class="btn btn-secondary btn-inline-block px-5" type="submit">${msg("doSubmit")}</button>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
