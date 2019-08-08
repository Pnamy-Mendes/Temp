<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity 
* @ORM\Table(name="JogadorEstatistica")
**/
class JogadorEstatistica 
{
	/**
    * @ORM\Id 
    * @ORM\ManyToOne(targetEntity="Jornada", inversedBy="JogadorStats")
    * @ORM\JoinColumn(name="ID_Jornada", referencedColumnName="ID_Jornada")
    **/
    protected $Jornada;

    /**
    * @ORM\Id 
    * @ORM\ManyToOne(targetEntity="Entidade", inversedBy="JogadorStats")
    * @ORM\JoinColumn(name="ID_Entidade", referencedColumnName="ID_Entidade")
    **/
    protected $Entidade;

    /**
    * @ORM\Id 
    * @ORM\ManyToOne(targetEntity="TipoEvento", inversedBy="JogadorStats")
    * @ORM\JoinColumn(name="ID_Evento", referencedColumnName="ID_Evento")
    **/
    protected $Evento;

    /**
    * @ORM\Id 
    * @ORM\Column(name="Tempo", type="integer", nullable=true)
    * @Assert\Type(
    *     type="integer",
    *     message="O valor do campo Tempo tem de ser inteiro."
    * )
    * @Assert\GreaterThanOrEqual(
    *     value = 0,
    *     message = "O tempo jogado não pode ser inferior a 0 minutos."
    * )
    * @Assert\LessThanOrEqual(
    *     value = 120,
    *     message = "O tempo jogado não pode ultrapassar os 120 minutos."
    * )
    **/
    protected $Tempo;


    /**
     * Set tempo
     *
     * @param integer $tempo
     *
     * @return JogadorEstatistica
     */
    public function setTempo($tempo)
    {
        $this->Tempo = $tempo;

        return $this;
    }

    /**
     * Get tempo
     *
     * @return integer
     */
    public function getTempo()
    {
        return $this->Tempo;
    }

    /**
     * Set jornada
     *
     * @param \AppBundle\Entity\Jornada $jornada
     *
     * @return JogadorEstatistica
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
     * @return JogadorEstatistica
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

    /**
     * Set evento
     *
     * @param \AppBundle\Entity\TipoEvento $evento
     *
     * @return JogadorEstatistica
     */
    public function setEvento(\AppBundle\Entity\TipoEvento $evento)
    {
        $this->Evento = $evento;

        return $this;
    }

    /**
     * Get evento
     *
     * @return \AppBundle\Entity\TipoEvento
     */
    public function getEvento()
    {
        return $this->Evento;
    }
}
