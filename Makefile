NUM = 5000
FOLDER = $(NUM)-pods

.PHONY: generate
generate:
	mkdir $(FOLDER) || true
	go run generate-pods.go -n $(NUM) > $(FOLDER)/manifest.yaml

.PHONY: clean
	kubectl delete pods -n default -l "app.kubernetes.io/name=tbyb-fishfood"
