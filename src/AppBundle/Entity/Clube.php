<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity 
* @ORM\Table(name="Clube")
* @UniqueEntity(
*      fields={"Nome"},
*      message="O clube já se encontra registado."
* )
**/
class Clube 
{
	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_Clube", type="integer") 
    * @ORM\GeneratedValue
	**/
	protected $ID_Clube;

	/**
	* @ORM\Column(name="Nome", type="string")
    * @Assert\NotNull(
    *     message = "O campo Nome é obrigatório!"
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
    * @ORM\Column(name="Abrv", type="string")
    * @Assert\NotNull(
    *     message = "O campo Abreviatura é obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[a-z ]+$/i",
    *     htmlPattern = "^[a-zA-Z ]+$",
    *     message="O campo Abreviatura só pode conter letras."
    * )
    * @Assert\Length(
    *      min = 2,
    *      max = 15,
    *      minMessage = "O campo Abreviatura tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Abreviatura não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Abrv;

    /**
    * @ORM\Column(name="N_FPF", type="string", nullable=true)
    * @Assert\Regex(
    *     pattern     = "/^[0-9]+$/i",
    *     htmlPattern = "^[0-9]+$",
    *     message="O campo FPF é numérico."
    * )
    * @Assert\Length(
    *      min = 1,
    *      max = 5,
    *      minMessage = "O campo FPF tem que ter pelo menos {{ limit }} caractere.",
    *      maxMessage = "O campo FPF não pode ter mais de {{ limit }} caracteres.",
    * )
    **/
    protected $N_FPF;

    /**
    * @ORM\Column(name="Associacao", type="string", nullable=true)
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç. ]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç. ]+$",
    *     message="O campo Associação só pode conter letras."
    * )
    * @Assert\Length(
    *     min = 3,
    *     max = 80,
    *     minMessage = "O campo Associação tem que ter pelo menos {{ limit }} caracteres.",
    *     maxMessage = "O campo Associação não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Associacao;

    /**
    * @ORM\Column(name="Fundacao", type="date", nullable=true)
    * @Assert\Date(
    *   message = "Data inválida!"
    * )
    * @Assert\LessThan(
    *       value="today",
    *       message="A Data de Fundação não pode ser superior à data atual."
    *   )
    **/
    protected $Fundacao;

    /**
    * @ORM\Column(name="Presidente", type="string", nullable=true)
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç ]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç ]+$",
    *     message="O campo Presidente só pode conter letras."
    * )
    * @Assert\Length(
    *      min = 3,
    *      max = 70,
    *      minMessage = "O campo Presidente tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Presidente não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Presidente;

    /**
    * @ORM\Column(name="Estadio", type="string")
    * @Assert\NotNull(
    *     message = "O campo Estádio é obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç. ]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç. ]+$",
    *     message="O campo Estádio só pode conter letras."
    * )
    * @Assert\Length(
    *      min = 3,
    *      max = 50,
    *      minMessage = "O campo Estádio tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Estádio não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Estadio;

    /**
    * @ORM\Column(name="Cidade", type="string")
    * @Assert\NotNull(
    *     message = "O campo Cidade é obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç ]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç ]+$",
    *     message="O campo Cidade só pode conter letras."
    * )
    * @Assert\Length(
    *      min = 3,
    *      max = 50,
    *      minMessage = "O campo Cidade tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Cidade não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Cidade;

    /**
    * @ORM\Column(name="Pais", type="string", nullable=true)
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç ]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç ]+$",
    *     message="O campo País só pode conter letras."
    * )
    * @Assert\Length(
    *      min = 2,
    *      max = 50,
    *      minMessage = "O campo País tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo País não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Pais;

    /**
    * @ORM\Column(name="Foto", type="string", nullable=true)
    **/
    protected $Foto;

    /**
     * Get iDClube
     *
     * @return integer
     */
    public function getIDClube()
    {
        return $this->ID_Clube;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return Clube
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
     * Set abrv
     *
     * @param string $abrv
     *
     * @return Clube
     */
    public function setAbrv($abrv)
    {
        $this->Abrv = $abrv;

        return $this;
    }

    /**
     * Get abrv
     *
     * @return string
     */
    public function getAbrv()
    {
        return $this->Abrv;
    }

    /**
     * Set nFPF
     *
     * @param string $nFPF
     *
     * @return Clube
     */
    public function setNFPF($nFPF)
    {
        $this->N_FPF = $nFPF;

        return $this;
    }

    /**
     * Get nFPF
     *
     * @return string
     */
    public function getNFPF()
    {
        return $this->N_FPF;
    }

    /**
     * Set associacao
     *
     * @param string $associacao
     *
     * @return Clube
     */
    public function setAssociacao($associacao)
    {
        $this->Associacao = $associacao;

        return $this;
    }

    /**
     * Get associacao
     *
     * @return string
     */
    public function getAssociacao()
    {
        return $this->Associacao;
    }

    /**
     * Set fundacao
     *
     * @param \DateTime $fundacao
     *
     * @return Clube
     */
    public function setFundacao($fundacao)
    {
        $this->Fundacao = $fundacao;

        return $this;
    }

    /**
     * Get fundacao
     *
     * @return \DateTime
     */
    public function getFundacao()
    {
        return $this->Fundacao;
    }

    /**
     * Set presidente
     *
     * @param string $presidente
     *
     * @return Clube
     */
    public function setPresidente($presidente)
    {
        $this->Presidente = $presidente;

        return $this;
    }

    /**
     * Get presidente
     *
     * @return string
     */
    public function getPresidente()
    {
        return $this->Presidente;
    }

    /**
     * Set estadio
     *
     * @param string $estadio
     *
     * @return Clube
     */
    public function setEstadio($estadio)
    {
        $this->Estadio = $estadio;

        return $this;
    }

    /**
     * Get estadio
     *
     * @return string
     */
    public function getEstadio()
    {
        return $this->Estadio;
    }

    /**
     * Set cidade
     *
     * @param string $cidade
     *
     * @return Clube
     */
    public function setCidade($cidade)
    {
        $this->Cidade = $cidade;

        return $this;
    }

    /**
     * Get cidade
     *
     * @return string
     */
    public function getCidade()
    {
        return $this->Cidade;
    }

    /**
     * Set pais
     *
     * @param string $pais
     *
     * @return Clube
     */
    public function setPais($pais)
    {
        $this->Pais = $pais;

        return $this;
    }

    /**
     * Get pais
     *
     * @return string
     */
    public function getPais()
    {
        return $this->Pais;
    }

    /**
     * Set email
     *
     * @param string $email
     *
     * @return Clube
     */
    public function setEmail($email)
    {
        $this->Email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->Email;
    }

    /**
     * Set foto
     *
     * @param string $foto
     *
     * @return Clube
     */
    public function setFoto($foto)
    {
        $this->Foto = $foto;

        return $this;
    }

    /**
     * Get foto
     *
     * @return string
     */
    public function getFoto()
    {
        return $this->Foto;
    }
}
