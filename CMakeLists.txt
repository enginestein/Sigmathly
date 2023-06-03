# CMakeList.txt : CMake project for Sigmathly, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

# Enable Hot Reload for MSVC compilers if supported.
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

project ("Sigmathly")

# Add source to this project's executable.
add_executable (Sigmathly   "calculus/ap.cpp" "calculus/calculus.cpp" "calculus/equations.cpp" "calculus/matrix.cpp" "computing/basic.cpp" "computing/complex.cpp" "computing/nums.cpp" "computing/sets.cpp" "engineering/civil.cpp" "engineering/electrical.cpp" "engineering/kinematics.cpp" "engineering/mechanical.cpp" "imp/constants.cpp" "imp/equify.cpp" "imp/geometry.cpp" "imp/logarithm.cpp" "imp/polynomial.cpp" "imp/random.cpp" "imp/time.cpp" "statistics/algorithms.cpp" "statistics/stats.cpp" "trigonometry/const.cpp" "trigonometry/hyperbolic.cpp" "calculus/ap.h" "calculus/calculus.h" "calculus/equations.h" "calculus/matrix.h" "computing/basic.h" "computing/complex.h" "computing/computing.h" "computing/nums.h" "computing/sets.h" "engineering/civil.h" "engineering/electrical.h" "engineering/kinematics.h" "engineering/mechanical.h"  "imp/constants.h" "imp/equify.h" "imp/geometry.h" "imp/logarithm.h" "imp/polynomial.h" "imp/random.h" "imp/time.h"    "statistics/algorithms.h" "statistics/stats.h" "trigonometry/const.h" "trigonometry/hyperbolic.h" "Sigmathly.cpp")

if (CMAKE_VERSION VERSION_GREATER 3.12)
  set_property(TARGET Sigmathly PROPERTY CXX_STANDARD 20)
endif()

# TODO: Add tests and install targets if needed.
