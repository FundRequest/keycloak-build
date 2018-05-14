<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginTitle",realm.displayName)}
    <#elseif section = "header">
        ${msg("loginTitleHtml",realm.displayNameHtml)?no_esc}
    <#elseif section = "form">
        <form id="kc-totp-login-form" class="form totp" action="${url.loginAction}" method="post">
            <div>
                <label for="totp">${msg("loginTotpOneTime")}</label>
                <input id="totp" name="totp" autocomplete="off" type="text" class="form-control" autofocus/>
            </div>

            <div class="totp-button-container">
                <div id="kc-form-buttons">
                    <div class="row">
                        <div class="col-6 col-push-6 col-sm-8 col-sm-push-4">
                            <button class="btn btn-secondary btn-block" name="login" id="kc-login"
                                    type="submit">${msg("doLogIn")}</button>
                        </div>
                        <div class="col-6 col-pull-6 col-sm-4 col-sm-pull-8">
                            <button class="btn btn-link text-secondary" name="cancel" id="kc-cancel"
                                    type="submit">${msg("doCancel")}</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>