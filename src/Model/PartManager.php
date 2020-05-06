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
        $queryString = "SELECT * FROM  parts WHERE " . $column . " like '%" . $stringFilter . "%' ORDER BY name DESC";
        return $this->pdo->query($queryString)->fetchAll();
    }

    public function selectBy(string $column, string $order)
    {
        return $this->pdo->query('SELECT * FROM ' . $this->table . " ORDER BY $column $order")->fetchAll();
    }

    /**
     *
     * @param int $id
     */
    public function delete(int $id)
    {
        $statement = $this->pdo->prepare("DELETE FROM " . self::TABLE . " WHERE id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
        header("location:/administration/index");
    }

    /**
     * Duplicate a line by id
     *
     * @param int $id id for the line src
     *
     * @return array #list of all parts
     */
    public function duplicateById(int $id)
    {
        $query = "INSERT INTO " . self::TABLE . "(name, type, visual, color, special_ability, strenght, speed, 
                  capacity, setmind, `left`, `right`, bottom, top, center, grade, range_id)
                  SELECT  name, type, visual, color, special_ability, strenght, speed, capacity, setmind, `left`,
                  `right`, bottom, top, center, grade, range_id
                  FROM " . self::TABLE .
            " WHERE id=:id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
        header("location:/administration/index");
    }

    public function isDeletablePart($id): string
    {
        $queryString ="SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_battery
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_body
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_brain
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_hemlet
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_left_arm
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_left_leg
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_right_arm
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_right_leg
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN user AS U ON p.id = U.parts_id_right_leg
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN user AS U ON p.id = U.parts_id_right_arm
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_left_leg
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_left_arm
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_hemlet
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_brain
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_body
        WHERE p.id= " .$id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_battery
        WHERE p.id IS NOT NULL
        ORDER BY id";
        $val = $this->pdo->query($queryString)->fetchAll();
        if (empty($val)) {
            return "false";
        } else {
            return "true";
        }
    }

    public function updateVisualById($idVal, $newValue)
    {
        $query ="UPDATE parts SET visual=:newValue WHERE id=:idVal";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":idVal", $idVal, \PDO::PARAM_INT);
        $statement->bindValue(":newValue", $newValue, \PDO::PARAM_STR);
        $statement->execute();
        header("location:/administration/index");
    }
}
