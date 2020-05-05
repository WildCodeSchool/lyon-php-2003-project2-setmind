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
       pbattery.capacity as capacity, pbrain.setmind as setmind
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

        $statement = $this-> pdo->prepare($query);
        $statement -> execute();

        return $statement->fetchAll(\PDO::FETCH_ASSOC);
    }
}
