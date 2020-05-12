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
        $userManager = new UserManager();
        $user2 = $userManager->selectOneWithPartsByIds($_SESSION["user"]["id"])[0];
        $envelopManager = new EnvelopManager();
        //var_dump($user2);
        $envelops = $envelopManager->selectWithPartsByIds([12]);
        $envelop = $envelops[0];
        return $this->twig->render('Envelop/myenvelop.html.twig', ['envelop' => $envelop, 'user' => $user2]);
    }
}
