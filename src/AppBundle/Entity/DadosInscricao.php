<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity 
* @ORM\Table(name="DadosInscricao")
**/
class DadosInscricao 
{

	/** 
	* @ORM\Id 
	* @ORM\Column(name="ID_dadosInscricao", type="integer") 
    * @ORM\GeneratedValue 
	**/
	protected $ID_dadosInscricao;

	/**
	* @ORM\Column(name="ExameMedico", type="string", nullable=true)
	**/
	protected $ExameMedico;

	/**
	* @ORM\Column(name="FichaInscricao", type="string", nullable=true)
	**/
	protected $FichaInscricao;

	/**
	* @ORM\Column(name="CopiaCC", type="string", nullable=true)
	**/
	protected $CopiaCC;

	/**
	* @ORM\Column(name="DataValidadeCC", type="date", nullable=true)
	**/
	protected $DataValidadeCC;

	/**
	* @ORM\Column(name="CopiaCCEncarregado", type="string", nullable=true)
	**/
	protected $CopiaCCEncarregado;

	/**
	* @ORM\Column(name="DataValidadeCCEncarregado", type="date", nullable=true)
	**/
	protected $DataValidadeCCEncarregado;

	/**
	* @ORM\Column(name="FichaInscricaoFPF", type="string", nullable=true)
	**/
	protected $FichaInscricaoFPF;

    /**
     * Get iDDadosInscricao
     *
     * @return integer
     */
    public function getIDDadosInscricao()
    {
        return $this->ID_dadosInscricao;
    }

    /**
     * Set exameMedico
     *
     * @param string $exameMedico
     *
     * @return DadosInscricao
     */
    public function setExameMedico($exameMedico)
    {
        $this->ExameMedico = $exameMedico;

        return $this;
    }

    /**
     * Get exameMedico
     *
     * @return string
     */
    public function getExameMedico()
    {
        return $this->ExameMedico;
    }

    /**
     * Set fichaInscricao
     *
     * @param string $fichaInscricao
     *
     * @return DadosInscricao
     */
    public function setFichaInscricao($fichaInscricao)
    {
        $this->FichaInscricao = $fichaInscricao;

        return $this;
    }

    /**
     * Get fichaInscricao
     *
     * @return string
     */
    public function getFichaInscricao()
    {
        return $this->FichaInscricao;
    }

    /**
     * Set copiaCC
     *
     * @param string $copiaCC
     *
     * @return DadosInscricao
     */
    public function setCopiaCC($copiaCC)
    {
        $this->CopiaCC = $copiaCC;

        return $this;
    }

    /**
     * Get copiaCC
     *
     * @return string
     */
    public function getCopiaCC()
    {
        return $this->CopiaCC;
    }

    /**
     * Set dataValidadeCC
     *
     * @param \DateTime $dataValidadeCC
     *
     * @return DadosInscricao
     */
    public function setDataValidadeCC($dataValidadeCC)
    {
        $this->DataValidadeCC = $dataValidadeCC;

        return $this;
    }

    /**
     * Get dataValidadeCC
     *
     * @return \DateTime
     */
    public function getDataValidadeCC()
    {
        return $this->DataValidadeCC;
    }

    /**
     * Set copiaCCEncarregado
     *
     * @param string $copiaCCEncarregado
     *
     * @return DadosInscricao
     */
    public function setCopiaCCEncarregado($copiaCCEncarregado)
    {
        $this->CopiaCCEncarregado = $copiaCCEncarregado;

        return $this;
    }

    /**
     * Get copiaCCEncarregado
     *
     * @return string
     */
    public function getCopiaCCEncarregado()
    {
        return $this->CopiaCCEncarregado;
    }

    /**
     * Set dataValidadeCCEncarregado
     *
     * @param \DateTime $dataValidadeCCEncarregado
     *
     * @return DadosInscricao
     */
    public function setDataValidadeCCEncarregado($dataValidadeCCEncarregado)
    {
        $this->DataValidadeCCEncarregado = $dataValidadeCCEncarregado;

        return $this;
    }

    /**
     * Get dataValidadeCCEncarregado
     *
     * @return \DateTime
     */
    public function getDataValidadeCCEncarregado()
    {
        return $this->DataValidadeCCEncarregado;
    }

    /**
     * Set fichaInscricaoFPF
     *
     * @param string $fichaInscricaoFPF
     *
     * @return DadosInscricao
     */
    public function setFichaInscricaoFPF($fichaInscricaoFPF)
    {
        $this->FichaInscricaoFPF = $fichaInscricaoFPF;

        return $this;
    }

    /**
     * Get fichaInscricaoFPF
     *
     * @return string
     */
    public function getFichaInscricaoFPF()
    {
        return $this->FichaInscricaoFPF;
    }
}
