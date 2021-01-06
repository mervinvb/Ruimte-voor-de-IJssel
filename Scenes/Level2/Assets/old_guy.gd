extends Sprite
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
var state = 1

func _ready():
	yield(get_tree().create_timer(1),"timeout")
	talk()
	
func talk(answer = ""):
	match state:
		1:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Bedankt voor ons naar de overkant brengen."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 2
		2:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Bernhard"
			dialoguePopup.dialogue = "Geen probleem, nog veel plezier met jullie uitstapje!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 3
			
		3:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Mr. van Voorden"
			dialoguePopup.dialogue = "Bedankt he, fijne dag!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			state = 4
		4:
			dialoguePopup.close()
			$AnimationPlayer2.play("cutscene")
			yield(get_tree().create_timer(8),"timeout")
			if GlobalVariables.old_man == 'neutral':
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Dat was een leuk tochtje!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
			if GlobalVariables.old_man == 'angry':
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Ik heb nog nooit op zo een lelijke boot gevaren."
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
			if GlobalVariables.old_man == 'happy':
				dialoguePopup.npc = self
				dialoguePopup.npc_name = "Jij"
				dialoguePopup.dialogue = "Ik ben blij dat we met zijn mooie boot mee mochten!"
				dialoguePopup.answers = "[R]"
				dialoguePopup.open()
			state = 5
		5:
			dialoguePopup.close()
			NoteHandler.show_handler()
			self.queue_free()
