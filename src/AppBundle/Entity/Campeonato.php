<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity 
* @ORM\Table(name="Campeonato")
* @UniqueEntity(
*      fields={"Nome"},
*      message="O jogo já se encontra registado."
* )
**/
class Campeonato 
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_Campeonato", type="integer") 
	* @ORM\GeneratedValue 
	**/
	protected $ID_Campeonato;

    /**
    * @ORM\ManyToOne(targetEntity="Escalao")
    * @ORM\JoinColumn(name="ID_Escalao", referencedColumnName="ID_Escalao")
    **/
    protected $Escalao;

    /**
    * @ORM\Column(name="Nome", type="string")
    * @Assert\NotNull(
    *     message = "Campo obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç 0-9.]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç 0-9.]+$",
    *     message="O campo Nome Campeonato não pode conter caracteres especiais."
    * )
    * @Assert\Length(
    *      max = 50,
    *      maxMessage = "O campo Nome Campeonato não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Nome;

    /**
    * @ORM\Column(name="DataInicial", type="date")
    * @Assert\NotNull(
    *     message = "Campo obrigatório!"
    * )
    * @Assert\Date(
    *   message = "Data inválida!"
    * )
    **/
    protected $DataInicial;

    /**
    * @ORM\Column(name="DataFinal", type="date")
    * @Assert\NotNull(
    *     message = "Campo obrigatório!"
    * )
    * @Assert\Date(
    *   message = "Data inválida!"
    * )
    **/
    protected $DataFinal;

    /**
    * @ORM\ManyToOne(targetEntity="Epoca")
    * @ORM\JoinColumn(name="REF_Epoca", referencedColumnName="ID_epoca")
    **/
    protected $Epoca;

    /**
    * @ORM\Column(name="QtEquipas", type="integer", nullable=true)
    * @Assert\Regex(
    *     pattern     = "/^[0-9]+$/i",
    *     htmlPattern = "^[0-9]+$",
    *     message="O campo Quantidade Equipas tem que ser numérico."
    * )
    * @Assert\Length(
    *      min = 1,
    *      max = 6,
    *      minMessage = "O campo Quantidade Equipas tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Quantidade Equipas não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $QtEquipas;

    /**
     * @ORM\ManyToMany(targetEntity="Clube", inversedBy="Campeonato")
     * @ORM\JoinTable(name="Campeonato_Clube",
     *      joinColumns={@ORM\JoinColumn(name="ID_Campeonato", referencedColumnName="ID_Campeonato")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="ID_Clube", referencedColumnName="ID_Clube")}
     *      )
    **/
    protected $Clubes;

    /**
     * @ORM\OneToMany(targetEntity="Jornada", mappedBy="Campeonato")
    **/
    protected $Jornadas;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->Clubes = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Get iDCampeonato
     *
     * @return integer
     */
    public function getIDCampeonato()
    {
        return $this->ID_Campeonato;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return Campeonato
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
     * Set dataInicial
     *
     * @param \DateTime $dataInicial
     *
     * @return Campeonato
     */
    public function setDataInicial($dataInicial)
    {
        $this->DataInicial = $dataInicial;

        return $this;
    }

    /**
     * Get dataInicial
     *
     * @return \DateTime
     */
    public function getDataInicial()
    {
        return $this->DataInicial;
    }

    /**
     * Set dataFinal
     *
     * @param \DateTime $dataFinal
     *
     * @return Campeonato
     */
    public function setDataFinal($dataFinal)
    {
        $this->DataFinal = $dataFinal;

        return $this;
    }

    /**
     * Get dataFinal
     *
     * @return \DateTime
     */
    public function getDataFinal()
    {
        return $this->DataFinal;
    }

    /**
     * Set qtEquipas
     *
     * @param integer $qtEquipas
     *
     * @return Campeonato
     */
    public function setQtEquipas($qtEquipas)
    {
        $this->QtEquipas = $qtEquipas;

        return $this;
    }

    /**
     * Get qtEquipas
     *
     * @return integer
     */
    public function getQtEquipas()
    {
        return $this->QtEquipas;
    }

    /**
     * Set escalao
     *
     * @param \AppBundle\Entity\Escalao $escalao
     *
     * @return Campeonato
     */
    public function setEscalao(\AppBundle\Entity\Escalao $escalao = null)
    {
        $this->Escalao = $escalao;

        return $this;
    }

    /**
     * Get escalao
     *
     * @return \AppBundle\Entity\Escalao
     */
    public function getEscalao()
    {
        return $this->Escalao;
    }

    /**
     * Set epoca
     *
     * @param \AppBundle\Entity\Epoca $epoca
     *
     * @return Campeonato
     */
    public function setEpoca(\AppBundle\Entity\Epoca $epoca = null)
    {
        $this->Epoca = $epoca;

        return $this;
    }

    /**
     * Get epoca
     *
     * @return \AppBundle\Entity\Epoca
     */
    public function getEpoca()
    {
        return $this->Epoca;
    }

    /**
     * Add clube
     *
     * @param \AppBundle\Entity\Clube $clube
     *
     * @return Campeonato
     */
    public function addClube(\AppBundle\Entity\Clube $clube)
    {
        $this->Clubes[] = $clube;

        return $this;
    }

    /**
     * Remove clube
     *
     * @param \AppBundle\Entity\Clube $clube
     */
    public function removeClube(\AppBundle\Entity\Clube $clube)
    {
        $this->Clubes->removeElement($clube);
    }

    /**
     * Get clubes
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getClubes()
    {
        return $this->Clubes;
    }

    /**
     * Set jornadas
     *
     * @param \AppBundle\Entity\Jornada $jornadas
     *
     * @return Campeonato
     */
    public function setJornadas(\AppBundle\Entity\Jornada $jornadas = null)
    {
        $this->Jornadas = $jornadas;

        return $this;
    }

    /**
     * Get jornadas
     *
     * @return \AppBundle\Entity\Jornada
     */
    public function getJornadas()
    {
        return $this->Jornadas;
    }

    /**
     * Add jornada
     *
     * @param \AppBundle\Entity\Jornada $jornada
     *
     * @return Campeonato
     */
    public function addJornada(\AppBundle\Entity\Jornada $jornada)
    {
        $this->Jornadas[] = $jornada;

        return $this;
    }

    /**
     * Remove jornada
     *
     * @param \AppBundle\Entity\Jornada $jornada
     */
    public function removeJornada(\AppBundle\Entity\Jornada $jornada)
    {
        $this->Jornadas->removeElement($jornada);
    }
}
