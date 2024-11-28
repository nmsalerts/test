<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Latest Social Media Posts</title>
</head>
<body>
    <h1>Latest Twitter Posts</h1>
    <?php
    require "vendor/autoload.php";
    use Abraham\TwitterOAuth\TwitterOAuth;

    $consumerKey = 'YOUR_CONSUMER_KEY';
    $consumerSecret = 'YOUR_CONSUMER_SECRET';
    $accessToken = 'YOUR_ACCESS_TOKEN';
    $accessTokenSecret = 'YOUR_ACCESS_TOKEN_SECRET';

    $connection = new TwitterOAuth($consumerKey, $consumerSecret, $accessToken, $accessTokenSecret);
    $tweets = $connection->get("statuses/user_timeline", ["count" => 5, "tweet_mode" => "extended"]);

    if (isset($tweets->errors)) {
        echo "Error fetching tweets.";
    } else {
        foreach ($tweets as $tweet) {
            echo "<div>";
            echo "<p>{$tweet->full_text}</p>";
            echo "<p><small>{$tweet->created_at}</small></p>";
            echo "</div>";
        }
    }
    ?>

    <h1>Latest Instagram Posts</h1>
    <?php
    $accessToken = 'YOUR_INSTAGRAM_ACCESS_TOKEN';
    $userId = 'YOUR_INSTAGRAM_USER_ID';

    $url = "https://graph.instagram.com/$userId/media?fields=id,caption,media_url,timestamp&access_token=$accessToken";
    $response = file_get_contents($url);
    $data = json_decode($response, true);

    if (isset($data['error'])) {
        echo "Error fetching Instagram posts.";
    } else {
        $posts = array_slice($data['data'], 0, 5);
        foreach ($posts as $post) {
            echo "<div>";
            echo "<img src='{$post['media_url']}' alt='Instagram post' style='max-width: 500px;'>";
            echo "<p>{$post['caption']}</p>";
            echo "<p><small>{$post['timestamp']}</small></p>";
            echo "</div>";
        }
    }
    ?>
</body>
</html>

