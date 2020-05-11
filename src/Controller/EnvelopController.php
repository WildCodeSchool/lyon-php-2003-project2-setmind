<?php

namespace App\Controller;

use App\Model\EnvelopManager;
use App\Model\UserManager;

class EnvelopController extends AbstractController
{
    /**
     * Display envelops page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */

    public function envelops()
    {
        $envelopManager = new EnvelopManager();
        $envelops = $envelopManager->selectAllWithParts();
        return $this->twig->render('Envelop/envelops.html.twig', ['envelops' => $envelops]);
    }


    public function resultat()
    {
        if (!isset($_SESSION["user"])) {
            header("location:/login/login");
        }
        // todo create profile manager
        $envelopManager = new EnvelopManager();
        // todo get list off id enveloppes from  prifile and build array with ids.
        //$envelops = $envelopManager->selectOneWithPartsById(18);
        // pass ids in array for wanted envelops ids
        $envelops = $envelopManager->selectWithPartsByIds([18,12]);

        return $this->twig->render('Envelop/resultat.html.twig', ['envelops' => $envelops]);
    }

    public function myEnvelop()
    {
        if (!isset($_SESSION["user"])) {
            header("location:/login/login");
        }
        $envelopManager = new EnvelopManager();
        $envelops = $envelopManager->selectWithPartsByIds([18]);
        $envelop=$envelops[0];
        $userManager = new UserManager();
        $user = $userManager->selectOneById($_SESSION["user"]["id"]);
        return $this->twig->render('Envelop/myenvelop.html.twig', ['envelop' => $envelop, 'user' => $user]);
    }
}
