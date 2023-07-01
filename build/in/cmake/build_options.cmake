option(WTR_WATCHER_BUILD_RELEASE        "Build the CLI with all optimizations"        ON)
option(WTR_WATCHER_BUILD_DEBUG          "Build the CLI without optimizations"         OFF)
option(WTR_WATCHER_BUILD_TEST           "Build the test programs"                     OFF)
option(WTR_WATCHER_BUILD_BENCH          "Build the benchmarking programs"             OFF)
option(WTR_WATCHER_BUILD_ASAN           "Build with the address sanitizer"            OFF)
option(WTR_WATCHER_BUILD_MSAN           "Build with the memory sanitizer"             OFF)
option(WTR_WATCHER_BUILD_TSAN           "Build with the thread sanitizer"             OFF)
option(WTR_WATCHER_BUILD_UBSAN          "Build with the undefined behavior sanitizer" OFF)
# option(WTR_WATCHER_BUILD_STACKSAN       "Build with the stack safety sanitizer"       OFF)
# option(WTR_WATCHER_BUILD_DATAFLOWSAN    "Build with the data flow sanitizer"          OFF)
# option(WTR_WATCHER_BUILD_CFISAN         "Build with the cfi sanitizer"                OFF)
# option(WTR_WATCHER_BUILD_KCFISAN        "Build with the kernel cfi sanitizer"         OFF)