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
        return $this->twig->render('Login/connexion.html.twig');
    }

    public function successSignUp()
    {
        return $this->twig->render('Login/successSignUp.html.twig');
    }

    public function addUser()
    {
        if (!empty($_POST)) {
            $error = [];
            $user = [];
            if (!empty($_POST['last_name'])) {
                $userLastName = trim($_POST['last_name']);
                $user['last_name'] = $userLastName;
            } else {
                $error['lastName'] = "Please insert your last name here!";
            }
            if (!empty($_POST['first_name'])) {
                $userFirstName = trim($_POST['first_name']);
                $user['first_name'] = $userFirstName;
            } else {
                $error['firstName'] = "Please insert your first name here!";
            }
            if (!empty($_POST['email'])) {
                if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                    $userEmail = $_POST['email'];
                    $user['email'] = $userEmail;
                } else {
                    $error['email'] = "Please insert a valid email format!";
                }
            } else {
                $error['email'] = "Please insert your email here!";
            }
            if (!empty($_POST['password'])) {
                if (empty($error)) {
                    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
                    $user['password'] = $password;
                } else {
                    $user['password'] = $_POST['password'];
                }
            } else {
                $error['password'] = "Please insert your password here!";
            }
            if (!empty($error)) {
                return $this->twig->render('Login/connexion.html.twig', ['error' => $error, 'user' => $user]);
            } else {
                $loginManager = new LoginManager();
                $loginManager->signUp($user);
                header('Location: ./successSignUp');
            }
        }
    }
}
