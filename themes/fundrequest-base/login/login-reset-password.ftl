<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")}
    <#elseif section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="form reset-password"
              action="${url.loginAction}" method="post">
            <div class="reset-password-field">
                <label for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                <input type="text" id="username" name="username" class="form-control" autofocus/>
            </div>

            <div class=" row">
                <div id="kc-form-options" class="col-5">
                    <a class="btn btn-link text-secondary" href="${url.loginUrl}">
                        ${msg("backToLogin")}
                    </a>
                </div>

                <div id="kc-form-buttons" class="col-7">
                    <button class="btn btn-secondary btn-block" type="submit">${msg("doSubmit")}</button>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        <hr/>
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
