<?php
namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;


/**
* @ORM\Entity @ORM\Table(name="Utilizador")
* @UniqueEntity(
*      fields={"Email"},
*      message="O email já se encontra registado."
* )
**/
class Utilizador implements UserInterface, \Serializable
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_utilizador", type="integer") 
    * @ORM\GeneratedValue 
	**/
	protected $ID_utilizador;

	/**
	* @ORM\Column(name="Nome", type="string")
    * @Assert\NotNull(
    *     message = "Campo Nome obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[a-zàáãâéêíóõôúç0-9 ]+$/i",
    *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç0-9 ]+$",
    *     message="O campo Nome só pode conter letras."
    * )
    * @Assert\Length(
    *      min = 2,
    *      max = 70,
    *      minMessage = "O campo Nome tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Nome não pode ter mais de {{ limit }} caracteres."
    * )
	**/
	protected $Nome;

    /**
    * @ORM\Column(name="Email", type="string", unique=true)
    * @Assert\NotNull(
    *     message = "Campo Email obrigatório."
    * )
    * @Assert\Email(
    *     message = "O email '{{ value }}' não é válido.",
    *     checkMX = true
    * )
    * @Assert\Length(
    *      min = 7,
    *      max = 255,
    *      minMessage = "O campo Email tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Email não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Email;

    /**
    * @ORM\Column(name="Password", type="string", length=64)   
    **/
    protected $Password;

    /**
    * @ORM\ManyToOne(targetEntity="TipoUtilizador")
    * @ORM\JoinColumn(name="ID_tipoU", referencedColumnName="ID_tipoU")
    **/
    protected $TipoUtilizador;


    /**
     * Get iDUtilizador
     *
     * @return integer
     */
    public function getIDUtilizador()
    {
        return $this->ID_utilizador;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return Utilizador
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
     * Set email
     *
     * @param string $email
     *
     * @return Utilizador
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
     * Set tipoUtilizador
     *
     * @param \AppBundle\Entity\TipoUtilizador $tipoUtilizador
     *
     * @return Utilizador
     */
    public function setTipoUtilizador(\AppBundle\Entity\TipoUtilizador $tipoUtilizador = null)
    {
        $this->TipoUtilizador = $tipoUtilizador;

        return $this;
    }

    /**
     * Get tipoUtilizador
     *
     * @return \AppBundle\Entity\TipoUtilizador
     */
    public function getTipoUtilizador()
    {
        return $this->TipoUtilizador;
    }

    /**
     * Set password
     *
     * @param string $password
     *
     * @return Utilizador
     */
    public function setPassword($password)
    {
        $this->Password = $password;

        return $this;
    }

    /**
     * Get password
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->Password;
    }

    public function getUsername()
    {
        return $this->Email;
    }

      public function eraseCredentials()
    {
    }

     public function getSalt()
    {
        // you *may* need a real salt depending on your encoder
        // see section on salt below
        return null;
    }

    public function getRoles()
    {
        return array($this->TipoUtilizador->getRole());
    }

    /** @see \Serializable::serialize() */
    public function serialize()
    {
        return serialize(array(
            $this->ID_utilizador,
            $this->Email,
            $this->Password,
            // see section on salt below
            // $this->salt,
        ));
    }

    /** @see \Serializable::unserialize() */
    public function unserialize($serialized)
    {
        list (
            $this->ID_utilizador,
            $this->Email,
            $this->Password,
            // see section on salt below
            // $this->salt
        ) = unserialize($serialized);
    }
}
