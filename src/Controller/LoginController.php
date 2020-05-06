<?php

namespace App\Controller;

use App\Model\LoginManager;

class LoginController extends AbstractController
{

    /**
     * Display item listing
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function connexion()
    {
        if ($_POST) {
            if (!empty($_POST)) {
                $loginManager = new LoginManager();
                $user = [
                    'first_name' => $_POST['first_name'],
                    'last_name' => $_POST['last_name'],
                    'email' => $_POST['email'],
                    'password' => $_POST['password']
                ];
                $loginManager->signUp($user);
                return $this->twig->render('Login/connexion.html.twig', ['user' => $user]);
            }
        } else {
            return $this->twig->render('Login/connexion.html.twig');
        }
    }

    /*public function addUser()
    {

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $loginManager = new LoginManager();
            $user = [
                'first_name' => $_POST['first_name'],
                'last_name' => $_POST['last_name'],
                'email' => $_POST['email'],
                'password' => $_POST['password']
            ];
            $loginManager->signUp($user);
            return $this->twig->render('Login/connexion.html.twig', ['user' => $user]);
        }
    }*/
}
