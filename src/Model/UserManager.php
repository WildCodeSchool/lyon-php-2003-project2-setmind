<?php


namespace App\Model;

class UserManager extends AbstractManager
{
    const TABLE = "user";

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function delete(int $id)
    {
        $statement = $this->pdo->prepare("DELETE FROM " . self::TABLE . " WHERE id =: id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }

    public function selectOneByEmail(string $email)
    {
        $query = "SELECT * FROM " . self::TABLE . " WHERE email = :email";

        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":email", $email, \PDO::PARAM_STR);

        if ($statement->execute()) {
            return $statement->fetch();
        }
        return [];
    }

    public function selectOneWithPartsByIds(int $id)
    {
        $query = "select user.first_name as first_name,user.last_name as last_name, user.email as email, pbody.visual 
       as body_visual, phemlet.visual as hemlet_visual, 
       plarm.visual as larm_visual,prarm.visual as rarm_visual, plleg.visual as lleg_visual, 
       prleg.visual as rleg_visual, pbattery.visual as battery_visual, pbrain.visual as brain_visual, 
       plleg.speed + prleg.speed as speed, plarm.strenght + prarm.strenght as strenght, 
       pbattery.capacity as capacity, pbrain.setmind as setmind, user.id as id,pbody.name as body_name,
       phemlet.name as hemlet_name,  plarm.name as larm_name, prarm.name as rarm_name, prleg.name as rleg_name,
       plleg.name as lleg_name, pbattery.name as battery_name, pbrain.name as brain_name,
       plleg.speed as left_speed, prleg.speed as right_speed, 
       plarm.strenght as left_strenght, prarm.strenght as right_strenght,
       user.envelop_id as envelop_id
from user
    join parts pbody on user.parts_id_body = pbody.id
    join parts phemlet on user.parts_id_hemlet = phemlet.id
    join parts plarm on user.parts_id_left_arm = plarm.id
    join parts prarm on user.parts_id_right_arm = prarm.id
    join parts plleg on user.parts_id_left_leg = plleg.id
    join parts prleg on user.parts_id_right_leg = prleg.id
    join parts pbattery on user.parts_id_battery = pbattery.id
    join parts pbrain on user.parts_id_brain = pbrain.id
WHERE user.id = $id";
        $statement = $this->pdo->prepare($query);
        $statement->execute();
        return $statement->fetchAll(\PDO::FETCH_ASSOC);
    }
}
