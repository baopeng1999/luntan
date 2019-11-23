	  function show(tag){
          var light=document.getElementById(tag);
          var fade=document.getElementById('fade');
          light.style.display='block';
          fade.style.display='block';
       }
       function hide(tag){
          var light=document.getElementById(tag);
          var fade=document.getElementById('fade');
          light.style.display='none';
          fade.style.display='none';
      }
       
       function shownextt(tag1,tag2){
           var oDiv1 = document.getElementById(tag1);
           var oDiv2 = document.getElementById(tag2);
           oDiv1.style.display='block';
           oDiv2.style.display='none';
           }
       
       function checklogin(){
    	   var account=document.getElementById('account').value;
    	   var psd=document.getElementById('psd').value;
    	   if(account==""){
    		   accempty.style.display='inline';
    		   return false;
    	   }
    	   if(psd==""){
    		   accempty.style.display='none';
    		   psdempty.style.display='inline';
    		   return false;
    	   }
    	   return true;
       }
       
       function shownextt(tag1,tag2){
           var oDiv1 = document.getElementById(tag1);
           var oDiv2 = document.getElementById(tag2);
           oDiv1.style.display='block';
           oDiv2.style.display='none';
           }


       function checkLname()
       {
          var lname = document.getElementById("racc").value;
            var spanNode = document.getElementById("raccempty");
            var reg = /^[\u4E00-\u9FA5|A-Za-z]([a-zA-Z0-9_\u4e00-\u9fa5]){3,8}$/;   //^'和'$' 作用是分别指出一个字符串的开始和结束。       
            if(reg.test(lname))
            {
                 spanNode.innerHTML = "正确".fontcolor("green");  
                return true;  
            }
            else
           {
                 spanNode.innerHTML = "*4-9位字母、数字，字母开头".fontcolor("red"); 
                 return false; 
            }
        }
        
        //检验姓名
        function checkName()
       {
          var name = document.getElementById("rname").value;
          var spanNode = document.getElementById("nameempty"); 
          var reg = /^[\u4e00-\u9fa5]{2,4}$/;
          
           if(reg.test(name))
            {
               spanNode.innerHTML = "正确".fontcolor("green");  
             return true;  
          }
          else
          {
               spanNode.innerHTML = "*请填写姓名".fontcolor("red"); 
               return false; 
            }
       }
        
        //检验手机号
        function checkPhone()
        {
             var phone = document.getElementById("rtel").value;
            var spanNode = document.getElementById("telempty"); 
             var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
             
             if(reg.test(phone))
            {
                 spanNode.innerHTML = "正确".fontcolor("green");  
                 return true;  
             }
            else
           {
                spanNode.innerHTML = "*请填写有效的邮箱".fontcolor("red"); 
                return false; 
            }
       }
        
        function checkPwd()
        {
             var pwd = document.getElementById("rpsd").value;
              var spanNode = document.getElementById("rpsdempty");
             var reg = /^[\S]{6,15}$/;       // \s:[a-zA-Z0-9] ; \S 取反：非空白字符
             
             if(reg.test(pwd))
             {
                  spanNode.innerHTML = "正确".fontcolor("green");  
                  return true;  
              }
             else
            {
                 spanNode.innerHTML = "*6-15位英文(区分大小写)、数字".fontcolor("red"); 
                 return false; 
             }
         }

        //检验确认密码
         function checkRepwd()
         {
             var pwd = document.getElementById("rpsd").value;
              var repwd = document.getElementById("rrpsd").value;
             var spanNode = document.getElementById("rrpsdempty");
              var reg = /^[\s\S]{6,15}$/;
              
            if(reg.test(repwd))
            {
                 if(pwd==repwd)
                 {
                     spanNode.innerHTML = "正确".fontcolor("green");  
                     return true;  
                  }
                else
               { 
                     spanNode.innerHTML = "*请再输入一遍上面的密码".fontcolor("red"); 
                     return false; 
                 }
            }
             else
           {
                 spanNode.innerHTML = "*请再输入一遍上面的密码".fontcolor("red"); 
                 return false; 
           }
        }
         
          //全部验证成功再提交表单  
          function checkAll()
          {
              var lname=checkLname();
              var name=checkName();
              var phone=checkPhone();
              var pwd = checkPwd();
              var repwd= checkRepwd();
                   
              if(lname&&name&&phone&&pwd&&repwd)
              {
                  return true;
              }
              else
              {
                   return false;
              }
          }
          