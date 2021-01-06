extends Sprite

var in_body
var state = 1
var state_2 = 1
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
onready var doel = get_tree().root.get_node("World/Doel/AnimationPlayer")
onready var cutscene = get_tree().root.get_node("World/Cutscene1")
var text_left
var played = false

export var water_aart = false

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		$AnimationPlayer.play("showtext")
		in_body = true

func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		$AnimationPlayer.play_backwards("showtext")
		in_body = false

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		if water_aart == true:
			if GlobalVariables.level_1_blaadjes_left == 0:
				talk()
		else:
			talk()
		
func talk(answer = ""):
	if GlobalVariables.level_1_blaadjes_left != 0:
		match state:
			1:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Hè hè, eindelijk die telefoon gevonden? De rest is al lang vertrokken."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state = 2
			2:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Ik zag net een paar papiertjes voorbij komen vliegen, ze gingen alle kanten op!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state = 3
				
			3:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Volgens mij zijn dat mevrouw Alkemade’s notities die zijn weggewaaid!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state = 4

			4:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Ik heb er in totaal 4 gezien. Hup hup, ga ze zoeken!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state = 5
			
			5:
				dialoguePopup.close()
				state = 6
				if played == false:
					doel.play("doel")
					played = true
				
			6:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				text_left = GlobalVariables.level_1_blaadjes_left
				var format_string = "Je mist nog %s/4 blaadjes!"
				var actual_string = format_string % str(text_left)
				dialoguePopup.dialogue = actual_string
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state = 5
	else:
		match state_2:
			1:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Je hebt alle blaadjes gevonden! Nu heb je de volledige notitie over de Zandweerdplas."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state_2 = 2
			2:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Bewaar hem goed, want je moet hem zo aan mevrouw Alkemade geven."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state_2 = 3
			3:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Deze aardige man hier heeft een botenvereniging."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state_2 = 4
			4:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Hij wil ons naar de overkant van de IJssel brengen; Ossenweerd!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state_2 = 5
			5:
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Mr. van Voorden"
				dialoguePopup.dialogue = "Dat is waar de rest van de groep nu is."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
				state_2 = 6
			6:
				if GlobalVariables.old_man == 'neutral':
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Hoi! Ik ben Bernhard, ik breng jullie naar de overkant."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state_2 = 7
				if GlobalVariables.old_man == 'happy':
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Hey, ben jij daar weer! Gelukkig vind je mijn boot mooi, want we gaan varen!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state_2 = 7
				if GlobalVariables.old_man == 'angry':
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Ben jij daar weer? Het is dat ik in een goede bui ben..."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state_2 = 7
			7:
				NoteHandler.hide_handler()
				dialoguePopup.close()
				cutscene.perform()
