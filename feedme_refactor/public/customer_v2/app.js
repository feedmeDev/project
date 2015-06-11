(function() { // We use this anonymous function to create a closure.

	var app = angular.module('feedme-web', ['ngCookies', 'ngRoute']);

	app.config(function($routeProvider) {
		$routeProvider

			//route for the login
			.when ('/', {
				templateUrl : 'pages/login.html',
				controller  : 'loginController'
			})

			//route for the indication page
			.when('/indicate', {
				templateUrl : 'pages/indicate',
				controller  : 'indicateController'
			})
	});

	//Provides login functions
	app.factory("Login", ['$http', function($http) {
		return {
			customer: 
				//returns a promise of a request return
				function (userNameIn, passWordIn) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'POST', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/login/customer.json',
						headers: {
							'Content-Type': 'application/json'
						},
						data: { 
							username: userNameIn, password: passWordIn
						},
					}

					//creation of a promise
					var promise = $http(req)
						.success(function (data, status, headers, config) {
							return data;
						})
						.error(function (data, status, headers, config) {
							return data;
						});

					return promise;
				},

            logout:
                //server side logout
                function () {
                    var req = {
                        method: 'POST',
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/logout.json',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                    }
                    //creation of a promise
                    var promise = $http(req)
                        .success(function (data, status, headers, config) {
                            return data;
                        })
                        .error(function (data, status, headers, config) {
                            return data;
                        });

                    return promise;
                }
			}
		}
	]);

	//Provides indication functions
	app.factory("Indication", ['$http', function($http) {
		return {
			indicate: 
				//returns a promise of a request return
				function (student_id, meal_id, is_going, list) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'POST', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/attendances.json',
						headers: {
							'Content-Type': 'application/json'
						},
						data: { 
							meal_id: meal_id, person_id: student_id, going: is_going, list: list
						},
					}

					//creation of a promise
					var promise = $http(req)
						.success(function (data, status, headers, config) {
							return data;
						})
						.error(function (data, status, headers, config) {
							return data;
						});

					return promise;
				}
			}
		}
	]);

	//Provides Meal retrieval functions
	app.factory("FutureMeals", ['$http', function($http) {
		return {
			retrieve: 
				//returns a promise of a request return
				function () {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/meals/future.json',
						headers: {
							'Content-Type': 'application/json'
						},
					}

					//creation of a promise
					var promise = $http(req)
						.success(function (data, status, headers, config) {
							return data;
						})
						.error(function (data, status, headers, config) {
							return data;
						});

					return promise;
				}
			}
		}
	]);

	//Provides Component retrieval functions
	app.factory("Components", ['$http', function($http) {
		return {
			get_for_meal: 
				//returns a promise of a request return
				function (meal_id) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/meals/components.json',
						headers: {
							'Content-Type': 'application/json'
						},
						params: {
							id: meal_id
						},
					}

					//creation of a promise
					var promise = $http(req)
						.success(function (data, status, headers, config) {
							return data;
						})
						.error(function (data, status, headers, config) {
							return data;
						});

					return promise;
				}
			}
		}
	]);

	/*
	controls the logged in state of the user
	*/
	app.controller('loginController', function (Login, $scope, $cookieStore, $location) {
		//login method
		$scope.login = function (userIn) {
			//attempt login
			Login.customer(userIn.username, userIn.password).then(
				//login succeed
				function (promise) {
					//make the user object to store
					retUser = {
                        id: promise.data.id,
                        name: promise.data.name,
                        username: promise.data.username
                    };
					
					//store the user object
					$cookieStore.put('loggedInUser', retUser);
					//change the location
					$location.path('/indicate');
					
				}, function (error) {	//login fail
					//login failed message
					alert("Unable to login. \nAre your login details correct?");
				}
			);
		}
	});

	/*
	controller for indicating on a meal
	*/
	app.controller('indicateController', function (Login, FutureMeals, Components, Indication, $scope, $location, $cookieStore) {
		
/*

set indicated component done in the html
check indicated component done in the html


todo
make the following methods
->indicate ** must have a component that has been indicated on
*/

		//list of future meals
		$scope.meals = [];
		$scope.components = [];
		$scope.selected_component = [];

		//the currently logged in user
		$scope.user = $cookieStore.get('loggedInUser');
		
		$scope.selected_meal = "";
			
		        $scope.convertMealDateTime = function(unformatted_date_in) {
            //get sub string
            var substring_date = unformatted_date_in.substr(0, 10);

            //reverse and join
            var reversed_date = substring_date.split("-").reverse().join();

            var date_str = reversed_date.replace(/,/g, "/");

            //get time substring
            var substring_time = unformatted_date_in.substr(12, 17);

            var ret = date_str + " " + substring_time;
			
			//shorten string
			var ret = ret.substr(0, 15);

            //return
            return ret;
        }



		//set the selected meal
		$scope.set_selected_meal = function (meal) {
			//set the selected meal id
			//alert("set " + mealId);
			$scope.selected_meal = meal;
			$scope.get_components_for_meal(meal.id);
		}
		
		//reset the selected meal
		$scope.reset_selected_meal = function () {
			$scope.selected_meal = "";
		}

		$scope.is_selected_meal = function () {
			return ($scope.selected_meal != "");
		}

		//is the component in the list
		$scope.is_component_selected = function (component_id) {
            return (~$scope.selected_component.indexOf(component_id));
        };

		$scope.set_selected_component = function (component_id) {
			$scope.selected_component = [component_id];
		}


		//log out function
		$scope.logout = function () {
			Login.logout().then(
				//logged out
				function (promise) {
					//remove the loggedInUser object from the $cookie
					$cookieStore.remove('loggedInUser');
					//change to login screen
					$location.path('/');
					//tell the user they are logged out
					alert("You have been logged out.");

				}, function (error) { //logout fail
					//log out failed message
					alert("Unable to logout.");
				}
			);
		}
		
		//get the list of meals from the server
		$scope.get_meals_from_server = function () {
			FutureMeals.retrieve().then(
				//meals retrieved
				function (promise) {
					$scope.meals = promise.data.future;
				}, function (error) {
					alert(error.data);
				}
			);
		}
		
		//get the components for a meal from the server
		$scope.get_components_for_meal = function (mealId) {

			//reset the selected component
			$scope.selected_component = "";
			//reset the components
			$scope.components = [];
			//get the componets for the meal
			Components.get_for_meal(mealId).then(
				//components have been retrieved
				function (promise) {
					//make the components part of the meal
					$scope.components = promise.data.components;
				}, function (error) {
					alert(error.data);
				}
			);
			//set the componets for the meal
			//meal.components = promise.data.components
			//removes the need for holding the components in a seperate object
		}

		//number of meals greater than zero
		$scope.meals_present = function () {
			return ($scope.meals.length > 0);
		}

		//indicate
		$scope.indicate = function (mealId, going) {
			Indication.indicate($scope.user.id, mealId, going, $scope.selected_component).then(
                function (promise) {
                    //feedback indication successful
                    alert("indication successful");

                }, function (error) {
                    //feedback indication not successful
                    alert("indication not successful");

                }
            );
		}

		$scope.get_meals_from_server();

	});
})
();
