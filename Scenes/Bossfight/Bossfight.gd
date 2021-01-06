extends Node2D

var correct = 0
var incorrect = 0
var question = 1
var answer = 1
var response
var can_click = false
var end = false

const MySmokeResource = preload("res://Scenes/Bossfight/Confetti.tscn")

func _ready():
	$Question.text = ""
	$Answer1.text = ""
	$Answer2.text = ""
	$Answer3.text = ""
	begin()
	

func question():
	match question:
		1:
			$Question.text = "Wat is het gevolg van het afzetten van zand bij de Zandweerplas?"
			$Answer1.text = "De noordelijke boombegroeiing zal meer ruimte krijgen."
			$Answer2.text = "De drempel zal vaker overstromen."
			$Answer3.text = "De oever wordt groter, wat de doorstroombaarheid verbeterd."
			answer = 1
		2:
			$Question.text = "Waarom is het van belang dat de Zandweerplas en IJssel op een andere plaats verbonden worden?"
			$Answer1.text = "Het water kan dan beter in de Zandweerplas vloeien."
			$Answer2.text = "De Zandweerplas zal daardoor dieper kunnen worden gemaakt."
			$Answer3.text = "Watersporters zullen dan minder in elkaars water komen."
			answer = 3
		3:
			$Question.text = "Om welke reden moet de diepte van het water in de Zandweerplas laag genoeg blijven?"
			$Answer1.text = "De waterzuiveringsinstallatie moet nog herkenbaar blijven."
			$Answer2.text = "De oeverrecreanten moeten voldoende water hebben."
			$Answer3.text = "De woonboten en ligboxen moeten genoeg water behouden."
			answer = 3
		4:
			$Question.text = "Wat is de hoofdfunctie van een bollenlijn?"
			$Answer1.text = "Boten kunnen afremmen met behulp van de bollenlijn."
			$Answer2.text = "De bollenlijn dient als houvast als iemand in het water is gevallen."
			$Answer3.text = "Om boten en roeiers uit de afgesloten wateren te houden."
			answer = 3
		5:
			$Question.text = "Wat is het belang van de matige hoeveelheid vegetatie aan de oevers van de Ossenwaard?"
			$Answer1.text = "Zodat het duidelijk is dat vee daar niet mag grazen."
			$Answer2.text = "Zo blijft de doorstroombaarheid van de IJssel voldoende."
			$Answer3.text = "De weinige vegetatie zorgt voor een extra barrière tegen overstromingen."
			answer = 2
		6:
			$Question.text = "Wat is de hoofdfunctie van een geleide- of remmingwerk?"
			$Answer1.text = "Schepen en boten kunnen afremmen dankzij het remmingwerk."
			$Answer2.text = "Het geleidewerk dient als scheiding tussen de banen waar boten in moeten varen."
			$Answer3.text = "Het geleidewerk leent zich voor versieringen tijdens de feestdagen."
			answer = 1
		7:
			$Question.text = "Waarom wordt de Bolwerksplas ondieper gemaakt?"
			$Answer1.text = "Zodat boten minder gemakkelijk in de hank varen."
			$Answer2.text = "Zodat het voor de creatie van een natuurgebied kan zorgen."
			$Answer3.text = "Zodat een kleiner deel van het water uit de IJssel de hank in vloeit."
			answer = 2
		8:
			$Question.text = "Wat is de reden dat de randen van de oevers van de Bolwerksplas begraasd worden?"
			$Answer1.text = "Het beperkt de lengte van het gras wat de doorstroombaarheid bevordert."
			$Answer2.text = "Het bevordert de sfeer van oeverrecreatie in de Bolwerksplas."
			$Answer3.text = "Het zorgt ervoor dat niet te veel water in de nevengeul vloeit in tijden van lage waterstand."
			answer = 1
		9:
			$Question.text = "Waarom is goede doorstroombaarheid van belang?"
			$Answer1.text = "Goede doortstroombaarheid zorgt voor snellere scheepvaart."
			$Answer2.text = "Het zorgt voor stiller ondiep water wat oeverrecreatie bevordert."
			$Answer3.text = "Door de goede doorstroombaarheid zal de kans op overstromingen verminderen."
			answer = 3
	$NewQuestion.play("new")

func explain(answer):
	match question:
		1:
			if answer == "correct":
				alkie_text("Goed zo! Boombegroeiing zal inderdaad meer ruimte krijgen!")
			if answer == "incorrect":
				alkie_text("Oei... Dat klopt niet. Het juiste antwoord is dat de noordelijke boombegroeiing meer ruimte zal krijgen.")
		2:
			if answer == "correct":
				alkie_text("Dat klopt! Watersporters zullen dan inderdaad minder in elkaars water komen, dat is voor iedereen fijn!")
			if answer == "incorrect":
				alkie_text("Oh nee, dat klopt niet! Het antwoord is dat watersporters minder in elkaars water komen.")
		3:
			if answer == "correct":
				alkie_text("Juist! De woonboten en ligboxen moeten genoeg water behouden, anders worden ze beschadigd.")
			if answer == "incorrect":
				alkie_text("Oef! Dat is fout. Het antwoord is dat de woonboten en ligboxen genoeg water moeten behouden.")
		4:
			if answer == "correct":
				alkie_text("Goed gedaan! Met de bollenlijn beschermen we de natuur, door de boten en roeiers weg te houden!")
			if answer == "incorrect":
				alkie_text("Jammer! Dat is niet goed. Het goede antwoord was om boten en roeiers uit de afgesloten wateren te houden.")
		5:
			if answer == "correct":
				alkie_text("Dat klopt! Omdat er weinig vegetatie is, kan het water makkelijker stromen!")
			if answer == "incorrect":
				alkie_text("Oei... Dat is incorrect. Het antwoord is dat door de vegetatie de doorstroombaarheid van de IJssel voldoende blijft.")
		6:
			if answer == "correct":
				alkie_text("Yes! Schepen en boten kunnen inderdaad afremmen dankzij het remmingwerk!")
			if answer == "incorrect":
				alkie_text("Dat is fout. Het goede antwoord is dat schepen en boten af kunnen remmen dankzij het remmingwerk.")
		7:
			if answer == "correct":
				alkie_text("Goed zo! Een ondiepe bodem zorgt voor de creatie van een natuurgebied.")
			if answer == "incorrect":
				alkie_text("Ach en wee! Dat is fout. Het goede antwoord is omdat het voor de creatie van een natuurgebied kan zorgen.")
		8:
			if answer == "correct":
				alkie_text("Inderdaad! Kort gras zorgt voor betere doorstroombaarheid! Hier komt de laatste vraag...")
			if answer == "incorrect":
				alkie_text("Ach, dat is fout! Het juiste antwoord is dat het de lengte van het gras beperkt, wat de doorstroombaarheid bevordert. Hier komt de laatste vraag...")
		9:
			if answer == "correct":
				alkie_text("Dat klopt! Het zorgt voor minder overstromingen, en daar gaat het hele Ruimte Voor De Rivier project over!")
			if answer == "incorrect":
				alkie_text("Oh nee! Fout. Het antwoord is dat door de goede doorstroombaarheid, de kans op overstromingen zal verminderen.")
			end = true

func check():
	print("checking!")
	can_click = false
	if answer == response:
		correct += 1
		print("showing da confetti")
		confetti()
		$kidscheer.play()
		explain("correct")
	else:
		incorrect += 1
		$buzzer.play()
		$CanvasLayer/ColorRect/AnimationPlayer.play("red")
		explain("incorrect")
	$Correct.text = str(correct)
	$Incorrect.text = str(incorrect)



func confetti():
	var GrabedInstance = MySmokeResource.instance()
	self.add_child(GrabedInstance)

func begin():
	yield(get_tree().create_timer(0.5),"timeout")
	$CanvasLayer2/talkbubble/Label.text = "Laten we beginnen met de eerste vraag! Klik op het juiste antwoord!"
	$CanvasLayer2/talkbubble/AnimationPlayer.play("show")
	yield(get_tree().create_timer(4),"timeout")
	$CanvasLayer2/talkbubble/AnimationPlayer.play_backwards("show")
	question	()
	can_click = true

func alkie_text(text):
	yield(get_tree().create_timer(0.5),"timeout")
	$CanvasLayer2/talkbubble/Label.text = text
	$CanvasLayer2/talkbubble/AnimationPlayer.play("show")
	yield(get_tree().create_timer(6),"timeout")
	$CanvasLayer2/talkbubble/AnimationPlayer.play_backwards("show")
	if end:
		GlobalVariables.correct_questions = correct
		yield(get_tree().create_timer(0.5),"timeout")
		$CanvasLayer2/talkbubble/Label.text = "Dit waren mijn vragen! Laten we kijken hoe je hebt gescoord..."
		$CanvasLayer2/talkbubble/AnimationPlayer.play("show")
		yield(get_tree().create_timer(4),"timeout")
		$CanvasLayer2/talkbubble/AnimationPlayer.play_backwards("show")
		SceneChanger.changescene("res://Scenes/Bossfight/EndScore.tscn")
	else:
		question += 1
		question	()
		can_click = true

func _on_Answer1_pressed():
	print("answering 1")
	if can_click:
		response = 1
		check()
	
func _on_Answer2_pressed():
	print("answering 2")
	if can_click:
		response = 2
		check()

func _on_Answer3_pressed():
	print("answering 3")
	if can_click:
		response = 3
		check()
