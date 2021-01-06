extends Sprite

var in_body
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
onready var Player = get_tree().root.get_node("World/YSort/Player")

func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()

func talk(answer = ""):
	match GlobalVariables.emma_state:
		1:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Hoi, heb jij misschien een notitie zien rondwaaien?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.emma_state += 1
		2:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Emma"
			dialoguePopup.dialogue = "Ja, hij waaide zo dat doolhof in!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.emma_state += 1
		3:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Sinds wanneer is er hier een doolhof?!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.emma_state += 1
		4:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Emma"
			dialoguePopup.dialogue = "Jij stelt te veel vragen... Succes met zoeken!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.emma_state += 1
		5:
			dialoguePopup.close()
			GlobalVariables.position_x = Player.position.x
			GlobalVariables.position_y = Player.position.y
		
			SceneChanger.changescene("res://Scenes/Level3/Maze.tscn")
			GlobalVariables.emma_state += 1
		6:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Emma"
			dialoguePopup.dialogue = "Oh, je heb de notitie gevonden!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.emma_state += 1
		7:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Emma"
			dialoguePopup.dialogue = "De meeste mensen die dat doolhof in gaan komen niet meer terug..."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.emma_state += 1
		8:
			dialoguePopup.close()
			GlobalVariables.emma_state += 1
		9:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Emma"
			dialoguePopup.dialogue = "Hopelijk vond je het een leuk tochtje!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.emma_state = 8
			
func note_made():
	pass
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		$AnimationPlayer2.play("show_text")
		in_body = true


func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		$AnimationPlayer2.play_backwards("show_text")
		in_body = false
