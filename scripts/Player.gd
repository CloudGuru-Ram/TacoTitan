extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _quadratic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, t: float):
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	var r = q0.lerp(q1, t)
	return r

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation_degrees = Global.angle
	if Global.start:
		var player_cos = cos(deg_to_rad((Global.angle)))
		var player_sin = sin(deg_to_rad((Global.angle)))
		self.position = _quadratic_bezier(self.position, (self.position + Vector2(Global.x_speed * player_sin, -Global.y_speed * player_cos)), (self.position + Vector2(Global.x_speed * player_sin, -Global.y_speed * player_cos)), delta)
		if self.position.y <= 200:
			Global.angle += .1
		else:
			Global.angle = 0
			Global.start = false
	pass


func _on_test_button_button_down():
	Global.x_speed = 200
	Global.y_speed = 200
	Global.angle = 45

	Global.start = true
	pass # Replace with function body.


func _on_obstacle_frame_area_entered(area):
	Global.x_speed += 200
	Global.y_speed += 200
	Global.angle = 45
	pass # Replace with function body.
