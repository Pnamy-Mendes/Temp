<?php
namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity @ORM\Table(name="TipoUtilizador")
**/
class TipoUtilizador 
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_tipoU", type="integer") 
    * @ORM\GeneratedValue 
	**/
	protected $ID_tipoU;

	/**
	* @ORM\Column(name="Nome", type="string")
	**/
	protected $Nome;

    /**
    * @ORM\Column(name="Role", type="string")
    **/
    protected $Role;


    /**
     * Get iDTipoU
     *
     * @return integer
     */
    public function getIDTipoU()
    {
        return $this->ID_tipoU;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return TipoUtilizador
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
     * Set role
     *
     * @param string $role
     *
     * @return TipoUtilizador
     */
    public function setRole($role)
    {
        $this->Role = $role;

        return $this;
    }

    /**
     * Get role
     *
     * @return string
     */
    public function getRole()
    {
        return $this->Role;
    }
}
