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
        $parts = $partManager->duplicateById($id);
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function duplicate($id)
    {
        $partManager = new PartManager();
        $parts = $partManager->duplicateById($id);
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }
}
