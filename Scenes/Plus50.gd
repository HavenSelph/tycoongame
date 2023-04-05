extends Button

var cost = 300
@onready
var root = get_node("../../../../../../")

# Called when the node enters the scene tree for the first time.
func _ready():
	update_cost()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _pressed():
	if Globals.money >= cost:
		root.add_money(-cost)
		Globals.money_per_second += 50
		update_cost()


func update_cost():
	cost = int(cost*1.8)
	self.text = "+50 Per Second\n("+Globals.money_as_string(cost)+")"
