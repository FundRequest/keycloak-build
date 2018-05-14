<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">
        <form id="kc-register-form" class="register form" action="${url.registrationAction}"
              method="post">
            <input type="text" readonly value="this is not a login form" style="display: none;">
            <input type="password" readonly value="this is not a login form" style="display: none;">

          <#if !realm.registrationEmailAsUsername>
            <div class="register-field ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <label for="username">${msg("username")}</label>
                <input type="text" id="username" class="form-control" name="username"
                       value="${(register.formData.username!'')}"/>
            </div>
          </#if>
            <div class="register-field ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <label for="firstName">${msg("firstName")}</label>
                <input type="text" id="firstName" class="form-control" name="firstName"
                       value="${(register.formData.firstName!'')}"/>
            </div>

            <div class="register-field ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <label for="lastName">${msg("lastName")}</label>
                <input type="text" id="lastName" class="form-control" name="lastName"
                       value="${(register.formData.lastName!'')}"/>
            </div>

            <div class="register-field ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <label for="email">${msg("email")}</label>
                <input type="text" id="email" class="form-control" name="email"
                       value="${(register.formData.email!'')}"/>
            </div>

            <#if passwordRequired>
            <div class="register-field ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <label for="password">${msg("password")}</label>
                <input type="password" id="password" class="form-control"
                       name="password"/>
            </div>

            <div class="register-field ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <label for="password-confirm">${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" class="form-control"
                       name="password-confirm"/>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
            </div>
            </#if>

            <div class="register-button-container">
                <div class="row">
                    <div id="kc-form-options" class="col-5">
                        <a class="btn btn-link text-secondary" href="${url.loginUrl}">${msg("backToLogin")}</a>
                    </div>

                    <div id="kc-form-buttons" class="col-7">
                        <button class="btn btn-secondary btn-block" type="submit">${msg("doRegister")}</button>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
