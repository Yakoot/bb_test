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

    if ($_GET['type'] == 'menu') {
        echo json_encode($menu);
    }