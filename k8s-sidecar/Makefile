# Use:
# `make kubectl` will build kubectl.
# `make tag` will suggest a tag.
# `make container` will build a container-- you must supply a tag.
# `make push` will push the container-- you must supply a tag.

GOARCH?=$(shell go env GOARCH)
GOOS?=$(shell go env GOOS)

kubectl:
	make -C ../../ WHAT=cmd/kubectl KUBE_STATIC_OVERRIDES="kubectl"; \
	cp ../../_output/local/bin/$(GOOS)/$(GOARCH)/kubectl .

.tag: 
	./dist/kubectl version --client | grep -o 'GitVersion:"[^"]*"' | sed 's/[^"]*"\([^"+]*\).*/\1/' > .tag

tag: .tag
	@echo "Suggest using TAG=$(shell cat .tag)"
	@echo "$$ make build TAG=$(shell cat .tag)"
	@echo "or"
	@echo "$$ make push TAG=$(shell cat .tag)"

build: 
	$(if $(TAG),,$(error TAG is not defined. Use 'make tag' to see a suggestion))
	docker build --pull -t docker.io/datalayer/k8s-sidecar:$(TAG) .

push: build
	$(if $(TAG),,$(error TAG is not defined. Use 'make tag' to see a suggestion))
	docker push docker.io/datalayer/k8s-sidecar:$(TAG)

clean:
	rm -f kubectl
	rm -f .tag
