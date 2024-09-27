
// lib/models/animal.dart

import 'package:flutter/material.dart';

class Animal {
	final String text;
	final IconData icon;

	const Animal({required this.text, required this.icon});

	factory Animal.fromJson(Map<String, dynamic> json) {
		return Animal(
			text: json['text'] as String,
			icon: IconData(json['icon'] as int, fontFamily: 'MaterialIcons'),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint,
		};
	}

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		if (other is! Animal) return false;
		return text == other.text && icon == other.icon;
	}

	@override
	int get hashCode => text.hashCode ^ icon.hashCode;
}
