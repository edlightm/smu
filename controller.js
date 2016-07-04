// JavaScript Document
var app = angular.module('myApp',['ngRoute']);
app.config(function($routeProvider,$locationProvider){
	//$locationProvider.html5Mode(true);
	$routeProvider
	.when('/home',{
		templateUrl:'home.html',
		controller: 'signinCtrl'
	})
	.when('/signup',{
		title:'SMU - Registration',
		templateUrl:'signup.html',
		controller: 'signupCtrl'	
	})
	.when('/personal',{
		title:'Registration - Personal',
		templateUrl:'personal.html',
		controller: 'personalCtrl'	
	})
	.when('/contacts',{
		title:'Registration - Contacts',
		templateUrl:'contacts.html',
		controller: 'contactsCtrl'	
	})
	.when('/nok',{
		title:'Registration - Next of Kin',
		templateUrl:'nok.html',
		controller: 'nokCtrl'	
	})
	.when('/olevel',{
		title:'Registration O-level',
		templateUrl:'olevel.html',
		controller: 'olevelCtrl'	
	})
	.when('/alevel',{
		title:'Registration A-level',
		templateUrl:'alevel.html',
		controller: 'alevelCtrl'	
	})
	.when('/programmes',{
		title:'Registration Programmes',
		templateUrl:'programmes.html',
		controller: 'programmesCtrl'	
	})
	.when('/dashboard',{
		title:'Applicant Dasboard',
		templateUrl:'dashboard.html',
		controller: 'dashboardCtrl'	
	})
	.when('/',{
		title:'Samora Machel University',
		templateUrl:'home.html',
		controller: 'signinCtrl'		
	})
	
	.otherwise({redirectTo:'home'});
});