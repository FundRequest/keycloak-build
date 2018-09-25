<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">

        <form id="kc-x509-login-info" action="${url.loginAction}" method="post">
            <label for="certificate_subjectDN">${msg("clientCertificate")}</label>
            <#if subjectDN??>
                     <label id="certificate_subjectDN">${(subjectDN!"")}</label>
            <#else>
                    <label id="certificate_subjectDN">${msg("noCertificate")}</label>
            </#if>

            <#if isUserEnabled>
                <label for="username">${msg("doX509Login")}</label>
                <label id="username">${(username!'')}</label>
            </#if>

            <div id="kc-form-buttons">
                <#if isUserEnabled>
                    <button class="btn btn-link text-secondary"
                            name="cancel" id="kc-cancel" type="submit">${msg("doIgnore")}</button>
                </#if>
                <button class="btn btn-secondary" name="login" id="kc-login" type="submit">${msg("doContinue")}</button>
            </div>
        </form>
    </#if>

</@layout.registrationLayout>
