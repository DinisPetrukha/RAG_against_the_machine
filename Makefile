.PHONY : install run debug clean lint lint-strict

install:
	uv sync

test:
	uv run --with pytest pytest tests/ -v

run:
#TODO
	clear && uv run python -m src 

debug:
#TODO
	uv run python -m pdb -m src

clean:
	find . -type d \( -name __pycache__ -o -name ".mypy_cache" \) -not -path "./.venv/*" -not -path "./.git/*" -exec rm -rf {} +

lint:
	uvx flake8 .
	uv run --with mypy mypy . --warn-return-any --warn-unused-ignores --ignore-missing-imports --disallow-untyped-defs --check-untyped-defs

lint-strict:
	uvx flake8 .
	uv run --with mypy mypy . --strict