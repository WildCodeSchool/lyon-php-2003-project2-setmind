<?php

namespace App\Controller;

class QuestionnaireController extends AbstractController
{


    /**
     * Display item listing
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function questionnaire()
    {
        return $this->twig->render('Questionnaire/questionnaire.html.twig');
    }
}
