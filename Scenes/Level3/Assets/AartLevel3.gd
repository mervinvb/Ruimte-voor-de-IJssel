extends Sprite

var in_body
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
onready var doel = get_tree().root.get_node("World/CanvasLayer2")
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()

func talk(answer = ""):
	match GlobalVariables.aart_state:
		1:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Mr. van Voorden"
			dialoguePopup.dialogue = "Zo, daar zijn we! De laatste stop vandaag: de Bolwerkseplas."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.aart_state += 1
		2:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Mr. van Voorden"
			dialoguePopup.dialogue = "We hebben al 7 notities gevonden."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.aart_state += 1
		3:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Mr. van Voorden"
			dialoguePopup.dialogue = "Volgens mij had mevrouw Alkemade er 10 bij zich. Nog 3 te vinden!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.aart_state += 1
		4:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Mr. van Voorden"
			dialoguePopup.dialogue = "Als ik jou was zou ik het pad naar beneden volgen!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.aart_state += 1
		5:
			dialoguePopup.close()
			GlobalVariables.aart_state += 1
			doel.doel()
		6:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Mr. van Voorden"
			dialoguePopup.dialogue = "Veel succes met de laatste loodjes!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.aart_state += 1
		7:
			dialoguePopup.close()
			GlobalVariables.aart_state = 6
			
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
