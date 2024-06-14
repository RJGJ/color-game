extends Node

@export var spawns: Array[Node3D]
var is_waiting = true
var cubes: Array
var cube_scene = preload("res://scenes/cube/cube.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if (spawns.is_empty()):
		return
	spawn_cubes()


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			if is_waiting:
				for cube in cubes:
					cube.freeze = false
				is_waiting = false
			else:
				spawn_cubes()
				is_waiting = true
	pass	


func spawn_cubes():
	if !cubes.is_empty():
		for cube in cubes:
			remove_child(cube)
		cubes = []

	for index in len(spawns):
		var cube_instance = cube_scene.instantiate() 
		cube_instance.position = spawns[index].position
		cube_instance.rotation = Vector3(
			randi_range(0, 360),
			randi_range(0, 360),
			randi_range(0, 360)
		)
		cubes.append(cube_instance)
		add_child(cube_instance)
