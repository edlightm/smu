<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_result_weight.result_id,tblsystem_result_weight.result_name,tblsystem_result_weight.result_weight FROM tblsystem_result_weight"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Town Found";
		$response["resultsData"] = array();

		while($row=$rs->fetch_array())
		{
			$resultsData = array();
			$resultsData["result_id"] = $row["result_id"];
			$resultsData["result_name"] = $row["result_name"];
			$resultsData["result_weight"] = $row["result_weight"];
			
			// update your reponse json							 
			array_push($response["resultsData"], $resultsData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Results Details not found";
		die(json_encode($response));
	}
?>