shell:
	docker run --rm -it -v $(shell pwd):/workspace -w /workspace \
	mobiledevops/android-sdk-image
