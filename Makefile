.PHONY: generate
generate:
	mkdir 100-pods || true
	go run generate-pods.go -n 100 > 100-pods/manifest.yaml
	mkdir 200-pods || true
	go run generate-pods.go -n 200 > 200-pods/manifest.yaml
	mkdir 500-pods || true
	go run generate-pods.go -n 500 > 500-pods/manifest.yaml
	mkdir 1000-pods || true
	go run generate-pods.go -n 1000 > 1000-pods/manifest.yaml
	mkdir 2000-pods || true
	go run generate-pods.go -n 2000 > 2000-pods/manifest.yaml
	mkdir 5000-pods || true
	go run generate-pods.go -n 5000 > 5000-pods/manifest.yaml

.PHONY: clean
clean:
	kubectl delete pods -n default -l "app.kubernetes.io/name=tbyb-fishfood"
	kubectl delete namespace pizza --ignore-not-found
	kubectl delete namespace taco --ignore-not-found
