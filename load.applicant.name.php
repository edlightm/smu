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
				tblapplicant.applicant_id,
				tblapplicant.applicant_number,
				tblapplicant.firstnames,
				tblapplicant.surname,
				tblapplicant.applicant_type_id,
				tblapplicant_contacts.mobile_number,
				tblapplicant_contacts.email_address
			  FROM
				tblapplicant
				INNER JOIN tblapplicant_contacts ON tblapplicant_contacts.applicant_id = tblapplicant.applicant_id
			  WHERE
				tblapplicant.applicant_id = '$uid'"; 	
	if($rs = $db->query($query))
	{
		$c = $rs->num_rows;
		
		if($c > 0)
		{
			//$response["success"] = 1;
			//$response["message"] = "Applicant Found";
			$response["applicantData"] = array();
	
			while($row=$rs->fetch_array())
			{
				$applicantData = array();
				$applicantData["applicant_id"] = $row["applicant_id"];
				$applicantData["applicant_number"] = $row["applicant_number"];
				$applicantData["firstnames"] = $row["firstnames"];
				$applicantData["surname"] = $row["surname"];
				$applicantData["mobile_number"] = $row["mobile_number"];
				$applicantData["email_address"] = $row["email_address"];
				
				// update your reponse json							 
				array_push($response["applicantData"], $applicantData);	
			}
			
			//print_r($response);
			die(json_encode($response));
		}
		else
		{
			$response["success"] = 0;  		
			$response["message"] = "Applicant Details not found";
			die(json_encode($response));
		}		
	}
	else{
		$response["success"] = 0;
		$response["error"] = "Error, Record not created!";
		die(json_encode($response));
	}	
?>