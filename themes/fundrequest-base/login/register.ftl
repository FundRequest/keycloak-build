<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">


        <form id="kc-register-form" class="register form" action="${url.registrationAction}"
              method="post">
            <#if realm.password && social.providers??>
                    <div class="row">
                        <div id="kc-social-providers" class="col-12 small text-center">
                            Sign up with
                                <#list social.providers as p>
                                        <#if (p_has_next && p_index != 0)>,</#if>
                                        <#if !(p_has_next)>or</#if>
                                        <a href="${p.loginUrl}" id="zocial-${p.alias}" class="text-secondary">
                                            ${p.displayName}
                                        </a>
                                </#list>
                            </ul>
                        </div>
                        <div class="col-12">
                            <div class="form-separator"><span class="small">or</span></div>
                        </div>
                    </div>
            </#if>

            <input type="text" readonly value="this is not a login form" style="display: none;">
            <input type="password" readonly value="this is not a login form" style="display: none;">

            <div class="register-field ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <input type="text" placeholder="${msg("email")}" id="email" class="form-control" name="email"
                       value="${(register.formData.email!'')}"/>
            </div>
              <#if !realm.registrationEmailAsUsername>
                <div class="register-field ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <input type="text" placeholder="${msg("username")}" id="username" class="form-control" name="username"
                           value="${(register.formData.username!'')}"/>
                </div>
              </#if>
            <div class="register-field ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <input type="text" placeholder="${msg("firstName")}" id="firstName" class="form-control" name="firstName"
                       value="${(register.formData.firstName!'')}"/>
            </div>

            <div class="register-field ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <input type="text" placeholder="${msg("lastName")}" id="lastName" class="form-control" name="lastName"
                       value="${(register.formData.lastName!'')}"/>
            </div>

            <#if passwordRequired>
            <div class="register-field ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <input type="password" placeholder="${msg("password")}" id="password" class="form-control"
                       name="password"/>
            </div>
            <div class="register-field ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <input type="password" placeholder="${msg("passwordConfirm")}"  id="password-confirm" class="form-control"
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
                    <div id="kc-form-buttons" class="col-12">
                        <button class="btn btn-secondary btn-block" type="submit">${msg("doRegister")}</button>
                    </div>
                    <div class="col-12">
                        <div class="form-separator"></div>
                    </div>
                    <div id="kc-form-options" class="col-12 text-center">
                        Already have a FundRequest account? <a class="text-secondary" href="${url.loginUrl}">Log in</a>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
