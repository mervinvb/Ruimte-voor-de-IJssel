extends Area2D

enum QuestStatus { NOT_STARTED, STARTED, COMPLETED }
var quest_status = QuestStatus.NOT_STARTED
var dialogue_state = 0
var necklace_found = false
onready var animationPlayer = $AnimationPlayer
var in_body = 0
var dialoguePopup
var player

func _ready():
	dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
	player = get_tree().root.get_node("World/YSort/Player")

func _input(delta):
	if Input.is_action_just_pressed("interact") and in_body == 1:
		talk()

func talk(answer = ""):
	# Set dialoguePopup npc to Fiona
	dialoguePopup.npc = self
	dialoguePopup.npc_name = "Meneer van Voorden"
	
	# Show the current dialogue
	match quest_status:
		QuestStatus.NOT_STARTED:
			match dialogue_state:
				0:
					# Update dialogue tree state
					dialogue_state = 1
					# Show dialogue popup
					dialoguePopup.dialogue = "Hallo leerling! Heb jij zin in een aardrijkskunde les?"
					dialoguePopup.answers = "[R] Ja  [T] Nee"
					dialoguePopup.open()
				1:
					match answer:
						"A":
							# Update dialogue tree state
							dialogue_state = 2
							# Show dialogue popup
							dialoguePopup.dialogue = "Geweldig! We beginnen over 10 minuten."
							dialoguePopup.answers = "[R] Tot zo!"
							dialoguePopup.open()
						"B":
							# Update dialogue tree state
							dialogue_state = 3
							# Show dialogue popup
							dialoguePopup.dialogue = "Oke, dan niet!"
							dialoguePopup.answers = "[R] Doei"
							dialoguePopup.open()
				2:
					# Update dialogue tree state
					dialogue_state = 0
					quest_status = QuestStatus.STARTED
					# Close dialogue popup
					dialoguePopup.close()
				3:
					# Update dialogue tree state
					dialogue_state = 0
					# Close dialogue popup
					dialoguePopup.close()
		QuestStatus.STARTED:
			match dialogue_state:
				0:
					# Update dialogue tree state
					dialogue_state = 1
					# Show dialogue popup
					dialoguePopup.dialogue = "Ik zei toch over 10 minuten!"
					if necklace_found:
						dialoguePopup.answers = "[R] Yes  [T] No"
					else:
						dialoguePopup.answers = "[R] Oh ja oeps..."
					dialoguePopup.open()
				1:
					if necklace_found and answer == "A":
						# Update dialogue tree state
						dialogue_state = 2
						# Show dialogue popup
						dialoguePopup.dialogue = "You're my hero! Please take this potion as a sign of my gratitude!"
						dialoguePopup.answers = "[R] Thanks"
						dialoguePopup.open()
					else:
						# Update dialogue tree state
						dialogue_state = 3
						# Show dialogue popup
						dialoguePopup.dialogue = "Geen probleem, kom zo maar terug."
						dialoguePopup.answers = "[R] Tot zo!"
						dialoguePopup.open()
				2:
					# Update dialogue tree state
					dialogue_state = 0
					quest_status = QuestStatus.COMPLETED
					# Close dialogue popup
					dialoguePopup.close()
					# Add potion and XP to the player. 
					yield(get_tree().create_timer(0.5), "timeout") #I added a little delay in case the level advancement panel appears.
					player.add_xp(50)
				3:
					# Update dialogue tree state
					dialogue_state = 0
					# Close dialogue popup
					dialoguePopup.close()
		QuestStatus.COMPLETED:
			match dialogue_state:
				0:
					# Update dialogue tree state
					dialogue_state = 1
					# Show dialogue popup
					dialoguePopup.dialogue = "Thanks again for your help!"
					dialoguePopup.answers = "[R] Bye"
					dialoguePopup.open()
				1:
					# Update dialogue tree state
					dialogue_state = 0
					# Close dialogue popup
					dialoguePopup.close()


func _on_Fiona_body_entered(body):
	if body.name == "Player":
		in_body = 1
		$AnimationPlayer.play("ShowText")


func _on_Fiona_body_exited(body):
	if body.name == "Player":
		in_body = 0
		$AnimationPlayer.play_backwards("ShowText")
