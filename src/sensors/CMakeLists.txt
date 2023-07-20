# CMakeLists.txt
#
# CMake file for the Paho C++ sample applications.
#
#*******************************************************************************
# This is part of the Paho MQTT C++ client library.
#
# Copyright (c) 2016-2019
# 
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# and Eclipse Distribution License v1.0 which accompany this distribution.
# 
# The Eclipse Public License is available at
#   http://www.eclipse.org/legal/epl-v10.html
# and the Eclipse Distribution License is available at
#   http://www.eclipse.org/org/documents/edl-v10.php.
# 
# Contributors:
#   Guilherme Maciel Ferreira - initial version
#   Frank Pagliughi - Updates for new samples
#*******************************************************************************/

## Note: on OS X you should install XCode and the associated command-line tools

## --- Library dependencies ---

set (THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

## include directories
#include_directories(${CMAKE_CURRENT_SOURCE_DIR})

## binary files
add_executable(main main.cpp)

## link binaries
target_link_libraries(main ${PAHO_CPP_LIB})

set(INSTALL_TARGETS
	main
)

## install binaries
install(TARGETS ${INSTALL_TARGETS} EXPORT PahoMqttCppSamples
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
)

