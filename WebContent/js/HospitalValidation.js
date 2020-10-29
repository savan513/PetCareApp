 function fun3()
  {
      
      var Pass=document.getElementById("HpPassword");
      var Passc=document.getElementById("HpPasswordC");
      var EM=document.getElementById("HpEmail");
      var Mb=document.getElementById("HpMobile");
      var Regx=/^[7-9]\d{9}$/;
      if(Pass.value.trim()!=Passc.value.trim())
      {
          alert("Password And Cofirm Password are not same");
          Pass.style.border="3px solid red";
          Passc.style.border="3px solid red";
          return false;
      }
      if(!Regx.test(Mb.value))
      {
    	 
    	  alert("Invalid Mobile Number");
    	  Mb.style.border="3px solid red";
    	  return false;
      }
      
      var reg1=/^([a-z 0-9\.-]+)@([a-z 0-9-]+)([a-z]{2,8})(.[a-z]{2,8})?$/;
      if(!reg1.test(EM.value.trim()))
      {
    	 
    	  alert("Invalid Email Address");
    	  EM.style.border="3px solid red";
    	  return false;
      }
          true;
  
  }