extends Node2D

@export var enemy_scene: PackedScene = preload("res://Enemy.tscn")
@export var spawn_interval: float = 2.0

func _ready():
    randomize()
    var timer = Timer.new()
    timer.wait_time = spawn_interval
    timer.one_shot = false
    timer.autostart = true
    add_child(timer)
    timer.timeout.connect(_on_spawn_timer_timeout)

func _on_spawn_timer_timeout() -> void:
    var enemy = enemy_scene.instantiate()
    # Spawn off-screen to the right; adjust Y randomly (assumes ~600px tall viewport)
    enemy.position = Vector2(1000, randf() * 600)
    add_child(enemy)
