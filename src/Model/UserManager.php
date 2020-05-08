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
        $statement = $this->pdo->prepare("DELETE FROM " . self::TABLE . " WHERE id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }

    public function selectOneByEmail(string $email)
    {
        $statement = $this->pdo->prepare("SELECT * FROM $this->table WHERE email= :email");
        $statement->bindValue(':email', $email, \PDO::PARAM_INT);
        if ($statement->execute()) {
            return $statement->fetch();
        }
        return false;
    }
}
