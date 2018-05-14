<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
	<div class="title">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
    </div>
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="form " action="${url.loginAction}" method="post">
                <#if social.providers??>
                    <div class="row">
                        <div id="kc-social-providers" class="col-12">
                            <ul class="mb-0">
                                <#list social.providers as p>
                                    <li>
                                        <a href="${p.loginUrl}" id="zocial-${p.alias}"
                                           class="btn zocial ${p.providerId}">
                                            <span class="text">Log in with ${p.displayName}</span></a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                        <div class="col-12">
                            <div class="form-separator"><span class="small">or</span></div>
                        </div>
                    </div>
                </#if>
                <div class="row">
                    <div class="col-12">
                        <div class="username-container input-group">
                            <#if usernameEditDisabled??>
                                <input id="username" class="form-control" name="username"
                                       value="${(login.username!'')}" type="text" disabled/>
                            <#else>
                                <input id="username" class="form-control" name="username"
                                       placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                                       value="${(login.username!'')}" type="text" autofocus autocomplete="off"/>
                            </#if>
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                            </div>
                        </div>

                        <div class="password-container input-group">
                            <input id="password" class="form-control" placeholder="${msg("password")}" name="password"
                                   type="password" autocomplete="off"/>
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fa fa-lock"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div id="kc-form-options" class="row">
                            <div class="col-7">
                            <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="checkbox remember-me-checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"
                                                   checked>&nbsp;&nbsp;${msg("rememberMe")}
                                        <#else>
                                            <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3">&nbsp;&nbsp;${msg("rememberMe")}
                                        </#if>
                                    </label>
                                </div>
                            </#if>
                            </div>
                            <div id="kc-form-buttons" class="col-12 mb-1">
                                <button class="btn btn-secondary btn-block"
                                        name="login" id="kc-login" type="submit">${msg("doLogIn")}</button>
                            </div>
                             <#if realm.resetPasswordAllowed>
                                 <div class="col-12 text-center small">
                                     <a class="text-secondary"
                                        href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                                 </div>
                             </#if>
                        </div>
                    </div>

                    <#if (realm.password && realm.registrationAllowed && !usernameEditDisabled??)>
                        <div class="col-12">
                            <div class="form-separator"></div>
                        </div>
                        <div id="kc-registration" class="col-12 text-center">
                            <span>${msg("noAccount")}
                                <a class="text-secondary" href="${url.registrationUrl}">${msg("doRegister")}</a>
                            </span>
                        </div>
                    </#if>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >

    </#if>
</@layout.registrationLayout>
