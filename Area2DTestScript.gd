extends Area2D


func _on_Area2D_area_entered(area):
	print("Hello")


func _on_Area2D_body_entered(body):
	var TreeLoad = load("res://World/Tree.tscn")
	var treeLoad = TreeLoad.instance()
	var world = get_tree().current_scene
	world.add_child(treeLoad)
	treeLoad.global_position = global_position
