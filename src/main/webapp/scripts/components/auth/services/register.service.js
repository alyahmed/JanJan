'use strict';

angular.module('janjanApp')
    .factory('Register', function ($resource) {
        return $resource('api/register', {}, {
        });
    });


