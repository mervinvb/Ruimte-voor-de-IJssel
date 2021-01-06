extends Label


onready var player = get_tree().root.get_node("World/Ysort/Player")
var player_y
var player_x

func _ready():
	player_y = player.position.y
	player_x = player.position.x
	yield(get_tree().create_timer(5),"timeout")
	if player_y == player.position.y and player_x == player.position.x:
		$AnimationPlayer.play("show")
