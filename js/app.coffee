angular.module 'vocabulary', [
  'ngRoute',
  'ngDraggable',
  'pascalprecht.translate'
  'judgebooklet.controller'
]
.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/index.html',
      controller: 'IndexCtrl'
    .otherwise redirectTo: '/'
]
.config ['$translateProvider', ($translateProvider) ->
# translations
    language = switch (navigator.language or navigator.userLanguage).toLowerCase().substr(0,2)
      when "es" then "es"
      when "it" then "it"
      when "fr" then "fr"
      when "de" then "de"
      when "pt" then "pt"
      when "cn" then "cn"
      when "jp" then "jp"
      when "ru" then "ru"
      else "en"
    $translateProvider
    .useStaticFilesLoader
        prefix: 'translations/lang-',
        suffix: '.json'
    .fallbackLanguage 'en'
    .preferredLanguage language
    .useSanitizeValueStrategy 'sanitizeParameters'
]
