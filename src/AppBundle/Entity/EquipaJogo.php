<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity 
* @ORM\Table(name="EquipaJogo")
**/
class EquipaJogo 
{
	/**
    * @ORM\Id 
    * @ORM\ManyToOne(targetEntity="Jornada", inversedBy="EquipasJogo")
    * @ORM\JoinColumn(name="ID_Jornada", referencedColumnName="ID_Jornada")
    **/
    protected $Jornada;

    /**
    * @ORM\Id 
    * @ORM\ManyToOne(targetEntity="Entidade", inversedBy="EquipasJogo")
    * @ORM\JoinColumn(name="ID_Entidade", referencedColumnName="ID_Entidade")
    **/
    protected $Entidade;

    /**
    * @ORM\Column(name="TempoJogado", type="integer", options={"default": 0})
    * @Assert\Type(
    *     type="integer",
    *     message="O valor {{ value }} não é válido, tem que ser do tipo {{ type }}."
    * )
    * @Assert\GreaterThanOrEqual(
    *     value = 0,
    *     message = "O tempo jogado não pode ser inferior a 0 minutos."
    * )
    **/
    protected $TempoJogado;

    /**
    * Constructor
    */
     public function __construct()
     {
         $this->TempoJogado = 0;
     }

    /**
     * Set tempoJogado
     *
     * @param integer $tempoJogado
     *
     * @return EquipaJogo
     */
    public function setTempoJogado($tempoJogado)
    {
        $this->TempoJogado = $tempoJogado;

        return $this;
    }

    /**
     * Get tempoJogado
     *
     * @return integer
     */
    public function getTempoJogado()
    {
        return $this->TempoJogado;
    }

    /**
     * Set jornada
     *
     * @param \AppBundle\Entity\Jornada $jornada
     *
     * @return EquipaJogo
     */
    public function setJornada(\AppBundle\Entity\Jornada $jornada)
    {
        $this->Jornada = $jornada;

        return $this;
    }

    /**
     * Get jornada
     *
     * @return \AppBundle\Entity\Jornada
     */
    public function getJornada()
    {
        return $this->Jornada;
    }

    /**
     * Set entidade
     *
     * @param \AppBundle\Entity\Entidade $entidade
     *
     * @return EquipaJogo
     */
    public function setEntidade(\AppBundle\Entity\Entidade $entidade)
    {
        $this->Entidade = $entidade;

        return $this;
    }

    /**
     * Get entidade
     *
     * @return \AppBundle\Entity\Entidade
     */
    public function getEntidade()
    {
        return $this->Entidade;
    }
}
