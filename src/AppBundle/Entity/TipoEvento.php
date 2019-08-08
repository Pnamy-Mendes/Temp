<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity 
* @ORM\Table(name="TipoEvento")
**/
class TipoEvento 
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_Evento", type="integer") 
    * @ORM\GeneratedValue 
	**/
	protected $ID_Evento;

    /**
    * @ORM\Column(name="Nome", type="string")
    **/
    protected $Nome;

    /**
    * @ORM\OneToMany(targetEntity="JogadorEstatistica", mappedBy="Evento")
    */
    protected $JogadorStats;

    

    /**
     * Get iDEvento
     *
     * @return integer
     */
    public function getIDEvento()
    {
        return $this->ID_Evento;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return TipoEvento
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
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->JogadorStats = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add jogadorStat
     *
     * @param \AppBundle\Entity\JogadorEstatistica $jogadorStat
     *
     * @return TipoEvento
     */
    public function addJogadorStat(\AppBundle\Entity\JogadorEstatistica $jogadorStat)
    {
        $this->JogadorStats[] = $jogadorStat;

        return $this;
    }

    /**
     * Remove jogadorStat
     *
     * @param \AppBundle\Entity\JogadorEstatistica $jogadorStat
     */
    public function removeJogadorStat(\AppBundle\Entity\JogadorEstatistica $jogadorStat)
    {
        $this->JogadorStats->removeElement($jogadorStat);
    }

    /**
     * Get jogadorStats
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getJogadorStats()
    {
        return $this->JogadorStats;
    }
}
