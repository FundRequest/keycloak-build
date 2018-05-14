<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="application-name" content="FundRequest">
    <meta name="keywords" content="">
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"></title>

    <#if properties.externalStyles?has_content>
        <#list properties.externalStyles?split(' ') as style>
            <link href="${style?ensure_starts_with("http", properties.externalAssetsUrl + "/")}" rel="stylesheet"/>
        </#list>
    </#if>

    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
        </#list>
    </#if>

    <link rel="apple-touch-icon" sizes="180x180" href="${properties.externalAssetsUrl}/img/logo-single180.png"/>
    <link rel="icon" type="image/png" sizes="32x32" href="${properties.externalAssetsUrl}/img/logo-single32.png"/>
    <link rel="icon" type="image/png" sizes="16x16" href="${properties.externalAssetsUrl}/img/logo-single16.png"/>
</head>

<body class="template preload" data-spy="scroll" data-target="#primary-menu">

<div id="vue-app" class="fnd-page-container">
    <nav class="fnd-header navbar navbar-dark navbar-expand-md bg bg--blue bg--no-rect">
        <div class="container">
            <a id="kc-logo" href="${properties.kcLogoLink!'#'}" class="navbar-brand navbar-brand--fnd">
                <img alt="Fundrequest logo"
                     src="${url.resourcesPath}/img/logo-single180.png"
                     class="d-md-none">
                <img
                        alt="Fundrequest logo" src="${url.resourcesPath}/img/Fundrequest-title-white.png"
                        class="d-none d-md-block">
            </a>
            <button type="button" data-toggle="collapse" data-target="#primary-menu" aria-controls="primary-menu"
                    aria-expanded="false" aria-label="Toggle primary menu" class="navbar-toggler"><span
                    class="navbar-toggler-icon"></span>
            </button>
            <div id="primary-menu" class="collapse navbar-collapse navbar--fnd-primary">
                <ul class="navbar-nav text-center mr-md-auto">
                    <li class="nav-item">
                        <a href="https://fundrequest.io/requests" class="nav-link waves-effect waves-light">Browse</a>
                    </li>
                </ul>
                <ul class="navbar-nav text-center ml-md-auto">
                    <li class="nav-item">
                        <a href="https://fundrequest.io/about" class="nav-link waves-effect waves-light">
                            About
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="https://help.fundrequest.io" class="nav-link waves-effect waves-light">
                            Help needed?
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>


    <div id="kc-container">
        <div id="kc-container-wrapper">

            <div id="kc-header">
                <div id="kc-header-wrapper"><#nested "header"></div>
            </div>

            <div id="kc-content" class="container">
                <div id="kc-content-wrapper">
                    <#if displayMessage && message?has_content>
                        <#if message.type = 'success'>
                                <div class="alert alert-success alert--with-icon">
                                    <span>${message.summary?no_esc}</span>
                                </div>
                        <#elseif message.type = 'warning'>
                                <div class="alert alert-warning alert--with-icon">
                                    <span>${message.summary?no_esc}</span>
                                </div>
                        <#elseif message.type = 'error'>
                                <div class="alert alert-danger alert--with-icon">
                                    <span>${message.summary?no_esc}</span>
                                </div>
                        <#else>
                                <div class="alert alert-info alert--with-icon">
                                    <span>${message.summary?no_esc}</span>
                                </div>
                        </#if>
                    </#if>

                    <div id="kc-form">
                        <div id="kc-form-wrapper">
                            <#nested "form">
                        </div>
                    </div>

                    <#if displayInfo>
                        <div id="kc-info">
                            <div id="kc-info-wrapper">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>

            <#if realm.internationalizationEnabled>
                <div id="kc-locale">
                    <div id="kc-locale-wrapper">
                        <div class="kc-dropdown language-picker" id="kc-locale-dropdown">

                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="language-picker-dropdown" class="language-picker-dropdown-label">
                                        <i class="fa fa-2x fa-globe"></i>
                                    </label>
                                    <select id="language-picker-dropdown" class="form-control">
                                        <#list locale.supported as l>
                                            <#if l.label = locale.current>
                                                <option value="" selected>${l.label}</option>
                                            <#else>
                                                <option value="${l.url}">${l.label}</option>
                                            </#if>
                                            <!-- <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li> -->
                                        </#list>
                                    </select>

                                    <!-- <a href="#" id="kc-current-locale-link">${locale.current}</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
            </#if>

        </div>
        </div>
    </div>
    <section class="w-100 mt-5">
        <div class="fnd-footer section section--blue section--compact section--end mt-1">
            <div class="container">
                <div class="row">
                    <div class="fnd-footer__left col-12 mb-1 col-lg-6">
                        © 2018 FundRequest OÜ
                    </div>
                    <div class="fnd-footer__right mb-1 col-lg-6">
                        <a class="btn btn-link btn--social-link pl-0 waves-effect waves-light"
                           href="https://github.com/fundrequest/" rel="noopener noreferrer" target="_blank">
                            <span class="sr-only">Github</span>
                            <i class="fab fa-github"></i>
                        </a>
                        <a class="btn btn-link btn--social-link waves-effect waves-light"
                           href="https://fundrequest.chat" target="_blank" rel="noopener noreferrer">
                            <span class="sr-only">Rocket Chat</span>
                            <i class="fab fa-rocketchat"></i>
                        </a>
                        <a class="btn btn-link btn--social-link waves-effect waves-light"
                           href="https://twitter.com/fundrequest_io" target="_blank" rel="noopener noreferrer">
                            <span class="sr-only">Twitter</span>
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="btn btn-link btn--social-link pr-0 waves-effect waves-light"
                           href="https://t.me/fundrequestofficial" target="_blank" rel="noopener noreferrer">
                            <span class="sr-only">Telegram</span>
                            <i class="fab fa-telegram"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <#if properties.externalScripts?has_content>
        <#list properties.externalScripts?split(' ') as script>
            <script src="${script?ensure_starts_with("http", properties.externalAssetsUrl + "/")}"
                    type="text/javascript"></script>
        </#list>
    </#if>

    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>

    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>

    <script>
        window.intercomSettings = {
            app_id: "u88cl7tr"
        };
    </script>
    <script defer="defer">(function() {
        var w = window;
        var ic = w.Intercom;
        if (typeof ic === "function") {
            ic('reattach_activator');
            ic('update', intercomSettings);
        } else {
            var d = document;
            var i = function() {
                i.c(arguments)
            };
            i.q = [];
            i.c = function(args) {
                i.q.push(args)
            };
            w.Intercom = i;

            function l() {
                var s = d.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = 'https://widget.intercom.io/widget/u88cl7tr';
                var x = d.getElementsByTagName('script')[0];
                x.parentNode.insertBefore(s, x);
            }

            if (w.attachEvent) {
                w.attachEvent('onload', l);
            } else {
                w.addEventListener('load', l, false);
            }
        }
    })()</script>
</body>
</html>
</#macro>
