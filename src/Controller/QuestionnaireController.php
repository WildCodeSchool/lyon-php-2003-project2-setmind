<?php

namespace App\Controller;

use App\Model\QuestionnaireManager;

class QuestionnaireController extends AbstractController
{
    public function questionnaire()
    {
        $questionnaireManager = new QuestionnaireManager();
        if (!empty($_POST["reponse_choisie_id"])) {
            $question = $questionnaireManager->selectNextQuestion($_POST["reponse_choisie_id"]);
            return $this->twig->render('Questionnaire/questionnaire.html.twig', ['question' => $question]);
        }
        $defaultQuestion = 1;
        $question = $questionnaireManager->selectQuestion($defaultQuestion);
        return $this->twig->render('Questionnaire/questionnaire.html.twig', ['question' => $question]);
    }
}
