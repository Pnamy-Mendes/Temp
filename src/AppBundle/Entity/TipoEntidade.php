<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity 
* @ORM\Table(name="TipoEntidade")
**/
class TipoEntidade 
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_tipoentidade", type="integer") 
	* @ORM\GeneratedValue 
	**/
	protected $ID_tipoentidade;

	/**
	* @ORM\Column(name="Nome", type="string")
	**/
	protected $Nome;

    /**
     * Get iDTipoentidade
     *
     * @return integer
     */
    public function getIDTipoentidade()
    {
        return $this->ID_tipoentidade;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return TipoEntidade
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
