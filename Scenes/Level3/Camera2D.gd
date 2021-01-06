extends Camera2D


onready var Player = get_tree().root.get_node("World/Player")

func _physics_process(delta):
	self.position.x = Player.position.x + 60
