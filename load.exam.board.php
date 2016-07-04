<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_exam_board.exam_board_id,tblsystem_exam_board.exam_board_name FROM tblsystem_exam_board"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Town Found";
		$response["examData"] = array();

		while($row=$rs->fetch_array())
		{
			$examData = array();
			$examData["exam_board_id"] = $row["exam_board_id"];
			$examData["exam_board_name"] = $row["exam_board_name"];
			
			// update your reponse json							 
			array_push($response["examData"], $examData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Board Details not found";
		die(json_encode($response));
	}
?>