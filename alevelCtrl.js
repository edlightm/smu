//registration controller
app.controller("alevelCtrl",function($scope,$http,$location,$rootScope)
{
	//scope.person = {};
	$scope.ndiyani = $rootScope.uid;
	var uid = $rootScope.uid;
	//----- load student data
	
	$http.post('load.applicant.name.php', {'uid': uid})
	.then(function successCallback(response)
	{
		// this callback will be called asynchronously
		console.log(response);	
		console.log(response.status);		
		if(response.statusText == "OK")
		{
			$scope.person = response.data.applicantData;
			console.log("Data : " + $scope.person);
			//console.log("Success : " + response.data);	
			console.log("Success status : " + response.status);
			//$location.path('/contacts');
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
	
	//----- end loading student data
	
	//---- populate exam boards -----
	$http.get('load.exam.board.php')
	.then(function successCallback(response)
	{
		// this callback will be called asynchronously
		console.log(response);	
		//console.log(response.status);		
		if(response.statusText == "OK")
		{
			$scope.examboard = response.data.examData;
			console.log("Data : " + $scope.examboard);
			//console.log("Success : " + response.data);	
			console.log("Board status : " + response.status);
		}
		else
		{
			//$scope.errors.push(response.data['error']);
			console.log("Error : " + response);	
		}
	});
	
	//----- end boards --->
	
	//---- populate exam subjects -----
	$http.get('load.subjects.php')
	.then(function successCallback(response)
	{
		// this callback will be called asynchronously
		console.log(response);	
		//console.log(response.status);		
		if(response.statusText == "OK")
		{
			$scope.subjects = response.data.subjectData;
			console.log("Data : " + $scope.subjects);
			//console.log("Success : " + response.data);	
			console.log("Subject status : " + response.status);
		}
		else
		{
			//$scope.errors.push(response.data['error']);
			console.log("Error : " + response);	
		}
	});
	
	//----- end subjects --->
	
	//---- populate exam results -----
	$http.get('load.results.php')
	.then(function successCallback(response)
	{
		// this callback will be called asynchronously
		console.log(response);	
		//console.log(response.status);		
		if(response.statusText == "OK")
		{
			$scope.results = response.data.resultsData;
			console.log("Data : " + $scope.results);
			//console.log("Success : " + response.data);	
			console.log("Result Weight : " + response.status);
		}
		else
		{
			//$scope.errors.push(response.data['error']);
			console.log("Error : " + response);	
		}
	});
	
	//----- end results --->
	
	
	//------- save ssubject results -----
	$scope.saveAlevelResult=function()
	{
		//$scope.errors.splice(0, $scope.errors.length); // remove all error messages
		//$scope.msgs.splice(0, $scope.msgs.length);
		var level = "2"; //"ALEVEL";
		$http.post('alevel.results.php', {'uid': uid, 'emboard': $scope.emboard, 'subject': $scope.subject, 'examresults': $scope.examresults, 'level': level})
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
				//$location.path('/olevel');
				getAlevelResults(response.data['uid']);
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
	//-------- end save subject results --->
	
	function getAlevelResults($appID){
		$http.post('alevel.results.show.php', {'uid': $appID})
		.then(function successCallback(response)
		{
			// this callback will be called asynchronously
			console.log(response);	
			console.log(response.status);		
			if(response.statusText == "OK")
			{
				$scope.resultz = response.data.resultsData;
				console.log("Data : " + $scope.resultz);
				//console.log("Success : " + response.data);	
				console.log("Results status : " + response.status);
			}
	  	});	
	}
	
	//------- done move to alevel -----
	$scope.doneAlevel=function()
	{
		$location.path('/programmes');				
	}	
	//-------- end done --->
	
	
	
	
	
});