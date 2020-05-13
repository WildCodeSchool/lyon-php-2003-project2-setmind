<?php

namespace App\Controller;

use App\Model\EnvelopManager;
use App\Model\ProfilEnvelopsManager;
use App\Model\ProfilManager;
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


    public function resultat(int $id = 5)
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
        if (empty($_SESSION["resultat"])) {
            $profil = $profilManager->selectOneById($id);
        } else {
            $resultValues = array_count_values($_SESSION["resultat"]);
            arsort($resultValues);
            $idProfil = array_slice(array_keys($resultValues), 0, 1, true);
            $profil = $profilManager->selectOneById($idProfil[0]);
        }
        //var_dump($_SESSION["resultat"]);
        //$profil = $profilManager->selectOneById($id);
        $profilEnvelops = new ProfilEnvelopsManager();
        $envelops = $profilEnvelops->selectByProfilId($profil["id"]);
        $envelopIds = [];
        foreach ($envelops as $envelop) {
            $envelopIds[]= $envelop["env"];
        }
        $envelops = $envelopManager->selectWithPartsByIds($envelopIds);
        return $this->twig->render('Envelop/resultat.html.twig', ['envelops' => $envelops,
            'profil' => $profil, "page" => "resultat"]);
    }

    public function myEnvelop()
    {
        if (!isset($_SESSION["user"])) {
            header("location:/login/login");
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!empty($_POST["idSelectedEnvelop"])) {
                $selectedEnvelop = $_POST["idSelectedEnvelop"];
                $userId = $_SESSION["user"]["id"];
                $userManager = new UserManager();
                $userManager->updateEnvelopId($userId, $selectedEnvelop);
            }
        }

        $userManager = new UserManager();
        $user2 = $userManager->selectOneWithPartsByIds($_SESSION["user"]["id"])[0];
        $envelopManager = new EnvelopManager();
        $envelops = $envelopManager->selectWithPartsByIds([$user2["envelop_id"]]);
        $envelop = $envelops[0];
        return $this->twig->render('Envelop/myenvelop.html.twig', ['envelop' => $envelop, 'user' => $user2]);
    }
}
