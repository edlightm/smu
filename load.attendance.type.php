<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_attendance_type.attendance_type_id,tblsystem_attendance_type.attendance_type_name FROM tblsystem_attendance_type"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Town Found";
		$response["attendanceData"] = array();

		while($row=$rs->fetch_array())
		{
			$attendanceData = array();
			$attendanceData["attendance_type_id"] = $row["attendance_type_id"];
			$attendanceData["attendance_type_name"] = $row["attendance_type_name"];
			
			// update your reponse json							 
			array_push($response["attendanceData"], $attendanceData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Attendancy Details not found";
		die(json_encode($response));
	}
?>