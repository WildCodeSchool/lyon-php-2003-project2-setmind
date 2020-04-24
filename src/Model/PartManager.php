<?php


namespace App\Model;

class PartManager extends AbstractManager
{
    const TABLE= "parts";

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }
}
