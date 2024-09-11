.PHONY: shell
shell:
	docker run --rm -it -v $(shell pwd):/workspace -w /workspace \
	mobiledevops/android-sdk-image

.PHONY: clean
clean:
	./gradlew clean

.PHONY: build
build:
	./gradlew build

.PHONY: key_generate
key_generate:
	keytool -genkey \
	-v -keystore my-release-key.jks \
	-keyalg RSA -keysize 2048 -validity 10000 \
	-alias my-alias

.PHONY: apk_sign
apk_sign:
	/opt/android-sdk-linux/build-tools/34.0.0/apksigner sign \
	--ks-key-alias my-alias --ks ./my-release-key.jks \
	--out my-app-release.apk \
	./app/build/outputs/apk/release/app-release-unsigned.apk

.PHONY: apk_verify
apk_verify:
	/opt/android-sdk-linux/build-tools/34.0.0/apksigner verify \
	--verbose my-app-release.apk

# Distribute to Firebase (1 project for dev, stg, and prod)
