extends Sprite

export var speed = "slow"
export var direction = "left"
var real_speed
onready var player = get_tree().root.get_node("World/Player")
var can_jump

func _ready():
	if speed == "slow":
		real_speed = 0.5
	if speed == "medium":
		real_speed = 1
	if speed == "fast":
		real_speed = 1.5

func _physics_process(delta):
	if direction == "left":
		if position.x > 35:
			position.x -= real_speed
		else:
			direction = "right"

	if direction == "right":
		if position.x < 285:
			position.x += real_speed
		else:
			direction = "left"

func _on_Area2D_body_entered(body):
	if player.can_log:
		player.log_on = self
		player.on_log = true

func _on_Area2D_body_exited(body):
	player.on_log = false

func _on_Area2D_area_entered(area):
	can_jump = true

func _on_Area2D_area_shape_exited(area_id, area, area_shape, self_shape):
	can_jump = false
