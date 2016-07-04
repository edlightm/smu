<?php
	//$post = json_decode(file_get_contents("php://input"), true);
		
	include("opendb.php");
	
	$query = "SELECT tblsystem_relationship.relationship_id,tblsystem_relationship.relationship_name FROM tblsystem_relationship"; 	
	$rs = $db->query($query);
	
	$c = $rs->num_rows;
	
	if($c > 0)
	{
		//$response["success"] = 1;
		//$response["message"] = "Relatioship Found";
		$response["relationData"] = array();

		while($row=$rs->fetch_array())
		{
			$relationData = array();
			$relationData["relationship_id"] = $row["relationship_id"];
			$relationData["relationship_name"] = $row["relationship_name"];
			
			// update your reponse json							 
			array_push($response["relationData"], $relationData);	
		}
		
		//print_r($response);
		die(json_encode($response));
	}
	else
	{
		$response["success"] = 0;  		
		$response["message"] = "Relation Details not found";
		die(json_encode($response));
	}
?>