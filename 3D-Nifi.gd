extends Node3D

# Network nodes with temporal data
var network_nodes = [
	# Central primary node - always active with pulsing
	{"id": "ResPro", "type": "Primary", "pos": Vector2(0, 0), "color": Color.YELLOW, "size": 0.35, "active_times": [0.0, 100.0], "always_active": true},
	  
	# Left edge cluster (Cars) - temporal appearance with cascade
	{"id": "Car1", "type": "Entry", "pos": Vector2(-3.5, -1), "color": Color.RED, "size": 0.3, "active_times": [0.0, 15.0, 30.0, 45.0, 60.0, 75.0], "active_duration": 8.0},
	{"id": "Car2", "type": "Entry", "pos": Vector2(-3.5, 0), "color": Color.RED, "size": 0.3, "active_times": [5.0, 20.0, 35.0, 50.0, 65.0, 80.0], "active_duration": 8.0},
	{"id": "Car3", "type": "Entry", "pos": Vector2(-3.5, 1), "color": Color.RED, "size": 0.3, "active_times": [10.0, 25.0, 40.0, 55.0, 70.0, 85.0], "active_duration": 8.0},
	{"id": "Car4", "type": "Entry", "pos": Vector2(-3.5, 2), "color": Color.RED, "size": 0.3, "active_times": [2.0, 17.0, 32.0, 47.0, 62.0, 77.0], "active_duration": 8.0},
	  
	# Right edge cluster (Trucks) - temporal appearance with cascade
	{"id": "Truck1", "type": "Entry", "pos": Vector2(3.5, -1), "color": Color.RED, "size": 0.3, "active_times": [8.0, 23.0, 38.0, 53.0, 68.0, 83.0], "active_duration": 8.0},
	{"id": "Truck2", "type": "Entry", "pos": Vector2(3.5, 0), "color": Color.RED, "size": 0.3, "active_times": [12.0, 27.0, 42.0, 57.0, 72.0, 87.0], "active_duration": 8.0},
	{"id": "Truck3", "type": "Entry", "pos": Vector2(3.5, 1), "color": Color.RED, "size": 0.3, "active_times": [3.0, 18.0, 33.0, 48.0, 63.0, 78.0], "active_duration": 8.0},
	{"id": "Truck4", "type": "Entry", "pos": Vector2(3.5, 2), "color": Color.RED, "size": 0.3, "active_times": [7.0, 22.0, 37.0, 52.0, 67.0, 82.0], "active_duration": 8.0},
	  
	# Blue system nodes - always active with responsive pulsing
	{"id": "Sys1", "type": "System", "pos": Vector2(-1.5, -1), "color": Color.BLUE, "size": 0.25, "active_times": [0.0, 100.0], "always_active": true},
	{"id": "Sys2", "type": "System", "pos": Vector2(1.5, -1), "color": Color.BLUE, "size": 0.25, "active_times": [0.0, 100.0], "always_active": true},
	{"id": "Sys3", "type": "System", "pos": Vector2(-1.5, 1), "color": Color.BLUE, "size": 0.25, "active_times": [0.0, 100.0], "always_active": true},
	{"id": "Sys4", "type": "System", "pos": Vector2(1.5, 1), "color": Color.BLUE, "size": 0.25, "active_times": [0.0, 100.0], "always_active": true},
	  
	# White temperature nodes - cascade activation after entry nodes
	{"id": "Temp1", "type": "Temperature", "pos": Vector2(-4, -2), "color": Color.WHITE, "size": 0.15, "active_times": [2.0, 17.0, 32.0, 47.0, 62.0, 77.0], "active_duration": 6.0},
	{"id": "Temp2", "type": "Temperature", "pos": Vector2(-3, 0), "color": Color.WHITE, "size": 0.15, "active_times": [6.0, 21.0, 36.0, 51.0, 66.0, 81.0], "active_duration": 6.0},
	{"id": "Temp3", "type": "Temperature", "pos": Vector2(-2, 2), "color": Color.WHITE, "size": 0.15, "active_times": [8.0, 23.0, 38.0, 53.0, 68.0, 83.0], "active_duration": 6.0},
	{"id": "Temp4", "type": "Temperature", "pos": Vector2(-1, -3), "color": Color.WHITE, "size": 0.15, "active_times": [11.0, 26.0, 41.0, 56.0, 71.0, 86.0], "active_duration": 6.0},
	{"id": "Temp5", "type": "Temperature", "pos": Vector2(0, 3), "color": Color.WHITE, "size": 0.15, "active_times": [13.0, 28.0, 43.0, 58.0, 73.0, 88.0], "active_duration": 6.0},
	{"id": "Temp6", "type": "Temperature", "pos": Vector2(1, -2), "color": Color.WHITE, "size": 0.15, "active_times": [15.0, 30.0, 45.0, 60.0, 75.0, 90.0], "active_duration": 6.0},
	{"id": "Temp7", "type": "Temperature", "pos": Vector2(2, 1), "color": Color.WHITE, "size": 0.15, "active_times": [17.0, 32.0, 47.0, 62.0, 77.0, 92.0], "active_duration": 6.0},
	{"id": "Temp8", "type": "Temperature", "pos": Vector2(3, -1), "color": Color.WHITE, "size": 0.15, "active_times": [4.0, 19.0, 34.0, 49.0, 64.0, 79.0], "active_duration": 6.0},
	{"id": "Temp9", "type": "Temperature", "pos": Vector2(4, 2), "color": Color.WHITE, "size": 0.15, "active_times": [7.0, 22.0, 37.0, 52.0, 67.0, 82.0], "active_duration": 6.0},
	{"id": "Temp10", "type": "Temperature", "pos": Vector2(-5, 1), "color": Color.WHITE, "size": 0.15, "active_times": [10.0, 25.0, 40.0, 55.0, 70.0, 85.0], "active_duration": 6.0},
	{"id": "Temp11", "type": "Temperature", "pos": Vector2(5, -2), "color": Color.WHITE, "size": 0.15, "active_times": [12.0, 27.0, 42.0, 57.0, 72.0, 87.0], "active_duration": 6.0},
	{"id": "Temp12", "type": "Temperature", "pos": Vector2(-1, 4), "color": Color.WHITE, "size": 0.15, "active_times": [14.0, 29.0, 44.0, 59.0, 74.0, 89.0], "active_duration": 6.0},
	{"id": "Temp13", "type": "Temperature", "pos": Vector2(1, -4), "color": Color.WHITE, "size": 0.15, "active_times": [16.0, 31.0, 46.0, 61.0, 76.0, 91.0], "active_duration": 6.0},
	{"id": "Temp14", "type": "Temperature", "pos": Vector2(-2, -1), "color": Color.WHITE, "size": 0.15, "active_times": [5.0, 20.0, 35.0, 50.0, 65.0, 80.0], "active_duration": 6.0},
	{"id": "Temp15", "type": "Temperature", "pos": Vector2(2, 3), "color": Color.WHITE, "size": 0.15, "active_times": [9.0, 24.0, 39.0, 54.0, 69.0, 84.0], "active_duration": 6.0},
	{"id": "Temp16", "type": "Temperature", "pos": Vector2(0, -1), "color": Color.WHITE, "size": 0.15, "active_times": [3.0, 18.0, 33.0, 48.0, 63.0, 78.0], "active_duration": 6.0},
	{"id": "Temp17", "type": "Temperature", "pos": Vector2(-3, 3), "color": Color.WHITE, "size": 0.15, "active_times": [11.0, 26.0, 41.0, 56.0, 71.0, 86.0], "active_duration": 6.0},
	{"id": "Temp18", "type": "Temperature", "pos": Vector2(3, -3), "color": Color.WHITE, "size": 0.15, "active_times": [13.0, 28.0, 43.0, 58.0, 73.0, 88.0], "active_duration": 6.0}
]

# Network connections with cascade priorities
var connections = [
	# Central primary connections to blue system nodes
	["ResPro", "Sys1"], ["ResPro", "Sys2"], ["ResPro", "Sys3"], ["ResPro", "Sys4"],
	  
	# Car cluster (left edge) connections
	["Car1", "Car2"], ["Car2", "Car3"], ["Car3", "Car4"],
	["Sys1", "Car1"], ["Sys3", "Car2"],
	  
	# Truck cluster (right edge) connections  
	["Truck1", "Truck2"], ["Truck2", "Truck3"], ["Truck3", "Truck4"],
	["Sys2", "Truck1"], ["Sys4", "Truck2"],
	  
	# White nodes connect to nearby edge clusters
	["Temp1", "Car1"], ["Temp2", "Car3"], 
	["Temp3", "Truck1"], ["Temp4", "Truck3"],
	["Temp5", "Car2"], ["Temp6", "Truck2"],
	["Temp7", "Car4"], ["Temp8", "Truck4"],
	  
	# Some perimeter connections
	["Temp9", "Sys1"], ["Temp10", "Sys2"],
	["Temp11", "Sys3"], ["Temp12", "Sys4"],
	  
	# Cross connections from center to edges
	["ResPro", "Car1"], ["ResPro", "Truck1"],
	  
	# Additional edge connections
	["Temp13", "ResPro"], ["Temp14", "ResPro"],
	["Temp15", "Car2"], ["Temp16", "Truck2"]
]

# Temporal waves for flowing purple fabric
var temporal_waves = [
	{"center": Vector2(0, 0), "amplitude": 4.0, "frequency": 0.5, "phase": 0.0, "radius": 8.0},
	{"center": Vector2(-3, 0), "amplitude": 2.5, "frequency": 0.8, "phase": 1.57, "radius": 5.0},
	{"center": Vector2(3, 0), "amplitude": 2.5, "frequency": 0.8, "phase": 3.14, "radius": 5.0},
	{"center": Vector2(0, -3), "amplitude": 2.0, "frequency": 1.2, "phase": 4.71, "radius": 4.0},
	{"center": Vector2(0, 3), "amplitude": 2.0, "frequency": 1.2, "phase": 2.35, "radius": 4.0}
]

var camera_group: Node3D
var auto_rotate = true
var node_meshes = {}
var node_states = {}  # Track fade states
var connection_lines = []
var surface_mesh_instance: MeshInstance3D
var purple_grid_lines = []
var current_time = 0.0
var time_speed = 1.0
var timeline_display: Label3D  # Visual timeline indicator

func _ready():
	print("Starting Fixed Temporal 3D NiFi Network Visualization")
	print("Press R to toggle rotation, Space to reset camera, T to change time speed")
	print("Press UP/DOWN arrows to adjust time speed, 1-3 for preset speeds")
	setup_scene()
	create_blue_grid()
	create_dynamic_purple_surface()
	create_dynamic_purple_grid()
	create_network_nodes()
	create_connections()
	create_timeline_display()
	setup_camera()
	setup_lighting()
	print("Enhanced temporal system active - nodes appear/disappear with cascade effects")

func setup_scene():
	camera_group = Node3D.new()
	add_child(camera_group)
	  
	# Initialize node states
	for node_data in network_nodes:
		node_states[node_data.id] = {
			"target_alpha": 0.0,
			"current_alpha": 0.0,
			"fade_speed": 3.0,
			"last_active": false
		}

func create_timeline_display():
	# Create a visual timeline indicator
	timeline_display = Label3D.new()
	timeline_display.text = "Time: 0.0s | Cycle: 0.0%"
	timeline_display.font_size = 32
	timeline_display.position = Vector3(0, 8, 0)
	timeline_display.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	add_child(timeline_display)

func setup_camera():
	var camera = Camera3D.new()
	camera.position = Vector3(18, 10, 18)
	camera.look_at(Vector3(0, 2, 0), Vector3.UP)
	camera_group.add_child(camera)

func setup_lighting():
	# Ambient light
	var ambient = Environment.new()
	ambient.background_mode = Environment.BG_COLOR
	ambient.background_color = Color(0.02, 0.02, 0.08)
	ambient.ambient_light_color = Color.WHITE
	ambient.ambient_light_energy = 0.4
	  
	var world_env = WorldEnvironment.new()
	world_env.environment = ambient
	add_child(world_env)
	  
	# Main directional light
	var main_light = DirectionalLight3D.new()
	main_light.position = Vector3(10, 15, 5)
	main_light.rotation_degrees = Vector3(-60, -30, 0)
	main_light.light_energy = 1.2
	main_light.shadow_enabled = true
	add_child(main_light)
	  
	# Secondary fill light
	var fill_light = DirectionalLight3D.new()
	fill_light.position = Vector3(-10, 8, -5)
	fill_light.light_color = Color(0.3, 0.81, 1.0)
	fill_light.light_energy = 0.4
	add_child(fill_light)
	  
	# Enhanced pulsing purple accent light
	var purple_light = OmniLight3D.new()
	purple_light.position = Vector3(0, 8, 0)
	purple_light.light_color = Color(0.53, 0.33, 1.0)
	purple_light.light_energy = 0.3
	purple_light.omni_range = 40
	purple_light.name = "PurpleLight"
	add_child(purple_light)

# DYNAMIC FLOWING SURFACE HEIGHT
func get_dynamic_surface_height(x: float, z: float, time: float) -> float:
	var height = 1.0  # Base height
	  
	# Add flowing waves that move continuously
	for wave in temporal_waves:
		var distance = sqrt((x - wave.center.x) * (x - wave.center.x) + (z - wave.center.y) * (z - wave.center.y))
		var wave_phase = wave.phase + time * wave.frequency
		var wave_contribution = wave.amplitude * sin(distance * 0.5 + wave_phase) * exp(-distance / wave.radius)
		height += wave_contribution
	  
	# Add fabric-like flowing noise
	var noise_x = sin(x * 0.8 + time * 0.3) * 0.1
	var noise_z = cos(z * 0.8 + time * 0.4) * 0.1
	height += (noise_x + noise_z)
	  
	return max(height, 0.2)

func create_blue_grid():
	var grid_material = StandardMaterial3D.new()
	grid_material.albedo_color = Color(0.3, 0.81, 1.0)
	grid_material.emission_enabled = true
	grid_material.emission = Color(0.3, 0.81, 1.0)
	grid_material.emission_energy = 0.7
	grid_material.flags_unshaded = true
	  
	var grid_size = 20
	var divisions = 20
	var step = float(grid_size) / divisions
	  
	for i in range(divisions + 1):
		var pos = -10 + i * step
			
		# Vertical lines
		var v_mesh = ArrayMesh.new()
		var v_arrays = []
		v_arrays.resize(Mesh.ARRAY_MAX)
		var v_vertices = PackedVector3Array()
		v_vertices.append(Vector3(pos, 0, -10))
		v_vertices.append(Vector3(pos, 0, 10))
		v_arrays[Mesh.ARRAY_VERTEX] = v_vertices
		v_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, v_arrays)
			
		var v_instance = MeshInstance3D.new()
		v_instance.mesh = v_mesh
		v_instance.material_override = grid_material
		add_child(v_instance)
			
		# Horizontal lines
		var h_mesh = ArrayMesh.new()
		var h_arrays = []
		h_arrays.resize(Mesh.ARRAY_MAX)
		var h_vertices = PackedVector3Array()
		h_vertices.append(Vector3(-10, 0, pos))
		h_vertices.append(Vector3(10, 0, pos))
		h_arrays[Mesh.ARRAY_VERTEX] = h_vertices
		h_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, h_arrays)
			
		var h_instance = MeshInstance3D.new()
		h_instance.mesh = h_mesh
		h_instance.material_override = grid_material
		add_child(h_instance)

func create_dynamic_purple_surface():
	# Create high-resolution surface for smooth flowing
	var size = 12.0
	var divisions = 60  # High resolution for smooth waves
	  
	# Create ArrayMesh directly instead of PlaneMesh
	var surface_mesh = ArrayMesh.new()
	var vertices = PackedVector3Array()
	var uvs = PackedVector2Array()
	var indices = PackedInt32Array()
	  
	# Generate vertices
	for i in range(divisions + 1):
		for j in range(divisions + 1):
			var x = (float(i) / divisions - 0.5) * size
			var z = (float(j) / divisions - 0.5) * size
			var y = get_dynamic_surface_height(x, z, 0.0)  # Initial height
				  
			vertices.append(Vector3(x, y, z))
			uvs.append(Vector2(float(i) / divisions, float(j) / divisions))
	  
	# Generate indices for triangles
	for i in range(divisions):
		for j in range(divisions):
			var base = i * (divisions + 1) + j
				  
			# First triangle
			indices.append(base)
			indices.append(base + divisions + 1)
			indices.append(base + 1)
				  
			# Second triangle
			indices.append(base + 1)
			indices.append(base + divisions + 1)
			indices.append(base + divisions + 2)
	  
	# Create mesh arrays
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_TEX_UV] = uvs
	arrays[Mesh.ARRAY_INDEX] = indices
	  
	surface_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	  
	# Enhanced flowing purple material
	var purple_material = StandardMaterial3D.new()
	purple_material.albedo_color = Color(0.66, 0.33, 0.97)
	purple_material.metallic = 0.1
	purple_material.roughness = 0.6
	purple_material.flags_transparent = false
	purple_material.emission_enabled = true
	purple_material.emission = Color(0.66, 0.33, 0.97)
	purple_material.emission_energy = 0.1
	  
	surface_mesh_instance = MeshInstance3D.new()
	surface_mesh_instance.mesh = surface_mesh
	surface_mesh_instance.material_override = purple_material
	surface_mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	surface_mesh_instance.name = "FlowingPurpleSurface"
	  
	add_child(surface_mesh_instance)

func update_flowing_surface():
	# Update surface geometry every frame for flowing fabric effect
	if surface_mesh_instance and surface_mesh_instance.mesh:
		var mesh = surface_mesh_instance.mesh as ArrayMesh
		var arrays = mesh.surface_get_arrays(0)
		var vertices = arrays[Mesh.ARRAY_VERTEX] as PackedVector3Array
		
		# Update each vertex height based on current time
		for i in range(vertices.size()):
			var vertex = vertices[i]
			var height = get_dynamic_surface_height(vertex.x, vertex.z, current_time)
			vertices[i] = Vector3(vertex.x, height, vertex.z)
		
		# Update the mesh with new vertices
		arrays[Mesh.ARRAY_VERTEX] = vertices
		var updated_mesh = ArrayMesh.new()
		updated_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		
		surface_mesh_instance.mesh = updated_mesh

func create_dynamic_purple_grid():
	# Store grid lines for dynamic updates
	purple_grid_lines.clear()
	  
	var grid_material = StandardMaterial3D.new()
	grid_material.albedo_color = Color(1.0, 0.0, 1.0)
	grid_material.emission_enabled = true
	grid_material.emission = Color(1.0, 0.0, 1.0)
	grid_material.emission_energy = 0.9
	grid_material.flags_unshaded = true
	  
	var divisions = 16
	var size = 12.0
	  
	# Create grid line instances that will be updated each frame
	for i in range(divisions + 1):
		# Vertical grid lines
		var v_instance = MeshInstance3D.new()
		v_instance.material_override = grid_material
		v_instance.name = "VGridLine_" + str(i)
		add_child(v_instance)
		purple_grid_lines.append({"instance": v_instance, "type": "vertical", "index": i})
		
		# Horizontal grid lines
		var h_instance = MeshInstance3D.new()
		h_instance.material_override = grid_material
		h_instance.name = "HGridLine_" + str(i)
		add_child(h_instance)
		purple_grid_lines.append({"instance": h_instance, "type": "horizontal", "index": i})

func update_flowing_grid():
	# Update grid lines to follow the flowing surface
	var divisions = 16
	var size = 12.0
	var step = size / divisions
	  
	for grid_line in purple_grid_lines:
		var instance = grid_line.instance
		var i = grid_line.index
		var pos = -size/2 + i * step
		
		var mesh = ArrayMesh.new()
		var arrays = []
		arrays.resize(Mesh.ARRAY_MAX)
		var vertices = PackedVector3Array()
		
		if grid_line.type == "vertical":
			# Vertical lines following dynamic surface
			for j in range(divisions + 1):
				var z_pos = -size/2 + j * step
				var surface_height = get_dynamic_surface_height(pos, z_pos, current_time)
				vertices.append(Vector3(pos, surface_height + 0.01, z_pos))
		else:
			# Horizontal lines following dynamic surface
			for j in range(divisions + 1):
				var x_pos = -size/2 + j * step
				var surface_height = get_dynamic_surface_height(x_pos, pos, current_time)
				vertices.append(Vector3(x_pos, surface_height + 0.01, pos))
		
		arrays[Mesh.ARRAY_VERTEX] = vertices
		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINE_STRIP, arrays)
		instance.mesh = mesh

func update_node_positions():
	# Update node positions to follow the flowing surface
	for node_id in node_meshes.keys():
		var node_info = node_meshes[node_id]
		var node_data = node_info.data
		var node_group = node_info.group
		
		# Calculate new position based on flowing surface
		var surface_height = get_dynamic_surface_height(node_data.pos.x, node_data.pos.y, current_time)
		var new_position = Vector3(node_data.pos.x, surface_height + 2.0, node_data.pos.y)
		
		# Smooth position transition
		node_group.position = node_group.position.lerp(new_position, 0.1)

func get_node_by_id(node_id: String) -> Dictionary:
	for node_data in network_nodes:
		if node_data.id == node_id:
			return node_data
	return {}

func update_purple_light():
	var purple_light = get_node_or_null("PurpleLight")
	if purple_light:
		# Dynamic pulsing based on active nodes
		var active_count = 0
		for node_data in network_nodes:
			if is_node_active(node_data, current_time):
				active_count += 1
		
		var base_pulse = 0.3 + 0.2 * sin(current_time * 2.0)
		var activity_boost = min(active_count * 0.05, 0.4)
		purple_light.light_energy = base_pulse + activity_boost

func print_debug_info():
	# Debug function to print current state
	var active_nodes = []
	for node_data in network_nodes:
		if is_node_active(node_data, current_time):
			active_nodes.append(node_data.id)
	
	if active_nodes.size() > 0:
		print("Time: %.1f - Active nodes: %s" % [current_time, str(active_nodes)])

# Main process loop - runs every frame
func _process(delta):
	current_time += delta * time_speed
	
	# Update all dynamic systems
	update_flowing_surface()
	update_flowing_grid()
	update_node_states(delta)
	update_node_positions()
	update_connections()
	update_timeline()
	update_purple_light()
	
	# Auto-rotate camera
	if auto_rotate:
		camera_group.rotation_degrees.y += 15 * delta
	
	# Optional debug output every few seconds
	if int(current_time) % 5 == 0 and fmod(current_time, 1.0) < delta:
		print_debug_info()

# Input handling for user controls
func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_R:
				auto_rotate = !auto_rotate
				print("Auto-rotate: ", auto_rotate)
			KEY_SPACE:
				reset_camera()
				print("Camera reset")
			KEY_T:
				cycle_time_speed()
				print("Time speed: ", time_speed)
			KEY_UP:
				time_speed = min(time_speed + 0.5, 5.0)
				print("Time speed increased: ", time_speed)
			KEY_DOWN:
				time_speed = max(time_speed - 0.5, 0.1)
				print("Time speed decreased: ", time_speed)
			KEY_1:
				time_speed = 0.5
				print("Time speed set to slow: ", time_speed)
			KEY_2:
				time_speed = 1.0
				print("Time speed set to normal: ", time_speed)
			KEY_3:
				time_speed = 2.0
				print("Time speed set to fast: ", time_speed)
			KEY_P:
				time_speed = 0.0 if time_speed > 0.0 else 1.0
				print("Time paused: ", time_speed == 0.0)
			KEY_D:
				print_debug_info()
			KEY_ESCAPE:
				get_tree().quit()

func reset_camera():
	camera_group.rotation_degrees = Vector3.ZERO
	auto_rotate = true

func cycle_time_speed():
	if time_speed == 1.0:
		time_speed = 2.0
	elif time_speed == 2.0:
		time_speed = 0.5
	else:
		time_speed = 1.0

func create_network_nodes():
	for node_data in network_nodes:
		var node_group = Node3D.new()
		node_group.name = node_data.id + "_Group"
		
		# Position node above the flowing surface
		var surface_height = get_dynamic_surface_height(node_data.pos.x, node_data.pos.y, 0.0)
		node_group.position = Vector3(node_data.pos.x, surface_height + 2.0, node_data.pos.y)
		
		# Create sphere mesh
		var sphere_mesh = SphereMesh.new()
		sphere_mesh.radius = node_data.size
		sphere_mesh.height = node_data.size * 2
		
		var mesh_instance = MeshInstance3D.new()
		mesh_instance.mesh = sphere_mesh
		
		# Enhanced materials with emission
		var material = StandardMaterial3D.new()
		material.albedo_color = node_data.color
		material.metallic = 0.3
		material.roughness = 0.4
		material.emission_enabled = true
		material.emission = node_data.color
		material.emission_energy = 0.5
		material.flags_transparent = true
		
		mesh_instance.material_override = material
		mesh_instance.name = node_data.id + "_Mesh"
		
		# Add label
		var label = Label3D.new()
		label.text = node_data.id
		label.font_size = 16
		label.position = Vector3(0, node_data.size + 0.3, 0)
		label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		
		node_group.add_child(mesh_instance)
		node_group.add_child(label)
		add_child(node_group)
		
		node_meshes[node_data.id] = {"group": node_group, "mesh": mesh_instance, "data": node_data}

func create_connections():
	var line_material = StandardMaterial3D.new()
	line_material.albedo_color = Color(0.3, 0.81, 1.0)
	line_material.emission_enabled = true
	line_material.emission = Color(0.3, 0.81, 1.0)
	line_material.emission_energy = 0.6
	line_material.flags_unshaded = true
	line_material.flags_transparent = true
	
	for connection in connections:
		var from_id = connection[0]
		var to_id = connection[1]
		
		if from_id in node_meshes and to_id in node_meshes:
			var from_node = node_meshes[from_id]
			var to_node = node_meshes[to_id]
			
			var line_mesh = ArrayMesh.new()
			var line_arrays = []
			line_arrays.resize(Mesh.ARRAY_MAX)
			var line_vertices = PackedVector3Array()
			
			line_vertices.append(from_node.group.position)
			line_vertices.append(to_node.group.position)
			
			line_arrays[Mesh.ARRAY_VERTEX] = line_vertices
			line_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, line_arrays)
			
			var line_instance = MeshInstance3D.new()
			line_instance.mesh = line_mesh
			line_instance.material_override = line_material
			line_instance.name = "Connection_" + from_id + "_to_" + to_id
			
			add_child(line_instance)
			connection_lines.append({
				"instance": line_instance,
				"from": from_id,
				"to": to_id
			})

func is_node_active(node_data: Dictionary, time: float) -> bool:
	if node_data.get("always_active", false):
		return true
	
	var active_times = node_data.get("active_times", [])
	var duration = node_data.get("active_duration", 5.0)
	
	for start_time in active_times:
		if time >= start_time and time <= start_time + duration:
			return true
	
	return false

func update_node_states(delta: float):
	for node_data in network_nodes:
		var node_id = node_data.id
		var state = node_states[node_id]
		var is_active = is_node_active(node_data, current_time)
		
		# Set target alpha based on activity
		state.target_alpha = 1.0 if is_active else 0.0
		
		# Smooth fade transition
		var alpha_diff = state.target_alpha - state.current_alpha
		state.current_alpha += alpha_diff * state.fade_speed * delta
		state.current_alpha = clamp(state.current_alpha, 0.0, 1.0)
		
		# Update node visibility and position
		if node_id in node_meshes:
			var node_group = node_meshes[node_id].group
			var mesh_instance = node_meshes[node_id].mesh
			var material = mesh_instance.material_override as StandardMaterial3D
			
			# Update position to follow flowing surface
			var surface_height = get_dynamic_surface_height(node_data.pos.x, node_data.pos.y, current_time)
			node_group.position = Vector3(node_data.pos.x, surface_height + 2.0, node_data.pos.y)
			
			# Apply alpha and pulsing effects
			if material:
				material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
				material.albedo_color.a = state.current_alpha
				
				# Pulsing effect for active nodes
				if is_active:
					var pulse = 0.7 + 0.3 * sin(current_time * 4.0)
					material.emission_energy = 0.5 * pulse * state.current_alpha
				else:
					material.emission_energy = 0.1 * state.current_alpha
		
		state.last_active = is_active

func update_connections():
	# Update connection lines to follow node positions and visibility
	for connection in connection_lines:
		var from_id = connection.from
		var to_id = connection.to
		var line_instance = connection.instance
		
		if from_id in node_meshes and to_id in node_meshes:
			var from_node = node_meshes[from_id]
			var to_node = node_meshes[to_id]
			var from_state = node_states[from_id]
			var to_state = node_states[to_id]
			
			# Update line geometry
			var line_mesh = ArrayMesh.new()
			var line_arrays = []
			line_arrays.resize(Mesh.ARRAY_MAX)
			var line_vertices = PackedVector3Array()
			
			line_vertices.append(from_node.group.position)
			line_vertices.append(to_node.group.position)
			
			line_arrays[Mesh.ARRAY_VERTEX] = line_vertices
			line_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, line_arrays)
			line_instance.mesh = line_mesh
			
			# Update line visibility based on connected nodes
			var material = line_instance.material_override as StandardMaterial3D
			if material:
				var line_alpha = min(from_state.current_alpha, to_state.current_alpha)
				material.albedo_color.a = line_alpha
				material.emission_energy = 0.6 * line_alpha

func update_timeline():
	if timeline_display:
		var cycle_time = fmod(current_time, 100.0)
		var cycle_percent = (cycle_time / 100.0) * 100.0
		timeline_display.text = "Time: %.1fs | Cycle: %.1f%% | Speed: %.1fx" % [current_time, cycle_percent, time_speed]

func _process(delta):
	current_time += delta * time_speed
	
	# Update all dynamic systems
	update_flowing_surface()
	update_flowing_grid()
	update_node_states(delta)
	update_connections()
	update_timeline()
	
	# Auto-rotate camera
	if auto_rotate:
		camera_group.rotation_degrees.y += 15 * delta
	
	# Update purple light pulsing
	var purple_light = get_node_or_null("PurpleLight")
	if purple_light:
		var pulse = 0.3 + 0.2 * sin(current_time * 2.0)
		purple_light.light_energy = pulse

func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_R:
				auto_rotate = !auto_rotate
				print("Auto-rotate: ", auto_rotate)
			KEY_SPACE:
				reset_camera()
				print("Camera reset")
			KEY_T:
				cycle_time_speed()
				print("Time speed: ", time_speed)
			KEY_UP:
				time_speed = min(time_speed + 0.5, 5.0)
				print("Time speed increased: ", time_speed)
			KEY_DOWN:
				time_speed = max(time_speed - 0.5, 0.1)
				print("Time speed decreased: ", time_speed)
			KEY_1:
				time_speed = 0.5
				print("Time speed set to slow: ", time_speed)
			KEY_2:
				time_speed = 1.0
				print("Time speed set to normal: ", time_speed)
			KEY_3:
				time_speed = 2.0
				print("Time speed set to fast: ", time_speed)
			KEY_P:
				time_speed = 0.0 if time_speed > 0.0 else 1.0
				print("Time paused: ", time_speed == 0.0)

func reset_camera():
	camera_group.rotation_degrees = Vector3.ZERO
	auto_rotate = true

func cycle_time_speed():
	if time_speed == 1.0:
		time_speed = 2.0
	elif time_speed == 2.0:
		time_speed = 0.5
	else:
		time_speed = 1.0
