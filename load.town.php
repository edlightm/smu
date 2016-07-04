<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_towns.town_id,tblsystem_towns.town_name,tblsystem_towns.province_id FROM tblsystem_towns"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Town Found";
		$response["townData"] = array();

		while($row=$rs->fetch_array())
		{
			$townData = array();
			$townData["town_id"] = $row["town_id"];
			$townData["town_name"] = $row["town_name"];
			
			// update your reponse json							 
			array_push($response["townData"], $townData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "town Details not found";
		die(json_encode($response));
	}
?>