/// @description Insert description here

switch(room) {
	case rm_game:
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		var c = c_yellow;
		draw_text_transformed_color(
			room_width/2, 10, string(score), 
			2, 2, 0, c,c,c,c, .9
		);
		draw_set_halign(fa_left);
		draw_text(10, room_height - 60, "LIVES: " + string(lives));
		draw_set_halign(fa_left);
		draw_text(10, room_height - 40, "BOMBS: " + string(global.bomb_count));
		draw_set_halign(fa_right);
		draw_text(room_width - 10, room_height - 40, "WAVE: " + string(global.enemy_wave));
		break;
		
	case rm_start:
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		var c = c_yellow;
		draw_text_transformed_color(
			room_width/2, 200, "GALAG", 
			6, 6, 0, c,c,c,c, 1
		);
		//draw_set_color(c_white);
		draw_text(
			room_width/2, 300, 
			@"
			LEFT/RIGHT: move
			SPACE: shoot
			M: missle
			B: bomb
			
			>> PRESS ENTER TO START <<
			"
		);
		//draw_set_color(c_yellow);
		//draw_text(
		//	room_width/2, 500, 
		//	"High Score: " + string(global.high_score)
		//);
		draw_text_transformed_color(
			room_width/2, 500, "High Score: " + string(global.high_score), 
			2, 2, 0, c,c,c,c, 1
		);
		draw_set_halign(fa_left);
		break;
			
	case rm_gameover:
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		var c = c_red;
		draw_text_transformed_color(
			room_width/2, 300, "GAME OVER", 
			6, 6, 0, c,c,c,c, 1
		);
		//draw_text(
		//	room_width/2, 500, 
		//	"FINAL SCORE: " + string(score)
		//);		
		c = c_yellow;
		draw_text_transformed_color(
			room_width/2, 500, "FINAL SCORE: " + string(score), 
			2, 2, 0, c,c,c,c, 1
		);		

		draw_text(
			room_width/2, 600, 
			"PRESS ENTER TO RESTART"
		);
		draw_set_halign(fa_left);	
		break;
}
