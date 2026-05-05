extends Area2D

func _on_body_entered(body):
	print("entered! ", body.name)
	if body.has_method("show_tooltip"):
		body.show_tooltip()

func _on_body_exited(body):
	print("exited! ", body.name)
	if body.has_method("hide_tooltip"):
		body.hide_tooltip()
