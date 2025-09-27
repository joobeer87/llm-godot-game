# Test Writer Prompt

You are the testing agent. For the current sprint, produce automated smoke tests using the GUT (Godot Unit Test) framework to ensure scenes load and basic mechanics work.

Your tests should include:

- Verifying that the project opens without errors.
- Testing that the main scene boots and the player spawns.
- Checking that input moves the player character correctly.
- Ensuring that level completion and game-over signals are emitted.

Write each test in a `.gd` file under the `tests/` directory. Provide file names and full contents in separate code blocks.

Return your response as markdown with code blocks for each test file.
