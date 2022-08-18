FOLDER = 5000-pods

.PHONY: generate
generate:
	mkdir $(FOLDER)
	go run generate-pods.go > $(FOLDER)/manifest.yaml
