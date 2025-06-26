add_library(core
  "foo.cpp"
)

set(CORE_PRIVATE_HEADERS 
  "include/core/foo.hpp"
)
set(CORE_PUBLIC_HEADERS 
  "${PROJECT_SOURCE_DIR}/include/core/public_foo.hpp"
)

# Make these headers visible in Solution Explorer
target_sources(core 
  PRIVATE
    ${CORE_PRIVATE_HEADERS}
  PUBLIC
    ${CORE_PUBLIC_HEADERS}
)

# Organize headers into VS folders
source_group("Private Headers" FILES ${CORE_PRIVATE_HEADERS})
source_group("Public Headers" FILES ${CORE_PUBLIC_HEADERS})

# -----UNCOMMENT WHEN NEEDED-----
# ----------------------------
# Treat headers of submodules
# as system headers to suppress warnings:
# ----------------------------
# target_include_directories(core
#   SYSTEM PUBLIC
#   $<TARGET_PROPERTY:yourOwnExternSubmoduleName,INTERFACE_INCLUDE_DIRECTORIES>
# )

target_include_directories(core
  PRIVATE 
    "include/"
  PUBLIC
    "${PROJECT_SOURCE_DIR}/include"
)

set_target_properties(core PROPERTIES FOLDER "Libraries")