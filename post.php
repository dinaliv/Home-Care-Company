<?php

$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "test";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if(!$conn){
    die("Connection Failed: ".mysqli_connect_error());
}

//check if action is delete
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'delete') {
    $clientID = intval($_POST['clientID']);

    //DELETE query
    $stmt = $conn->prepare("DELETE FROM Client WHERE clientID = ?");
    $stmt->bind_param("i", $clientID);

    if ($stmt->execute()) {
        echo "Record deleted successfully";
    } else {
        echo "Error deleting record: " . $conn->error;
    }

    $stmt->close();
}
//or if action is update
else if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'update') {
    $clientID = intval($_POST['clientID']);
    $name = $_POST['name'];
    $dataOfBirth = $_POST['dataOfBirth'];
    $phoneNumber = $_POST['phoneNumber'];
    $postalCode = $_POST['postalCode'];
    $city = $_POST['city'];
    $street = $_POST['street'];
    $clientType = $_POST['clientType'];

    //UPDATE query
    $stmt = $conn->prepare("UPDATE Client SET name = ?, dataOfBirth = ?, phoneNumber = ?, postalCode = ?, city = ?, street = ?, clientType = ? WHERE clientID = ?");
    $stmt->bind_param("sssssssi", $name, $dataOfBirth, $phoneNumber, $postalCode, $city, $street, $clientType, $clientID);

    if ($stmt->execute()) {
        echo "Record updated successfully";
    } else {
        echo "Error updating record: " . $stmt->error;
    }

    $stmt->close();
}
//otherwise add a client
else {
    $name = $_POST['name'];
    $dataOfBirth = $_POST['dataOfBirth'];
    $phoneNumber = $_POST['phoneNumber'];
    $postalCode = $_POST['postalCode'];
    $city = $_POST['city'];
    $street = $_POST['street'];
    $clientType = $_POST['clientType'];

    //INSERT query
    $stmt = $conn->prepare("INSERT INTO Client (name, dataOfBirth, phoneNumber, postalCode, city, street, clientType) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssss", $name, $dataOfBirth, $phoneNumber, $postalCode, $city, $street, $clientType);

    if ($stmt->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

//html tag to go back
echo '<br><br><a href="index.html">Go back to Home Page</a>';

$conn->close();
?>

