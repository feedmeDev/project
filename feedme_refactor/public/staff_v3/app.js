(function() { // We use this anonymous function to create a closure.

	var app = angular.module('feedme-web', ['ngCookies', 'ngRoute']);

    // configure our routes
    app.config(function($routeProvider) {
        $routeProvider
			
			//route for the login page
			.when('/', {
				templateUrl : 'pages/login.html',
				controller  : 'loginController'
			})

            // route for the home page
            .when('/home', {
                templateUrl : 'pages/home.html'
            })

            // route for the customers page
            .when('/customers', {
                templateUrl : 'pages/customers.html',
                controller  : 'customerController'
            })

            // route for the staff page
            .when('/staff', {
                templateUrl : 'pages/staff.html',
                controller  : 'staffController'
            })

            // route for the meals page
            .when('/meals', {
                templateUrl : 'pages/meals.html',
                controller  : 'mealController'
            })

            // route for the component page
            .when('/components', {
                templateUrl : 'pages/components.html',
                controller  : 'componentController'
            })

            // route for the report page
            .when('/report', {
                templateUrl : 'pages/report.html',
                controller  : 'reportController'
            });
    });
	
	//Provides meal functions
	app.factory("Meal", ['$http', function($http) {
		return {
			create: 
				//returns a promise of a request return to create a meal
				function (meal_in, component_listIn) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'POST', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/meal.json',
						headers: {
							'Content-Type': 'application/json'
						},
						data: { 
							meal: meal_in, component_list: component_listIn
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

			all:
				//returns a promise of a request return that contains all meals
				function () {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET',
						url:'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/meals.json',
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
            past:
                //returns a promise of a request return that contains all meals for which the deadline has passed
                function () {

                    //the request with method, url, content-type, and data needed for a login
                    var req =  {
                        method: 'GET',
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/meals/past.json',
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

            future:
                //returns a promise of a request return that contains all meals for which the deadline has passed
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
                },



			}
		}
	]);

	
	app.factory("Person", ['$http', function($http) {
		return {
			get_all_customers:
				function () {

					var req = {
						method: 'GET',
						url:'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/customers.json',
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

			get_all_staff:
                function () {

                    var req = {
                        method: 'GET',
                        url:'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/staff.json',
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

			create_customer:
				function (customer_in) {

					customer_in.staff = false;
				//the request with method, url, content-type, and data needed for a login
                    var req =  {
                        method: 'POST',
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/person.json',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        data: {
                            person: customer_in
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

			create_staff:
                function (staff_in) {

                    staff_in.staff = true;
                //the request with method, url, content-type, and data needed for a login
                    var req =  {
                        method: 'POST',
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/person.json',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        data: {
                            person: staff_in
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
                function (person) {

					var formatted_person = {name: person.name, username: person.username, password: person.password, password_confirmation: person.password_confirmation, staff: person.staff}

                    //the request with method, url, content-type, and data needed for a login
                    var req =  {
                        method: 'PUT',
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/person.json',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        data: {
                            person: formatted_person, id: person.id
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





	//Provides report functions
	app.factory("Report", ['$http', function($http) {
		return {
			get_report: 
				//returns a promise of a request return
				function (mealId) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/report.json',
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
				},
			get_detailed_report://returns a promise of a request return
                function (mealId) {

                    //the request with method, url, content-type, and data needed for a login
                    var req =  {
                        method: 'GET',
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/detailed_report.json',
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
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/login/staff.json',
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


	//Provides Component retrieval functions
	app.factory("Components", ['$http', function($http) {
		return {
			get_for_meal: 
				//returns a promise of a request return
				function (meal_id) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/meal/components.json',
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
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/components.json',
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
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/component.json',
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
                        url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com/component.json',
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
	app.controller('loginController', function (Login, $scope, $location, $cookieStore) {
		//login function
		$scope.login = function (username, password)
		{
			Login.staff(username, password).then(
				function (promise) {
					//create a user
					retUser = {
						id: promise.data.id,
						name: promise.data.name,
						username: promise.data.username
					};

                    //store the user object
                    $cookieStore.put('loggedInUser', retUser);
                    //change the location
                    $location.path('/home');

				}, function (error) {
					alert("Unable to login. \nAre your login details correct?");
				}
			);

			this.password = "";
		};
	});

	/*
	log out controller
	*/
	app.controller('logoutController', function (Login, $scope, $location, $cookieStore) {
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
	});

	/*
	controller for components
	*/
	app.controller('componentController', function (Components, $scope) {
		//components in the selected individual future meal
		$scope.components = [];

		//component for editing		
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
					alert("Failure: Unable to get components from server.");
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

					alert("Failure: Unable to add component");

				}
			);

		};




	//edit
		$scope.edit_component = function(component) {
			Components.edit(component).then(
				function(promise) {
					
					$scope.show_edit = false;
					alert("Component updated.");
					$scope.get_all_components();

				}, function (error) {

					alert("Failure: Unable to update.");
					$scope.get_all_components();
				}	
			);

		};

        $scope.set_focus_edit = function (component){

			if($scope.show_edit && component === $scope.cur_selected_edit_component)
			{	
				//alert("hiding");
				$scope.show_edit = false;
				$scope.cur_selected_edit_component = "";
			}

			else
			{
				//alert("showing");
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

	/*
    controller for people
    */
    app.controller('customerController', function (Person, $scope) {
    	$scope.customers = [];

        //component for editing     
        $scope.cur_selected_edit_customer = "";

		$scope.reset_edit_customer = function () {
			$scope.cur_selected_edit_customer = "";
		}

		$scope.is_selected_edit_customer = function () {
			return($scope.cur_selected_edit_customer != "");
		}

		$scope.set_edit_customer = function (customer) {
			$scope.cur_selected_edit_customer = customer;
		}

		//View all customers
        $scope.get_all_customers = function() {
            Person.get_all_customers().then(
                function (promise) {
					//alert("Customers got");
                    $scope.customers = promise.data;

                }, function (error) {

                    //description of error
                    alert("Failure: Unable to get customers from server.");
                }
            );
        };

		$scope.get_customers = function () {
			return $scope.customers;
		};

		$scope.edit_customer = function (customer) {

			Person.edit(customer).then(
				function(promise) {
					alert("Customer edited");
					$scope.get_all_customers();
					alert(priomise.data.name);
				}, function (error) {
					alert("Failure: Unable to update customer");
					$scope.get_all_customers();
				}
			);
		};

		$scope.add_customer = function (customer) {
			Person.create_customer(customer).then(
				function(promise) {
					//alert("Customer created \nname = " + promise.data.name + "\nusername = " + promise.data.username);
				}, function (error) {
					alert("Failure: Unable to create customer.");
				}
			);
		};

		$scope.reset_controller = function () {
			$scope.get_all_customers();
		};

		$scope.reset_controller();
	});


	/*
    controller for staff
    */
    app.controller('staffController', function (Person, $scope) {
        $scope.staff = [];

        //component for editing     
        $scope.cur_selected_edit_staff = "";

		$scope.reset_edit_staff = function () {
            $scope.cur_selected_edit_staff = "";
        }

        $scope.is_selected_edit_staff = function () {
            return($scope.cur_selected_edit_staff != "");
        }

        $scope.set_edit_staff = function (staff) {
            $scope.cur_selected_edit_staff = staff;
        }


        //View all customers
        $scope.get_all_staff = function() {
			Person.get_all_staff().then(
                function (promise) {
                    //alert("Staff got");
                    $scope.staff = promise.data;

                }, function (error) {

                    //description of error
                    alert("Failure: Unable to get staff from server.");
                }
            );
        };

        $scope.get_staff = function () {
            return $scope.staff;
        };

        $scope.edit_staff = function (staff) {
            Person.edit(staff).then(
                function(promise) {
                    alert("Staff edited");
                    $scope.get_all_staff();

                }, function (error) {
                    alert("Failure: Unable to update staff member");
                    $scope.get_all_staff();
                }
            );
        };

		$scope.add_staff = function (staff) {
            Person.create_staff(staff).then(
                function(promise) {
                    alert("Staff member created \nname = " + promise.data.name + "\nusername = " + promise.data.username);
                }, function (error) {
                    alert("Failure: Unable to create staff member.");
                }
            );
        };

        $scope.reset_controller = function () {
            $scope.get_all_staff();
        };

        $scope.reset_controller();
    });

	app.controller('mealController', function (Meal, Components, $scope) {
		$scope.meals = [];

		$scope.cur_selected_meal_for_edit = "";

		//sub page views
        $scope.tab = 0;
		

		$scope.convertMealDate = function(unformatted_date_in) {
			//get sub string
			var substring_date = unformatted_date_in.substr(0, 10);

			//reverse and join
			var reversed_date = substring_date.split("-").reverse().join();

			var ret = reversed_date.replace(/,/g, "/");

			//return
			return ret;
		}

		$scope.convertMealDateTime = function(unformatted_date_in) {
            //get sub string
            var substring_date = unformatted_date_in.substr(0, 10);

            //reverse and join
            var reversed_date = substring_date.split("-").reverse().join();

            var date_str = reversed_date.replace(/,/g, "/");

			//get time substring
			var substring_time = unformatted_date_in.substr(12, 17);

			var ret = date_str + " " + substring_time;

            //return
            return ret;
        }


        $scope.setTab = function(newTab) {
            $scope.tab = newTab;
        };

        $scope.getTab = function() {
            return $scope.tab;
        };

        $scope.check_tab_same = function (testTab) {
            return ($scope.tab === testTab);
        };

        $scope.show_details = false;
		$scope.allow_show_delete = false;
		
		$scope.components = [];
		$scope.selected_components = [];

		$scope.check_component_in_list = function (component) {
            return (~$scope.selected_components.indexOf(component));
        };

		$scope.add_component_to_list = function (component) {
			if(!$scope.check_component_in_list(component)) {
				$scope.selected_components.push(component);
				alert("Component added");
			}
		};
		
		$scope.remove_component_from_list = function (component) {
			var index = $scope.selected_components.indexOf(component);

			if(index != -1) {
				$scope.selected_components.splice(index, 1);
			};
		};

		$scope.get_components = function () {
			Components.get_all().then(
				function (promise) {
					//alert("win");
					$scope.components = promise.data.components;
				}, function (errors) {
					//alert("error");
				}
			);
		};
		
		$scope.get_selected_components = function() {
			return $scope.selected_components;
		};	

		$scope.get_all_components = function () {
			return $scope.components;
		};

		$scope.add_meal = function (meal_to_add) {
			if($scope.selected_components.length <= 0)
			{
				alert("you need to have some Components in the meal.");
			}
			else
			{
            	Meal.create(meal_to_add, $scope.selected_components).then(
            	    function(promise) {
						alert("Meal created.");
            		}, function (errors) {
               	    	alert("Failure: Unable to create meal.");
               		}
            	);
			}
        };



		$scope.get_all = function () {
			
			$scope.meals = [];
			
			//get all the meals
			Meal.all().then(
				function (promise) {
					$scope.meals = promise.data;
				}, function (error) {
					alert("Failure: Unable to get Meals from server");
				}
			);
		};

		$scope.get_future = function () {

            $scope.meals = [];

			//get all future meals
			Meal.future().then(
                function (promise) {
                    $scope.meals = promise.data.future;
                }, function (error) {
                    alert("Failure: Unable to get Meals from server");
                }
            );

		};

		$scope.get_past = function () {

            $scope.meals = [];

			//get all past meals
			Meal.past().then(
                function (promise) {
                    $scope.meals = promise.data;
                }, function (error) {
                    alert("Failure: Unable to get Meals from server");
                }
            );

		};	

		$scope.get_meals = function() {
			return $scope.meals;
		};

		//reset the controller
		$scope.reset_controller = function () {
			$scope.get_all();
		};

		$scope.reset_controller();
	});
	
	app.controller('reportController', function (Report, Meal, $scope) {
		//meals available for report
		$scope.meals = [];
		//current report object, delete on hide
		$scope.current_report = "";
		$scope.current_detailed_report = "";
		$scope.tab = "";
		$scope.selected_meal = "";
		
		$scope.set_selected_meal = function (meal) {
			//set selected meal
			//get the report for the selected meal
			$scope.selected_meal = meal;
			$scope.get_report_for(meal.id);
			$scope.get_detailed_report_for(meal.id);
		};

        //reset the selected meal
        $scope.reset_selected_meal = function () {
            $scope.selected_meal = "";
        }

        $scope.is_selected_meal = function () {
            return ($scope.selected_meal != "");
        }

		//get meals
		$scope.get_meals_from_server = function () {
			Meal.all().then(
				function (promise) {
					$scope.meals = promise.data;
					//alert($scope.meals);
				}, function (error) {
					alert("Error: unable to get meals from server");
				}
			);
		};

		//get report for meal (meal_id)
		$scope.get_report_for = function (meal_id) {
			//delete the old report
			$scope.current_report = "";
			
			Report.get_report(meal_id).then(
				function (promise) {
					$scope.current_report = promise.data.report;
				}, function (error) {
					alert("Error: contact your system administrator");
				}
			);
		};

		//get detailed report for meal (meal_id)
        $scope.get_detailed_report_for = function (meal_id) {
            //delete the old report

            Report.get_detailed_report(meal_id).then(
                function (promise) {
                    $scope.current_detailed_report = promise.data.report;
                }, function (error) {
                    alert("Error: contact your system administrator");
                }
            );
        };


		$scope.get_meals_from_server();
		
		$scope.convertMealDate = function(unformatted_date_in) {
            //get sub string
            var substring_date = unformatted_date_in.substr(0, 10);

            //reverse and join
            var reversed_date = substring_date.split("-").reverse().join();

            var ret = reversed_date.replace(/,/g, "/");

            //return
            return ret;
        }

        $scope.convertMealDateTime = function(unformatted_date_in) {
            //get sub string
            var substring_date = unformatted_date_in.substr(0, 10);

            //reverse and join
            var reversed_date = substring_date.split("-").reverse().join();

            var date_str = reversed_date.replace(/,/g, "/");

            //get time substring
            var substring_time = unformatted_date_in.substr(11, 5);

            var ret = date_str + " " + substring_time;

            //return
            return ret;
        }

	});
})
();
