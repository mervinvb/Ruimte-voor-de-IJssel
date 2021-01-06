extends Area2D

var dialoguePopup
var player
var in_body = 0

onready var animationPlayer = $AnimationPlayer

var dialogue_state = 0
func _ready():
	dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
	player = get_tree().root.get_node("World/YSort/Player")

func _input(delta):
	if Input.is_action_just_pressed("interact"):
		talk()

func talk(answer = ""):
	# Set dialoguePopup npc to Fiona
	if in_body == 0:
		return
	dialoguePopup.npc = self
	dialoguePopup.npc_name = "Bordje"
	match dialogue_state:
				0:
					# Update dialogue tree state
					dialogue_state = 1
					# Show dialogue popup
					dialoguePopup.dialogue = "Ik ben een ander bordje."
					dialoguePopup.answers = "[A] Ok"
					dialoguePopup.open()
				1:
					match answer:
						"A":
							# Update dialogue tree state
							dialogue_state = 0
							dialoguePopup.close()

func _on_Sign_body_entered(body):
	if body.name == "Player":
		print("Playered entered sign area!")
		in_body = 1
		$AnimationPlayer.play("SignShow")

func _on_Sign_body_exited(body):
	if body.name == "Player":
		print("Player left sign area!")
		in_body = 0
		$AnimationPlayer.play("SignHide")
