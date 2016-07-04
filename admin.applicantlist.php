<?php
	$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT
				tblapplicant.applicant_id,
				tblapplicant.applicant_number,
				tblapplicant.firstnames,
				tblapplicant.surname,
				tblapplicant.applicant_type_id,
				tblapplicant.previous_regnumber,
				tblapplicant_personal.date_of_birth,
				tblapplicant_personal.national_id,
				tblapplicant_personal.nationality_other,
				tblapplicant_personal.place_of_birth_other,
				tblapplicant_personal.citizenship,
				tblapplicant_personal.passport_number,
				tblapplicant_personal.permanent_resident,
				tblsystem_marital_status.marital_status_name,
				tblsystem_religion.religion_name,
				tblsystem_sex.sex_name,
				tblsystem_title.title_name,
				tblsystem_nationality.nationality_name
				FROM
				tblapplicant
				LEFT OUTER JOIN tblapplicant_personal ON tblapplicant_personal.applicant_id = tblapplicant.applicant_id
				LEFT OUTER JOIN tblsystem_marital_status ON tblsystem_marital_status.marital_status_id = tblapplicant_personal.marital_status_id
				LEFT OUTER JOIN tblsystem_religion ON tblsystem_religion.religion_id = tblapplicant_personal.religion_id
				LEFT OUTER JOIN tblsystem_sex ON tblsystem_sex.sex_id = tblapplicant_personal.sex_id
				LEFT OUTER JOIN tblsystem_title ON tblsystem_title.title_id = tblapplicant_personal.title_id
				LEFT OUTER JOIN tblsystem_nationality ON tblsystem_nationality.nationality_id = tblapplicant_personal.nationality_id"; 	
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
				//$applicantData["mobile_number"] = $row["mobile_number"];
				//$applicantData["email_address"] = $row["email_address"];
				
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