PYTHON = python3

.PHONY: init setup install cleanup clean-cache run-ingest run-query run-test help

build:

permissions:
	chmod +x gcp_project/*.sh 

init:	
	$(MAKE) permissions
	$(PYTHON) -m venv venv
	. venv/bin/activate; pip install -r requirements.txt
	cd build && terraform init

build:
	cd build && terraform apply

cleanup:   
	cd build && terraform destroy

clean-cache:
	rm -rf venv __pycache__

run-ingest:
	$(PYTHON) ingest.py --symbol $(symbol) --debug

run-query:
	./gcp_project/query.sh

run-test:
	@echo "Load stock market data for IBM"
	$(MAKE)	run-ingest symbol=ibm
	@echo "Load stock market data for GOOGLE"
	$(MAKE)	run-ingest symbol=goog
	@echo "Load stock market data for APPLE"
	$(MAKE)	run-ingest symbol=aapl
	@echo "Analyse of the stock market"
	$(MAKE)	run-query

# Help target
help:
	@echo "Available commands:"
	@echo "  make init         - Create virtual environment and install dependencies"
	@echo "  make build        - Create GCP infrastructure using terraform"
	@echo "  clean-cache       - Remove cache of the project"
	@echo "  make cleanup      - Remove bucket and account"
	@echo "  make run-ingest   - Load data using script ingest.py (usage: make run-ingest symbol=ibm)"
	@echo "  make run-query    - Execute Big Query queries for stock market analysis"
	@echo "  make run-test     - Load stock market data for 3 companies and show their analysis"