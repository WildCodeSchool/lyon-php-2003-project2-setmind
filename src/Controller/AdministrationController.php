<?php


namespace App\Controller;

use App\Model\EnvelopManager;
use App\Model\PartManager;
use App\Model\UserManager;

class AdministrationController extends AbstractController
{

    public function __construct()
    {
        parent::__construct();
        if (!isset($_SESSION["user"])) {
            header("location:/login/login");
        }
        if ($_SESSION["user"]["administrator"] == 0) {
            header("location:/login/login");
        }
    }

    public function index()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectAll();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }


    /**
     *
     * @return string redered page built by twig render.
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function sort()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!empty($_POST["sortBy"])) {
                $columnName = $_POST["sortBy"];
                $orderBy = $_POST["orderBy"];
                $method = "selectBy";
                $partManager = new PartManager();
                if (method_exists($partManager, $method)) {
                    $parts = $partManager->{$method}($columnName, $orderBy);
                    return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
                } else {
                    $method = "selectAll";
                    $parts = $partManager->{$method}();
                    return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
                }
            }
        }
        $partManager = new PartManager();
        $parts = $partManager->selectAll();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }


    /**
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function filter()
    {
        $partManager = new PartManager();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST["selectFilterParts"])) {
                $column = $_POST["selectFilterParts"];
                $searchString = $_POST["searchFilterParts"];
                if (!empty($searchString)) {
                    $parts = $partManager->filterBy($column, $searchString);
                    return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
                } else {
                    $parts = $partManager->selectAll();
                    return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
                }
            }
        }
        $parts = $partManager->selectAll();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    /** TODO work inprogress scheduled implement in next feature
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function updateDataBySrcAjax()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $column = $_POST["column"];
            $id = $_POST["id"];
            $value = $_POST["value"];
            $partManager = new PartManager();
            $method = "update" . ucwords($column);
            if (method_exists($partManager, $method)) {
                $result = $partManager->{$method}($id, $value);
                return $result;
            } else {
                return "Cete demande ne peut pas etre prise en charge par le serveur.
                 Valeur : $value / id PHP : $id / column PHP : $column";
            }
        } else {
            // message retourné a la XmlHttpRequest
            return "Unable to read and parse send data, please send correct POST data";
        }
    }

    public function delete(int $id)
    {
        $partManager = new PartManager();
        $partManager->delete($id);
        return $this->index();
    }

    /**
     * Fontion intialle creer pour copier une PART , ne permet pas de copier une enveloppe ou user ou  question.
     *
     * @param int $id
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function duplicate(int $id)
    {
        $partManager = new PartManager();
        $parts = $partManager->duplicateById($id);
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function isDeletablePart($id): string
    {
        $partManager = new PartManager();
        $result = $partManager->isDeletablePart($id);
        return $result;
    }

    public function uploadPartImage(int $id)
    {
        // todo upgrade errors control and show errors on call  header
        $errorsTrack = []; // use for errors
        $sizeLimit = 1024000;
        $errorsTrack = [];
        $authExtentions = ["image/jpg", "image/jpeg", "image/png", "image/gif"];
        $fileRootPath = $_SERVER['DOCUMENT_ROOT'];
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            /* acquérir les infos sur la part traité */
            $partManager = new PartManager();
            $partInfos = $partManager->selectOneById($id);
            // acquérir les données sur le file recu
            $file = $_FILES['imgFile'];
            $error = $file["error"];
            $name = $file["name"];
            $tmpName = $file["tmp_name"];
            $typeMime = $file["type"];
            $size = $file["size"];
            $uniqIdForEndFileName = uniqid("", false);
            if ($error === 0) {
                // controle de la taille
                if ($size >= $sizeLimit) {
                    $errorsTrack[] = "Le fichier [" . $name . "] depasse la taille limite interne au  programme [ " .
                        $sizeLimit . "] et a été refusé . Taille [ " . $size . "].<br>";
                }
                // recupération de l'extention du  fichier passer en parametre
                $ext = pathinfo($name, PATHINFO_EXTENSION);
                // controle du  typê de fichier
                if (!in_array($typeMime, $authExtentions)) {
                    $errorsTrack[] = "Le fichier [" . $name . "] est de type MIME [" . $typeMime . "] . 
                        Ce type n'est authaurisé. <br>";
                } else {
                    $inSitelink = "/assets/images/parts/" . $partInfos["name"] . $uniqIdForEndFileName . "." . $ext;
                    move_uploaded_file($tmpName, $fileRootPath . $inSitelink);
                    $partManager->updateVisualById($id, $inSitelink);
                    // todo implement image delete ( visual ) if no envelops use it
                    header("location:/Administration/index");
                }
            }

            if ($error === 1) {
                $errorsTrack[] = "Le fichier [" . $name . "] depasse la taille limite du serveur PHP
                        et a été refusé par le controle de validation.<br>";
            }
        } else {
            // message retourné a la XmlHttpRequest
            header("location:/Administration/index");
        }
        header("location:/Administration/index");
    }

    public function envelops()
    {
        $envelopManager = new EnvelopManager();
        $envelops = $envelopManager->selectAllWithParts();
        return $this->twig->render('Administration/envelops.html.twig', ['envelops' => $envelops]);
    }

    public function duplicateEnvelop($id)
    {
        $envelopManager = new EnvelopManager();
        $envelopManager->duplicateById($id);
        header("location:/administration/envelops");
    }


    public function users()
    {
        $userManager = new UserManager();
        $users = $userManager->selectAll();
        return $this->twig->render('Administration/users.html.twig', ['users' => $users]);
    }

    public function deleteUser($id)
    {
        $userManager = new UserManager();
        $userManager->delete($id);
        header("location:/administration/users");
    }

    public function deleteEnvelop(int $id)
    {
        $envelopManager = new EnvelopManager();
        $envelopManager->delete($id);
        header("location:/administration/envelops");
    }
}
