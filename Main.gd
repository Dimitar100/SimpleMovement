extends Node2D

var matrix = [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,1,1,1,1,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],]
var matrix_fields = []
var width = 8
var height = 8

var walls = []

var test_arr = []

var directions = ["Up", "Diagonal", "Right"]

var field = preload("res://Sprites/Grid.png")
var wall = preload("res://Sprites/wall.png")

func set_locationX(block, x):
	block.position.x = x*64

func set_locationY(block, y):
	block.position.y = y*64
	
func place_block_Green():
	set_locationX($Green, 1)
	set_locationY($Green, 8)

func place_block_Blue():
	set_locationX($Blue, 2)
	set_locationY($Blue, 3)
	
func place_block_Red():
	set_locationX($Red, 3)
	set_locationY($Red, 5)

func place_wall():
	var s = Sprite.new()
	add_child(s,true)
	s.set_texture(wall)
	return s

func setup_walls():
	var step = 0;
	walls.resize(5)
	for i in 5:
		walls[i] = place_wall()
		var x = 2 + step
		set_locationX(walls[i], x)
		set_locationY(walls[i], 4)
		step = step + 1
	print(walls)
	

func setup_grid():
	var xLoc = 64
	var yLoc = 64
	
	for z in height:
		for i in width:
			var s = Sprite.new()
			add_child(s,true)
			s.set_texture(field)
			s.position.x = xLoc
			s.position.y = yLoc
			s.show_behind_parent = true
					
			xLoc = xLoc + 64
		yLoc = yLoc + 64
		xLoc = 64
		
func _ready():
	setup_grid()
	setup_walls()
	place_block_Green()
	place_block_Blue()
	place_block_Red()


func _process(_delta):
	if Input.is_action_just_pressed("ui_reset"):
		get_tree().reload_current_scene()
