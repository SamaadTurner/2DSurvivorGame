extends CharacterBody2D

const max_speed = 75

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = get_direction_to_player()
	velocity = direction * max_speed
	move_and_slide()


func get_direction_to_player():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player_node = player_nodes[0] as Node2D
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO

func on_area_entered(other_area: Area2D):
	queue_free() 
	
	
