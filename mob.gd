extends CharacterBody2D

var health = 100

@onready var player = get_node("/root/Game/Player")

func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	#print("direction was called")
	move_and_slide()
	
	#if velocity.length() > 0.0:
		#$Slime.play_walk()

signal mob_killed

func take_damage():
	health -= 50
	$Slime.play_hurt()	
	if health == 0:
		print("emit mob kill")
		mob_killed.emit()  # Signal emitálása
		queue_free()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		var game_node = get_tree().root.get_node("Game")
		game_node.spawn_mob()
		game_node.spawn_mob()
