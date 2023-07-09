extends Node2D

func get_direction():
	if get_parent().get_node("Up").visible:
		return "Up"
	if get_parent().get_node("Right").visible:
		return "Right"
	if get_parent().get_node("Diagonal").visible:
		return "Diagonal"
		
func check_movement_up():
	if get_parent().position.y > 64:
		return true
		
func check_movement_right():
	if get_parent().position.x < 512:
		return true

func check_for_walls(loc):
	var walls = get_parent().get_parent().walls
	for i in walls:
		if i.position == loc:
			return false
	
	return true
	
	
	
func reverse_roles_three():
	var size = get_parent().get_parent().directions.size()
	if size == 3:
		if Input.is_action_just_pressed("ui_reverse"):
			var direction = get_direction()
			match direction:
				"Up":
					get_parent().get_node("Up").visible = false
					get_parent().get_node("Diagonal").visible = true
				"Right":
					get_parent().get_node("Right").visible = false
					get_parent().get_node("Up").visible = true
				"Diagonal":
					get_parent().get_node("Diagonal").visible = false
					get_parent().get_node("Right").visible = true
	elif size == 2:
		if Input.is_action_just_pressed("ui_reverse"):
			var direction = get_direction()
			
			if direction == get_parent().get_parent().directions[0]:
					get_parent().get_node(get_parent().get_parent().directions[0]).visible = false
					get_parent().get_node(get_parent().get_parent().directions[1]).visible = true
			if direction == get_parent().get_parent().directions[1]:
					get_parent().get_node(get_parent().get_parent().directions[1]).visible = false
					get_parent().get_node(get_parent().get_parent().directions[0]).visible = true


func finished():
	if get_parent().position.y == 64 && get_parent().position.x == 512:
		var direction = get_direction()
		get_parent().get_parent().directions.erase(direction)
		get_parent().queue_free()
		print(get_parent().get_parent().directions)
		
		
func _ready():
	pass

func _process(_delta):
	finished()
	reverse_roles_three()
	
	if Input.is_action_just_pressed("ui_accept"):
		var direction = get_direction()
		match direction:
			"Up":
				if check_movement_up():
					var temp = get_parent().position
					temp.x = get_parent().position.x
					temp.y = get_parent().position.y - 64
					if check_for_walls(temp):
						get_parent().position.y = get_parent().position.y - 64
			"Right":
				if check_movement_right():
					var temp = get_parent().position
					temp.x = get_parent().position.x + 64
					temp.y = get_parent().position.y 
					if check_for_walls(temp):
						get_parent().position.x = get_parent().position.x + 64
			"Diagonal":
				if check_movement_up() && check_movement_right():
					var temp = get_parent().position
					temp.x = get_parent().position.x + 64
					temp.y = get_parent().position.y - 64
					if check_for_walls(temp):
						get_parent().position.y = get_parent().position.y - 64
						get_parent().position.x = get_parent().position.x + 64
