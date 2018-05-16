<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
    ${msg("termsTitle")}
    <#elseif section = "header">
    ${msg("termsTitleHtml")}
    <#elseif section = "form">
    <div id="kc-terms-text">
        ${msg("termsText")?no_esc}
    </div>
    <form class="form-actions d-flex justify-content-between" action="${url.loginAction}" method="POST">
        <button class="btn btn-link text-secondary" name="cancel" id="kc-decline" type="submit">${msg("doDecline")}</button>
        <button class="btn btn-secondary" name="accept" id="kc-accept" type="submit">${msg("doAccept")}</button>
    </form>
    </#if>
</@layout.registrationLayout>