echo 'Compiling build tools..'
###########################################################
# create outout directory and all sub paths needed
###########################################################
mkdir -p ./build-tools/bin/com/huguesjohnson/retailclerk/build/objects/
mkdir -p ./build-tools/bin/com/huguesjohnson/retailclerk/build/parameters/

###########################################################
# compile PathResolver 
###########################################################
javac ./build-tools/src/com/huguesjohnson/PathResolver.java

###########################################################
# copy compiled class
###########################################################
mv ./build-tools/src/com/huguesjohnson/PathResolver.class ./build-tools/bin/com/huguesjohnson/

###########################################################
# build the various object classes
###########################################################
javac -cp ./build-tools/bin/ ./build-tools/src/com/huguesjohnson/retailclerk/build/objects/*.java

###########################################################
# copy the complied classes
###########################################################
mv ./build-tools/src/com/huguesjohnson/retailclerk/build/objects/*.class ./build-tools/bin/com/huguesjohnson/retailclerk/build/objects/

###########################################################
# build the various build parameters
###########################################################
javac -cp ./build-tools/bin/ ./build-tools/src/com/huguesjohnson/retailclerk/build/parameters/*.java

###########################################################
# copy the complied classes
###########################################################
mv ./build-tools/src/com/huguesjohnson/retailclerk/build/parameters/*.class ./build-tools/bin/com/huguesjohnson/retailclerk/build/parameters/

###########################################################
# compile the main build tool classes
###########################################################
javac -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar ./build-tools/src/com/huguesjohnson/retailclerk/build/*.java

###########################################################
# copy the complied classes
###########################################################
mv ./build-tools/src/com/huguesjohnson/retailclerk/build/*.class ./build-tools/bin/com/huguesjohnson/retailclerk/build/

echo ''

###########################################################
# main build
###########################################################
echo 'Running main build..'
java -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar com.huguesjohnson.retailclerk.build.MainBuild build.json

