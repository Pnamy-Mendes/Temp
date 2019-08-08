<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity
* @ORM\Table(name="Epoca")
* @UniqueEntity(
*      fields={"Nome"},
*      message="A época já se encontra registada."
* )
**/
class Epoca
{

	/**
	* @ORM\Id
	* @ORM\Column(name="ID_epoca", type="integer")
    * @ORM\GeneratedValue
	**/
	protected $ID_epoca;

	/**
	* @ORM\Column(name="Nome", type="string")
    * @Assert\NotNull(
    *     message = "Campo obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[19[5-9]\d|20[0-4]\d|2050]+$/i",
    *     htmlPattern = "^[19[5-9]\d|20[0-4]\d|2050]+$",
    *     message="Época inválida. [Ex: '2015-2016']"
    * )
    * @Assert\Length(
    *      min = 9,
    *      max = 9,
    *      exactMessage = "O campo Época tem que ter {{ limit }} caracteres. [Ex: '2015-2016']"
    * )
	**/
	protected $Nome;

    /**
    * @ORM\Column(name="DataInicio", type="date")
    * @Assert\NotNull(
    *     message = "Campo obrigatório!"
    * )
    * @Assert\Date(
    *   message = "Data inválida!"
    * )
    **/
    protected $DataInicio;

    /**
    * @ORM\Column(name="DataFim", type="date")
    * @Assert\NotNull(
    *     message = "Campo obrigatório!"
    * )
    * @Assert\Date(
    *   message = "Data inválida!"
    * )
    **/
    protected $DataFim;

		/**
			* @ORM\OneToMany(targetEntity="ModoPagamento", mappedBy="Epoca")
			*/
		protected $ModosPagamento;


    /**
     * Get iDEpoca
     *
     * @return integer
     */
    public function getIDEpoca()
    {
        return $this->ID_epoca;
    }

    /**
     * Set nome
     *
     * @param string $nome
     *
     * @return Epoca
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
     * Set dataInicio
     *
     * @param \DateTime $dataInicio
     *
     * @return Epoca
     */
    public function setDataInicio($dataInicio)
    {
        $this->DataInicio = $dataInicio;

        return $this;
    }

    /**
     * Get dataInicio
     *
     * @return \DateTime
     */
    public function getDataInicio()
    {
        return $this->DataInicio;
    }

    /**
     * Set dataFim
     *
     * @param \DateTime $dataFim
     *
     * @return Epoca
     */
    public function setDataFim($dataFim)
    {
        $this->DataFim = $dataFim;

        return $this;
    }

    /**
     * Get dataFim
     *
     * @return \DateTime
     */
    public function getDataFim()
    {
        return $this->DataFim;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->ModosPagamento = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add modosPagamento
     *
     * @param \AppBundle\Entity\ModoPagamento $modosPagamento
     *
     * @return Epoca
     */
    public function addModosPagamento(\AppBundle\Entity\ModoPagamento $modosPagamento)
    {
        $this->ModosPagamento[] = $modosPagamento;

        return $this;
    }

    /**
     * Remove modosPagamento
     *
     * @param \AppBundle\Entity\ModoPagamento $modosPagamento
     */
    public function removeModosPagamento(\AppBundle\Entity\ModoPagamento $modosPagamento)
    {
        $this->ModosPagamento->removeElement($modosPagamento);
    }

    /**
     * Get modosPagamento
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getModosPagamento()
    {
        return $this->ModosPagamento;
    }
}
