extends Node2D

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()



func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	#print("adding mob at: ")
	print(%PathFollow2D.global_position)
	
	# Defer adding the mob as a child to avoid the flushing queries error
	call_deferred("add_child", new_mob)
	
	new_mob.connect("mob_killed", Callable(self, "_on_mob_killed"))


var counter = 0

func _on_mob_killed():
	counter += 1
	print(counter)
	%CounterLabel.text = str(counter)
	# Itt adhatsz hozzá extra logikát, pl. pontok növelése, új mob spawnolása stb.
