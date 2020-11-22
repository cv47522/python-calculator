CONTAINER := calculator

# ---- build metadata ---- #
COMMIT    := $(shell git rev-parse HEAD)
REPO      := $(shell git config remote.origin.url)
EMAIL     := $(shell git config user.email)
NAME      := $(shell git config user.name)
DATE      := $(shell date +"%Y%m%dT%H%M")

.PHONY: default
default: docker

.PHONY: install
install:
	python3 -m venv venv
	. venv/bin/activate && pip install -r requirements.txt

.PHONY: run-tests
run-tests: install
	. venv/bin/activate && flake8 --exclude=venv/ --statistics && pytest -v --cov=calculator

# --------- pull the latest version of any base images instead of reusing local tagged ones ---- #
.PHONY: docker
docker: run-tests version.json
	docker build -t $(CONTAINER) --no-cache --pull=true .
	rm -rf version.json

# ----- tee command reads the standard input and writes it to both the standard output and one or more files ----- #
version.json:
	@echo "{\"container\": \"$(CONTAINER)\", \
			\"registry\": \"$(REGISTRY)\", \
			\"repository\": \"$(REPO)\", \
			\"commit\": \"$(COMMIT)\", \
			\"date\": \"$(DATE)\", \
			\"by\": {\
				\"name\": \"$(NAME)\", \
				\"email\": \"$(EMAIL)\"\
			}}" | python -m json.tool | tee $@