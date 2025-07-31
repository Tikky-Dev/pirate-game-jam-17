extends Node

func _on_toxic_atmosphere_finished() -> void:
	$ImagineAutomatic.play()

func _on_imagine_automatic_finished() -> void:
	$IdesOfMystery.play()

func _on_ides_of_mystery_finished() -> void:
	$DestinyCalls.play()

func _on_destiny_calls_finished() -> void:
	$WhereToTurn.play()

func _on_where_to_turn_finished() -> void:
	$LostInTheHull.play()

func _on_lost_in_the_hull_finished() -> void:
	$Solace.play()

func _on_solace_finished() -> void:
	$WandererBridge.play()

func _on_wanderer_bridge_finished() -> void:
	$Cacophony.play()

func _on_cacophony_finished() -> void:
	$MasterPlan.play()

func _on_master_plan_finished() -> void:
	$PsychologyOfSolitude.play()

func _on_psychology_of_solitude_finished() -> void:
	$ToxicAtmosphere.play()
