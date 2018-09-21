
//获取当前url的数据前缀，用于拼接url
function getHttpHost() {
    //前缀如：http://localhost:8080
    return window.location.protocol+"//"+window.location.host
}

//获取当前时间，到分
function getCurrentTime() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth();
    var day = date.getDate();
    var hours = date.getHours();
    var min = date.getMinutes();
    var time = year +"-"+ fnDate(month+1) +"-"+ fnDate(day) +" "+ fnDate(hours) +":"+ fnDate(min);
    return time;
}

//判断输入小于10则补0
function fnDate(str) {
    var num;
    str>10?num = str: num = "0" + str;
    return num
}