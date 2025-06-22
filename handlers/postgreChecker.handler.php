<?php
require_once __DIR__ . '/../utils/envSetter.util.php'; // adjust path if needed

$host = $config['pg_host'];
$port = $config['pg_port'];
$username = $config['pg_user'];
$password = $config['pg_pass'];
$dbname = $config['pg_db'];

$conn_string = "host=$host port=$port dbname=$dbname user=$username password=$password";

$dbconn = pg_connect($conn_string);

if (!$dbconn) {
    echo "❌ Connection Failed: " . pg_last_error() . "  <br>";
    exit();
} else {
    echo "✔️ PostgreSQL Connection  <br>";
    pg_close($dbconn);
}
