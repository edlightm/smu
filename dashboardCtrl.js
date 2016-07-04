//registration controller
app.controller("dashboardCtrl",function($scope,$http,$location,$rootScope)
{
	//$scope.ndiyani = $rootScope.uid;
	var uid = $rootScope.uid;
	
	//----- load student data
	
	$http.post('load.applicant.profile.php', {'uid': uid})
	.then(function successCallback(response)
	{
		// this callback will be called asynchronously
		if(response.statusText == "OK")
		{
			$scope.person = response.data.applicantData;
		}
		else
		{
			console.log("Error : " + response);	
		}
	},
	function errorCallback(response)
	{
		// called asynchronously if an error occurs
		//$scope.errors.push(response.data['error']);
		console.log("Error : " + response);	
		console.log("Error status : " + response.status);
		console.log("Error : " + response.data);				
	});	
	
	//----- end loading student data
	
	
	//----- load acceptance status
	
	$http.post('check.acceptance.php', {'uid': uid})
	.then(function successCallback(response)
	{
		console.log(response);	
		console.log(response.status);		
		if(response.data['success'] == 1)
		{
			//$scope.msgs.push(response.data['message']);
			$scope.acceptstatus = "Accepted";
		}
		else
		{
			//$scope.errors.push(response.data['error']);
			$scope.acceptstatus = "Pending ...";
		}
	},
	function errorCallback(response)
	{
		// called asynchronously if an error occurs
		//$scope.errors.push(response.data['error']);
		console.log("Error : " + response);	
		console.log("Error status : " + response.status);
		console.log("Error : " + response.data);				
	});	
	
	//----- end acceptance status
	
	
	
});