cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_alpha(1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_m6x11);
//
if player_effect_damaged>0 { var player_hp_draw_x=x+irandom_range(-2,2), player_hp_draw_y=y+irandom_range(-2,2); }
else { var player_hp_draw_x=x, player_hp_draw_y=y; }
if enemy_effect_damaged>0 { var enemy_hp_draw_x=x+irandom_range(-2,2), enemy_hp_draw_y=y+irandom_range(-2,2); }
else { var enemy_hp_draw_x=x, enemy_hp_draw_y=y; }
//
var scoreboard_x=cam_w-78;
var scoreboard_y=71;
//
sc_drawrectangle(scoreboard_x,scoreboard_y,scoreboard_x+67,scoreboard_y+25,global.color_black,global.color_white,1,0.5,1,0);
draw_set_halign(fa_center);
sc_drawtext(scoreboard_x+16+player_hp_draw_x,scoreboard_y+9+player_hp_draw_y,string(player_hp),global.color_player,global.color_black,1,0.5,0,-1);
sc_drawtext(scoreboard_x+34,scoreboard_y+9,"/",global.color_white,global.color_black,1,0.5,0,-1);
sc_drawtext(scoreboard_x+52+enemy_hp_draw_x,scoreboard_y+9+enemy_hp_draw_y,string(enemy_hp),global.color_enemy,global.color_black,1,0.5,0,-1);
//
var bar_amount=((player_hp)*100)/(hp_max*2);
draw_healthbar(scoreboard_x+2,scoreboard_y+2,scoreboard_x+65,scoreboard_y+5,bar_amount,global.color_enemy,global.color_player,global.color_player,0,true,false);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_m3x6);
//
draw_set_halign(fa_left);
var var_text=string(card_berrydeck_total) + "x Berry Deck";
sc_drawrectangle(10,cam_h-20,14+string_width(var_text),cam_h-9,global.color_black,global.color_black,1,0.5,1,0);
sc_drawtext(13,cam_h-21,var_text,global.color_white,c_black,0.1,0,0,-1);
//
draw_set_halign(fa_right);
var var_text=string(card_maindeck_total) + "x Main Deck";
sc_drawrectangle(cam_w-15-string_width(var_text),cam_h-20,cam_w-11,cam_h-9,global.color_black,global.color_black,1,0.5,1,0);
sc_drawtext(cam_w-12,cam_h-21,var_text,global.color_white,c_black,0.1,0,0,-1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_halign(fa_center);
var var_message="", var_message_color=c_white;
//
if player_turn=false {
	var_message="(Adversary's turn)"
	var_message_color=global.color_enemy;
}
else if first_turn_warning=true {
	var_message="You can't attack on your first turn."
	var_message_color=global.color_damage;
}
else if card_draw_points>0 and card_hand_total=card_hand_max {
	var_message="You can't hold more than " + string(card_hand_max) + " cards in your hand. Discard or play one to draw more."
	var_message_color=global.color_damage;
}
else if card_draw_points>0 and card_draw_points<=2 {
	var_message="You may draw a card from your main deck, or 2 berries."
	var_message_color=global.color_player;
}
else if card_draw_points>2 {
	var_message="You may draw a card from your main deck, or 2 berries (2x)."
	var_message_color=global.color_player;
}
//
if helpmsg_dismissed=false and var_message!="" {
	sc_drawrectangle(cam_w/2-string_width(var_message)/2-5,219,cam_w/2+string_width(var_message)/2+3,230,global.color_black,global.color_black,1,0.8,1,0);
	sc_drawtext(cam_w/2,218,var_message,var_message_color,global.color_black,1,0.5,0,-1);
}
//
draw_set_halign(fa_left);
if card_draw_points>=card_drawcost_berry {
	sc_drawrectangle(27,193,49,204,global.color_black,global.color_black,1,0.5,1,0);
	sc_drawtext(30,192,"Draw",global.color_player,global.color_black,1,0.5,0,-1);
}
if card_draw_points>=card_drawcost_main {
	sc_drawrectangle(cam_w-50,193,cam_w-28,204,global.color_black,global.color_black,1,0.5,1,0);
	sc_drawtext(cam_w-47,192,"Draw",global.color_player,global.color_black,1,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if tooltip_text!="" {
	if mouse_x+17+string_width(tooltip_text)<cam_w {
		draw_set_halign(fa_left);
		sc_drawrectangle(mouse_x+9,mouse_y-4,mouse_x+18+string_width(tooltip_text),mouse_y+12,global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x+15,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
	else {
		draw_set_halign(fa_right);
		sc_drawrectangle(mouse_x-14-string_width(tooltip_text),mouse_y-4,mouse_x-5,mouse_y+12,global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x-8,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
}
tooltip_text="";
//————————————————————————————————————————————————————————————————————————————————————————————————————
if fade_black>0 {
	sc_drawrectangle(cam_x-8,cam_y-8,cam_x+cam_w+8,cam_y+cam_h+8,c_black,c_white,0,fade_black,1,0);
}
//
if textbox_active=true { sc_drawrectangle(cam_x+4,cam_y+cam_h-52,cam_x+cam_w-6,cam_y+cam_h-6,c_black,c_white,1,0.5,1,1); }
if text_string!="" { sc_drawtext(cam_x+12,cam_y+cam_h-48,text_show,c_white,c_black,1,0.5,0,233); }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if AI_report_toggle=true {
	draw_set_halign(fa_left);
	sc_drawrectangle(-2,-2,room_width+2,room_height+2,c_black,c_black,0,0.4,1,0);
	sc_drawtext(4,0,AI_report,c_aqua,c_black,1,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cursor_hide=false { var mouse_alpha=1; } else { var mouse_alpha=0.5; }
draw_sprite_general(sp_sheet,0,16*(mouse_cursor+1),16*0,16,16,mouse_x-5,mouse_y-5,1,1,0,c_white,c_white,c_white,c_white,mouse_alpha);