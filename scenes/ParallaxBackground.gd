extends ParallaxBackground

var xVelocity = 7
var yVelocity = 7

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_base_offset -= Vector2(-xVelocity, yVelocity) * delta
