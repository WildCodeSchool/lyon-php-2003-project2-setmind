<?php

namespace App\Controller;

class QuestionnaireController extends AbstractController
{
    /**
     * Display envelops page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function Questionnaire_structure ()
    {
    return $this->twig->render('Questionnaire/Questionnaire_structure.html.twig');
    }
}

