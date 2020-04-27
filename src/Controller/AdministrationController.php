<?php


namespace App\Controller;

use App\Model\PartManager;

class AdministrationController extends AbstractController
{


    public function index()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectAll();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByNameAsc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByNameAsc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByNameDesc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByNameDesc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByTypeAsc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByTypeAsc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByTypeDesc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByTypeDesc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByStrenghtAsc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByStrenghtAsc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByStrenghtDesc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByStrenghtDesc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsBySpeedAsc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectBySpeedAsc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsBySpeedDesc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByTypeDesc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }
}
