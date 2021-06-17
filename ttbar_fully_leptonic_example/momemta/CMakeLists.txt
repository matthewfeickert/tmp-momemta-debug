add_executable(example_tt_fullyleptonic "tt_fullyleptonic.cc")

target_link_libraries(example_tt_fullyleptonic momemta::momemta)

set_target_properties(example_tt_fullyleptonic PROPERTIES OUTPUT_NAME "tt_fullyleptonic.exe")
