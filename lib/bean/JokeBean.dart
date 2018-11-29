import 'dart:convert' show json;

class JokeBean {
  int error_code;
  String reason;
  ResultBean result;
  
  JokeBean(jsonStr) {
    var jsonRes = json.decode(jsonStr);
    
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    var result = jsonRes['result'];
    if(result == null) {
       return ;
    }
    result = ResultBean(jsonRes["result"]);
  }

  @override
  String toString() {
    return 'JokeBean{error_code: $error_code, reason: $reason, result: $result}';
  }
  
}

class ResultBean{
  List<DataBean> data;
  
  ResultBean(jsonStr) {
    data = [];
    
    for (var dataItem in jsonStr['data']){
      data.add(DataBean(dataItem));
    }
  }

  @override
  String toString() {
    return 'ResultBean{data: $data}';
  }
  
}

class DataBean {
  String content;
  String hashId;
  int unixtime;
  String updatetime;
  
  DataBean(jsonRes) {
    content = jsonRes['content'];
    hashId = jsonRes['hashId'];
    unixtime = jsonRes['unixtime'];
    updatetime = jsonRes['updatetime'];
  }

  @override
  String toString() {
    return 'DataBean{content: $content, hashId: $hashId, unixtime: $unixtime, updatetime: $updatetime}';
  }


}