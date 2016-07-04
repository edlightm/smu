<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_title.title_id,tblsystem_title.title_name FROM tblsystem_title"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Titles Found";
		$response["titleData"] = array();

		while($row=$rs->fetch_array())
		{
			$titleData = array();
			$titleData["title_id"] = $row["title_id"];
			$titleData["title_name"] = $row["title_name"];
			
			// update your reponse json							 
			array_push($response["titleData"], $titleData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Title Details not found";
		die(json_encode($response));
	}
?>