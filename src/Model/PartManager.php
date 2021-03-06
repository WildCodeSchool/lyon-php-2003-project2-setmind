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

    public function isDeletablePartOld($id): string
    {
        $queryString = "SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_battery
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_body
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_brain
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_hemlet
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_left_arm
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_left_leg
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_right_arm
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN envelop AS E ON p.id = E.parts_id_right_leg
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN user AS U ON p.id = U.parts_id_right_leg
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
        JOIN user AS U ON p.id = U.parts_id_right_arm
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_left_leg
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_left_arm
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_hemlet
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_brain
        WHERE p.id= " . $id . "
        UNION
        SELECT DISTINCT p.id, p.name
        FROM parts AS p
                 JOIN user AS U ON p.id = U.parts_id_body
        WHERE p.id= " . $id . "
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

    public function isDeletablePart($id)
    {
        $query = "select envelop . id as id, envelop . name as name
from envelop
WHERE parts_id_battery =$id
        or parts_id_body =$id
        or parts_id_brain =$id
        or parts_id_hemlet =$id
        or parts_id_left_arm =$id
        or parts_id_left_leg =$id
        or parts_id_right_arm =$id
        or parts_id_right_leg =$id
UNION
select user . envelop_id as id, user . email as name
from user
WHERE parts_id_battery =$id
        or parts_id_body =$id
        or parts_id_brain =$id
        or parts_id_hemlet =$id
        or parts_id_left_arm =$id
        or parts_id_left_leg =$id
        or parts_id_right_arm =$id
        or parts_id_right_leg =$id";
        $val = $this->pdo->query($query)->fetchAll();
        if (empty($val)) {
            return "false";
        } else {
            return "true";
        }
    }

    public function updateVisualById($idVal, $newValue)
    {
        $query = "UPDATE parts SET visual=:newValue WHERE id=:idVal";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":idVal", $idVal, \PDO::PARAM_INT);
        $statement->bindValue(":newValue", $newValue, \PDO::PARAM_STR);
        $statement->execute();
    }

    public function updateCapacity(int $id, int $newValue): string
    {

        try {
            if ($newValue > 100) {
                return "[INSERT REFUSE] Max value is 100.";
            } elseif ($newValue < 0) {
                return "[INSERT REFUSE] Min value is 0.";
            }
            $query = "UPDATE parts SET capacity=:newValue WHERE id=:idVal";
            $statement = $this->pdo->prepare($query);
            $statement->bindValue(":idVal", $id, \PDO::PARAM_INT);
            $statement->bindValue(":newValue", $newValue, \PDO::PARAM_INT);
            $statement->execute();
            return "OK";
        } catch (\Exception $e) {
            return "[INSERT REFUSE] unkno error";
        }
    }

    public function updateSetmind(int $id, int $newValue): string
    {
        if ($newValue > 100) {
            return "[INSERT REFUSE] Max value is 100.";
        } elseif ($newValue < 0) {
            return "[INSERT REFUSE] Min value is 0.";
        }
        $query = "UPDATE parts SET setmind=:newValue WHERE id=:idVal";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":idVal", $id, \PDO::PARAM_INT);
        $statement->bindValue(":newValue", $newValue, \PDO::PARAM_INT);
        $statement->execute();
        return "OK";
    }

    public function updateSpeed(int $id, int $newValue): string
    {
        if ($newValue > 50) {
            return "[INSERT REFUSE] Max value is 50.";
        } elseif ($newValue < 0) {
            return "[INSERT REFUSE] Min value is 0.";
        }
        $query = "UPDATE parts SET speed=:newValue WHERE id=:idVal";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":idVal", $id, \PDO::PARAM_INT);
        $statement->bindValue(":newValue", $newValue, \PDO::PARAM_INT);
        $statement->execute();
        return "OK";
    }

    public function updateStrenght(int $id, int $newValue): string
    {
        if ($newValue > 50) {
            return "[INSERT REFUSE] Max value is 50.";
        } elseif ($newValue < 0) {
            return "[INSERT REFUSE] Min value is 0.";
        }
        $query = "UPDATE parts SET strenght=:newValue WHERE id=:idVal";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":idVal", $id, \PDO::PARAM_INT);
        $statement->bindValue(":newValue", $newValue, \PDO::PARAM_INT);
        $statement->execute();
        return "OK";
    }
}
