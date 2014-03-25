<?php
require_once 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class ScoresDAO {
    public $pdo;

    public function __construct() {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function getScore($id) {
        $sql = "SELECT * FROM `scores` WHERE `id` = :id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":id", $id);
        if ($stmt->execute()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
        return array();
    }

    public function getScores() {
        $sql = "SELECT * FROM `scores`";
        $stmt = $this->pdo->prepare($sql);
        if ($stmt->execute()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        return array();
    }

    public function insertScore($name, $objects, $time) {
        $sql = "INSERT INTO `questions` (`team_name`, `objects`, `time`) VALUES (:name, :objects, :time)";
        $stmt = $this->pdo->prepare($sql);
        if ($stmt->execute()) {
            return $this->getScoreById($this->pdo->lastInsertId());
        }
        return array();
    }
}