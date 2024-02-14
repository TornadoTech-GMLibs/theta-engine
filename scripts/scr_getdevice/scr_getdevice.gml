function scr_getdevice(){
	if(os_type == os_android || os_type == os_ios)
	{
		return 1; //Мобильные устройства
	}
	return 0; //Компьютеры
}