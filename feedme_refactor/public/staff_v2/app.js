(function() { // We use this anonymous function to create a closure.

	var app = angular.module('feedme-web', ['ngRoute']);

    // configure our routes
    app.config(function($routeProvider) {
        $routeProvider

            // route for the home page
            .when('/', {
                templateUrl : 'pages/home.html'
            })

            // route for the about page
            .when('/customers', {
                templateUrl : 'pages/customers.html',
                controller  : 'personController'
            })

            // route for the contact page
            .when('/staff', {
                templateUrl : 'pages/staff.html',
                controller  : 'personController'
            })

            // route for the about page
            .when('/meals', {
                templateUrl : 'pages/meals.html',
                controller  : 'mealController'
            })

            // route for the about page
            .when('/components', {
                templateUrl : 'pages/components.html',
                controller  : 'componentController'
            })

            // route for the about page
            .when('/report', {
                templateUrl : 'pages/report.html',
                controller  : 'reportController'
            });
    });
	
	//Provides meal functions
	app.factory("Meal", ['$http', function($http) {
		return {
			create_meal: 
				//returns a promise of a request return to create a meal
				function (date_and_time_of_mealIn, deadlineIn, component_listIn) {
					
					alert("start req");

					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'POST', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/meals.json',
						headers: {
							'Content-Type': 'application/json'
						},
						data: { 
							meal:{date_and_time_of_meal: date_and_time_of_mealIn, deadline: deadlineIn}, component_list: component_listIn
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

			view_meals:
				//returns a promise of a request return that contains all meals
				function () {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET',
						url:'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/meals.json',
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
				},

			get_deadline_past:
				//returns a promise of a request return that contains all meals for which the deadline has passed
				function () {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/meal/deadline_past.json',
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
				},


			}
		}
	]);

	
	app.factory("Person", ['$http', function($http) {
		return {
			view_all_customers:
				function () {

					var req = {
						method: 'GET',
						url:'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/students.json',
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
				},
					/*
			create_customer:
					var req = {
						method: 'POST',
						url:'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/student.json'},
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
				},
				*/
			}
		}
	]);





	//Provides report functions
	app.factory("Report", ['$http', function($http) {
		return {
			get_report: 
				//returns a promise of a request return
				function (mealId) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/get_report.json',
						headers: {
							'Content-Type': 'application/json'
						},
						params: { 
							id: mealId
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

	//Provides login functions
	app.factory("Login", ['$http', function($http) {
		return {
			staff: 
				//returns a promise of a request return
				function (userNameIn, passWordIn) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'POST', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/login/staff.json',
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
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/logout.json',
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
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/attendances.json',
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


	//Provides Component retrieval functions
	app.factory("Components", ['$http', function($http) {
		return {
			get_for_meal: 
				//returns a promise of a request return
				function (meal_id) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/meal/components.json',
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
				},
			get_all: 
				//returns a promise of a request return
				function () {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/components.json',
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
				},
			edit:
				//returns a promise of a request return
                function (component_in) {

                    //the request with method, url, content-type, and data needed for a login
                    var req =  {
                        method: 'PUT',
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/component.json',
                        headers: {
                            'Content-Type': 'application/json'
                        },
						data: {
                            component: component_in, id: component_in.id
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
			create_component:
				//creates a component
				function (component_in) {

                    //the request with method, url, content-type, and data needed for a login
                    var req =  {
                        method: 'POST',
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/component.json',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        data: {
                            component: component_in
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
	app.controller('CTRLLoginController', function (Login, $scope) {

		this.username = "";
		this.password = "";


		//indicated logged in or not
		$scope.logged_in_indicator = false;
		$scope.logged_in_user = "";

		//login function
		this.login = function ()
		{
			Login.staff(this.username, this.password).then(
				function (promise) {
					//create a user
					retUser = {
						id: promise.data.id,
						name: promise.data.name,
						username: promise.data.username
					};

					//set the logged_in_user variable to the returned user
					$scope.logged_in_user = retUser;

					//set the logged_in_indicator to true
					$scope.logged_in_indicator = true;
					}, function (error) {
					alert("login failed	\nIncorrect username or pssword");
				}
			);

			this.password = "";
		};


		//logout function
		this.logout = function(){
			//alert("logout");
			$scope.logged_in_indicator = false;
			$scope.logged_in_user = "";

			
			//make and add the logout requests here
			Login.logout().then(
				function(promise) {
					//alert("You have successfully logged out");
				}, function (error) {
					alert("Error on logout");
				}
			);
		};

		//check if the user is logged in
		this.isLoggedIn = function(){
			return $scope.logged_in_indicator;
		};

		//returns the logged in user as a json object
		this.getLoggedInUser = function(){
			return $scope.logged_in_user;
		};
	});

	/*
	page controller
	*/
	app.controller('CTRLPageController', function () {
		this.tab = 0;

	    this.isSet = function(checkTab) {
	      return this.tab === checkTab;
	    };

	    this.setTab = function(setTab) {
	      this.tab = setTab;
	    };
	});

	/*
	controller for components
	*/
	app.controller('componentController', function (Components, $scope) {
		//components in the selected individual future meal
		$scope.components = [];

		//component for editing		
		$scope.master = "";	
		$scope.cur_selected_edit_component = "";

		//sub page views
		$scope.tab = 0;

		$scope.setTab = function(newTab) {
			$scope.tab = newTab;
		};

		$scope.getTab = function() {
			return $scope.tab;
		};

		$scope.check_tab_same = function (testTab) {
			return ($scope.tab === testTab);
		};

		$scope.show_edit = false;

		/*
			setup methods
		*/

		$scope.reset_controller = function () {
			$scope.reset_vars();
		};

		$scope.reset_vars = function () {

			//reset component list
			//avoid graphical ugliness
			//server too fast so needs a reset

			$scope.master = "";		

			$scope.components = [];

			$scope.cur_selected_edit_component = "";

			$scope.tab = 0;

			$scope.show_edit = false;

			$scope.get_all_components();
		};

	//view
		$scope.get_all_components = function() {
			

			Components.get_all().then(
				function (promise) {

					$scope.components = promise.data.components;

				}, function (error) {

					//description of error
					alert("Unable to get components from server.");
				}
			);
		};

		$scope.get_components = function () {
			return $scope.components;
		};

	//add
		$scope.add_component = function(component_to_add) {
			Components.create_component(component_to_add).then(
				function(promise) {
					
					alert("Component added");

				}, function (error) {

					alert("Unable to add component");

				}
			);

		};




	//edit
		$scope.edit_component = function(component) {
			Components.edit(component).then(
				function(promise) {
					
					$scope.show_edit = false;
					alert("Success");

				}, function (error) {

					alert("Unable to update");
				}	
			);

		};

        $scope.set_focus_edit = function (component){

			if($scope.show_edit && component === $scope.cur_selected_edit_component)
			{	
				alert("hiding");
				$scope.show_edit = false;
				$scope.cur_selected_edit_component = "";
			}

			else
			{
				alert("showing");
				$scope.show_edit = true;
				$scope.cur_selected_edit_component = component;
			}

		};

		$scope.get_show_edit = function (id) {
			var show = false;

			if(id == $scope.cur_selected_edit_component.id && $scope.show_edit)
			{
				show = true;
			}
			
			return show;

		};

		$scope.reset_controller();


	});

	app.controller('





})
();
