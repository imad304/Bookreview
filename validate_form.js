function validate_reg()
{
	//alert("hi");
	
	var x2=document.fm.fname.value;

	
	if(x2=="" || x2.length<3)
	{
		alert("first name should not be empty and be atleast 3 characters");
		fm.fname.focus();
		return false;
	}

	if(!((x2.substr(0,1)>="A" && x2.substr(0,1)<="Z") ||( x2.substr(0,1)>="a" &&  x2.substr(0,1)<="z")))
	{
		alert("first name should not begin with number or any special character");
		fm.fname.focus();
		return false;
	}


var x3=document.fm.lname.value;
	

	if(x3=="" || x3.length<1)
	{
		alert("last name should not be empty and be atleast 1 characters");
		fm.lname.focus();
		return false;
	}
	
	if ( ( document.fm.sex[0].checked == false ) && ( document.fm.sex[1].checked == false ) ) 
	{
	alert ( "Please choose your Gender: Male or Female" ); 
	return false;
	}
	
	x= document.fm.address.value;
	if(x=="")
	{
		alert("please enter address ");
		fm.address.focus();
		return false;
	}
	
	var x = document.fm.phoneno.value;
    if (x==null || x=="")
 	{
 		alert("Phone no. cannot be left blank");
		fm.phoneno.focus();
 		return false;
 	}      

    if(isNaN(x)|| x.indexOf(" ")!=-1 || x<0)
	{
		alert("Enter numeric value");
		fm.phoneno.focus();
		return false;
    }
       	
	if (x.length > 10)
	{
		alert("enter 10 characters"); 
		fm.phoneno.focus();
		return false;
	}

	if (x.length < 10)
	{
		alert("enter 10 characters"); 
		fm.phoneno.focus();
		return false;
	}
	
	var x=document.fm.email.value;
	var atpos=x.indexOf("@");
	var atpos2=x.lastIndexOf("@");
	var fdot=x.indexOf(".");
	var dotpos=x.lastIndexOf(".");
		
	if(x.length<=0)
	{
		alert("email id should not be left empty");
		fm.email.focus();
		return false;
	}
		
	var i;
	var str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@_.";
	for(i=0;i<x.length;i++)
	{
		var c=x.charAt(i);
		if(str.indexOf(c)==-1)
		{
			alert("email id should not contain undefined special characters");
			fm.email.focus();
			return false;
		}
	}
		
	if(fdot==0)
	{
		alert("email id should not begin with dot");
		fm.email.focus();
		return false;
	}

	if(atpos!=atpos2)
	{
		alert("email id should contain only one @ symbol");
		fm.email.focus();
		return false;
	}

	/*if(atpos<3)
	{
		alert("email id user name should be atleast 3 characters");
		fm.email.focus();
		return false;
	}*/

	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
		alert("Not a valid e-mail address");
		fm.email.focus();
		return false;
	}
	
	var x1=document.fm.uname.value;
	
	if(x1=="" || x1.length<3)
	{
		alert("user name should not be empty and be atleast 3 characters");
		fm.uname.focus();
		return false;
	}
	

	if(!((x1.substr(0,1)>="A" && x1.substr(0,1)<="Z") ||( x1.substr(0,1)>="a" &&  x1.substr(0,1)<="z")))
	{
		alert("user name should not begin with number or any special character");
		fm.uname.focus();
		return false;
	}
 
	var y1=document.fm.pass1.value;
	
	if(y1=="" || y1.length<6)
	{
		alert("password should not be empty and must be atleast 6 characters");
		fm.pass1.focus();
		return false;
	}
    
	var y2=document.fm.pass2.value;
	
	if(y2=="" || y2.length<6)
	{
		alert("conform password should not be empty and must be atleast 6 characters");
		fm.pass2.focus();
		return false;
	}

	if( y1 != y2 )
	{
		alert("passwords not matched");
		fm.pass2.focus();
		return false;
	}
	
	/*
	

	var dt=document.getElementById('date');
	var mn=document.getElementById('month');
	var yr=document.getElementById('year');

	if(dt.selectedIndex==0)
	{
		alert("please select date");
		return false;
	}

	if(mn.selectedIndex==0)
	{
		alert("please select month");
		return false;
	}

	if(yr.selectedIndex==0)
	{
		alert("please select year");
		return false;
	}

	var chks = document.getElementsByName('colors[]');
var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
}}
if(!(hasChecked))
	{
		alert("Please select at least one of the \"Language\" options.");
		return false;
	}


	if((document.getElementById('gender_Male').checked)==0 && (document.getElementById('gender_Female').checked)==0 )
	{
		alert("please select gender");
		return false;
	}

	
*/	// alert("your successfully registered");


}
