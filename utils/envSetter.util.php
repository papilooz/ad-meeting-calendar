<?php
require_once __DIR__ . '/../vendor/autoload.php'; // Adjust the path if needed

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../'); // Adjust path to where .env is
$dotenv->load();

$config = [
    'pg_host' => $_ENV['PG_HOST'],
    'pg_port' => $_ENV['PG_PORT'],
    'pg_db'   => $_ENV['PG_DB'],
    'pg_user' => $_ENV['PG_USER'],
    'pg_pass' => $_ENV['PG_PASS'],
    'mongo_uri' => $_ENV['MONGO_URI'],
    'mongo_db'  => $_ENV['MONGO_DB'],
];