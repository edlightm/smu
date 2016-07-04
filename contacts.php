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
	
	$mobile = $post['mobile'];
	$phone = $post['phone'];
	$email = $post['email'];
	$permanentaddress = $post['permanentaddress'];
	$permanentaddresstown = $post['permanentaddresstown'];
	$postaladdress = $post['postaladdress'];
	$postaladdresstown = $post['postaladdresstown'];
		
	
	include("opendb.php");
	
	//update applicant table
	$query = "UPDATE tblapplicant_contacts SET permanent_address = '$permanentaddress', permanent_address_town_id = '$permanentaddresstown', contact_address = '$postaladdress', contact_town_id = '$postaladdresstown', mobile_number = '$mobile', phone_number = '$phone', email_address = '$email' WHERE applicant_id = '$uid'";		
	$db->query($query);
	
	//add to tracking
	$query = "UPDATE applicant_registration_tracking SET contacts = 1 WHERE applicant_id = '$uid'";		
	$db->query($query);
		
	$response["success"] = 1;
	$response["message"] = "Contact details successfully updated";
	$response["uid"] = $uid;
	// update your reponse json							 
	//array_push($response["feedData"], $feedData);
	die(json_encode($response));	
?>