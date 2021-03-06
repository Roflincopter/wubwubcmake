include(${CMAKE_CURRENT_LIST_DIR}/flag_compiles.cmake)

option(USE_UBSAN "Enable Undefined Behavior Sanitizer" OFF)

if(USE_UBSAN)
	set(flags "-fsanitize=undefined -fno-omit-frame-pointer")
	flag_compiles(FLAGS ${flags} WORKING_FLAG flag)

	if(flag)
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${flag}")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
		set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${flag}")
		set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${flag}")
		set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${flag}")
	else()
		message(WARNING "Undefined Behavior Sanitizer requested, but your compiler doesn't support it (could be other compilation flags, such as the address sanitizer)")
	endif()
endif()
