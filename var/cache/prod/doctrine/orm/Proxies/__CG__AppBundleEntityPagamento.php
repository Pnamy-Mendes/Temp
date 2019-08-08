<?php

namespace Proxies\__CG__\AppBundle\Entity;

/**
 * DO NOT EDIT THIS FILE - IT WAS CREATED BY DOCTRINE'S PROXY GENERATOR
 */
class Pagamento extends \AppBundle\Entity\Pagamento implements \Doctrine\ORM\Proxy\Proxy
{
    /**
     * @var \Closure the callback responsible for loading properties in the proxy object. This callback is called with
     *      three parameters, being respectively the proxy object to be initialized, the method that triggered the
     *      initialization process and an array of ordered parameters that were passed to that method.
     *
     * @see \Doctrine\Common\Persistence\Proxy::__setInitializer
     */
    public $__initializer__;

    /**
     * @var \Closure the callback responsible of loading properties that need to be copied in the cloned object
     *
     * @see \Doctrine\Common\Persistence\Proxy::__setCloner
     */
    public $__cloner__;

    /**
     * @var boolean flag indicating if this object was already initialized
     *
     * @see \Doctrine\Common\Persistence\Proxy::__isInitialized
     */
    public $__isInitialized__ = false;

    /**
     * @var array properties to be lazy loaded, with keys being the property
     *            names and values being their default values
     *
     * @see \Doctrine\Common\Persistence\Proxy::__getLazyProperties
     */
    public static $lazyPropertiesDefaults = [];



    /**
     * @param \Closure $initializer
     * @param \Closure $cloner
     */
    public function __construct($initializer = null, $cloner = null)
    {

        $this->__initializer__ = $initializer;
        $this->__cloner__      = $cloner;
    }







    /**
     * 
     * @return array
     */
    public function __sleep()
    {
        if ($this->__isInitialized__) {
            return ['__isInitialized__', 'ID_Pagamento', 'ModoPagamento', 'Descricao', 'Valor', 'ValorPosLimite', 'DataLimite', 'Benificio', 'DescricaoBenificio', 'PagamentosEntidade'];
        }

        return ['__isInitialized__', 'ID_Pagamento', 'ModoPagamento', 'Descricao', 'Valor', 'ValorPosLimite', 'DataLimite', 'Benificio', 'DescricaoBenificio', 'PagamentosEntidade'];
    }

    /**
     * 
     */
    public function __wakeup()
    {
        if ( ! $this->__isInitialized__) {
            $this->__initializer__ = function (Pagamento $proxy) {
                $proxy->__setInitializer(null);
                $proxy->__setCloner(null);

                $existingProperties = get_object_vars($proxy);

                foreach ($proxy->__getLazyProperties() as $property => $defaultValue) {
                    if ( ! array_key_exists($property, $existingProperties)) {
                        $proxy->$property = $defaultValue;
                    }
                }
            };

        }
    }

    /**
     * 
     */
    public function __clone()
    {
        $this->__cloner__ && $this->__cloner__->__invoke($this, '__clone', []);
    }

    /**
     * Forces initialization of the proxy
     */
    public function __load()
    {
        $this->__initializer__ && $this->__initializer__->__invoke($this, '__load', []);
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setInitialized($initialized)
    {
        $this->__isInitialized__ = $initialized;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setInitializer(\Closure $initializer = null)
    {
        $this->__initializer__ = $initializer;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __getInitializer()
    {
        return $this->__initializer__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setCloner(\Closure $cloner = null)
    {
        $this->__cloner__ = $cloner;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific cloning logic
     */
    public function __getCloner()
    {
        return $this->__cloner__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     * @static
     */
    public function __getLazyProperties()
    {
        return self::$lazyPropertiesDefaults;
    }

    
    /**
     * {@inheritDoc}
     */
    public function getIDPagamento()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getIDPagamento', []);

        return parent::getIDPagamento();
    }

    /**
     * {@inheritDoc}
     */
    public function setDescricao($descricao)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDescricao', [$descricao]);

        return parent::setDescricao($descricao);
    }

    /**
     * {@inheritDoc}
     */
    public function getDescricao()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDescricao', []);

        return parent::getDescricao();
    }

    /**
     * {@inheritDoc}
     */
    public function setValor($valor)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setValor', [$valor]);

        return parent::setValor($valor);
    }

    /**
     * {@inheritDoc}
     */
    public function getValor()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getValor', []);

        return parent::getValor();
    }

    /**
     * {@inheritDoc}
     */
    public function setValorPosLimite($valor)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setValorPosLimite', [$valor]);

        return parent::setValorPosLimite($valor);
    }

    /**
     * {@inheritDoc}
     */
    public function getValorPosLimite()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getValorPosLimite', []);

        return parent::getValorPosLimite();
    }

    /**
     * {@inheritDoc}
     */
    public function setDataLimite($dataLimite)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDataLimite', [$dataLimite]);

        return parent::setDataLimite($dataLimite);
    }

    /**
     * {@inheritDoc}
     */
    public function getDataLimite()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDataLimite', []);

        return parent::getDataLimite();
    }

    /**
     * {@inheritDoc}
     */
    public function setBenificio($benificio)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setBenificio', [$benificio]);

        return parent::setBenificio($benificio);
    }

    /**
     * {@inheritDoc}
     */
    public function getBenificio()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getBenificio', []);

        return parent::getBenificio();
    }

    /**
     * {@inheritDoc}
     */
    public function setDescricaoBenificio($descricaoBenificio)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDescricaoBenificio', [$descricaoBenificio]);

        return parent::setDescricaoBenificio($descricaoBenificio);
    }

    /**
     * {@inheritDoc}
     */
    public function getDescricaoBenificio()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDescricaoBenificio', []);

        return parent::getDescricaoBenificio();
    }

    /**
     * {@inheritDoc}
     */
    public function setModoPagamento(\AppBundle\Entity\ModoPagamento $modoPagamento = NULL)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setModoPagamento', [$modoPagamento]);

        return parent::setModoPagamento($modoPagamento);
    }

    /**
     * {@inheritDoc}
     */
    public function getModoPagamento()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getModoPagamento', []);

        return parent::getModoPagamento();
    }

    /**
     * {@inheritDoc}
     */
    public function addPagamentoEntidade(\AppBundle\Entity\PagamentoEntidade $pagamento)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'addPagamentoEntidade', [$pagamento]);

        return parent::addPagamentoEntidade($pagamento);
    }

    /**
     * {@inheritDoc}
     */
    public function removePagamentoEntidade(\AppBundle\Entity\PagamentoEntidade $pagamento)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'removePagamentoEntidade', [$pagamento]);

        return parent::removePagamentoEntidade($pagamento);
    }

    /**
     * {@inheritDoc}
     */
    public function getPagamentosEntidade()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getPagamentosEntidade', []);

        return parent::getPagamentosEntidade();
    }

}
