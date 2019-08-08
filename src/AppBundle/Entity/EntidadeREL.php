<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;


/**
* @ORM\Entity
* @ORM\Table(name="EntidadeREL")
**/
class EntidadeREL 
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_EntidadeRel", type="integer") 
	* @ORM\GeneratedValue 
	**/
	protected $ID_EntidadeRel;

	/**
    * @ORM\ManyToOne(targetEntity="Entidade")
    * @ORM\JoinColumn(name="ID_Entidade", referencedColumnName="ID_Entidade", onDelete="CASCADE")
    **/
	protected $ID_Entidade;

    /**
    * @ORM\ManyToOne(targetEntity="Entidade")
    * @ORM\JoinColumn(name="ID_EntidadeAssoc", referencedColumnName="ID_Entidade", onDelete="CASCADE")
    **/
    protected $ID_EntidadeAssoc;

    /**
    * @ORM\ManyToOne(targetEntity="TipoREL")
    * @ORM\JoinColumn(name="ID_EntidadeAssocTipo", referencedColumnName="ID_tiporel")
    **/
    protected $ID_EntidadeAssocTipo;

    /**
     * Get iDEntidadeRel
     *
     * @return integer
     */
    public function getIDEntidadeRel()
    {
        return $this->ID_EntidadeRel;
    }

    /**
     * Set iDEntidade
     *
     * @param \AppBundle\Entity\Entidade $iDEntidade
     *
     * @return EntidadeREL
     */
    public function setIDEntidade(\AppBundle\Entity\Entidade $iDEntidade = null)
    {
        $this->ID_Entidade = $iDEntidade;

        return $this;
    }

    /**
     * Get iDEntidade
     *
     * @return \AppBundle\Entity\Entidade
     */
    public function getIDEntidade()
    {
        return $this->ID_Entidade;
    }

    /**
     * Set iDEntidadeAssoc
     *
     * @param \AppBundle\Entity\Entidade $iDEntidadeAssoc
     *
     * @return EntidadeREL
     */
    public function setIDEntidadeAssoc(\AppBundle\Entity\Entidade $iDEntidadeAssoc = null)
    {
        $this->ID_EntidadeAssoc = $iDEntidadeAssoc;

        return $this;
    }

    /**
     * Get iDEntidadeAssoc
     *
     * @return \AppBundle\Entity\Entidade
     */
    public function getIDEntidadeAssoc()
    {
        return $this->ID_EntidadeAssoc;
    }

    /**
     * Set iDEntidadeAssocTipo
     *
     * @param \AppBundle\Entity\TipoREL $iDEntidadeAssocTipo
     *
     * @return EntidadeREL
     */
    public function setIDEntidadeAssocTipo(\AppBundle\Entity\TipoREL $iDEntidadeAssocTipo = null)
    {
        $this->ID_EntidadeAssocTipo = $iDEntidadeAssocTipo;

        return $this;
    }

    /**
     * Get iDEntidadeAssocTipo
     *
     * @return \AppBundle\Entity\TipoREL
     */
    public function getIDEntidadeAssocTipo()
    {
        return $this->ID_EntidadeAssocTipo;
    }
}
