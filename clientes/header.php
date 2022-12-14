<?php
require "carrito-count.php";

error_reporting(0);
if ($_SESSION["id"] > 1) { } else {
    //header("Location: login.php");
}
?>

<html>

<head>
    <style>
        body {
            margin: 0px;
            font-family: Arial, Helvetica, sans-serif;
        }

        #backButton {
            text-decoration: none;
            border-radius: 8px;
            text-align: end;
            border-radius: 5px;
            color: white;
            font-size: 15px;
            background: darkgrey;
            padding: 8px;
            display: inline-block;
        }

        #backButton:hover {
            background: #696969;
        }

        .backButtonf {
            text-decoration: none;
            border-radius: 8px;
            text-align: end;
            border-radius: 5px;
            color: white;
            font-size: 15px;
            background: #8f8f8f;
            padding: 8px;
            display: inline-block;
        }

        .backButtonf:hover {
            background: #696969;
        }

        #cerrarButton {
            text-decoration: none;
            border-radius: 8px;
            text-align: end;
            border-radius: 5px;
            color: white;
            font-size: 15px;
            background: crimson;
            padding: 8px;
            display: inline-block;
            float: right;
        }

        #cerrarButton:hover {
            background: #800000;
        }

        #login {
            text-decoration: none;
            border-radius: 8px;
            text-align: end;
            border-radius: 5px;
            color: white;
            font-size: 15px;
            background: #28a745;
            padding: 8px;
            display: inline-block;
            float: right;
        }

        #login:hover {
            background: #218838;
        }

        #container {
            background: lightgray;
            width: 100%;
            padding: 15px;
        }
        #topDiv {
            margin-bottom: 15px;
            width: 97%;
        }
        #navigationDiv {
            width: 97%;
        }
        #name {
            font-size: 22px;
            float: right;
        }

        #profilePic {
            display: inline-block; 
            max-width: 60px; 
            float: right; 
            border-radius: 5px;
            margin-left: 13px;
        }
        
    </style>
</head>

<body>
    <div id="container" name="container">
        <div id="topDiv">
            <a style= "font-size: 25px" >Repulser Book Store</a>
            <a id="name" ><?php echo $_SESSION["nombre"]; ?></a>
        </div>
        <!-- INICIO || USUARIOS || PRODUCTOS || SALIR -->
        <div id="navigationDiv">
            <a id="backButton" href="home.php" target="_PARENT">INICIO</a>
            <a id="backButton" href="productos.php" target="_PARENT">PRODUCTOS</a>
            <a id="backButton" href="tabla-mostrar-pedidos.php" target="_PARENT">MIS PEDIDOS</a>
            
            <!-- BUSCAR - PENDIENTE -->

            <a id="carrito" name="carrito" class="backButtonf" href="carrito1.php" target="_PARENT">&zwnj;<img src="img/carrito.png" style="max-height: 25px; margin: -5px; vertical-align: bottom;" target="_PARENT"> - <?php echo carritoCount(); ?></a>
            <?php if($_SESSION["id"] > 1) {
                echo '<a id="cerrarButton" href="../closeSession.php" target="_PARENT" >SALIR</a>';
            }
            else {
                echo '<a id="login" href="../login.php" target="_PARENT" >Login</a>';
            }
            ?>
        </div>
    </div>
</body>

</html>