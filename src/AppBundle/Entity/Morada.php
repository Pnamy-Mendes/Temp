<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
* @ORM\Entity
* @ORM\Table(name="Morada")
**/
class Morada
{

	/**
	* @ORM\Id
	* @ORM\Column(name="ID_Morada", type="integer")
	* @ORM\GeneratedValue
	**/
	protected $ID_Morada;

	/**
	* @ORM\Column(name="Rua", type="string", nullable=true)
    * @Assert\NotNull(
    *     message = "O campo Rua é obrigatório!"
    * )
    * @Assert\Length(
    *      min = 3,
    *      max = 70,
    *      minMessage = "O campo Rua tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Rua não pode ter mais de {{ limit }} caracteres."
    * )
	**/
	protected $Rua;

    /**
    * @ORM\Column(name="Numero", type="integer", nullable=true)
    * @Assert\Regex(
    *     pattern     = "/^[0-9]+$/i",
    *     htmlPattern = "^[0-9]+$",
    *     message="O campo Número na Morada é numérico."
    * )
    * @Assert\Length(
    *      min = 1,
    *      max = 6,
    *      minMessage = "O campo Número na Morada tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Número na Morada não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Numero;

    /**
    * @ORM\Column(name="Andar", type="string", nullable=true)
    * @Assert\Length(
    *      max = 6,
    *      maxMessage = "O campo Andar na Morada não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Andar;

    /**
    * @ORM\Column(name="CodPostal4", type="string", nullable=true)
    * @Assert\NotNull(
    *     message = "O campo Código Postal [4] é obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[0-9]+$/i",
    *     htmlPattern = "^[0-9]+$",
    *     message="O campo Código Postal [4] na Morada é numérico."
    * )
    * @Assert\Length(
    *      min = 4,
    *      max = 4,
    *      exactMessage = "O campo Código Postal [4] na Morada tem que ter {{ limit }} caracteres."
    * )
    **/
    protected $CodPostal4;

    /**
    * @ORM\Column(name="CodPostal3", type="string", nullable=true)
    * @Assert\NotNull(
    *     message = "O campo Código Postal [3] é obrigatório!"
    * )
    * @Assert\Regex(
    *     pattern     = "/^[0-9]+$/i",
    *     htmlPattern = "^[0-9]+$",
    *     message="O campo Código Postal [3] é numérico."
    * )
    * @Assert\Length(
    *      min = 3,
    *      max = 3,
    *      exactMessage = "O campo Código Postal [3] tem que ter {{ limit }} caracteres."
    * )
    **/
    protected $CodPostal3;

    /**
    * @ORM\Column(name="Localidade", type="string", nullable=true)
    * @Assert\NotNull(
    *     message = "O campo Localidade é obrigatório!"
    * )
    * @Assert\Length(
    *      min = 3,
    *      max = 50,
    *      minMessage = "O campo Localidade tem que ter pelo menos {{ limit }} caracteres.",
    *      maxMessage = "O campo Localidade não pode ter mais de {{ limit }} caracteres."
    * )
    **/
    protected $Localidade;

    /**
     * Get iDMorada
     *
     * @return integer
     */
    public function getIDMorada()
    {
        return $this->ID_Morada;
    }

    /**
     * Set rua
     *
     * @param string $rua
     *
     * @return Morada
     */
    public function setRua($rua)
    {
        $this->Rua = $rua;

        return $this;
    }

    /**
     * Get rua
     *
     * @return string
     */
    public function getRua()
    {
        return $this->Rua;
    }

    /**
     * Set numero
     *
     * @param integer $numero
     *
     * @return Morada
     */
    public function setNumero($numero)
    {
        $this->Numero = $numero;

        return $this;
    }

    /**
     * Get numero
     *
     * @return integer
     */
    public function getNumero()
    {
        return $this->Numero;
    }

    /**
     * Set andar
     *
     * @param integer $andar
     *
     * @return Morada
     */
    public function setAndar($andar)
    {
        $this->Andar = $andar;

        return $this;
    }

    /**
     * Get andar
     *
     * @return integer
     */
    public function getAndar()
    {
        return $this->Andar;
    }

    /**
     * Set codPostal4
     *
     * @param integer $codPostal4
     *
     * @return Morada
     */
    public function setCodPostal4($codPostal4)
    {
        $this->CodPostal4 = $codPostal4;

        return $this;
    }

    /**
     * Get codPostal4
     *
     * @return integer
     */
    public function getCodPostal4()
    {
        return $this->CodPostal4;
    }

    /**
     * Set codPostal3
     *
     * @param integer $codPostal3
     *
     * @return Morada
     */
    public function setCodPostal3($codPostal3)
    {
        $this->CodPostal3 = $codPostal3;

        return $this;
    }

    /**
     * Get codPostal3
     *
     * @return integer
     */
    public function getCodPostal3()
    {
        return $this->CodPostal3;
    }

    /**
     * Set localidade
     *
     * @param string $localidade
     *
     * @return Morada
     */
    public function setLocalidade($localidade)
    {
        $this->Localidade = $localidade;

        return $this;
    }

    /**
     * Get localidade
     *
     * @return string
     */
    public function getLocalidade()
    {
        return $this->Localidade;
    }
}
