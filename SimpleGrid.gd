onready var vr=get_viewport_rect()
var separation_x=32
var separation_y=32

func _ready():
	pass 


func _draw():
	for i in range(0,vr.size.y,separation_x):
		draw_line(Vector2(vr.position.x,i),Vector2(vr.size.x,i),Color.darkcyan)
	for i in range(0,vr.size.x,separation_y):
		draw_line(Vector2(i,vr.position.y),Vector2(i,vr.size.y),Color.darkcyan)
