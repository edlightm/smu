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
				tblapplicant_qualifications.applicant_qualification_id,
				tblapplicant_qualifications.applicant_id,
				tblapplicant_qualifications.exam_level_id,
				tblsystem_exam_board.exam_board_name,
				tblsystem_subject.subject_name,
				tblsystem_result_weight.result_name,
				tblsystem_result_weight.result_weight
				FROM
				tblapplicant_qualifications
				INNER JOIN tblsystem_exam_board ON tblsystem_exam_board.exam_board_id = tblapplicant_qualifications.exam_board_id
				INNER JOIN tblsystem_subject ON tblsystem_subject.subject_id = tblapplicant_qualifications.subject_id
				INNER JOIN tblsystem_result_weight ON tblsystem_result_weight.result_id = tblapplicant_qualifications.subject_result
				WHERE
				tblapplicant_qualifications.applicant_id = '$uid' and tblapplicant_qualifications.exam_level_id = 2"; 
					
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Town Found";
		$response["resultsData"] = array();

		while($row=$rs->fetch_array())
		{
			$resultsData = array();
			$resultsData["applicant_qualification_id"] = $row["applicant_qualification_id"];
			$resultsData["exam_level"] = "A-LEVEL";
			$resultsData["exam_board_name"] = $row["exam_board_name"];
			$resultsData["subject_name"] = $row["subject_name"];
			$resultsData["result_name"] = $row["result_name"];
			
			// update your reponse json							 
			array_push($response["resultsData"], $resultsData);	
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