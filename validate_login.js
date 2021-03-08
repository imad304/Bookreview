function validate_reg()
{
	
	
	var x1=document.fm.un.value;
	var y1=document.fm.pwd.value;
	
	var index=document.fm.user.selectedIndex;
	
	if(index=="")
	{
		alert("Please select the user type");
		return false;
		
	}
	
	if(x1=="" || x1.length<3)
	{
		alert("user name should not be empty ");
		fm.un.focus();
		return false;
	}

		
	
	if(y1=="" || y1.length<6)
	{
		alert("password should not be empty ");
		fm.pwd.focus();
		return false;
	}
    
		

}
