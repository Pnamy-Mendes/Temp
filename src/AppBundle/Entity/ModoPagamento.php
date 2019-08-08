<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity
* @ORM\Table(name="ModoPagamento")
**/
class ModoPagamento
{
  /**
  * @ORM\Id
  * @ORM\Column(name="ID_Modo_Pagamento", type="integer")
  * @ORM\GeneratedValue
  **/
  protected $ID_Modo_Pagamento;

  /**
  * @ORM\Column(name="Descricao", type="string")
  * @Assert\NotNull(
  *     message = "Campo obrigatório!"
  * )
  * @Assert\Regex(
  *     pattern     = "/^[a-zàáãâéêíóõôúç 0-9.]+$/i",
  *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç 0-9.]+$",
  *     message="O campo Descricao Pagamento não pode conter caracteres especiais."
  * )
  * @Assert\Length(
  *      max = 50,
  *      maxMessage = "O campo Descricao Pagamento não pode ter mais de {{ limit }} caracteres."
  * )
  **/
  protected $Descricao;

  /**
  * @ORM\ManyToOne(targetEntity="Epoca", inversedBy="ModosPagamento")
  * @ORM\JoinColumn(name="REF_Epoca", referencedColumnName="ID_epoca")
  **/
  protected $Epoca;

  /**
  * @ORM\Column(type="boolean")
  */
  protected $Activo;

  /**
    * @ORM\OneToMany(targetEntity="Pagamento", mappedBy="ModoPagamento")
    */
  protected $Pagamentos;
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->Pagamentos = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Get iDModoPagamento
     *
     * @return integer
     */
    public function getIDModoPagamento()
    {
        return $this->ID_Modo_Pagamento;
    }

    /**
     * Set descricao
     *
     * @param string $descricao
     *
     * @return ModoPagamento
     */
    public function setDescricao($descricao)
    {
        $this->Descricao = $descricao;

        return $this;
    }

    /**
     * Get descricao
     *
     * @return string
     */
    public function getDescricao()
    {
        return $this->Descricao;
    }

    /**
     * Set epoca
     *
     * @param \AppBundle\Entity\Epoca $epoca
     *
     * @return ModoPagamento
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
     * Add pagamento
     *
     * @param \AppBundle\Entity\Pagamento $pagamento
     *
     * @return ModoPagamento
     */
    public function addPagamento(\AppBundle\Entity\Pagamento $pagamento)
    {
        $this->Pagamentos[] = $pagamento;

        return $this;
    }

    /**
     * Remove pagamento
     *
     * @param \AppBundle\Entity\Pagamento $pagamento
     */
    public function removePagamento(\AppBundle\Entity\Pagamento $pagamento)
    {
        $this->Pagamentos->removeElement($pagamento);
    }

    /**
     * Get pagamentos
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPagamentos()
    {
        return $this->Pagamentos;
    }

    /**
     * Set activo
     *
     * @param boolean $activo
     *
     * @return PagamentoEntidade
     */
    public function setActivo($activo)
    {
        $this->Activo = $activo;

        return $this;
    }

    /**
     * Get activo
     *
     * @return boolean
     */
    public function getActivo()
    {
        return $this->Activo;
    }
}
