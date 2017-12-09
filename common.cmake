
if(NOT DEFINED LIBUV_PLATFORM)
  if(CMAKE_SYSTEM_NAME STREQUAL "AIX")
    set(LIBUV_PLATFORM aix)
  elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(LIBUV_PLATFORM mac)
  elseif(CMAKE_SYSTEM_NAME STREQUAL "DragonFly")
    set(LIBUV_PLATFORM dragonflybsd)
  elseif(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD")
    set(LIBUV_PLATFORM freebsd)
  elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(LIBUV_PLATFORM linux)
  elseif(CMAKE_SYSTEM_NAME STREQUAL "NetBSD")
    set(LIBUV_PLATFORM netbsd)
  elseif(CMAKE_SYSTEM_NAME STREQUAL "OpenBSD")
    set(LIBUV_PLATFORM openbsd)
  elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(LIBUV_PLATFORM win32)
  elseif(CMAKE_SYSTEM_NAME MATCHES "Solaris|SunOS")
    set(LIBUV_PLATFORM sunos)
  endif()
endif()

# CMAKE_SYSTEM_PROCESSOR is always i386 on MacOS.  Since we only support
# 64 bits builds anyway, default to x64.
if(CMAKE_SYSTEM_NAME STREQUAL "Darwin" OR
   CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64" OR
   CMAKE_SYSTEM_PROCESSOR STREQUAL "IA64" OR
   CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64" OR
   CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
  set(LIBUV_ARCH x64)
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "i386" OR
       CMAKE_SYSTEM_PROCESSOR STREQUAL "i686" OR
       CMAKE_SYSTEM_PROCESSOR STREQUAL "x86")
  set(LIBUV_ARCH ia32)
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm")
  set(LIBUV_ARCH arm)
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "ppc64")
  set(LIBUV_ARCH ppc64)
endif()

set(${LIBUV_PLATFORM} ON)
set(${LIBUV_ARCH} ON)

