<?php

namespace App\Controller;

use App\Model\QuestionnaireManager;

class QuestionnaireController extends AbstractController
{
    const LASTANSWERS = [9, 10, 11, 12, 28, 29, 30, 31, 46, 47, 48, 49, 54, 55, 56, 57];

    public function questionnaire()
    {
        if (!isset($_SESSION["user"])) {
            header("location:/login/login");
        }
        $questionnaireManager = new QuestionnaireManager();
        if (!empty($_POST["reponse_choisie_id"])) {
            if (in_array($_POST["reponse_choisie_id"], self::LASTANSWERS)) {
                header('Location: /envelop/resultat');
            } else {
                $question = $questionnaireManager->selectNextQuestion($_POST["reponse_choisie_id"]);
                return $this->twig->render('Questionnaire/questionnaire.html.twig', ['question' => $question]);
            }
        }
        $defaultQuestion = 1;
        $question = $questionnaireManager->selectQuestion($defaultQuestion);
        return $this->twig->render('Questionnaire/questionnaire.html.twig', ['question' => $question]);
    }
}
