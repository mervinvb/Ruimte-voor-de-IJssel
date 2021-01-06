extends Sprite

var in_body
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
var mood = GlobalVariables.old_man
onready var Player = get_tree().root.get_node("World/YSort/Player")

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()

func talk(answer = ""):
	mood = GlobalVariables.old_man
	GlobalVariables.position_x = Player.position.x
	GlobalVariables.position_y = Player.position.y
	match mood:
		"angry":
			match GlobalVariables.old_guy_state:
				1:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Jij"
					dialoguePopup.dialogue = "Hoi Bernhard, heb jij toevallig nog een notitie gezien?"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				2:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Ja! Maar met deze lelijke boot wil je er vast niet naartoe varen."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				3:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Jij"
					dialoguePopup.dialogue = "Sorry dat ik je boot beledigde... Wil je mij alsjeblieft helpen?"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				4:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Goed, we varen er wel naar toe."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				5:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Maar dan moet jij sturen, ik ga echt geen moeite meer voor je doen!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				6:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Oh, en zorg dat je niet tegen de stenen aan vaart... Dan zwaait er wat!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				7:
					dialoguePopup.close()
					SceneChanger.changescene("res://Scenes/Level3/FlappyBird.tscn")
					GlobalVariables.old_guy_state += 1
				8:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Jij"
					dialoguePopup.dialogue = "Weet je Bernhard, vanbinnen is jouw boot wel mooi!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				9:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Dat is toch fijn om te horen!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				10:
					dialoguePopup.close()
					GlobalVariables.old_guy_state += 1
				11:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Fijne dag nog he!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state -= 1

		"neutral":
			match GlobalVariables.old_guy_state:
				1:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Jij"
					dialoguePopup.dialogue = "Hoi Bernhard, heb jij toevallig nog een notitie gezien?"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				2:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Toevallig wel, zou je het leuk vinden om er mee naar toe te varen?"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				3:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Jij"
					dialoguePopup.dialogue = "Dat zou geweldig zijn!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				4:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Kom maar mee mijn boot op, jij mag sturen!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				5:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Zorg wel dat je niet tegen de stenen aan vaart..."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				6:
					dialoguePopup.close()
					SceneChanger.changescene("res://Scenes/Level3/FlappyBird.tscn")
					GlobalVariables.old_guy_state += 1
				7:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Nou, dat ging best goed! Fijne dag nog!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				8:
					dialoguePopup.close()
					GlobalVariables.old_guy_state -= 1
		"happy":
			match GlobalVariables.old_guy_state:
				1:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Jij"
					dialoguePopup.dialogue = "Hoi Bernhard, heb jij toevallig nog een notitie gezien?"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				2:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Jazeker, jij wil vast wel op deze mooie boot meevaren om hem te zoeken, of niet?"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				3:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Jij"
					dialoguePopup.dialogue = "Dat lijkt me fantastisch, ik vind het echt een prachtige boot!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				4:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Mooi, dan mag jij sturen! Zorg wel dat je niet tegen de stenen aan vaart..."
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					
					GlobalVariables.old_guy_state += 1
				5:
					dialoguePopup.close()
					SceneChanger.changescene("res://Scenes/Level3/FlappyBird.tscn")
					GlobalVariables.old_guy_state += 1
				6:
					dialoguePopup.npc = self
					dialoguePopup.npc_name = "Bernhard"
					dialoguePopup.dialogue = "Nou, dat ging best goed! Fijne dag nog!"
					dialoguePopup.answers = "[R]"
					dialoguePopup.open()
					GlobalVariables.old_guy_state += 1
				7:
					dialoguePopup.close()
					GlobalVariables.old_guy_state -= 1
			
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
