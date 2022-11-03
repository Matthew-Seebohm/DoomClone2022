extends Area

var speed : float = 320
var damage : int = 1

func _process (delta):
	# move the bullet forwards
	translation += global_transform.basis.z * speed * delta

#if the bullet enters a body that uses the function "take_damage" than the script runs the "take_damage" function
func _on_Bullet_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		destroy()

func destroy ():
	# destroys the bullet
	queue_free()

#to avoid slowing down the game with copius amounts of bullets being loaded, 
#the destroy function deletes the bullets from the game world after the timer runs out
func _on_Timer_timeout():
	destroy()
