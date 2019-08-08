<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity 
* @ORM\Table(name="Tamanho")
**/
class Tamanho 
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_Tamanho", type="integer") 
	* @ORM\GeneratedValue 
	**/
	protected $ID_Tamanho;

	/**
	* @ORM\Column(name="Nome", type="string")
	**/
	protected $Nome;

    /**
     * Get iDTamanho
     *
     * @return integer
     */
    public function getIDTamanho()
    {
        return $this->ID_Tamanho;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return Tamanho
     */
    public function setNome($nome)
    {
        $this->Nome = $nome;

        return $this;
    }

    /**
     * Get nome
     *
     * @return string
     */
    public function getNome()
    {
        return $this->Nome;
    }
}
