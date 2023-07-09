extends Node2D

var matrix = []
var matrix_fields = []
var width = 8
var height = 8

var directions = ["Up", "Diagonal", "Right"]

var field = preload("res://Sprites/Grid.png")

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

func setup_grid():
	var xLoc = 64
	var yLoc = 64
	
	for z in height:
		for i in width:
			var s = Sprite.new()
			add_child(s,true)
			#matrix_fields[i][z] = s
		
			s.set_texture(field)
			s.position.x = xLoc
			s.position.y = yLoc
			s.show_behind_parent = true
					
			xLoc = xLoc + 64
		yLoc = yLoc + 64
		xLoc = 64
		
func _ready():
	setup_grid()
	place_block_Green()
	place_block_Blue()
	place_block_Red()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
