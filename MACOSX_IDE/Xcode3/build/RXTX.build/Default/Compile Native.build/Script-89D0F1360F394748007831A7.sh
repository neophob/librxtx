#!/bin/sh
# find the jar file to dig into
JAR_TO_JAVAH="${BUILT_PRODUCTS_DIR}/RXTXcomm.jar"

# use a helper script to list all classes inside the jar, and all classes referenced by those classes
CLASS_LIST=`"${SRCROOT}/ant/find-classrefs.sh" "${JAR_TO_JAVAH}" | xargs`

# run javah for all classes inside the jar, and all classes referenced by those classes
javah -verbose -jni -classpath "${JAR_TO_JAVAH}" -d "${DERIVED_SOURCES_DIR}" ${CLASS_LIST}
