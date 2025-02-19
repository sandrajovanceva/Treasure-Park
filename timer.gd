extends CanvasLayer

var time_left = 120
func _ready() -> void:
	$Timer.start()
	update_time_label()

func _process(delta: float) -> void:
	pass

func update_time_label() -> void:
	var minutes: int = time_left / 60
	var seconds: int = time_left % 60
	$Time.text = "Time Left:\n%02d:%02d" % [minutes, seconds] 

func _on_timer_timeout() -> void:
	if time_left > 0:
		time_left -= 1 
		update_time_label()
	else:
		$Timer.stop()
		$GameOver.visible = true
