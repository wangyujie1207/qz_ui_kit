class BaseResp<T> {
  String code;
  String msg;
  T data;

  BaseResp(this.code, this.msg, this.data);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}