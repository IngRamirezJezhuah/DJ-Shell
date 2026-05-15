cmake_minimum_required(VERSION 3.16)
project(Dj-Shell VERSION 0.1 LANGUAGES CXX)

#=============================================================|
#     Estandares de C++17 para rendimiento optimo             |
#=============================================================|
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON )

#=============================================================|
#  Habilitacion de las herramientas de copilacion auto        |
#=============================================================|
SET(CMAKE_AUTOMOC ON)
SET(CMAKE_AUTORCC ON)
SET(CMAKE_AUTOUIC ON)

#=============================================================|
#  Habilitacion de las herramientas de copilacion             |
#=============================================================|
find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick Widgets)

#=============================================================|
#  Definicion de los ejecutables de qt6                       |
#=============================================================|
add_executable(Dj-Shell
    main.cpp
)

#=============================================================|
#  Enlazador de las librerias de Qt6                          |
#=============================================================|
target_link_libraries(Dj-Shell PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Widgets
)

#==============================================================|
#  Copia auto del main en la carpeta para ejecutar sin copilar |
#==============================================================|
configure_file(main.qml main.qml COPYONLY)







