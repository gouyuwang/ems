<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>考试系统</title>
    <meta name="keywords" content="考试系统">
    <meta name="description" content="考试系统">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <!-- load layui framework -->
    <link href="./layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <link href="./css/global.css" type="text/css" rel="stylesheet"/>
    <script src="./layui/layui.js" type="text/javascript"></script>
</head>
<body>
<div class="header">
    <div class="main">
        <a class="logo" href="/" title="在线考试系统">
            <i class="layui-icon" style="font-size: 40px;">&#xe609;</i> 在线考试系统
        </a>
        <div class="nav-user" style="display: none;">
            <span>
                <a href="javascript:;"><i class="layui-icon">&#xe612;</i> 考生:
                    <em style="color: #5FB878; list-style: none">0xdssesdee</em></a>
                <a href="index.html">退出</a>
            </span>
        </div>
    </div>
</div>
<div class="body">
    <div class="login">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">考生识别码</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required  lay-verify="required" placeholder="请输入考生识别码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">科目识别码</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required  lay-verify="required" placeholder="请输入科目识别码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">输入验证码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux" style="padding: 0 0; height: 28px">
					<img  src="./images/logo.png" onClick="this.src='captcha.php?'+Math.random()"
							  style="cursor:  pointer;" alt="获取验证码失败" title="点击刷新验证码" />
				 </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button onclick="location.href='./exam_index.html'" class="layui-btn" lay-submit lay-filter="formDemo" style="background-color:#5FB878;color: #fff;">参加考试</button>
                    <button onclick="location.href='./exam_result.html'" class="layui-btn" lay-submit lay-filter="formDemo2"style="background-color:#5FB878;color: #fff; " >成绩查询</button>
                </div>
            </div>
        </form>
     </div>
</div>

<!--<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form();
        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });

        //监听提交
        form.on('submit(formDemo2)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>-->
</body>
</html>