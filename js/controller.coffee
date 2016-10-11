angular.module 'vocabulary.controller', []
.controller 'IndexCtrl', ['$scope', '$translate', ($scope, $translate) ->
  $scope.pageNumbers = [0..7]
  $scope.pageList = [
    "sentences-1-en", "sentences-1-es", "sentences-1-it", "sentences-1-fr",
    "sentences-2-en", "sentences-2-es", "sentences-2-it", "sentences-2-fr"
  ]
  $scope.pages = ["sentences-1-en", "sentences-1-es", "sentences-1-it", "sentences-1-fr",
                  "sentences-2-en", "sentences-2-es", "sentences-2-it", "sentences-2-fr",
                  "sentences-3-en", "sentences-3-es", "sentences-3-it", "sentences-3-fr",
                  "sentences-4-en", "sentences-4-es", "sentences-4-it", "sentences-4-fr",
                  "basics-en", "basics-es", "basics-it", "basics-fr",
                  "tournament-en", "tournament-es", "tournament-it", "tournament-fr",
                  "ipg-en", "ipg-es", "ipg-it", "ipg-fr", "ipg-de", "ipg-pt", "ipg-cn", "ipg-jp", "ipg-ru"]
  $scope.lastDrag = false
  $scope.language = $translate.use() or "en"
  $scope.languages = ["en"]

  $scope.changeLanguage = ->
    $translate.use $scope.language
  $scope.pageDrop = (data, page) ->
    unless $scope.lastDrag is false
      $scope.pages[$scope.lastDrag] = $scope.pages[page]
      $scope.lastDrag = false
    $scope.pages[page] = data
  $scope.pageDrag = (data, page) ->
    $scope.pages[page] = ""
    $scope.lastDrag = page
  $scope.pageRemove = (page) ->
    $scope.pages[page] = "";
]
