<?php
// Crea una pokédex buida.
$pokedex = [];

// Crea els següents pokémons:

$pokemon1 = ['numero' => 001, 'nombre' => "Bulbasaur", 'region' => "Kanto", 'tipo' => "planta/veneno", 'alzada' => 70, 'peso' => 6.9, 'evolucion' => "sin evolucion", 'imagen' => "https://images.wikidexcdn.net/mwuploads/wikidex/8/8c/Bulbasaur_en_la_primera_generación.png"];
$pokemon2 = ['numero' => 002, 'nombre' => "Ivysaur", 'region' => "kanto", 'tipo' => "planta/veneno", 'alzada' => 100, 'peso' =>  13.0, 'evolucion' => "otra evolucion", 'imagen' => "img"];
$pokemon3 = ['numero' => 004, 'nombre' => "Charmander", 'region' => "kanto", 'tipo' => "Fuego", 'alzada' => 70, 'peso' => 6.9, 'evolucion' => "sin evolucion", 'imagen' => "img"];

//Afegir els pokémons a la pokédex.

$pokedex['pokemon1'] = $pokemon1;
$pokedex['pokemon2'] = $pokemon2;
$pokedex['pokemon3'] = $pokemon3;

// Mostrar tota la informació que hi ha a la pokédex.

//pintarPokedex($pokedex);

// Esborrar el pokemon Yvysaur de la pokédex.

unset($pokedex['pokemon2']);

// Tornar a mostrar el contingut de la pokédex.

//pintarPokedex($pokedex);


// Mostrar tota la informació que hi ha a la pokédex.
function pintarPokedex($argPokedex)
{
    foreach ($argPokedex as $key => $pokemon) {
        echo "<strong>$key</strong><br />";

        foreach ($pokemon as $atributo => $value) {
            echo $atributo . ":" . $value . "<br />";
        }

        echo "<br /><br />";
    }
}