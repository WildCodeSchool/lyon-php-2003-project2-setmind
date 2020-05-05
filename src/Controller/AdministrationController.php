<?php


namespace App\Controller;

use App\Model\PartManager;

class AdministrationController extends AbstractController
{


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
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $partManager = new PartManager();
            $column = $_POST["selectFilterParts"];
            $searchString = $_POST["searchFilterParts"];
            $parts = $partManager->filterBy($column, $searchString);
            return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
        }
        return $this->twig->render('Administration/index.html.twig');
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
            //TODO implement here POST router for jquery/ajax live edit
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

    public function duplicate($id)
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

    public function uploadPartImage($id)
    {
        $errorsTrack = [];
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
                    return $this->index();
                }
            }

            if ($error === 1) {
                $errorsTrack[] = "Le fichier [" . $name . "] depasse la taille limite du serveur PHP
                        et a été refusé par le controle de validation.<br>";
            }
        } else {
            // message retourné a la XmlHttpRequest
            return "Unable to read send file , unknow problem";
        }
    }
}
