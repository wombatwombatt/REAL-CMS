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

$sql = "SELECT a.id, a.title, a.summary, a.content, a.created, a.category_id, a.member_id,
               c.name  AS category,
               m.forename, m.surname, m.picture AS member_picture,
               COALESCE(i.file, 'blank.png') AS image_file,
               COALESCE(i.alt,  a.title)      AS image_alt
          FROM article a
          JOIN category c ON a.category_id = c.id
          JOIN member   m ON a.member_id   = m.id
     LEFT JOIN image    i ON a.image_id    = i.id
         WHERE a.id = :id
           AND a.published = 1;";
$article = pdo($pdo, $sql, ['id' => $id])->fetch();

if (!$article) {
    include 'page-not-found.php';
    exit;
}

$section     = $article['category_id'];
$title       = $article['title'];
$description = $article['summary'];
?>
<?php require_once 'includes/header.php'; ?>
  <main class="container article" id="content">
    <section class="text">
      <h1><?= html_escape($article['title']) ?></h1>
      <p class="credit">In <a href="category.php?id=<?= $article['category_id'] ?>"><?= html_escape($article['category']) ?></a></p>
      <span class="date"><?= format_date($article['created']) ?></span>
      <div class="content"><?= html_escape($article['content']) ?></div>
    </section>
    <aside>
      <img src="uploads/<?= html_escape($article['image_file']) ?>"
           alt="<?= html_escape($article['image_alt']) ?>">
      <p class="credit">
        By <a href="member.php?id=<?= $article['member_id'] ?? '' ?>"><?= html_escape($article['forename'] . ' ' . $article['surname']) ?></a>
      </p>
    </aside>
  </main>
<?php require_once 'includes/footer.php'; ?>
