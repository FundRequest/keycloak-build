<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("loginTotpTitle")}
    <#elseif section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "form">
<ol id="kc-totp-settings">
    <li>
        <p>${msg("loginTotpStep1")}</p>
        </li>
    <li>
        <p>${msg("loginTotpStep2")}</p>
        <img src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
        <span class="code">${totp.totpSecretEncoded}</span>
        </li>
    <li>
        <p>${msg("loginTotpStep3")}</p>
        </li>
    </ol>
    <form action="${url.loginAction}" class="form config-totp" id="kc-totp-settings-form" method="post">
        <div class="row">
            <div class="col-12">
                <input type="text" id="totp" name="totp" autocomplete="off" class="form-control" />
            </div>
            <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
        </div>
        <div class="row config-totp-button-container">
            <div class="col-6 offset-6 col-sm-4 offset-sm-8">
                <button class="btn btn-secondary btn-block" type="submit">${msg("doSubmit")}</button>
            </div>
        </div>
    </form>
    </#if>
</@layout.registrationLayout>
