<?php
include '../conection.php';

$userName = $_POST['Username'];
$custEmail = $_POST['Cust_email'];
$custPassword = md5($_POST['Cust_password']);

$sqlQuery = "INSERT INTO Customer SET Username = '$userName', Cust_email = '$custEmail', Cust_password = '$custPassword'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery){
    echo jason_encode(array("success"=>true));
}
else
{
    echo jason_encode(array("success"=>false));
}