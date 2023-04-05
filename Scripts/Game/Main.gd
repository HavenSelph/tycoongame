extends Node2D

@onready
var timer = Timer.new()
var rng = RandomNumberGenerator.new()
var coin = preload("res://Objects/Coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.one_shot = false
	timer.autostart = true
	self.add_child(timer)
	timer.connect("timeout", self.add_per_second_money, CONNECT_PERSIST)
	update_money()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_money():
	var node = get_node("Background/BackgroundForemost/MoneyDisplayBackground/MoneyDisplayNode")
	node.text = "[b]$[/b]" + str(Globals.money)
	
func add_money(amount):
	var amount_str = Globals.money_as_string(amount)
	if amount==0:
		print("Skipping add_command as amount=0")
		return
	elif amount > 0:
		print("Added "+amount_str)
	else:
		print("Removed "+amount_str)
	if amount == 1:
		spawn_coin()
	elif 0 < amount and amount < 10:
		spawn_coin(5)
	elif 10 < amount and amount < 20:
		spawn_coin(10)
	elif 20 < amount and amount < 40:
		spawn_coin(15)
	elif 40 < amount:
		spawn_coin(20)
	Globals.money += amount
	update_money()

func add_per_second_money():
	add_money(Globals.money_per_second)
	print("Ticked money_per_second...")
	

func spawn_coin(amnt=1):
	for i in range(0, amnt):
		var x_cord = rng.randf_range(0, 1024)
		var node = coin.instantiate()
		add_child(node)
		node.transform.origin = Vector2(x_cord, -10)
	print("Spawned "+str(amnt)+" coin(s)...")
