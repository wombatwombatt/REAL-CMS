<?php
declare(strict_types = 1);
require_once 'includes/database-connection.php';
require_once 'includes/functions.php';

$sql        = "SELECT id, name FROM category WHERE navigation = 1;";
$navigation = pdo($pdo, $sql)->fetchAll();
$section     = '';
$title       = 'Search - RaccoonArcade';
$description = 'Search for games in the RaccoonArcade store.';

$search   = trim(filter_input(INPUT_GET, 'search', FILTER_SANITIZE_SPECIAL_CHARS) ?? '');
$articles = [];

if ($search) {
    $sql = "SELECT a.id, a.title, a.summary, a.created, a.category_id,
                   c.name  AS category,
                   COALESCE(i.file, 'blank.png') AS image_file,
                   COALESCE(i.alt,  a.title)      AS image_alt
              FROM article a
              JOIN category c ON a.category_id = c.id
         LEFT JOIN image    i ON a.image_id    = i.id
             WHERE a.published = 1
               AND (a.title   LIKE :search
                OR  a.summary LIKE :search
                OR  a.content LIKE :search)
          ORDER BY a.title ASC;";
    $articles = pdo($pdo, $sql, ['search' => '%' . $search . '%'])->fetchAll();
}
?>
<?php require_once 'includes/header.php'; ?>
  <main class="container" id="content">
    <div class="header">
      <h1>Search</h1>
    </div>

    <form action="search.php" method="get" class="form-search" role="search">
      <label for="search">
        <span>Search for a game:</span>
      </label>
      <input type="text" id="search" name="search"
             value="<?= html_escape($search) ?>"
             placeholder="e.g. Minecraft, RPG, survival..."
             class="form-control">
      <input type="submit" value="Search" class="btn btn-primary">
    </form>

    <?php if ($search) { ?>
      <?php if ($articles) { ?>
        <p><?= count($articles) ?> result<?= count($articles) !== 1 ? 's' : '' ?> for
           <strong><?= html_escape($search) ?></strong></p>
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
      <?php } else { ?>
        <p>No results found for <strong><?= html_escape($search) ?></strong>. Try a different search term.</p>
      <?php } ?>
    <?php } ?>
  </main>
<?php require_once 'includes/footer.php'; ?>
