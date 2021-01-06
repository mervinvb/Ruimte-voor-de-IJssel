extends Camera2D
var zoom_number = 1

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("zoom_in"):
			self.zoom.y = 1
			self.zoom.x = 1
			zoom_number = 1
		if Input.is_action_just_pressed("zoom_out"):
			if zoom_number < 3:
				zoom_number += 1
				self.zoom.y += 1
				self.zoom.x += 1
			else:
				pass
