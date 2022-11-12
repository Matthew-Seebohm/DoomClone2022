extends Node

#for telling the locked door and finish if the player picked up the keycard
var blue_keycard = false
#contains the player's health, decreases if code is ran that requires it
var player_health = 100
#contains the value for heavy ammo used by the left pistol
var ammo_heavy = 15
#contains the value for light ammo used by the right pistol
var ammo_light = 30
#contains the value for the score, increases when an enemy is killed, but resets back to zero when the player is hit
var combo_count = 0
#this detirmines the difficulty mode, if set to true, it applies different code
var SLASH = false
#when entering the area of the locked door, this is set to true, when exiting its set back to false
var locked_door = false
#same as the locked door
var finish = false
