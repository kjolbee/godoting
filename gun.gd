extends Area2D

var enemies_in_range

func _physics_process(delta: float) -> void:
	enemies_in_range = get_overlapping_bodies()
	#print(enemies_in_range)
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front() 
		look_at(target_enemy.global_position)


func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
#
#
func _on_timer_timeout() -> void:
	if enemies_in_range.size() > 0:
		shoot()
