<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity @ORM\Table(name="TipoREL")
**/
class TipoREL
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_tiporel", type="integer") 
	* @ORM\GeneratedValue 
	**/
	protected $ID_tiporel;

	/**
	* @ORM\Column(name="Nome", type="string")
	**/
	protected $Nome;

    /**
     * Get iDTiporel
     *
     * @return integer
     */
    public function getIDTiporel()
    {
        return $this->ID_tiporel;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return TipoREL
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
