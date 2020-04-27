<?php


namespace App\Model;

class PartManager extends AbstractManager
{
    const TABLE = "parts";

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function filterBy(string $column, string $stringFilter)
    {
        $queryString="SELECT * FROM  parts WHERE " . $column . " like '%" . $stringFilter  . "%' ORDER BY name DESC";
        return $this->pdo->query($queryString)->fetchAll();
    }


    public function selectByNameAsc()
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY name ASC")->fetchAll();
    }

    public function selectByNameDesc()
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY name DESC")->fetchAll();
    }

    public function selectByTypeDesc()
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY type DESC")->fetchAll();
    }

    public function selectByTypeAsc()
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY type ASC")->fetchAll();
    }

    public function selectByStrenghtDesc()
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY strenght DESC")->fetchAll();
    }

    public function selectByStrenghtAsc()
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY strenght ASC")->fetchAll();
    }

    public function selectBySpeedDesc()
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY speed DESC")->fetchAll();
    }

    public function selectBySpeedAsc()
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY speed ASC")->fetchAll();
    }
}
