// Windows default working_directory C:\Users\{USERNAME}\AppData\Local

function highscore_load()
{
	var file = working_directory + "highscore";

	try 
	{
		var handle = file_text_open_read(file);
		global.high_score = file_text_read_real(handle);
		file_text_close(handle);
	}
	catch (_exception)
	{
		global.high_score = 0;
	}
	
}

function highscore_save()
{
	var file = working_directory + "highscore";
	var handle = file_text_open_write(file);
	file_text_write_real(handle, global.high_score);
	file_text_close(handle);
}