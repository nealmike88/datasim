#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "PahoMqttCpp::paho-mqttpp3" for configuration "Release"
set_property(TARGET PahoMqttCpp::paho-mqttpp3 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(PahoMqttCpp::paho-mqttpp3 PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libpaho-mqttpp3.so.1.2.0"
  IMPORTED_SONAME_RELEASE "libpaho-mqttpp3.so.1"
  )

list(APPEND _cmake_import_check_targets PahoMqttCpp::paho-mqttpp3 )
list(APPEND _cmake_import_check_files_for_PahoMqttCpp::paho-mqttpp3 "${_IMPORT_PREFIX}/lib64/libpaho-mqttpp3.so.1.2.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
