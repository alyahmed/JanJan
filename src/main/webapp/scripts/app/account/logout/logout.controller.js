'use strict';

angular.module('janjanApp')
    .controller('LogoutController', function (Auth) {
        Auth.logout();
    });
