(function() { // We use this anonymous function to create a closure.

	var app = angular.module('feedme-web', ['ngResource']);

	//Provides login functions
	app.factory("Login", ['$http', function($http) {
		return {
			customer: 
				//returns a promise of a request return
				function (userNameIn, passWordIn) {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'POST', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/login/customer.json',
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

	//Provides Meal retrieval functions
	app.factory("FutureMeals", ['$http', function($http) {
		return {
			retrieve: 
				//returns a promise of a request return
				function () {
					
					//the request with method, url, content-type, and data needed for a login
					var req =  {
						method: 'GET', 
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/meals/future.json',
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
						url: 'http://ec2-54-153-163-189.ap-southeast-2.compute.amazonaws.com:3000/meals/components.json',
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
	app.controller('CTRLLoginController', function (Login, $scope) {

		this.username = "";
		this.password = "";


		//indicated logged in or not
		$scope.logged_in_indicator = false;
		$scope.logged_in_user = "";

		//login function
		this.login = function ()
		{
			Login.customer(this.username, this.password).then(
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

					//fire event to setup any controllers that need to be setup after a successful login
					$scope.$broadcast ('successLogin');
				}, function (error) {
					alert("Login failed	\nIncorrect Username or Password");
				}
			);

			this.password = "";
		};


		//logout function
		this.logout = function(){
			$scope.logged_in_indicator = false;
			$scope.logged_in_user = "";
			//make and add the logout requests here
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
	controller for list of meals
	*/
	app.controller('CTRLListMealController', function (FutureMeals, Components, Indication, $scope) {

		//future meals
		$scope.list_of_meals = [];

		//components in the selected individual future meal
		$scope.components = [];
		//show the indication form
		this.show_components = false;

		//"i want these components" variable
		this.indicated_on_components = [];
		//i am (not) going to the meal
		this.going = true;

		this.show_specific = false;

		//view the indication for for the meal with the id matching this.tab
		this.tab = "0";


		/*
			setup methods
		*/
		
		this.convertMealDate = function(unformatted_date_in) {
            //get sub string
            var substring_date = unformatted_date_in.substr(0, 10);

            //reverse and join
            var reversed_date = substring_date.split("-").reverse().join();

            var ret = reversed_date.replace(/,/g, "/");

            //return
            return ret;			
		}

		$scope.$on('successLogin', function(e){
			
			$scope.reset_controller();

		});

		$scope.reset_controller = function () {
			
			$scope.reset_vars();
			$scope.populateMeals();

			this.show_components = false;
		};

		$scope.reset_vars = function () {

			//reset componet list
			//avoid graphical ugliness
			//server too fast so needs a reset
			$scope.components = [];
			this.indicated_on_components = [];
			this.going = true;
		};

		$scope.populateMeals = function () {
			FutureMeals.retrieve().then(
				function (promise) {

					$scope.list_of_meals = promise.data.future;

				}, function (error) {

					//usefull error message
					alert("General Failure \n Check internet connection \nContact system administrator.")
				}
			);
		};

		this.getMeals = function () {
			return $scope.list_of_meals;
		};


		//fix this
		//algorithmically inefficient
		this.setTab = function (meal_id) {

			$scope.reset_vars();

			if(this.tab === meal_id && this.show_components)
			{
				//components already shown
				//hide them
				this.show_components = false;

				this.show_specific = false;
			}
			else
			{
				//set the tab to the current meal
				this.tab = meal_id;

				//get the correct components from the server
				this.get_components_from_server();

				//alow showing of the components
				this.show_components = true;

				this.show_specific = true;
			};
		};

		this.getTab = function (queryTab) {

			//if correct tab
			var correct_tab = (this.tab == queryTab);

			//show_components allowable is already set

			var show_indicator = (correct_tab && this.show_components);
			return (show_indicator);
		};

		this.get_components_from_server = function() {
			

			Components.get_for_meal(this.tab).then(
				function (promise) {

					$scope.components = promise.data.components;

				}, function (error) {

					//description of error
					alert("Unable to get components from server.");
				}
			);
		};

		this.get_components = function () {
			return $scope.components;
		};

		this.numberOfMealsGreaterThanZero = function () {
			if($scope.list_of_meals.length > 0){
				return true;
			}
			else{
				return false;
			}
		};

		//if the component_id is in this.indicated_on_components then remove it
		//if the component_id is not in this.indicated_on_components then add it
		this.swap_component_indication = function (component_id) {
			/*

			//for panel
			if(this.check_component_in_list(component_id)) {
				
				var i = this.indicated_on_components.indexOf(component_id);
				if(i != -1) {
					this.indicated_on_components.splice(i, 1);
				}
			}
			else {
				this.indicated_on_components.push(component_id);
			}

			*/

			
			//for the event only
			if(this.check_component_in_list(component_id)) {
				
				this.indicated_on_components = [];
			}
			else {
				this.indicated_on_components = [component_id];
			}
		};

		this.show_meal = function (meal_id) {
			var show = false;

			if(this.show_specific) {
				if(this.tab == meal_id) {
					show = true;
				}
			}
			else {
				show = true;
			}

			return show;
		}

		this.check_component_in_list = function (component_id) {
			return (~this.indicated_on_components.indexOf(component_id));
		};

		this.indicate = function (user_id) {
			Indication.indicate(user_id, this.tab, this.going, this.indicated_on_components).then(
				function (promise) {
					//feedback indication successful
					alert("indication successful");

				}, function (error) {
					//feedback indication not successful
					alert("indication not successful");

				}
			);
		};
	});
})
();
