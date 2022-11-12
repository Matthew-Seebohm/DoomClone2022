extends Spatial
#this scripts is for the ammo pickup that spawns when an enemy is killed. 
#the code below adds 1 value to the heavy ammo variable from Global and 3 to the light ammo variable
func _on_Area_area_entered(area):
		Global.ammo_heavy += 1
		Global.ammo_light += 3
		queue_free()
#the queue free code removes the box from the gamescene, so the player cant just infinitely gain ammo
