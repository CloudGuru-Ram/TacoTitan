extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_test_button_button_down():
	self.frame = 1
	pass # Replace with function body.


func _on_test_button_button_up():
	self.frame = 0
	pass # Replace with function body.
