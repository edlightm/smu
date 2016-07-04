<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_programme.programme_id,tblsystem_programme.programme_name,tblsystem_programme.programme_code,tblsystem_programme.programme_type_id,tblsystem_programme.faculty_id FROM tblsystem_programme"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Country Found";
		$response["programmeData"] = array();

		while($row=$rs->fetch_array())
		{
			$programmeData = array();
			$programmeData["programme_id"] = $row["programme_id"];
			$programmeData["programme_name"] = $row["programme_name"];
			
			// update your reponse json							 
			array_push($response["programmeData"], $programmeData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Programme Details not found";
		die(json_encode($response));
	}
?>