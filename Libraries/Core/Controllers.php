<?php
// Libraries/Core/Controllers.php

class Controllers
{
    /** @var Views Instancia del motor de vistas */
    protected Views $views;

    /** @var object|null Instancia del modelo cargado */
    protected ?object $model = null;

    public function __construct()
    {
        $this->views = new Views();
        $this->loadModel();
    }

    protected function loadModel(): void
    {
        // HomeModel → Models/HomeModel.php
        $model      = get_class($this) . 'Model';
        $routeClass = "Models/{$model}.php";

        if (is_file($routeClass)) {
            require_once $routeClass;
            $this->model = new $model();
        }
    }
}
