extends Area3D

const ROTATION_SPEED = 2

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROTATION_SPEED))

func _on_body_entered(body: Node3D) -> void:
	Global.gold += 1
	if Global.gold >= 10:
		show_message()
	queue_free()

func show_message():
	var canvas = get_node("/root/Main/CanvasLayer")
	var time = canvas.get_node("Timer")
	time.stop()
	
	var you_win_label = canvas.get_node("Win")
	you_win_label.visible = true
