#player.gd
extends CharacterBody2D

var speed = 500
var health = 100

signal health_zero

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left","move_right", "move_up","move_down")
	velocity = direction * speed 
	move_and_slide()
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
	
	const DAMAGE = 100
	var overlapping_mobs = %Hitbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE * delta
		print(health)
		$"%ProgressBar".value = health
		
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		speed += 50
		print("speed increased")
		if health <= 0:
			health_zero.emit()
		
		
