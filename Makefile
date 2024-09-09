shell:
	docker run --rm -it -v $(shell pwd):/workspace -w /workspace \
	mobiledevops/android-sdk-image

build:
	./gradlew build

key_generate:
	keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-alias
	
