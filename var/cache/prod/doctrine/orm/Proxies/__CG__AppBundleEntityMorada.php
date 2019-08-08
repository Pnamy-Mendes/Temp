<?php

namespace Proxies\__CG__\AppBundle\Entity;

/**
 * DO NOT EDIT THIS FILE - IT WAS CREATED BY DOCTRINE'S PROXY GENERATOR
 */
class Morada extends \AppBundle\Entity\Morada implements \Doctrine\ORM\Proxy\Proxy
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
            return ['__isInitialized__', 'ID_Morada', 'Rua', 'Numero', 'Andar', 'CodPostal4', 'CodPostal3', 'Localidade'];
        }

        return ['__isInitialized__', 'ID_Morada', 'Rua', 'Numero', 'Andar', 'CodPostal4', 'CodPostal3', 'Localidade'];
    }

    /**
     * 
     */
    public function __wakeup()
    {
        if ( ! $this->__isInitialized__) {
            $this->__initializer__ = function (Morada $proxy) {
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
    public function getIDMorada()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getIDMorada', []);

        return parent::getIDMorada();
    }

    /**
     * {@inheritDoc}
     */
    public function setRua($rua)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setRua', [$rua]);

        return parent::setRua($rua);
    }

    /**
     * {@inheritDoc}
     */
    public function getRua()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getRua', []);

        return parent::getRua();
    }

    /**
     * {@inheritDoc}
     */
    public function setNumero($numero)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setNumero', [$numero]);

        return parent::setNumero($numero);
    }

    /**
     * {@inheritDoc}
     */
    public function getNumero()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getNumero', []);

        return parent::getNumero();
    }

    /**
     * {@inheritDoc}
     */
    public function setAndar($andar)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setAndar', [$andar]);

        return parent::setAndar($andar);
    }

    /**
     * {@inheritDoc}
     */
    public function getAndar()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getAndar', []);

        return parent::getAndar();
    }

    /**
     * {@inheritDoc}
     */
    public function setCodPostal4($codPostal4)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setCodPostal4', [$codPostal4]);

        return parent::setCodPostal4($codPostal4);
    }

    /**
     * {@inheritDoc}
     */
    public function getCodPostal4()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getCodPostal4', []);

        return parent::getCodPostal4();
    }

    /**
     * {@inheritDoc}
     */
    public function setCodPostal3($codPostal3)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setCodPostal3', [$codPostal3]);

        return parent::setCodPostal3($codPostal3);
    }

    /**
     * {@inheritDoc}
     */
    public function getCodPostal3()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getCodPostal3', []);

        return parent::getCodPostal3();
    }

    /**
     * {@inheritDoc}
     */
    public function setLocalidade($localidade)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setLocalidade', [$localidade]);

        return parent::setLocalidade($localidade);
    }

    /**
     * {@inheritDoc}
     */
    public function getLocalidade()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getLocalidade', []);

        return parent::getLocalidade();
    }

}
