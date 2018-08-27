
//获取当前url的数据前缀，用于拼接url
function getHttpHost() {
    //前缀如：http://localhost:8080
    return window.location.protocol+"//"+window.location.host
}