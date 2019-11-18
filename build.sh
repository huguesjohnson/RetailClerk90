if [ ! -e "./build-tools/bin/MainBuild.class" ]; then
	javac ./build-tools/src/com/huguesjohnson/PathResolver.java
	mv ./build-tools/src/com/huguesjohnson/PathResolver.class ./build-tools/bin/
	javac ./build-tools/src/com/huguesjohnson/retailclerk/build/parameters/*.java
	mv ./build-tools/src/com/huguesjohnson/retailclerk/build/parameters/*.class ./build-tools/bin/
	javac ./build-tools/src/com/huguesjohnson/retailclerk/build/*.java -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar
	mv ./build-tools/src/com/huguesjohnson/retailclerk/build/*.class ./build-tools/bin/
fi 
java -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar com.huguesjohnson.retailclerk.build.MainBuild build.json

