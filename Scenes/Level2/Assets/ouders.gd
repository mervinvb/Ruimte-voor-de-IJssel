extends Sprite

var in_body
var state = 1
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()
		
func talk(answer = ""):
	match state:
		1:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Hoi, ik was bezig met notities verzamelen, maar er zijn een aantal in het water gevallen."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		2:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Zouden jullie mij misschien iets over de Ossenwaard willen vertellen?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		3:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Natuurlijk, we komen hier al jaren, het is onze favoriete picknickplaats!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		4:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "En mijn dochter Lilly houdt van rivieren, ze weet er van alles over!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		5:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Ja, ik weet het nog al te goed. Het uitzicht was hier altijd zo mooi."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		6:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Je kon zo mooi over het water heen kijken, jammer dat Lilly dat niet heeft gezien."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		7:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Maar dat kan nu nogsteeds hoor!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		8:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Helemaal niet, ze hebben de geulen aan elkaar gemaakt."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		9:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Nu lijkt het alsof er een slang door het water kruipt in plaats van mooie kleine watertjes."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		10:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Dat heet de uiterwaard, heb je niet opgelet toen Lilly het uitlegde?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		11:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Ze hebben gewoon de hank uitgebreid en de vorige kleine wateren eraan verbonden..."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		12:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Nu is er dus maar één hank. Dat zei Lilly nog!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		13:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Ik luister eigenlijk nooit naar wat Lilly zegt..."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		14:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Nou ja zeg! Goed, ze zijn iets verderop ook wat van de bovengrond weg aan het halen."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		15:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Ze gaan daar een strand aanleggen."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		16:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Jouw oom houdt toch ook van stranden, Sandra?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		17:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Je kan er een leuke wandeling maken, dat is waar, maar het mist die natuurlijk charme."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		18:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Die charme moet blijven vind ik."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		19:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Jouw broer is toch bruggenbouwer?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		20:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Ik zou tegen hem zeggen dat dat remmingwerk het uitzicht heeft verpest."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		21:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Laat mijn broer hier buiten! Dat geleidewerk is anders heel handig hoor!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		22:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Boten kunnen afremmen als ze dreigen ergens tegen aan te varen, dat weet ik!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		23:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Ik heb je broer ontmoet en hij blijft er maar over doorgaan."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		24:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Nou, het helpt ook dat de boten kunnen afremmen tot stilstand."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		25:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Dat is handig als ze wachten wanneer bijvoorbeeld een ophaalbrug omhoog moet gaan."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		26:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Uh, dankjulliewel, ik heb het opgeschreven."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
			note_made()
		27:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Ik ga nog verder zoeken of er misschien wat notities in het water zijn gevallen."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 33
		28:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Dus jij luistert eigenlijk nooit naar mijn dochter?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 29
		29:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Ik had toch echt beter van je verwacht Sandra!!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 30
		30:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Sandra"
			dialoguePopup.dialogue = "Ach mens schei uit, ik luister ook nooit naar jou!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 31
		31:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Nou ja! Zeg wat zit jij met die cape daar nog te luisteren naar onze gesprekken? Ga weg!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 34
		32:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milou"
			dialoguePopup.dialogue = "Weg gaan zei ik toch!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 34
		33: 
			dialoguePopup.close()
			state = 28
		34: 
			dialoguePopup.close()
			state = 32

func note_made():
	if !NoteHandler.level2_1:
		NoteHandler.level2_1_slot = 'ouders'
		NoteHandler.level2_1 = true
	elif !NoteHandler.level2_2:
		NoteHandler.level2_2_slot = 'ouders'
		NoteHandler.level2_2 = true
	elif !NoteHandler.level2_3:
		NoteHandler.level2_3 = true
		NoteHandler.level2_3_slot = 'ouders'
		GlobalVariables.level_2_eind_aart = true
	GlobalVariables.total_notes += 1
	NoteHandler.update_stuff()
	$Paper.play()
	
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		in_body = true
		$AnimationPlayer2.play("show_text")

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		in_body = false
		$AnimationPlayer2.play_backwards("show_text")
