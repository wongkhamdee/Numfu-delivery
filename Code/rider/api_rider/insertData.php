<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;

    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {

		$username = $_GET['username'];
		$password = $_GET['password'];
		$email = $_GET['email'];
		$lat = $_GET['lat'];
		$lng = $_GET['lng'];

		$sql = "INSERT INTO 'customer'('id', 'username', 'password', 'email', 'lat', 'lng') VALUES (null,'$username','$password','$email','$lat','$lng')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master UNG";

}
	mysqli_close($link);
?>
