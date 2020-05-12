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
        if (!isset($_SESSION["resultat"])) {
            $_SESSION["resultat"] = [];
        }
        $questionnaireManager = new QuestionnaireManager();
        if (!empty($_POST["reponse_choisie_id"])) {
            $arrayId = explode(" ", $_POST["reponse_choisie_id"]);
            array_push($_SESSION["resultat"], $arrayId[1]);
            if (in_array($arrayId[0], self::LASTANSWERS)) {
                header('Location: /envelop/resultat');
            } else {
                $question = $questionnaireManager->selectNextQuestion(intval($arrayId[0]));
                return $this->twig->render('Questionnaire/questionnaire.html.twig', ['question' => $question,
                    'resultat' => $_SESSION["resultat"]]);
            }
        }
        $defaultQuestion = 1;
        $question = $questionnaireManager->selectQuestion($defaultQuestion);
        return $this->twig->render('Questionnaire/questionnaire.html.twig', ['question' => $question]);
    }
}
