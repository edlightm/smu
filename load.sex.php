<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_sex.sex_id,tblsystem_sex.sex_name FROM tblsystem_sex"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Sex Found";
		$response["sData"] = array();

		while($row=$rs->fetch_array())
		{
			$sData = array();
			$sData["sex_id"] = $row["sex_id"];
			$sData["sex_name"] = $row["sex_name"];
			
			// update your reponse json							 
			array_push($response["sData"], $sData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Sex Details not found";
		die(json_encode($response));
	}
?>