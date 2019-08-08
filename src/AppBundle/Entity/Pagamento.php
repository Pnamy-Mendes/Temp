<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity
* @ORM\Table(name="Pagamento")
**/
class Pagamento
{
  /**
  * @ORM\Id
  * @ORM\Column(name="ID_Pagamento", type="integer")
  * @ORM\GeneratedValue
  **/
  protected $ID_Pagamento;

  /**
  * @ORM\ManyToOne(targetEntity="ModoPagamento", inversedBy="Pagamentos")
  * @ORM\JoinColumn(name="REF_ModoPagamento", referencedColumnName="ID_Modo_Pagamento")
  **/
  protected $ModoPagamento;

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
  * @ORM\Column(name="Valor", type="integer", nullable=true)
  * @Assert\NotNull(
  *     message = "Campo obrigatório!"
  * )
  */
  protected $Valor;

  /**
  * @ORM\Column(name="ValorPosLimite", type="integer", nullable=true)
  * @Assert\NotNull(
  *     message = "Campo obrigatório!"
  * )
  */
  protected $ValorPosLimite;

  /**
  * @ORM\Column(name="DataLimite", type="date")
  * @Assert\NotNull(
  *     message = "Campo obrigatório!"
  * )
  * @Assert\Date(
  *   message = "Data inválida!"
  * )
  **/
  protected $DataLimite;

  /**
  * @ORM\Column(name="Benificio", type="integer")
  **/
  protected $Benificio;

  /**
  * @ORM\Column(name="DescricaoBenificio", type="string")
  * @Assert\NotNull(
  *     message = "Campo obrigatório!"
  * )
  * @Assert\Regex(
  *     pattern     = "/^[a-zàáãâéêíóõôúç 0-9.]+$/i",
  *     htmlPattern = "^[a-zA-Zàáãâéêíóõôúç 0-9.]+$",
  *     message="O campo Descricao Benificio não pode conter caracteres especiais."
  * )
  * @Assert\Length(
  *      max = 50,
  *      maxMessage = "O campo Descricao Benificio não pode ter mais de {{ limit }} caracteres."
  * )
  **/
  protected $DescricaoBenificio;

  /*
    * @ORM\OneToMany(targetEntity="PagamentoEntidade", mappedBy="Pagamento")
  */
  protected $PagamentosEntidade;

  public function __construct()
  {
      $this->PagamentosEntidade = new \Doctrine\Common\Collections\ArrayCollection();
  }

    /**
     * Get iDPagamento
     *
     * @return integer
     */
    public function getIDPagamento()
    {
        return $this->ID_Pagamento;
    }

    /**
     * Set descricao
     *
     * @param string $descricao
     *
     * @return Pagamento
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
     * Set valor
     *
     * @param integer $valor
     *
     * @return Pagamento
     */
    public function setValor($valor)
    {
        $this->Valor = $valor;

        return $this;
    }

    /**
     * Get valor
     *
     * @return integer
     */
    public function getValor()
    {
        return $this->Valor;
    }

    /**
     * Set valorPosLimite
     *
     * @param integer $valor
     *
     * @return Pagamento
     */
    public function setValorPosLimite($valor)
    {
        $this->ValorPosLimite = $valor;

        return $this;
    }

    /**
     * Get valor
     *
     * @return integer
     */
    public function getValorPosLimite()
    {
        return $this->ValorPosLimite;
    }


    /**
     * Set dataLimite
     *
     * @param \DateTime $dataLimite
     *
     * @return Pagamento
     */
    public function setDataLimite($dataLimite)
    {
        $this->DataLimite = $dataLimite;

        return $this;
    }

    /**
     * Get dataLimite
     *
     * @return \DateTime
     */
    public function getDataLimite()
    {
        return $this->DataLimite;
    }

    /**
     * Set benificio
     *
     * @param integer $benificio
     *
     * @return Pagamento
     */
    public function setBenificio($benificio)
    {
        $this->Benificio = $benificio;

        return $this;
    }

    /**
     * Get benificio
     *
     * @return integer
     */
    public function getBenificio()
    {
        return $this->Benificio;
    }

    /**
     * Set descricaoBenificio
     *
     * @param string $descricaoBenificio
     *
     * @return Pagamento
     */
    public function setDescricaoBenificio($descricaoBenificio)
    {
        $this->DescricaoBenificio = $descricaoBenificio;

        return $this;
    }

    /**
     * Get descricaoBenificio
     *
     * @return string
     */
    public function getDescricaoBenificio()
    {
        return $this->DescricaoBenificio;
    }

    /**
     * Set modoPagamento
     *
     * @param \AppBundle\Entity\ModoPagamento $modoPagamento
     *
     * @return Pagamento
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
     * Add pagamento entidade
     *
     * @param \AppBundle\Entity\PagamentoEntidade $pagamento
     *
     * @return Pagamento
     */
    public function addPagamentoEntidade(\AppBundle\Entity\PagamentoEntidade $pagamento)
    {
        $this->PagamentosEntidade[] = $pagamento;

        return $this;
    }

    /**
     * Remove pagamento entidade
     *
     * @param \AppBundle\Entity\PagamentoEntidade $pagamento
     */
    public function removePagamentoEntidade(\AppBundle\Entity\PagamentoEntidade $pagamento)
    {
        $this->PagamentosEntidade->removeElement($pagamento);
    }

    /**
     * Get pagamentos entidade
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPagamentosEntidade()
    {
        return $this->PagamentosEntidade;
    }
}
