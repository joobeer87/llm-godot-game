#!/usr/bin/env python3
"""
Builder script to automate interactions with ChatGPT for Godot game development.

This script provides functions to:
- Load prompts from the prompts/ directory.
- Send requests to the OpenAI ChatCompletion API.
- Save generated code or documentation to appropriate files.
- (Future) open pull requests via GitHub API.

It does not automatically commit or push changes; use at your own risk.
"""

import os
import openai
from typing import List, Dict

# Read your OpenAI API key from the environment
OPENAI_API_KEY = os.environ.get("OPENAI_API_KEY")


def load_prompt(filename: str) -> str:
    """Load a prompt file from the prompts directory."""
    path = os.path.join(os.path.dirname(__file__), "prompts", filename)
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def call_chatgpt(messages: List[Dict[str, str]], model: str = "gpt-4") -> str:
    """
    Call the OpenAI ChatCompletion API with a sequence of messages.
    The first message should usually be the system prompt.
    """
    if OPENAI_API_KEY is None:
        raise RuntimeError("Please set the OPENAI_API_KEY environment variable.")
    openai.api_key = OPENAI_API_KEY
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages,
    )
    return response.choices[0].message["content"]


def run_architect() -> str:
    """Run the architect prompt and return the mini-GDD."""
    prompt = load_prompt("01_architect.md")
    messages = [{"role": "system", "content": prompt}]
    return call_chatgpt(messages)


def run_coder(user_instructions: str) -> str:
    """Run the coder prompt to generate or update game scripts."""
    prompt = load_prompt("02_godot_coder.md")
    messages = [
        {"role": "system", "content": prompt},
        {"role": "user", "content": user_instructions},
    ]
    return call_chatgpt(messages)


def run_test_writer() -> str:
    """Run the test writer prompt to generate smoke tests."""
    prompt = load_prompt("03_test_writer.md")
    messages = [{"role": "system", "content": prompt}]
    return call_chatgpt(messages)


def run_balancer() -> str:
    """Run the balancer prompt to adjust game balance constants."""
    prompt = load_prompt("04_balancer.md")
    messages = [{"role": "system", "content": prompt}]
    return call_chatgpt(messages)


def run_release_manager(changelog: str) -> str:
    """Run the release manager prompt to prepare release notes and updates."""
    prompt = load_prompt("05_release_manager.md")
    messages = [
        {"role": "system", "content": prompt},
        {"role": "user", "content": changelog},
    ]
    return call_chatgpt(messages)


if __name__ == "__main__":
    # Example usage: print architect design to stdout
    gdd = run_architect()
    print(gdd)
