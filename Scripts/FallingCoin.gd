extends Sprite2D


var rng = RandomNumberGenerator.new()
var rotation_rad = 0.0
var rotation_speed = rng.randf_range(0,0.2)
var fall_speed = rng.randf_range(1,3)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation = rotation_rad
	rotation_rad += rotation_speed
	position.y += fall_speed

func _physics_process(delta):
	if position.y > 640:
		self.queue_free()
