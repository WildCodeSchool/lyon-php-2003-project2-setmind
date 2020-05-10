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

    public function selectOneByEmail(string $email) : array
    {
        $query = "SELECT * FROM " . self::TABLE . " WHERE email = :email";

        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":email", $email, \PDO::PARAM_STR);

        if ($statement->execute()) {
            return $statement->fetch();
        }
        return [];
    }
}
