extends Sprite

onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
var in_body = false
var state = 1
var happy

func _ready():
	$stand.play("stand")

func _on_Questarea_body_entered(body):
	if body.name == 'Player' and !GlobalVariables.level_1_blaadjes_left == 0:
		$AnimationPlayer.play("showtext")
		in_body = true

func _on_Questarea_body_exited(body):
	if body.name == 'Player' and !GlobalVariables.level_1_blaadjes_left == 0:
		$AnimationPlayer.play_backwards("showtext")
		in_body = false
		
func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		talk()
		
func talk(answer = ""):
	match state:
		1:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Bernhard"
			dialoguePopup.dialogue = "Dag kind! Wat vind je van mijn boot?"
			dialoguePopup.answers = "[R] Mooi!  [T] Lelijk."
			dialoguePopup.open()
			state = 2
		2:
			match answer:
				"A":
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Bedankt! Ik vaar er altijd mee over de IJssel."
					dialoguePopup.answers = "[R] Oke!"
					dialoguePopup.open()
					state = 3
					happy = true
					GlobalVariables.old_man = 'happy'
				"B":
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Nou oke, ieder zijn mening."
					dialoguePopup.answers = "[R] Doei."
					dialoguePopup.open()
					state = 3
					happy = false
					GlobalVariables.old_man = 'angry'
		3:
			dialoguePopup.close()
			state = 4
		4:
			match happy:
				true:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Succes met je zoektocht!"
					dialoguePopup.answers = "[R] Fijne dag!."
					dialoguePopup.open()
					state = 3
				false:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Ben jij daar weer? Kom je alweer mijn boot beledigen?"
					dialoguePopup.answers = "[R] Sorry, ik ga al."
					dialoguePopup.open()
					state = 3
