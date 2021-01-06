extends Sprite

var in_body
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
var state = 1 

func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()

func talk(answer = ""):
	match state:
		1:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Hoi, heb je toevallig wat notities gezien?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		2:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Notities? Notities zijn bewijs. Hoe kan je bewijs kwijt raken, nu moeten we nieuw bewijs vinden..."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		3:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Uh, dat klopt. Weet jij misschien iets over de Ossenwaard?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		4:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Ik ben al maanden bezig met het raadsel over de Ossenwaard op te lossen."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		5:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "In het water liggen rare bollen, ze blijven op het water drijven. Weet je wat dat betekent?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		6:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Ze zijn neergelegd om te voorkomen dat boten zomaar de Ossenwaard binnen varen?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		7:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Nee, als ze drijven betekent dat dat ze hol zijn..."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		8:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Er is genoeg ruimte om iets in te stoppen, er moeten geheime documenten in zitten!!!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		9:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Papier zou toch nat worden als het in het water ligt..."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		10:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Je weet niet waar je het over hebt en ik moet het mysterie oplossen!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		11:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Laat me met rust, je stem zorgt ervoor dat ik niet kan nadenken."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		12:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Wat heeft de overheid te verbergen???"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		13:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Het moet wel iets te maken hebben met burgemeester Ron König..."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			note_made()
			state = 15
		14:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Harrie"
			dialoguePopup.dialogue = "Ga weg! Zit jij soms ook in het complot???"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 15
		15:
			dialoguePopup.close()
			state = 14

func note_made():
	if !NoteHandler.level2_1:
		NoteHandler.level2_1_slot = 'crazy_guy'
		NoteHandler.level2_1 = true
	elif !NoteHandler.level2_2:
		NoteHandler.level2_2_slot = 'crazy_guy'
		NoteHandler.level2_2 = true
	elif !NoteHandler.level2_3:
		NoteHandler.level2_3_slot = 'crazy_guy'
		NoteHandler.level2_3 = true
		GlobalVariables.level_2_eind_aart = true
	GlobalVariables.total_notes += 1
	NoteHandler.update_stuff()
	$Paper.play()
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		$AnimationPlayer2.play("show_text")
		in_body = true


func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		$AnimationPlayer2.play_backwards("show_text")
		in_body = false
