extends YSort

var sign1 = "Deze boom staat hier al sinds 2020!"
var sign2 = "Ik ben een ander bordje!"
var current_sign
var sign_text
export var hotfix = false

var dialoguePopup
var player
var signTexts
var in_body = 0

var dialogue_state = 0
func _ready():
	dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")
	if hotfix:
		player = get_tree().root.get_node("World/Ysort/Player")
	else:
		player = get_tree().root.get_node("World/YSort/Player")

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("interact"):
			if in_body == 0:
				return
			if current_sign == 1:
				sign_text = "Dit is de Zandweerdhaven!"
			if current_sign == 2:
				sign_text = "Dit is het pad naar boven."
			if current_sign == 3:
				sign_text = "Deze brug is erg instabiel, kijk uit!"
			if current_sign == 4:
				sign_text = "Dit is de Bolwerkseplas, hij is verbonden met de IJsel!"
			talk()

func talk(answer = ""):
	# Set dialoguePopup npc to Fiona
	print("Checking for body. Current sign: " + str(current_sign))
	dialoguePopup.npc = self
	dialoguePopup.npc_name = "Bordje"
	match dialogue_state:
				0:
					# Update dialogue tree state
					dialogue_state = 1
					# Show dialogue popup
					dialoguePopup.dialogue = sign_text
					dialoguePopup.answers = "[R] Ok"
					dialoguePopup.open()
				1:
					match answer:
						"A":
							# Update dialogue tree state
							dialogue_state = 0
							dialoguePopup.close()
