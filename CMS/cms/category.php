<?php
declare(strict_types = 1);
require_once 'includes/database-connection.php';
require_once 'includes/functions.php';

$sql        = "SELECT id, name FROM category WHERE navigation = 1;";
$navigation = pdo($pdo, $sql)->fetchAll();

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if (!$id) {
    include 'page-not-found.php';
    exit;
}

$sql      = "SELECT id, name, description FROM category WHERE id = :id;";
$category = pdo($pdo, $sql, ['id' => $id])->fetch();

if (!$category) {
    include 'page-not-found.php';
    exit;
}

$sql = "SELECT a.id, a.title, a.summary, a.created, a.category_id,
               COALESCE(i.file, 'blank.png') AS image_file,
               COALESCE(i.alt,  a.title)      AS image_alt
          FROM article a
     LEFT JOIN image i ON a.image_id = i.id
         WHERE a.category_id = :id
           AND a.published = 1
      ORDER BY a.created DESC;";
$articles = pdo($pdo, $sql, ['id' => $id])->fetchAll();

$section     = $category['id'];
$title       = $category['name'] . ' - RaccoonArcade';
$description = $category['description'];
?>
<?php require_once 'includes/header.php'; ?>
  <main class="container" id="content">
    <div class="header">
      <h1><?= html_escape($category['name']) ?></h1>
      <p><?= html_escape($category['description']) ?></p>
    </div>
    <div class="grid">
      <?php foreach ($articles as $article) { ?>
      <article class="summary">
        <a href="article.php?id=<?= $article['id'] ?>">
          <img src="uploads/<?= html_escape($article['image_file']) ?>"
               alt="<?= html_escape($article['image_alt']) ?>">
          <h2><?= html_escape($article['title']) ?></h2>
          <p><?= html_escape($article['summary']) ?></p>
        </a>
      </article>
      <?php } ?>
    </div>
  </main>
<?php require_once 'includes/footer.php'; ?>
