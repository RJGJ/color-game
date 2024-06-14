extends RigidBody3D

signal stopped

var time_period = 1000
var time_counter = 0

var last_position: Vector3

func _ready():
	pass # Replace with function body.


func _process(_delta):
	last_position = self.position
	time_counter = _delta
	if (time_counter == time_period):
		time_counter = 0
		stopped.emit()
