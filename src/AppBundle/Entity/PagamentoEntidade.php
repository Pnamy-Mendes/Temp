<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity
* @ORM\Table(name="PagamentoEntidade")
**/
class PagamentoEntidade
{

  /**
  * @ORM\Id
  * @ORM\ManyToOne(targetEntity="ModoPagamentoEntidade", inversedBy="Pagamentos")
  * @ORM\JoinColumn(name="REF_ModoPagamentoEntidade", referencedColumnName="ID_Modo_Pagamento_Entidade")
  **/
  protected $ModoPagamentoEntidade;

  /**
  * @ORM\Id
  * @ORM\ManyToOne(targetEntity="Pagamento", inversedBy="PagamentosEntidade")
  * @ORM\JoinColumn(name="REF_Pagamento", referencedColumnName="ID_Pagamento")
  **/
  protected $Pagamento;

  /**
  * @ORM\Column(type="boolean")
  */
  protected $Pago;

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

  public function __construct(){
   $this->Pago = false;
  }

  /**
   * Set descricao
   *
   * @param string $descricao
   *
   * @return PagamentoEntidade
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
     * Set modoPagamentoEntidade
     *
     * @param \AppBundle\Entity\ModoPagamentoEntidade $modoPagamentoEntidade
     *
     * @return PagamentoEntidade
     */
    public function setModoPagamentoEntidade(\AppBundle\Entity\ModoPagamentoEntidade $modoPagamentoEntidade)
    {
        $this->ModoPagamentoEntidade = $modoPagamentoEntidade;

        return $this;
    }

    /**
     * Get modoPagamentoEntidade
     *
     * @return \AppBundle\Entity\ModoPagamentoEntidade
     */
    public function getModoPagamentoEntidade()
    {
        return $this->ModoPagamentoEntidade;
    }

    /**
     * Set pagamento
     *
     * @param \AppBundle\Entity\Pagamento $pagamento
     *
     * @return PagamentoEntidade
     */
    public function setPagamento(\AppBundle\Entity\Pagamento $pagamento)
    {
        $this->Pagamento = $pagamento;

        return $this;
    }

    /**
     * Get pagamento
     *
     * @return \AppBundle\Entity\Pagamento
     */
    public function getPagamento()
    {
        return $this->Pagamento;
    }

    /**
     * Set pago
     *
     * @param boolean $pago
     *
     * @return PagamentoEntidade
     */
    public function setPago($pago)
    {
        $this->Pago = $pago;

        return $this;
    }

    /**
     * Get pago
     *
     * @return boolean
     */
    public function getPago()
    {
        return $this->Pago;
    }

    /**
     * Set valor
     *
     * @param integer $valor
     *
     * @return PagamentoEntidade
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
     * @return PagamentoEntidade
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
     * @return PagamentoEntidade
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
     * @return PagamentoEntidade
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
     * @return PagamentoEntidade
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
}
