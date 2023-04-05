extends Timer

var rng = RandomNumberGenerator.new()
var scene = preload("res://Objects/Coin.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("timeout", _timeout, CONNECT_PERSIST)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _timeout():
	var x_cord = rng.randf_range(0, 1024)
	var node = scene.instantiate()
	add_child(node)
	node.transform.origin = Vector2(x_cord, -10)
	
