extends Position3D
#Simple orbit camera with joystick stick.
#set: 
#This node is a child of the character node at position 0,0,0
#A camera as a child of this node, pointing at the character, 
#in the desired position with respect to the character.

var rot_x = 0
var rot_y = 0
var LOOKAROUND_SPEED = 2

#func _input(event):
#	if event is InputEventJoypadMotion:
#		if event.get_axis() == JOY_ANALOG_RX or event.get_axis() == JOY_ANALOG_RY:
#			var axis_x = Input.get_joy_axis(0, JOY_ANALOG_RX)
#			var axis_y = Input.get_joy_axis(0, JOY_ANALOG_RY)

func _process(delta):
	var axis_x = Input.get_joy_axis(0, JOY_ANALOG_RX)
	var axis_y = Input.get_joy_axis(0, JOY_ANALOG_RY)
	rot_x += axis_x * LOOKAROUND_SPEED * delta
	rot_y += axis_y * LOOKAROUND_SPEED * delta
	print(rot_x)
	transform.basis = Basis() # reset rotation
	rotate_object_local(Vector3(0, 1, 0), rot_x) # first rotate in Y
	rotate_object_local(Vector3(1, 0, 0), rot_y) # then rotate in X
	pass 
