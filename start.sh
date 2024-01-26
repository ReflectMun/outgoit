set -ex

./gradlew bootJar
java -jar build/libs/outgoit-1.0.0.jar