extends Node3D

@export var nodes := {
	"Kafka": Vector3(0, 0, 0),
	"Foundry": Vector3(3, 0, 2),
	"Database": Vector3(-2, 0, 4),
	"NiFi": Vector3(4, 0, -1),
}

func _ready():
	for name in nodes.keys():
		var sphere = MeshInstance3D.new()
		sphere.mesh = SphereMesh.new()
		sphere.scale = Vector3(0.5, 0.5, 0.5)
		sphere.translation = nodes[name]
		sphere.name = name
		sphere.add_to_group("network_nodes")

		var label = Label3D.new()
		label.text = name
		label.translation = Vector3(0, 1, 0)
		sphere.add_child(label)

		add_child(sphere)
