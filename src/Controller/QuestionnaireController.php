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
        } elseif (empty($_SESSION["user"])) {
            header("location:/login/login");
        }

        if (!isset($_SESSION["resultat"])) {
            $_SESSION["resultat"] = [];
            $_SESSION["questionNumber"] = 1;
        }

        if (isset($_SESSION["user"])) {
            if ($_SESSION["user"]["envelop_id"] != 19) {
                header("location:/envelop/myenvelop/1");
            }
        }

        $questionnaireManager = new QuestionnaireManager();
        if (!empty($_POST["reponse_choisie_id"])) {
            $_SESSION["questionNumber"] += 1;
            $arrayId = explode(" ", $_POST["reponse_choisie_id"]);
            array_push($_SESSION["resultat"], $arrayId[1]);
            if (in_array($arrayId[0], self::LASTANSWERS)) {
                header('Location: /envelop/resultat');
            } else {
                $question = $questionnaireManager->selectNextQuestion(intval($arrayId[0]));
                return $this->twig->render('Questionnaire/questionnaire.html.twig', ['question' => $question,
                    'resultat' => $_SESSION["resultat"], 'questionNumber' => $_SESSION["questionNumber"]]);
            }
        }
        $defaultQuestion = 1;
        $question = $questionnaireManager->selectQuestion($defaultQuestion);
        return $this->twig->render('Questionnaire/questionnaire.html.twig', ['question' => $question,
            'questionNumber' => $_SESSION["questionNumber"]]);
    }
}
