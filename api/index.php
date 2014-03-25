<?php

define('WWW_ROOT', dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR);

require_once WWW_ROOT . 'dao' . DIRECTORY_SEPARATOR . 'ScoresDAO.php';
require_once WWW_ROOT . 'api' . DIRECTORY_SEPARATOR . 'Slim' . DIRECTORY_SEPARATOR . 'Slim.php';

\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

$scoresDAO = new ScoresDAO();

function wrapJSON($array) {
    header('Content-Type:application/json');
    print json_encode($array);
    exit;
}

$app->get('/scores/?', function () use ($scoresDAO) {
    wrapJSON($scoresDAO->getScores());
});

$app->get('/scores/:id/?', function ($id) use ($scoresDAO) {
    wrapJSON($scoresDAO->getScore($id));
});

$app->post('/scores/?', function () use ($app, $scoresDAO) {
    $post = $app->request->post();
    if (empty($post)) {
        $post = (array)json_encode($app->request()->getBody());
    }
    wrapJSON($scoresDAO->insertScore($post['team_name'], $post['objects'], $post['time']));
});

$app->run();