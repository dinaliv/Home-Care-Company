<?php

$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "test";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if(!$conn){
    die("Connection Failed: ".mysqli_connect_error());
}

//check if dates are set
if (isset($_GET['startDate']) && isset($_GET['endDate'])) {
    $startDate = $_GET['startDate'];
    $endDate = $_GET['endDate'];

    $stmt = $conn->prepare("SELECT * FROM Client WHERE dataOfBirth BETWEEN ? AND ?");
    $stmt->bind_param("ss", $startDate, $endDate);
    $stmt->execute();
    $result = $stmt->get_result();

    //check if records were found
    if ($result->num_rows > 0) {
        //output data of each row
        echo "<table border='1'><tr><th>Client ID</th><th>Name</th><th>Date of Birth</th><th>Phone Number</th><th>Postal Code</th><th>City</th><th>Street</th><th>Client Type</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["clientID"] . "</td><td>" . $row["name"] . "</td><td>" . $row["dataOfBirth"] . "</td><td>" . $row["phoneNumber"] . "</td><td>" . $row["postalCode"] . "</td><td>" . $row["city"] . "</td><td>" . $row["street"] . "</td><td>" . $row["clientType"] . "</td></tr>";
        }
        echo "</table>";
    } else {
        echo "No records found";
    }

    $stmt->close();
} else {
    echo "Please provide a valid date range";
}

//html tag to go back
echo '<br><br><a href="index.html">Go back to Home Page</a>';

$conn->close();
?>
