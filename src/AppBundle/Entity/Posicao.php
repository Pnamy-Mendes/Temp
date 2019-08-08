<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity 
* @ORM\Table(name="Posicao")
**/
class Posicao 
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_Posicao", type="integer") 
    * @ORM\GeneratedValue 
	**/
	protected $ID_Posicao;

    /**
    * @ORM\Column(name="Posicao", type="string")
    **/
    protected $Nome;

    

    /**
     * Get iDPosicao
     *
     * @return integer
     */
    public function getIDPosicao()
    {
        return $this->ID_Posicao;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return Posicao
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
