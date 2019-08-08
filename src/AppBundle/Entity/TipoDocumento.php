<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity
* @ORM\Table(name="TipoDocumento")
**/
class TipoDocumento
{

	/**
	* @ORM\Id
	* @ORM\Column(name="ID_tipodocumento", type="integer")
	* @ORM\GeneratedValue
	**/
	protected $ID_tipodocumento;

	/**
	* @ORM\Column(name="Descricao", type="string")
	**/
	protected $Descricao;

    /**
     * Get iDTipodocumento
     *
     * @return integer
     */
    public function getIDTipodocumento()
    {
        return $this->ID_tipodocumento;
    }

    /**
     * Set descricao
     *
     * @param string $descricao
     *
     * @return TipoDocumento
     */
    public function setDescricao($descricao)
    {
        $this->Descricao = $descricao;

        return $this;
    }

    /**
     * Get descricao
     *
     * @return string
     */
    public function getDescricao()
    {
        return $this->Descricao;
    }
}
