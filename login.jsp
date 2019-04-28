<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>登录页</title>
        <link rel="stylesheet" type="text/css" href="/commons/css/reset.css" />
       <!-- <link rel="stylesheet" type="text/css" href="iot/css/headerFooter.css" />-->
        <link rel="stylesheet" type="text/css" href="/commons/css/CASIC_Platform.css" />
        <script src="/commons/js/jquery.min.js"></script>
    </head>
    <body>
    	<form >
        <div class="login_main">
            <div class="login_mainCon">
                <div class="login_left">
                    <div class="con1">
                        INDICS Platform
                    </div>
                    <div class="con2">
                        INDustrial Intelligent Cloud System Platform China Leading Industrial Internet
                    </div>
                </div>
                <div class="login">
                    <div class="login_inner">
                        <div class="login_tit">
                            INDICS Platform 
                        </div>
                        <div>
                        	<span id="loginTip" style="color: red"></span>
                        </div>
                        <div class="login_input">
                            <span class="icon iconBg01"></span>
                            <input type="text" id="account" name="account" placeholder="邮箱/用户名/已验证手机" />
                        </div>
                        <div class="login_input">
                            <span class="icon iconBg02"></span>
                            <input id="password" name="password" placeholder="密码" type="password"/>
                        </div>
                        <div class="login_set">
                            <a href="" class="forget_password"> 忘记密码？</a>
                            <label><input type="checkbox" />自动登录</label>
                        </div>
                        <div class="login_btn">
                            <input type="button" value="登陆" id="btnLogin"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </body>
    
    <script>
		var height = $(window).height();
		$(".login_main").css({"height":height});
		
        $(document).ready(function(){
        	$('#password').keydown(function(e){
        		if(e.keyCode==13){
        		   $('#btnLogin').click();
        		}
        	}); 
        	function getAllUrlsParam(url,name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        		url=decodeURIComponent(url);
                var r = url.match(reg);
                if (r != null){
                	return unescape(r[2]);
                }else if(url.indexOf("?") != -1){
                	var tempurl=url.substr(url.indexOf("?")+1);
                	if(tempurl){
                		return getAllUrlsParam(tempurl,name);
                	}
                }; 
                return null; 
            }
        	function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        		url=decodeURIComponent(window.location.search.substr(1));
                var r = url.match(reg);
                if (r != null){
                	return unescape(r[2]);
                }else if(url.indexOf("?") != -1){
                	var tempurl=url.substr(url.indexOf("?")+1);
                	if(tempurl){
                		return getAllUrlsParam(tempurl,name);
                	}
                }; 
                return null; 
            }
        	
			$('#btnLogin').click(function(){
				var springSecurityRedirect=getUrlParam("spring-security-redirect");
				$.ajax({
					dataType : "json",
					url : "/local/iotLogin.ht",
					type : "post",
					data : {
						"spring-security-redirect":springSecurityRedirect,
						"account" : $('#account').val(),
						"password" : $('#password').val(),
						"_spring_security_remember_me" : $("input[name='_spring_security_remember_me']:checked").val()
					},
					success : function(data) {
						if (data && !data.success) {
							$("#loginTip").html(data.message);
						}
					},
					complete:function(XHR,TS){
						if(XHR.getResponseHeader("content-type") && XHR.getResponseHeader("content-type").indexOf("text/html")>-1){
							document.write(XHR.responseText);
							document.close();
							history.pushState("","",springSecurityRedirect);
						}
						
					}
				});
			});
		});
    </script>
</html>