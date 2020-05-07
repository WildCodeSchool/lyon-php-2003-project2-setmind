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
class LoginManager extends AbstractManager
{
    /**
     *
     */
    const TABLE = 'user';

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }


    /**
     * @param array $user
     */
    public function signUp(array $user) : void
    {
        // prepared request
        $query = "INSERT INTO " . self::TABLE . " (first_name, last_name, email, password) VALUES (:first_name,
         :last_name, :email, :password)";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('first_name', $user['first_name'], \PDO::PARAM_STR);
        $statement->bindValue('last_name', $user['last_name'], \PDO::PARAM_STR);
        $statement->bindValue('email', $user['email'], \PDO::PARAM_STR);
        $statement->bindValue('password', $user['password'], \PDO::PARAM_STR);
        $statement->execute();
    }
}
