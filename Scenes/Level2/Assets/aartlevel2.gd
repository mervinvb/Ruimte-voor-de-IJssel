extends Sprite

var in_body
export var end_aart = false
var state = 1
var first_time = false

onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
onready var blaadjes = get_tree().root.get_node("World/Blaadjes")
onready var doel = get_tree().root.get_node("World/CanvasLayer2/AnimationPlayer")

func _ready():
	pass # Replace with function body.

func _input(event):
	if GlobalVariables.level_2_eind_aart == true:
		if end_aart == false:
			queue_free()
		else:
			if !first_time:
				show()
				first_time = true
				state = 7
				doel.play("show_doel_2")

	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()

func talk(answer = ""):
	print("gtalking")
	if !end_aart:
		if GlobalVariables.level_2_mensen != 0:
			match state:
				1:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Mr. van Voorden"
					dialoguePopup.dialogue = "We zijn nu bij de Ossenwaard, tijd om te kijken of we nog een aantal notities kunnen vinden."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state = 2
				2:
					dialoguePopup.close()
					blaadjes.water()
					yield(get_tree().create_timer(4),"timeout")
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Mr. van Voorden"
					dialoguePopup.dialogue = "Oh nee! De notities zijn in het water gevallen, dat is niet al te best.."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state = 3
					
				3:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Mr. van Voorden"
					dialoguePopup.dialogue = "Probeer anders aan de mensen rond de Ossenwaard te vragen of zij iets weten."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state = 4
				4:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Mr. van Voorden"
					dialoguePopup.dialogue = "Dan kunnen we toch nog de verloren informatie te weten komen."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state = 5
				5:
					dialoguePopup.close()
					state = 6
					doel.play("show_doel")
				6:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Mr. van Voorden"
					dialoguePopup.dialogue = "Succes met mensen zoeken!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state = 5
	else:
		match state:
			7:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Ah, daar ben je! Ik was je al aan het zoeken."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			8:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Ik heb de blaadjes uit het water gevist! Goed van mij he?"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			9:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Ik heb ze eigenlijk niet meer nodig."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			10:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Hoe bedoel je 'ik heb ze niet meer nodig'???"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			11:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Ach ja, het maakt ook niet uit. We gaan nu naar de laatste stop van vandaag..."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			12:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "De Bolwerkseplas!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state += 1
			13:
				dialoguePopup.close()
				SceneChanger.changescene("res://World.tscn")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer2.play("praten")
		in_body = true
		
func _on_Area2D_body_exited(body):
	if body.name == "Player":
		$AnimationPlayer2.play_backwards("praten")
		in_body = false
