{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "c-cpp-dev-env";

  buildInputs = [
    pkgs.gcc       # C and C++ compiler
    pkgs.clang     # Alternative compiler
    pkgs.cmake     # Build system
    pkgs.ninja     # Faster build system (optional)
    pkgs.gdb       # Debugger
    pkgs.valgrind  # Memory debugging tool
    pkgs.lldb      # Alternative debugger
    pkgs.cppcheck  # Static analysis tool
    pkgs.clang-tools # Includes clang-format and clang-tidy
    pkgs.mesa
    pkgs.glfw
    pkgs.glew
    pkgs.glm
    pkgs.pkg-config
    pkgs.mesa-demos
    pkgs.freeglut
	pkgs.SDL2
	pkgs.SDL
	pkgs.glfw2
	pkgs.gnumake
  ];

  shellHook = ''
    echo "C/C++ development environment loaded."
    export CC=gcc
    export CXX=g++
  '';
}
