<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity
* @ORM\Table(name="DocumentoEntidade")
**/
class DocumentoEntidade
{

	/**
	* @ORM\Id
	* @ORM\Column(name="ID_documento", type="integer")
	* @ORM\GeneratedValue
	**/
	protected $ID_documento;

	/**
	* @ORM\Column(name="descricao", type="string")
	**/
	protected $descricao;

  /**
	* @ORM\Column(name="ficheiro", type="string")
	**/
	protected $ficheiro;

    /**
    * @ORM\ManyToOne(targetEntity="Entidade")
    * @ORM\JoinColumn(name="REF_entidade", referencedColumnName="ID_Entidade")
    **/
    protected $entidade;

    /**
    * @ORM\ManyToOne(targetEntity="TipoDocumento")
    * @ORM\JoinColumn(name="REF_tipodocumento", referencedColumnName="ID_tipodocumento")
    **/
    protected $tipoDocumento;

    /**
     * Get iDDocumento
     *
     * @return integer
     */
    public function getIDDocumento()
    {
        return $this->ID_documento;
    }

    /**
     * Set descricao
     *
     * @param string $descricao
     *
     * @return DocumentoEntidade
     */
    public function setDescricao($descricao)
    {
        $this->descricao = $descricao;

        return $this;
    }

    /**
     * Get descricao
     *
     * @return string
     */
    public function getDescricao()
    {
        return $this->descricao;
    }

    /**
     * Set ficheiro
     *
     * @param string $ficheiro
     *
     * @return DocumentoEntidade
     */
    public function setFicheiro($ficheiro)
    {
        $this->ficheiro = $ficheiro;

        return $this;
    }

    /**
     * Get ficheiro
     *
     * @return string
     */
    public function getFicheiro()
    {
        return $this->ficheiro;
    }

    /**
     * Set entidade
     *
     * @param \AppBundle\Entity\Entidade $entidade
     *
     * @return DocumentoEntidade
     */
    public function setEntidade(\AppBundle\Entity\Entidade $entidade = null)
    {
        $this->entidade = $entidade;

        return $this;
    }

    /**
     * Get entidade
     *
     * @return \AppBundle\Entity\Entidade
     */
    public function getEntidade()
    {
        return $this->entidade;
    }

    /**
     * Set tipoDocumento
     *
     * @param \AppBundle\Entity\TipoDocumento $tipoDocumento
     *
     * @return DocumentoEntidade
     */
    public function setTipoDocumento(\AppBundle\Entity\TipoDocumento $tipoDocumento = null)
    {
        $this->tipoDocumento = $tipoDocumento;

        return $this;
    }

    /**
     * Get tipoDocumento
     *
     * @return \AppBundle\Entity\TipoDocumento
     */
    public function getTipoDocumento()
    {
        return $this->tipoDocumento;
    }
}
