# Set the minimum required CMake version
cmake_minimum_required(VERSION 3.0)

# Set the project name
project(ProjectName)

# Set the CMake variables for the input file, output file, and ratio
set(INPUT_FILE "test_mono.wav")
set(OUTPUT_FILE "output.wav")
set(RATIO 0.5)

# Function to check if a system library is installed
function(check_system_library library_name)
  find_library(${library_name}_LIBRARY NAMES ${library_name})
  set(${library_name}_INSTALLED ${${library_name}_LIBRARY} PARENT_SCOPE)
endfunction()

# Define libsndfile1 package
set(LIBSNDFILE1_PACKAGE libsndfile1)

# Check if libsndfile1 is installed
check_system_library(LIBSNDFILE1)
if(NOT LIBSNDFILE1_INSTALLED)
  message(STATUS "Package libsndfile1 not found. Attempting to install libsndfile1...")

  if (UNIX AND NOT APPLE)
    execute_process(
      COMMAND apt-get -y install ${LIBSNDFILE1_PACKAGE}
      RESULT_VARIABLE INSTALL_RESULT
    )
  elseif (APPLE)
    execute_process(
      COMMAND brew install ${LIBSNDFILE1_PACKAGE}
      RESULT_VARIABLE INSTALL_RESULT
    )
  endif()

  if(INSTALL_RESULT EQUAL 0)
    check_system_library(LIBSNDFILE1)
    message(STATUS "libsndfile1 successfully installed.")
  else()
    message(FATAL_ERROR "Failed to install libsndfile1.")
  endif()
else()
  message(STATUS "libsndfile1 is already installed.")
endif()

# Define libsndfile1 package
set(LIBSNDFILE1_DEV_PACKAGE libsndfile1-dev)

# Check if libsndfile1 is installed
check_system_library(LIBSNDFILE1_DEV)
if(NOT LIBSNDFILE1_DEV_INSTALLED)
  message(STATUS "Package libsndfile1 not found. Attempting to install libsndfile1...")

  if (UNIX AND NOT APPLE)
    execute_process(
	    COMMAND apt-get -y install ${LIBSNDFILE1_DEV_PACKAGE}
      RESULT_VARIABLE INSTALL_RESULT
    )
  elseif (APPLE)
    execute_process(
	    COMMAND brew install ${LIBSNDFILE1_DEV_PACKAGE}
      RESULT_VARIABLE INSTALL_RESULT
    )
  endif()

  if(INSTALL_RESULT EQUAL 0)
	  check_system_library(LIBSNDFILE1_DEV)
    message(STATUS "libsndfile1 successfully installed.")
  else()
    message(FATAL_ERROR "Failed to install libsndfile1.")
  endif()
else()
  message(STATUS "libsndfile1 is already installed.")
endif()

# Find the Python interpreter
find_package(PythonInterp 3 REQUIRED)

# Function to check if a Python package is installed
function(check_python_package package_name)
  execute_process(
    COMMAND ${PYTHON_EXECUTABLE} -c "import ${package_name}"
    RESULT_VARIABLE PYTHON_PACKAGE_RESULT
    ERROR_QUIET
  )
  set(${package_name}_INSTALLED FALSE PARENT_SCOPE)
  if(PYTHON_PACKAGE_RESULT EQUAL 0)
    set(${package_name}_INSTALLED TRUE PARENT_SCOPE)
  endif()
endfunction()

# Check if librosa is installed
check_python_package("librosa")
if(NOT librosa_INSTALLED)
  execute_process(COMMAND ${PYTHON_EXECUTABLE} -m pip install librosa)
endif()

# Check if numpy is installed
check_python_package("numpy")
if(NOT numpy_INSTALLED)
  execute_process(COMMAND ${PYTHON_EXECUTABLE} -m pip install numpy)
endif()

# Check if matplotlib is installed
check_python_package("matplotlib")
if(NOT matplotlib_INSTALLED)
  execute_process(COMMAND ${PYTHON_EXECUTABLE} -m pip install matplotlib)
endif()

# Check if pysoundfile is installed
check_python_package("pysoundfile")
if(NOT pysoundfile_INSTALLED)
  execute_process(COMMAND ${PYTHON_EXECUTABLE} -m pip install pysoundfile)
endif()

# Check if pysoundfile is installed
check_python_package("IPython")
if(NOT IPython_INSTALLED)
	execute_process(COMMAND ${PYTHON_EXECUTABLE} -m pip install IPython)
endif()

# Check if pysoundfile is installed
check_python_package("sndfile")
if(NOT sndfile_INSTALLED)
  execute_process(COMMAND ${PYTHON_EXECUTABLE} -m pip install sndfile)
endif()

# Add a custom target to run the Python script with CMake variables as arguments
add_custom_target(
  RunPythonScript
  COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/main.py
  ${INPUT_FILE} ${OUTPUT_FILE} ${RATIO}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

