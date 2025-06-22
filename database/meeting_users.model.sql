CREATE TABLE IF NOT EXISTS meeting_users (
    meeting_id INTEGER NOT NULL REFERENCES meetings(id),
    user_id INTEGER NOT NULL REFERENCES users(id),
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (meeting_id, user_id)
);
echo "Applying schema from database/user.model.sql…\n";

$sql = file_get_contents('database/user.model.sql');

if ($sql === false) {
  throw new RuntimeException("Could not read database/user.model.sql");
} else {
  echo "Creation Success from database/user.model.sql\n";
}

$pdo->exec($sql);
echo "Truncating tables…\n";
foreach (['meeting_users', 'tasks', 'meetings', 'users'] as $table) {
  $pdo->exec("TRUNCATE TABLE {$table} RESTART IDENTITY CASCADE;");
}
