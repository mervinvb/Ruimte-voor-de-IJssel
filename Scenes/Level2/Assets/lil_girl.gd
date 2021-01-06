extends Sprite
var in_body
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
var state = 1

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()

func talk(answer = ""):
	match state:
		1:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Hallo, weet je misschien iets over de Ossenwaard?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		2:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Lilly"
			dialoguePopup.dialogue = "Natuurlijk, wat wil je weten?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		3:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Waar keek je naar?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		4:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Lilly"
			dialoguePopup.dialogue = "Ik keek naar de uiterwaard."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		5:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Lilly"
			dialoguePopup.dialogue = "Er is daar maar weinig groen aan de kant tegen de IJssel."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		6:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Waarom zijn daar dan geen bomen en gras aangelegd?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		6:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Lilly"
			dialoguePopup.dialogue = "Dat is zodat de rivier nog goed doorstroombaar is."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		7:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Lilly"
			dialoguePopup.dialogue = "Er moet niet te veel vegetatie in de uiterwaarden zijn."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		8:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Lilly"
			dialoguePopup.dialogue = "Dan kan het water niet meer goed stromen en zou dat meer problemen opleveren."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state += 1
		9:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Ik heb het opgeschreven, dank je!"
			dialoguePopup.answers = "[R]"
			note_made()
			dialoguePopup.open()
			state += 1
		10: 
			dialoguePopup.close()
			state += 1
		11:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Lilly"
			dialoguePopup.dialogue = "Weet jij of mijn moeder nog steeds aan het picknicken is?"
			dialoguePopup.answers = "[R] Ja  [T] Nee"
			dialoguePopup.open()
			state += 1
		12:
			match answer:
				"A":
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Lilly"
					dialoguePopup.dialogue = "Oh, dan blijf ik nog even uit de buurt. Mama heeft wel eens ruzie met Sandra..."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state += 1
				"B":
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Lilly"
					dialoguePopup.dialogue = "Oh, dan blijf ik hier nog even rondkijken."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					state += 1
		13: 
			dialoguePopup.close()
			state += 1
		14:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Lilly"
			dialoguePopup.dialogue = "Ik hou echt van de natuur!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 13


func note_made():
	if !NoteHandler.level2_1:
		NoteHandler.level2_1_slot = 'lil_girl'
		NoteHandler.level2_1 = true
	elif !NoteHandler.level2_2:
		NoteHandler.level2_2_slot = 'lil_girl'
		NoteHandler.level2_2 = true
	elif !NoteHandler.level2_3:
		NoteHandler.level2_3 = true
		NoteHandler.level2_3_slot = 'lil_girl'
		GlobalVariables.level_2_eind_aart = true
	GlobalVariables.total_notes += 1
	NoteHandler.update_stuff()
	$Paper.play()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer2.play("show_text")
		in_body = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		$AnimationPlayer2.play_backwards("show_text")
		in_body = false
