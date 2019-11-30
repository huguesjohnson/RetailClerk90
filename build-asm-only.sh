if [ ! -e "./build-tools/bin/com/huguesjohnson/retailclerk/build/MainBuild.class" ]; then
	mkdir -p ./build-tools/bin/com/huguesjohnson/retailclerk/build/parameters/
	javac ./build-tools/src/com/huguesjohnson/PathResolver.java
	mv ./build-tools/src/com/huguesjohnson/PathResolver.class ./build-tools/bin/com/huguesjohnson/
	javac ./build-tools/src/com/huguesjohnson/retailclerk/build/parameters/*.java
	mv ./build-tools/src/com/huguesjohnson/retailclerk/build/parameters/*.class ./build-tools/bin/com/huguesjohnson/retailclerk/build/parameters/
	javac ./build-tools/src/com/huguesjohnson/retailclerk/build/*.java -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar
	mv ./build-tools/src/com/huguesjohnson/retailclerk/build/*.class ./build-tools/bin/com/huguesjohnson/retailclerk/build/
fi 
java -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar com.huguesjohnson.retailclerk.build.MainBuild build-asm-only.json

