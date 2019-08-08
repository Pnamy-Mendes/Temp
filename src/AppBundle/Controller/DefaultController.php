<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;



class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage"))
     */
    public function indexAction()
    {

        return $this->render('base.html.twig');
    }

    /**
     * @Route("/login", name="login" , options={"expose"=true})
     */
    public function login(Request $request)
    {

        $em = $this->getDoctrine()->getManager();
    }

    /**
     * @Route("/allEpocas", name="all_epocas", options={"expose"=true})
     */
    public function getAllEpocas()
    {
        $epocas = $this->getDoctrine()->getRepository('AppBundle:Epoca')->findAll();

        $epocas = $this->get('serializer')->serialize('application/json');

        $response = new Response($epocas);

        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }
}
