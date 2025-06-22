CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    assigned_to INTEGER REFERENCES users(id),
    due_date TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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
