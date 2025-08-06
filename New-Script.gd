[gd_scene load_steps=4 format=3]

[ext_resource path="res://scripts/node_generator.gd" type="Script" id=1]
[ext_resource path="res://scripts/thread_drawer.gd" type="Script" id=2]

[node name="Main" type="Node3D"]

[node name="Camera3D" type="Camera3D" parent="."]
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 5, 10)
fov = 50.
near = 0.1
far = 100.0

[node name="DirectionalLight3D" type="DirectionalLight3D" parent="."]
transform = Transform3D(1, 0, 0, 0, 0.5, -0.866, 0, 0.866, 0.5, 0, 5, 10)
light_energy = 3.0

[node name="NodeContainer" type="Node3D" parent="."]
script = ExtResource( 1 )

[node name="ThreadLines" type="ImmediateMeshInstance3D" parent="."]
script = ExtResource( 2 )
