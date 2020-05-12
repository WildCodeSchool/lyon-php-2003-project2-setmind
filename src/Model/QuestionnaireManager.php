<?php

namespace App\Model;

class QuestionnaireManager extends AbstractManager
{
    const TABLE = "answer";
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectQuestion(int $questionId)
    {
        $recuperationQuestion = "select question.contenu from question where question.id = $questionId";
        $nomQuestion = $this->pdo->query($recuperationQuestion)->fetchall()[0]["contenu"];
        $recuperationReponses = "select answer.id as id, answer.contenu as answer_c,
         answer.next_question_id as next_q, profil_id FROM $this->table WHERE question_id = $questionId";
        $reponses = $this->pdo->query($recuperationReponses)->fetchall();

        $question = array(
            "nom" => $nomQuestion,
            "reponses" => $reponses
        );
        return $question;
    }
    // Récupére la question suivante sur base d'une réponse
    public function selectNextQuestion(int $selectedAnswerId)
    {
        $questSuivanteId = "SELECT next_question_id 
        FROM answer WHERE answer.id = $selectedAnswerId";
        $resultatRequete = $this->pdo->query($questSuivanteId)->fetch();
        $questionSuivanteId = (int)$resultatRequete["next_question_id"];
        return $this->selectQuestion($questionSuivanteId);
    }
}
