<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_marital_status.marital_status_id,tblsystem_marital_status.marital_status_name FROM tblsystem_marital_status"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Marital Found";
		$response["maritalData"] = array();

		while($row=$rs->fetch_array())
		{
			$maritalData = array();
			$maritalData["marital_status_id"] = $row["marital_status_id"];
			$maritalData["marital_status_name"] = $row["marital_status_name"];
			
			// update your reponse json							 
			array_push($response["maritalData"], $maritalData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Marital Details not found";
		die(json_encode($response));
	}
?>