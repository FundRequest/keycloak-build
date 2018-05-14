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
                <div class="username-container">
                    <label for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        <#if usernameEditDisabled??>
                            <input id="username" class="form-control" name="username"
                                   value="${(login.username!'')}" type="text" disabled/>
                        <#else>
                            <input id="username" class="form-control" name="username"
                                   value="${(login.username!'')}" type="text" autofocus autocomplete="off"/>
                        </#if>
                </div>
                <div class="password-container">
                    <label for="password">${msg("password")}</label>
                    <input id="password" class="form-control" name="password"
                           type="password" autocomplete="off"/>
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
                            <div id="kc-form-buttons" class="col-5">
                                <button class="btn btn-secondary btn-block"
                                        name="login" id="kc-login" type="submit">${msg("doLogIn")}</button>
                            </div>
                        </div>
                    </div>
                    <#if realm.password && social.providers??>
                        <div class="col-12">
                            <hr class="separator"/>
                        </div>
                        <div id="kc-social-providers" class="col-12">
                            <h5 class="text-center">Or log in with</h5>
                            <ul>
                                <#list social.providers as p>
                                    <li><a href="${p.loginUrl}" id="zocial-${p.alias}"
                                           class="btn zocial ${p.providerId}">
                                        <span class="text">${p.displayName}</span></a></li>
                                </#list>
                            </ul>
                        </div>
                    </#if>

                    <#if (realm.password && realm.registrationAllowed && !usernameEditDisabled??) || realm.resetPasswordAllowed>
                        <div class="col-12">
                            <hr class="separator"/>
                        </div>
                        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                            <div id="kc-registration" class="col-12">
                                <span>${msg("noAccount")} <a
                                        href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                            </div>
                        </#if>
                        <#if realm.resetPasswordAllowed>
                            <div class="col-12">
                                <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </div>
                        </#if>
                    </#if>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >

    </#if>
</@layout.registrationLayout>
