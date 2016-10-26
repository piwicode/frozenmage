// src_input_axis(vk_positive, vk_negative, gp_bt_positive, gp_bt_negative, gp_axis1)
var device = 0
var vk_positive = argument0
var vk_negative = argument1
var gp_bt_positive = argument2
var gp_bt_negative = argument3
var gp_axis1 = argument4
var keyboard = keyboard_check(vk_positive) - keyboard_check(vk_negative);
var gamepad1 = gamepad_button_check(device, gp_bt_positive) - gamepad_button_check(device, gp_bt_negative);
var gamepad2 = gamepad_axis_value(device, gp_axis1);
var deadzone = .3;
if( abs(gamepad2) < deadzone ) gamepad2 = 0;
return sign(keyboard + gamepad1 + gamepad2)
