extends Camera2D

onready var Player = get_tree().root.get_node("World/Player")

func _physics_process(delta):
	position.y = Player.position.y - 50
