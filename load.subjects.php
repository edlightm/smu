<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_subject.subject_id,tblsystem_subject.subject_name,tblsystem_subject.subject_code FROM tblsystem_subject"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Town Found";
		$response["subjectData"] = array();

		while($row=$rs->fetch_array())
		{
			$subjectData = array();
			$subjectData["subject_id"] = $row["subject_id"];
			$subjectData["subject_name"] = $row["subject_name"];
			
			// update your reponse json							 
			array_push($response["subjectData"], $subjectData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Subject Details not found";
		die(json_encode($response));
	}
?>