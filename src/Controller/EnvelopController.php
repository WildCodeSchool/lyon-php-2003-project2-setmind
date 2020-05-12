<?php

namespace App\Controller;

use App\Model\EnvelopManager;
use App\Model\ProfilManager;


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
        $profilManager = new ProfilManager();
        $envelopManager = new EnvelopManager();
        // todo get list off id envelops from  profile and build array with ids.
        //$envelops = $envelopManager->selectOneWithPartsById(18);
        // pass ids in array for wanted envelops ids
        $resultValues = array_count_values($_SESSION["resultat"]);
        arsort($resultValues);
        $idProfil = array_slice(array_keys($resultValues), 0, 1, true);
        $profil = $profilManager->selectOneById($idProfil[0]);
        $envelops = $envelopManager->selectWithPartsByIds([18,12]);
        return $this->twig->render('Envelop/resultat.html.twig', ['envelops' => $envelops, 'profil' => $profil]);

    }

    public function myEnvelop()
    {
        if (!isset($_SESSION["user"])) {
            header("location:/login/login");
        }
        $userManager = new UserManager();
        $user2 = $userManager->selectOneWithPartsByIds($_SESSION["user"]["id"])[0];
        $envelopManager = new EnvelopManager();

        $envelops = $envelopManager->selectWithPartsByIds([$user2["envelop_id"]]);
        $envelop = $envelops[0];
        return $this->twig->render('Envelop/myenvelop.html.twig', ['envelop' => $envelop, 'user' => $user2]);
    }
}
