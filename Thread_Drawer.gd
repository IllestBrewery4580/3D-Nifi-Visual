extends Node3D

@export var connections := [
	["Kafka", "Foundry"],
	["Foundry", "Database"],
	["Kafka", "NiFi"],
]

func _ready():
	var node_map := {}
	for node in get_tree().get_nodes_in_group("network_nodes"):
		node_map[node.name] = node

	for pair in connections:
		var line = Line3D.new()
		line.width = 0.05
		line.points = [
			node_map[pair[0]].global_transform.origin,
			node_map[pair[1]].global_transform.origin
		]
		line.default_color = Color.RED
		add_child(line)
