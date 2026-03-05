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

$sql    = "SELECT id, forename, surname, joined,
                  COALESCE(picture, 'blank-member.png') AS picture
             FROM member
            WHERE id = :id;";
$member = pdo($pdo, $sql, ['id' => $id])->fetch();

if (!$member) {
    include 'page-not-found.php';
    exit;
}

$sql = "SELECT a.id, a.title, a.summary, a.created, a.category_id,
               c.name AS category,
               COALESCE(i.file, 'blank.png') AS image_file,
               COALESCE(i.alt,  a.title)      AS image_alt
          FROM article a
          JOIN category c ON a.category_id = c.id
     LEFT JOIN image    i ON a.image_id    = i.id
         WHERE a.member_id  = :id
           AND a.published  = 1
      ORDER BY a.created DESC;";
$articles = pdo($pdo, $sql, ['id' => $id])->fetchAll();

$section     = '';
$title       = $member['forename'] . ' ' . $member['surname'] . ' - RaccoonArcade';
$description = 'Games added by ' . $member['forename'] . ' ' . $member['surname'];
?>
<?php require_once 'includes/header.php'; ?>
  <main class="container" id="content">
    <div class="header">
      <img src="uploads/<?= html_escape($member['picture']) ?>"
           alt="<?= html_escape($member['forename'] . ' ' . $member['surname']) ?>">
      <h1><?= html_escape($member['forename'] . ' ' . $member['surname']) ?></h1>
      <p>Member since <?= format_date($member['joined']) ?></p>
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
        <p class="credit">
          In <a href="category.php?id=<?= $article['category_id'] ?>"><?= html_escape($article['category']) ?></a>
        </p>
      </article>
      <?php } ?>
    </div>
  </main>
<?php require_once 'includes/footer.php'; ?>
