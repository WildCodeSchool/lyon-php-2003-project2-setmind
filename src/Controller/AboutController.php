<?php


namespace App\Controller;

class AboutController extends AbstractController
{
    public function about()
    {
        return $this->twig->render('About/about.html.twig');
    }
}
