<?php
	$post = json_decode(file_get_contents("php://input"), true);
		
	$uid = $post['uid'];
	
	if(empty($uid))
	{
		session_start();
    	$uid = $_SESSION["uid"];
	}
		
	include("opendb.php");
	
	$query = "SELECT
				tblapplicant_acceptance.applicant_id,
				tblapplicant_acceptance.employee_id,
				tblapplicant_acceptance.system_date,
				tblsystem_programme.programme_name,
				tblsystem_attendance_type.attendance_type_name
				FROM
				tblapplicant_acceptance
				INNER JOIN tblsystem_programme ON tblsystem_programme.programme_id = tblapplicant_acceptance.programme_id
				INNER JOIN tblsystem_attendance_type ON tblsystem_attendance_type.attendance_type_id = tblapplicant_acceptance.attendance_type_id
				WHERE
				tblapplicant_acceptance.applicant_id = '$uid'"; 	
	if($rs = $db->query($query))
	{
		$c = $rs->num_rows;
		
		if($c > 0)
		{
			$response["success"] = 1;
			//$response["message"] = "Applicant Found";
			$response["acceptData"] = array();
	
			while($row=$rs->fetch_array())
			{
				$acceptData = array();
				$acceptData["applicant_id"] = $row["applicant_id"];
				$acceptData["message"] = "Accepted";
				$acceptData["programme_name"] = $row["programme_name"];
				$acceptData["attendance_type_name"] = $row["attendance_type_name"];
				
				// update your reponse json							 
				array_push($response["acceptData"], $acceptData);	
			}
			
			//print_r($response);
			die(json_encode($response));
		}
		else
		{
			$response["success"] = 0;  		
			$response["message"] = "Pending...";
			die(json_encode($response));
		}		
	}
	else{
		$response["success"] = 0;
		$response["error"] = "Error, Record not created!";
		die(json_encode($response));
	}	
?>