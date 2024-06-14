extends Node3D

enum FaceDirection {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	FRONT,
	BACK
}

@export var face_direction: FaceDirection
@export var color: Color

var raycast: RayCast3D


func _ready():
	var mesh: CSGMesh3D = self.get_node('Mesh')
	var new_material = StandardMaterial3D.new()
	new_material.albedo_color = color
	new_material.cull_mode = BaseMaterial3D.CULL_FRONT
	mesh.set_material(new_material)

	raycast = self.get_node('RayCast')


func _process(_delta):
	pass
