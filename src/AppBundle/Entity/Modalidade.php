<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity
* @ORM\Table(name="Modalidade")
* @UniqueEntity(
*      fields={"Nome"},
*      message="A modalidade já se encontra registada."
* )
**/
class Modalidade 
{
    const FUTEBOL = 1;

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_Modalidade", type="integer") 
	* @ORM\GeneratedValue 
	**/
	protected $ID_Modalidade;

	/**
	* @ORM\Column(name="Nome", type="string")
    * @Assert\NotNull(
    *     message = "Campo obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç ]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç ]+$",
    *     message="O campo Nome só pode conter letras."
    * )
    * @Assert\Length(
    *      min = 3,
    *      max = 50,
    *      minMessage = "O campo Nome tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Nome não pode ter mais de {{ limit }} caracteres."
    * )
	**/
	protected $Nome;

    /**
    * @ORM\OneToMany(targetEntity="Entidade", mappedBy="Modalidades")
    */
    protected $Entidades;

    /**
     * @ORM\ManyToMany(targetEntity="Entidade", mappedBy="Modalidades")
     */
    protected $entidadesM;

    /**
     * Get iDModalidade
     *
     * @return integer
     */
    public function getIDModalidade()
    {
        return $this->ID_Modalidade;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return Modalidade
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
        $this->Entidades = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add entidade
     *
     * @param \AppBundle\Entity\Entidade $entidade
     *
     * @return Modalidade
     */
    public function addEntidade(\AppBundle\Entity\Entidade $entidade)
    {
        $this->Entidades[] = $entidade;

        return $this;
    }

    /**
     * Remove entidade
     *
     * @param \AppBundle\Entity\Entidade $entidade
     */
    public function removeEntidade(\AppBundle\Entity\Entidade $entidade)
    {
        $this->Entidades->removeElement($entidade);
    }

    /**
     * Get entidades
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEntidades()
    {
        return $this->Entidades;
    }

    

    /**
     * Add entidadesM
     *
     * @param \AppBundle\Entity\Entidade $entidadesM
     *
     * @return Modalidade
     */
    public function addEntidadesM(\AppBundle\Entity\Entidade $entidadesM)
    {
        $this->entidadesM[] = $entidadesM;

        return $this;
    }

    /**
     * Remove entidadesM
     *
     * @param \AppBundle\Entity\Entidade $entidadesM
     */
    public function removeEntidadesM(\AppBundle\Entity\Entidade $entidadesM)
    {
        $this->entidadesM->removeElement($entidadesM);
    }

    /**
     * Get entidadesM
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEntidadesM()
    {
        return $this->entidadesM;
    }
}
