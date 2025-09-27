extends CharacterBody2D

@export var speed: float = 200.0
@export var plant_scene: PackedScene = preload("res://Plant.tscn")

func _physics_process(delta: float) -> void:
    # Calculate input vector using built-in ui actions
    var input_vector = Vector2(
        Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
        Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    )
    if input_vector.length() > 0:
        input_vector = input_vector.normalized()
    velocity = input_vector * speed
    move_and_slide()

    # Plant seed when ui_accept (default Enter/Space) is pressed
    if Input.is_action_just_pressed("ui_accept"):
        var plant = plant_scene.instantiate()
        plant.position = position
        get_parent().add_child(plant)
