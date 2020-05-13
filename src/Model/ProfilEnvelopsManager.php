<?php
/**
 * Created by PhpStorm.
 * User: sylvain
 * Date: 07/03/18
 * Time: 18:20
 * PHP version 7
 */

namespace App\Model;

/**
 *
 */
class ProfilEnvelopsManager extends AbstractManager
{
    /**
     *
     */
    const TABLE = 'profil_envelops';

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }


    /**
     *
     */
    public function selectByProfilId(int $profilId) : array
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT envelop_id as env FROM $this->table WHERE profil_id=:id");
        $statement->bindValue('id', $profilId, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll(\PDO::FETCH_ASSOC);
    }
}
