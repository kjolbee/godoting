extends Node2D


func play_walk():
	%AnimationPlayer.play("walk")


func play_hurt():
	print("player hurt called")
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")
