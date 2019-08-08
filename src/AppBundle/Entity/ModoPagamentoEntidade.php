<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity
* @ORM\Table(name="ModoPagamentoEntidade")
**/
class ModoPagamentoEntidade
{
  /**
  * @ORM\Id
  * @ORM\Column(name="ID_Modo_Pagamento_Entidade", type="integer")
  * @ORM\GeneratedValue
  **/
  protected $ID_Modo_Pagamento_Entidade;

  /**
  * @ORM\ManyToOne(targetEntity="ModoPagamento")
  * @ORM\JoinColumn(name="REF_Modo_Pagamento", referencedColumnName="ID_Modo_Pagamento")
  **/
  protected $ModoPagamento;

  /**
  * @ORM\ManyToOne(targetEntity="Entidade")
  * @ORM\JoinColumn(name="REF_Entidade", referencedColumnName="ID_Entidade")
  **/
  protected $Entidade;

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
  * @ORM\ManyToOne(targetEntity="Epoca")
  * @ORM\JoinColumn(name="REF_Epoca", referencedColumnName="ID_epoca")
  **/
protected $Epoca;

  /**
    * @ORM\OneToMany(targetEntity="PagamentoEntidade", mappedBy="ModoPagamentoEntidade")
    */
  protected $Pagamentos;

  /**
  * @ORM\Column(type="boolean")
  */
  protected $Activo;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->Pagamentos = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Get iDModoPagamentoEntidade
     *
     * @return integer
     */
    public function getIDModoPagamentoEntidade()
    {
        return $this->ID_Modo_Pagamento_Entidade;
    }

    /**
     * Set modoPagamento
     *
     * @param \AppBundle\Entity\ModoPagamento $modoPagamento
     *
     * @return ModoPagamentoEntidade
     */
    public function setModoPagamento(\AppBundle\Entity\ModoPagamento $modoPagamento = null)
    {
        $this->ModoPagamento = $modoPagamento;

        return $this;
    }

    /**
     * Get modoPagamento
     *
     * @return \AppBundle\Entity\ModoPagamento
     */
    public function getModoPagamento()
    {
        return $this->ModoPagamento;
    }

    /**
     * Set descricao
     *
     * @param string $descricao
     *
     * @return ModoPagamentoEntidade
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
     * Set entidade
     *
     * @param \AppBundle\Entity\Entidade $entidade
     *
     * @return ModoPagamentoEntidade
     */
    public function setEntidade(\AppBundle\Entity\Entidade $entidade = null)
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
     * Set epoca
     *
     * @param \AppBundle\Entity\Epoca $epoca
     *
     * @return ModoPagamentoEntidade
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
     * @param \AppBundle\Entity\PagamentoEntidade $pagamento
     *
     * @return ModoPagamentoEntidade
     */
    public function addPagamento(\AppBundle\Entity\PagamentoEntidade $pagamento)
    {
        $this->Pagamentos[] = $pagamento;

        return $this;
    }

    /**
     * Remove pagamento
     *
     * @param \AppBundle\Entity\PagamentoEntidade $pagamento
     */
    public function removePagamento(\AppBundle\Entity\PagamentoEntidade $pagamento)
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
     * @return ModoPagamentoEntidade
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
