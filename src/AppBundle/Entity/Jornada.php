<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity 
* @ORM\Table(name="Jornada")
* @UniqueEntity(
*      fields={"Campeonato", "DataJogo"},
*      message="Já existe um jogo no mesmo dia!"
* )
**/
class Jornada 
{
	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_Jornada", type="integer") 
    * @ORM\GeneratedValue
	**/
	protected $ID_Jornada;

    /**
    * @ORM\Column(name="Nome", type="string")
    **/
    protected $Nome;

    /**
    * @ORM\ManyToOne(targetEntity="Clube")
    * @ORM\JoinColumn(name="ID_ClubeCasa", referencedColumnName="ID_Clube")
    **/
    protected $EquipaCasa;

    /**
    * @ORM\ManyToOne(targetEntity="Clube")
    * @ORM\JoinColumn(name="ID_ClubeVisit", referencedColumnName="ID_Clube")
    **/
    protected $EquipaVisitante;

    /**
    * @ORM\Column(name="LocalJogo", type="string", nullable=true)
    **/
    protected $LocalJogo;

    /**
    * @ORM\Column(name="DataJogo", type="date", nullable=true)
    **/
    protected $DataJogo;

    /**
    * @ORM\Column(name="HoraJogo", type="time", nullable=true)
    **/
    protected $HoraJogo;

    /**
    * @ORM\Column(name="LocalConcentracao", type="string", nullable=true)
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç0-9. -]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç0-9. -]+$",
    *     message="O campo Local de Concentração não pode conter caracteres especiais."
    * )
    * @Assert\Length(
    *      min = 3,
    *      max = 70,
    *      minMessage = "O campo Local de Concentração tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Local de Concentração não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $LocalConcentracao;

    /**
    * @ORM\Column(name="HoraConcentracao", type="time", nullable=true)
    **/
    protected $HoraConcentracao;

    /**
    * @ORM\Column(name="GolosCasa", type="integer", options={"default": 0})
    **/
    protected $GolosCasa;

    /**
    * @ORM\Column(name="GolosVisit", type="integer", options={"default": 0})
    **/
    protected $GolosVisit;

    /**
    * @ORM\Column(name="Duracao", type="integer", options={"default": 0})
    **/
    protected $Duracao;

    /**
     * @ORM\OneToMany(targetEntity="EquipaJogo", mappedBy="Jogo")
     */
    protected $EquipasJogo;

    /**
    * @ORM\OneToMany(targetEntity="JogadorEstatistica", mappedBy="Jogo")
    */
    private $JogadorStats;

    /**
    * @ORM\ManyToOne(targetEntity="Campeonato")
    * @ORM\JoinColumn(name="REF_Campeonato", referencedColumnName="ID_Campeonato")
    **/
    protected $Campeonato;

    /**
    * Constructor
    */
     public function __construct()
     {
         $this->GolosCasa = 0;
         $this->GolosVisit = 0;
         $this->Duracao = 0;
         $this->EquipasJogo = new \Doctrine\Common\Collections\ArrayCollection();
     }

    /**
     * Get iDJornada
     *
     * @return integer
     */
    public function getIDJornada()
    {
        return $this->ID_Jornada;
    }

    /**
     * Set localJogo
     *
     * @param string $localJogo
     *
     * @return Jornada
     */
    public function setLocalJogo($localJogo)
    {
        $this->LocalJogo = $localJogo;

        return $this;
    }

    /**
     * Get localJogo
     *
     * @return string
     */
    public function getLocalJogo()
    {
        return $this->LocalJogo;
    }

    /**
     * Set dataJogo
     *
     * @param \DateTime $dataJogo
     *
     * @return Jornada
     */
    public function setDataJogo($dataJogo)
    {
        $this->DataJogo = $dataJogo;

        return $this;
    }

    /**
     * Get dataJogo
     *
     * @return \DateTime
     */
    public function getDataJogo()
    {
        return $this->DataJogo;
    }

    /**
     * Set horaJogo
     *
     * @param \DateTime $horaJogo
     *
     * @return Jornada
     */
    public function setHoraJogo($horaJogo)
    {
        $this->HoraJogo = $horaJogo;

        return $this;
    }

    /**
     * Get horaJogo
     *
     * @return \DateTime
     */
    public function getHoraJogo()
    {
        return $this->HoraJogo;
    }

    /**
     * Set localConcentracao
     *
     * @param string $localConcentracao
     *
     * @return Jornada
     */
    public function setLocalConcentracao($localConcentracao)
    {
        $this->LocalConcentracao = $localConcentracao;

        return $this;
    }

    /**
     * Get localConcentracao
     *
     * @return string
     */
    public function getLocalConcentracao()
    {
        return $this->LocalConcentracao;
    }

    /**
     * Set horaConcentracao
     *
     * @param \DateTime $horaConcentracao
     *
     * @return Jornada
     */
    public function setHoraConcentracao($horaConcentracao)
    {
        $this->HoraConcentracao = $horaConcentracao;

        return $this;
    }

    /**
     * Get horaConcentracao
     *
     * @return \DateTime
     */
    public function getHoraConcentracao()
    {
        return $this->HoraConcentracao;
    }

    /**
     * Set golosCasa
     *
     * @param integer $golosCasa
     *
     * @return Jornada
     */
    public function setGolosCasa($golosCasa)
    {
        $this->GolosCasa = $golosCasa;

        return $this;
    }

    /**
     * Get golosCasa
     *
     * @return integer
     */
    public function getGolosCasa()
    {
        return $this->GolosCasa;
    }

    /**
     * Set golosVisit
     *
     * @param integer $golosVisit
     *
     * @return Jornada
     */
    public function setGolosVisit($golosVisit)
    {
        $this->GolosVisit = $golosVisit;

        return $this;
    }

    /**
     * Get golosVisit
     *
     * @return integer
     */
    public function getGolosVisit()
    {
        return $this->GolosVisit;
    }

    /**
     * Set duracao
     *
     * @param integer $duracao
     *
     * @return Jornada
     */
    public function setDuracao($duracao)
    {
        $this->Duracao = $duracao;

        return $this;
    }

    /**
     * Get duracao
     *
     * @return integer
     */
    public function getDuracao()
    {
        return $this->Duracao;
    }

    /**
     * Set equipaCasa
     *
     * @param \AppBundle\Entity\Clube $equipaCasa
     *
     * @return Jornada
     */
    public function setEquipaCasa(\AppBundle\Entity\Clube $equipaCasa = null)
    {
        $this->EquipaCasa = $equipaCasa;

        return $this;
    }

    /**
     * Get equipaCasa
     *
     * @return \AppBundle\Entity\Clube
     */
    public function getEquipaCasa()
    {
        return $this->EquipaCasa;
    }

    /**
     * Set equipaVisitante
     *
     * @param \AppBundle\Entity\Clube $equipaVisitante
     *
     * @return Jornada
     */
    public function setEquipaVisitante(\AppBundle\Entity\Clube $equipaVisitante = null)
    {
        $this->EquipaVisitante = $equipaVisitante;

        return $this;
    }

    /**
     * Get equipaVisitante
     *
     * @return \AppBundle\Entity\Clube
     */
    public function getEquipaVisitante()
    {
        return $this->EquipaVisitante;
    }

    /**
     * Add equipasJogo
     *
     * @param \AppBundle\Entity\EquipaJogo $equipasJogo
     *
     * @return Jornada
     */
    public function addEquipasJogo(\AppBundle\Entity\EquipaJogo $equipasJogo)
    {
        $this->EquipasJogo[] = $equipasJogo;

        return $this;
    }

    /**
     * Remove equipasJogo
     *
     * @param \AppBundle\Entity\EquipaJogo $equipasJogo
     */
    public function removeEquipasJogo(\AppBundle\Entity\EquipaJogo $equipasJogo)
    {
        $this->EquipasJogo->removeElement($equipasJogo);
    }

    /**
     * Get equipasJogo
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEquipasJogo()
    {
        return $this->EquipasJogo;
    }

    /**
     * Add jogadorStat
     *
     * @param \AppBundle\Entity\JogadorEstatistica $jogadorStat
     *
     * @return Jornada
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

    /**
     * Add campeonato
     *
     * @param \AppBundle\Entity\Campeonato $campeonato
     *
     * @return Jornada
     */
    public function addCampeonato(\AppBundle\Entity\Campeonato $campeonato)
    {
        $this->Campeonato[] = $campeonato;

        return $this;
    }

    /**
     * Remove campeonato
     *
     * @param \AppBundle\Entity\Campeonato $campeonato
     */
    public function removeCampeonato(\AppBundle\Entity\Campeonato $campeonato)
    {
        $this->Campeonato->removeElement($campeonato);
    }

    /**
     * Get campeonato
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCampeonato()
    {
        return $this->Campeonato;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return Jornada
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
     * Set campeonato
     *
     * @param \AppBundle\Entity\Campeonato $campeonato
     *
     * @return Jornada
     */
    public function setCampeonato(\AppBundle\Entity\Campeonato $campeonato = null)
    {
        $this->Campeonato = $campeonato;

        return $this;
    }
}
