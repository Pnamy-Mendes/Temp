<?php

namespace AppBundle\Security;

use Symfony\Component\Security\Core\Validator\Constraints as SecurityAssert;

class ChangePassword
{
    /**
     * @SecurityAssert\UserPassword(
     *     message = "A password que inseriu não corresponde à sua antiga password."
     * )
     */
     protected $oldPassword;

     function setOldPassword($password){

     	$this->oldPassword = $password;

     }
}


?>