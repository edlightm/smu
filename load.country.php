<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_country.country_id,tblsystem_country.country_name FROM tblsystem_country"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Country Found";
		$response["countryData"] = array();

		while($row=$rs->fetch_array())
		{
			$countryData = array();
			$countryData["country_id"] = $row["country_id"];
			$countryData["country_name"] = $row["country_name"];
			
			// update your reponse json							 
			array_push($response["countryData"], $countryData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Country Details not found";
		die(json_encode($response));
	}
?>