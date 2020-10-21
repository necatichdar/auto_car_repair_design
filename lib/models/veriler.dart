import 'package:deneme_app/models/service.dart';

class Veriler {

	Veriler({
		this.services,
	});

	List<Service> services;

	factory Veriler.fromJson(Map<String, dynamic> json) => Veriler(
		services: json["services"] == null ? null : List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
	);

	Map<String, dynamic> toJson() => {
		"services": services == null ? null : List<dynamic>.from(services.map((x) => x.toJson())),
	};
}
