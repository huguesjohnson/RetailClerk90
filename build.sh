echo 'Compiling build tools..'
###########################################################
# create outout directory and all sub paths needed
###########################################################
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
# build the various build parameters
###########################################################
javac ./build-tools/src/com/huguesjohnson/retailclerk/build/parameters/*.java

###########################################################
# copy the complied classes
###########################################################
mv ./build-tools/src/com/huguesjohnson/retailclerk/build/parameters/*.class ./build-tools/bin/com/huguesjohnson/retailclerk/build/parameters/

###########################################################
# compile the main build tool classes
###########################################################
javac ./build-tools/src/com/huguesjohnson/retailclerk/build/*.java -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar

###########################################################
# copy the complied classes
###########################################################
mv ./build-tools/src/com/huguesjohnson/retailclerk/build/*.class ./build-tools/bin/com/huguesjohnson/retailclerk/build/

echo ''

###########################################################
# temporary palettes used to build generic tiles
###########################################################
echo 'Building temporary palettes..'
java -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar com.huguesjohnson.retailclerk.build.MainBuild build-temp-palettes.json
echo ''

###########################################################
# main build
###########################################################
echo 'Running main build..'
java -cp ./build-tools/bin/:./build-tools/lib/gson-2.8.5.jar com.huguesjohnson.retailclerk.build.MainBuild build.json

