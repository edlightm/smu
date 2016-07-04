<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_religion.religion_id,tblsystem_religion.religion_name FROM tblsystem_religion"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Religion Found";
		$response["religionData"] = array();

		while($row=$rs->fetch_array())
		{
			$religionData = array();
			$religionData["religion_id"] = $row["religion_id"];
			$religionData["religion_name"] = $row["religion_name"];
			
			// update your reponse json							 
			array_push($response["religionData"], $religionData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Religion Details not found";
		die(json_encode($response));
	}
?>