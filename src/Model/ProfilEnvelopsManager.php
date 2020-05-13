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
     * liste des envelops ou la parts est presente
     */
    public function selectByProfilId(int $profilId): array
    {
        $statement = $this->pdo->prepare("SELECT envelop_id as env FROM $this->table WHERE profil_id=:id");
        $statement->bindValue('id', $profilId, \PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll(\PDO::FETCH_ASSOC);
    }

    /**
     * liste des profil ou  l'envelope est presente
     */
    public function selectByEnvelopId(int $envelopId): string
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT * FROM $this->table WHERE envelop_id=:id");
        $statement->bindValue('id', $envelopId, \PDO::PARAM_INT);
        $statement->execute();
        $val = $statement->fetchAll(\PDO::FETCH_ASSOC);
        if (empty($val)) {
            return "false";
        } else {
            return "true";
        }
    }
}
