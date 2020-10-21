class Service {
  Service({
    this.name,
    this.model,
    this.status,
    this.done,
  });

  String name;
  String model;
  String status;
  bool done;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"] == null ? null : json["name"],
        model: json["model"] == null ? null : json["model"],
        status: json["status"] == null ? null : json["status"],
        done: json["done"] == null ? null : json["done"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "model": model == null ? null : model,
        "status": status == null ? null : status,
        "done": done == null ? null : done,
      };
// String name;
// String model;
// String status;
// bool done;
//
// Services({this.name,this.model,this.status,this.done});
//
// Services.fromJsonMap(Map<String, dynamic> map):
// 	name = map["name"],
// 	model = map["model"],
// 	status = map["status"],
// 	done = map["done"];
//
// Map<String, dynamic> toJson() {
// 	final Map<String, dynamic> data = new Map<String, dynamic>();
// 	data['name'] = name;
// 	data['model'] = model;
// 	data['status'] = status;
// 	data['done'] = done;
// 	return data;
// }

}
