cmake_minimum_required(VERSION 4.3)

project(BStyle
    VERSION 0.0.3
    DESCRIPTION "Style for QML applications"
    LANGUAGES CXX
)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

find_package(Qt6 REQUIRED COMPONENTS QuickControls2)

file(GLOB_RECURSE QMLS RELATIVE ${CMAKE_SOURCE_DIR} CONFIGURE_DEPENDS qml/*.qml)

qt_standard_project_setup(REQUIRES 6.11)
qt_add_qml_module(bstyle
    URI BStyle
    VERSION 1.0
    IMPORTS QtQuick.Controls.Basic
    QML_FILES ${QMLS}
)

install(FILES ${CMAKE_BINARY_DIR}/libbstyle.so DESTINATION /usr/lib)
install(DIRECTORY ${QT_QML_OUTPUT_DIRECTORY} DESTINATION /usr/lib/qt6)
