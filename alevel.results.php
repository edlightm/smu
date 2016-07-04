<?php
	$post = json_decode(file_get_contents("php://input"), true);
	
	/*$response["success"] = 1;
	$response["message"] = "You are here now!";
	$response["feedData"] = array();
	$feedData = array();
	$feedData = $post;
	array_push($response["feedData"], $feedData);
	die(json_encode($response));*/
		
	
	$uid = $post['uid'];
	
	if(empty($uid))
	{
		session_start();
    	$uid = $_SESSION["uid"];
	}
	
	$emboard = $post['emboard'];
	$subject = $post['subject'];
	$examresults = $post['examresults'];
	$level = $post['level'];
		
	
	include("opendb.php");
	
	$query = "INSERT INTO tblapplicant_qualifications (applicant_id,exam_level_id,exam_board_id,subject_id,subject_result) VALUES ('$uid','$level','$emboard','$subject','$examresults')"; 	
	if($db->query($query)){
		
		//add to tracking
		$query = "UPDATE applicant_registration_tracking SET alevel = 1 WHERE applicant_id = '$uid'";		
		$db->query($query);
	
		$response["success"] = 1;
		$response["message"] = "Subject successfully added";
		$response["uid"] = $uid;
		// update your reponse json							 
		//array_push($response["feedData"], $feedData);
		die(json_encode($response));
	}
	else{
		$response["success"] = 0;
		$response["message"] = "Subject Failed";
		$response["uid"] = $uid;
		// update your reponse json							 
		//array_push($response["feedData"], $feedData);
		die(json_encode($response));
	}
?>