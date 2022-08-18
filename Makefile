NUM = 5000
FOLDER = $(NUM)-pods

.PHONY: generate
generate:
	mkdir $(FOLDER) || true
	go run generate-pods.go -n $(NUM) > $(FOLDER)/manifest.yaml

.PHONY: clean
clean:
	kubectl delete pods -n default -l "app.kubernetes.io/name=tbyb-fishfood"
	kubectl delete namespace pizza --ignore-not-found
	kubectl delete namespace taco --ignore-not-found
