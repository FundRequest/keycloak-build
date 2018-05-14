<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("updatePasswordTitle")}
    <#elseif section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="form update-password"
              action="${url.loginAction}" method="post">
            <input type="text" readonly value="this is not a login form" style="display: none;">
            <input type="password" readonly value="this is not a login form" style="display: none;">

            <div class="update-password-field">
                <label for="password-new">${msg("passwordNew")}</label>
                <input type="password" id="password-new" name="password-new" class="form-control" autofocus
                       autocomplete="off"/>
            </div>

            <div class="update-password-field">
                <label for="password-confirm">${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" name="password-confirm" class="form-control"
                       autocomplete="off"/>
            </div>

            <div class="row update-password-button-container">
                <div id="kc-form-buttons" class="col-6 col-sm-4">
                    <button class="btn btn-secondary btn-block" type="submit">${msg("doSubmit")}</button>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>