<?php

$menu = Array();
$menu[] = Array(
    'name' => "First",
    'values' => ['fdgdfg', 'dghfghfgh', 'ewerertrt']
);
$menu[] = Array(
    'name' => "Second",
    'values' => ['234234', '456456', '678678123123', '45']
);
$menu[] = Array(
    'name' => "Third",
);

$slider = Array();
$slider[] = Array(
    'img' => "cat1.png"
);
$slider[] = Array(
    'img' => "cat2.png"
);
$slider[] = Array(
    'img' => "cat3.png"
);

if ($_GET['type'] == 'menu') {
    echo json_encode($menu);
}

if ($_GET['type'] == 'slider') {
    echo json_encode($slider);
}