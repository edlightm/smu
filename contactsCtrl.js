//registration controller
app.controller("contactsCtrl",function($scope,$http,$location,$rootScope)
{
	//$scope.ndiyani = $rootScope.uid;
	var uid = $rootScope.uid;
	
	//----- load student data
	
	$http.post('load.applicant.name.php', {'uid': uid})
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
	
	//---- populate towns -----
	$http.get('load.town.php')
	.then(function successCallback(response)
	{
		// this callback will be called asynchronously
		console.log(response);	
		//console.log(response.status);		
		if(response.statusText == "OK")
		{
			$scope.towns = response.data.townData;
			console.log("Data : " + $scope.towns);
			//console.log("Success : " + response.data);	
			console.log("Town status : " + response.status);
		}
		else
		{
			//$scope.errors.push(response.data['error']);
			console.log("Error : " + response);	
		}
	});
	
	//----- end town --->
	
		
	//------- save contacts details -----
	$scope.saveContacts=function()
	{
		//$scope.errors.splice(0, $scope.errors.length); // remove all error messages
		//$scope.msgs.splice(0, $scope.msgs.length);
	
		$http.post('contacts.php', {'uid': uid, 'mobile': $scope.mobile, 'phone': $scope.phone, 'email': $scope.email, 'permanentaddress': $scope.permanentaddress, 'permanentaddresstown': $scope.permanentaddresstown,'postaladdress': $scope.postaladdress, 'postaladdresstown': $scope.postaladdresstown})
		.then(function successCallback(response)
		{
			// this callback will be called asynchronously
			console.log(response);	
			console.log(response.status);		
			if(response.data['success'] == 1)
			{
				//$scope.msgs.push(response.data['message']);
				console.log("Success : " + response.data);	
				console.log("Success status : " + response.status);
				$location.path('/nok');
			}
			else
			{
				//$scope.errors.push(response.data['error']);
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
	}	
	//-------- end saveContacts details save --->	
});