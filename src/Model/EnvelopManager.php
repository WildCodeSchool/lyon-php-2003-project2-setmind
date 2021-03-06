<?php

namespace App\Model;

class EnvelopManager extends AbstractManager
{
    const TABLE = "envelop";

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectAllWithParts()
    {
        $query = "select envelop.name as name, pbody.visual as body_visual, phemlet.visual as hemlet_visual, 
       plarm.visual as larm_visual,prarm.visual as rarm_visual, plleg.visual as lleg_visual, 
       prleg.visual as rleg_visual, pbattery.visual as battery_visual, pbrain.visual as brain_visual, 
       plleg.speed + prleg.speed as speed, plarm.strenght + prarm.strenght as strenght, 
       pbattery.capacity as capacity, pbrain.setmind as setmind, envelop.id as id
from envelop
    join parts pbody on envelop.parts_id_body = pbody.id
    join parts phemlet on envelop.parts_id_hemlet = phemlet.id
    join parts plarm on envelop.parts_id_left_arm = plarm.id
    join parts prarm on envelop.parts_id_right_arm = prarm.id
    join parts plleg on envelop.parts_id_left_leg = plleg.id
    join parts prleg on envelop.parts_id_right_leg = prleg.id
    join parts pbattery on envelop.parts_id_battery = pbattery.id
    join parts pbrain on envelop.parts_id_brain = pbrain.id
";

        $statement = $this->pdo->prepare($query);
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function duplicateById($id): bool
    {
        $query = "INSERT INTO " . self::TABLE . "(name, parts_id_body, parts_id_battery, parts_id_brain, 
                  parts_id_hemlet, parts_id_left_arm, parts_id_right_arm, parts_id_left_leg,parts_id_right_leg)
                  SELECT  name, parts_id_body, parts_id_battery, parts_id_brain, parts_id_hemlet, parts_id_left_arm, 
                  parts_id_right_arm, parts_id_left_leg,parts_id_right_leg
                  FROM " . self::TABLE .
            " WHERE id=:id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
        return true;
    }

    public function delete(int $id)
    {
        $statement = $this->pdo->prepare("DELETE FROM " . self::TABLE . " WHERE id = :id");
        $statement->bindValue(':id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }

    public function selectOneWithPartsById(int $id)
    {
        $query = "select envelop.name as name, pbody.visual as body_visual, phemlet.visual as hemlet_visual, 
       plarm.visual as larm_visual,prarm.visual as rarm_visual, plleg.visual as lleg_visual, 
       prleg.visual as rleg_visual, pbattery.visual as battery_visual, pbrain.visual as brain_visual, 
       plleg.speed + prleg.speed as speed, plarm.strenght + prarm.strenght as strenght, 
       pbattery.capacity as capacity, pbrain.setmind as setmind, envelop.id as id
from envelop
    join parts pbody on envelop.parts_id_body = pbody.id
    join parts phemlet on envelop.parts_id_hemlet = phemlet.id
    join parts plarm on envelop.parts_id_left_arm = plarm.id
    join parts prarm on envelop.parts_id_right_arm = prarm.id
    join parts plleg on envelop.parts_id_left_leg = plleg.id
    join parts prleg on envelop.parts_id_right_leg = prleg.id
    join parts pbattery on envelop.parts_id_battery = pbattery.id
    join parts pbrain on envelop.parts_id_brain = pbrain.id
WHERE envelop.id = $id
";

        $statement = $this->pdo->prepare($query);
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function selectWithPartsByIds(array $ids)
    {
        $query = "select envelop.name as name, pbody.visual as body_visual, phemlet.visual as hemlet_visual, 
       plarm.visual as larm_visual,prarm.visual as rarm_visual, plleg.visual as lleg_visual, 
       prleg.visual as rleg_visual, pbattery.visual as battery_visual, pbrain.visual as brain_visual, 
       plleg.speed + prleg.speed as speed, plarm.strenght + prarm.strenght as strenght, 
       pbattery.capacity as capacity, pbrain.setmind as setmind, envelop.id as id,pbody.name as body_name,
       phemlet.name as hemlet_name,  plarm.name as larm_name, prarm.name as rarm_name, prleg.name as rleg_name,
       plleg.name as lleg_name, pbattery.name as battery_name, pbrain.name as brain_name, 
       plleg.speed as left_speed, prleg.speed as right_speed, 
       plarm.strenght as left_strenght, prarm.strenght as right_strenght, envelop.date_creation as date_creation 
from envelop
    join parts pbody on envelop.parts_id_body = pbody.id
    join parts phemlet on envelop.parts_id_hemlet = phemlet.id
    join parts plarm on envelop.parts_id_left_arm = plarm.id
    join parts prarm on envelop.parts_id_right_arm = prarm.id
    join parts plleg on envelop.parts_id_left_leg = plleg.id
    join parts prleg on envelop.parts_id_right_leg = prleg.id
    join parts pbattery on envelop.parts_id_battery = pbattery.id
    join parts pbrain on envelop.parts_id_brain = pbrain.id
WHERE envelop.id IN (" . implode(',', $ids) . ")";
        $statement = $this->pdo->prepare($query);
        $statement->execute();
        return $statement->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function filterBy(string $column, string $stringFilter)
    {
        $query = "select envelop.name as name, pbody.visual as body_visual, phemlet.visual as hemlet_visual, 
       plarm.visual as larm_visual,prarm.visual as rarm_visual, plleg.visual as lleg_visual, 
       prleg.visual as rleg_visual, pbattery.visual as battery_visual, pbrain.visual as brain_visual, 
       plleg.speed + prleg.speed as speed, plarm.strenght + prarm.strenght as strenght, 
       pbattery.capacity as capacity, pbrain.setmind as setmind, envelop.id as id
from envelop
    join parts pbody on envelop.parts_id_body = pbody.id
    join parts phemlet on envelop.parts_id_hemlet = phemlet.id
    join parts plarm on envelop.parts_id_left_arm = plarm.id
    join parts prarm on envelop.parts_id_right_arm = prarm.id
    join parts plleg on envelop.parts_id_left_leg = plleg.id
    join parts prleg on envelop.parts_id_right_leg = prleg.id
    join parts pbattery on envelop.parts_id_battery = pbattery.id
    join parts pbrain on envelop.parts_id_brain = pbrain.id
WHERE " . "envelop." .$column . " like '%" . $stringFilter . "%' ORDER BY name DESC";
        //$queryString = "SELECT * FROM  $this->table WHERE " . $column . " like '%" . $stringFilter . "%' ORDER BY
        // name DESC";
        return $this->pdo->query($query)->fetchAll();
    }

    public function selectBy(string $column, string $order)
    {
        $query = "select envelop.name as name, pbody.visual as body_visual, phemlet.visual as hemlet_visual, 
       plarm.visual as larm_visual,prarm.visual as rarm_visual, plleg.visual as lleg_visual, 
       prleg.visual as rleg_visual, pbattery.visual as battery_visual, pbrain.visual as brain_visual, 
       plleg.speed + prleg.speed as speed, plarm.strenght + prarm.strenght as strenght, 
       pbattery.capacity as capacity, pbrain.setmind as setmind, envelop.id as id
from envelop
    join parts pbody on envelop.parts_id_body = pbody.id
    join parts phemlet on envelop.parts_id_hemlet = phemlet.id
    join parts plarm on envelop.parts_id_left_arm = plarm.id
    join parts prarm on envelop.parts_id_right_arm = prarm.id
    join parts plleg on envelop.parts_id_left_leg = plleg.id
    join parts prleg on envelop.parts_id_right_leg = prleg.id
    join parts pbattery on envelop.parts_id_battery = pbattery.id
    join parts pbrain on envelop.parts_id_brain = pbrain.id
order by $column $order
";
        return $this->pdo->query($query)->fetchAll();
    }
}
