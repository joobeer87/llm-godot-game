extends SceneTreeTest

var main_scene = preload("res://Main.tscn")

func test_project_loads() -> void:
    assert_true(main_scene != null, "Main scene should load")

func test_player_spawns() -> void:
    var main = main_scene.instantiate()
    get_tree().root.add_child(main)
    await get_tree().process_frame
    var player = main.get_node("Player")
    assert_true(player != null, "Player should exist in main scene")

func test_player_moves_right() -> void:
    var main = main_scene.instantiate()
    get_tree().root.add_child(main)
    await get_tree().process_frame
    var player = main.get_node("Player")
    var start_pos = player.global_position
    # Simulate right input for one frame
    Input.action_press("ui_right")
    await get_tree().process_frame
    Input.action_release("ui_right")
    var end_pos = player.global_position
    assert_true(end_pos.x > start_pos.x, "Player should move right when ui_right is pressed")
