(function(angular) {
  'use strict';
  document.addEventListener('turbolinks:load', function() {
    angular.bootstrap(document.body, ['docsTabsExample']);
});
angular.module('docsTabsExample', ['templates'])
  .directive('myTabs', function() {
    return {
      restrict: 'E',
      transclude: true,
      scope: {},
      controller: ['$scope', function MyTabsController($scope) {
        var panes = $scope.panes = [];

        $scope.select = function(pane) {
          angular.forEach(panes, function(pane) {
            pane.selected = false;
          });
          pane.selected = true;
        };

        this.addPane = function(pane) {
          if (panes.length === 0) {
            $scope.select(pane);
          }
          panes.push(pane);
        };
      }],
      templateUrl: 'my-tabs.html'
    };
  })
  .directive('myPane', function() {
    return {
      require: '^^myTabs',
      restrict: 'E',
      transclude: true,
      scope: {
        title: '@'
      },
      link: function(scope, element, attrs, tabsCtrl) {
        tabsCtrl.addPane(scope);
      },
      templateUrl: 'my-pane.html'
    };
  });
})(window.angular);

/*
Copyright 2017 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/