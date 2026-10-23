cmake_minimum_required(VERSION 4.4)

project(BStyle
    DESCRIPTION "Custom QML theme"
    VERSION 1.0
    LANGUAGES CXX
)

find_package(Qt6 REQUIRED COMPONENTS QuickControls2)

qt_standard_project_setup(REQUIRES 6.12)
qt_policy(SET QTP0001 NEW)

file(GLOB THEME_PUBLIC_QML CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/qml/*.qml")
file(GLOB THEME_INTERNAL_QML CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/qml/util/*.qml")

set(THEME_QML_FILES ${THEME_PUBLIC_QML} ${THEME_INTERNAL_QML})
set_source_files_properties("${CMAKE_CURRENT_SOURCE_DIR}/qml/Theme.qml" PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set_source_files_properties(${THEME_INTERNAL_QML} PROPERTIES QT_QML_INTERNAL_TYPE TRUE)

foreach(qml_file IN LISTS THEME_QML_FILES)
    get_filename_component(qml_name "${qml_file}" NAME)
    set_source_files_properties(${qml_file} PROPERTIES QT_RESOURCE_ALIAS "${qml_name}")
endforeach()

qt_add_qml_module(bstyleplugin
    URI ${PROJECT_NAME}
    VERSION ${PROJECT_VERSION}
    PLUGIN_TARGET bstyleplugin
    CLASS_NAME BStylePlugin
    OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}
    QML_FILES ${THEME_QML_FILES}
    DEPENDENCIES "QtQuick auto" "QtQuick.Templates auto"
)

set(QML_INSTALL_DIR "${QT6_INSTALL_PREFIX}/${QT6_INSTALL_QML}")
install(TARGETS bstyleplugin LIBRARY DESTINATION "${QML_INSTALL_DIR}/${PROJECT_NAME}" RUNTIME DESTINATION "${QML_INSTALL_DIR}/${PROJECT_NAME}")
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/qmldir" "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}/bstyleplugin.qmltypes" DESTINATION "${QML_INSTALL_DIR}/${PROJECT_NAME}")
install(FILES ${THEME_QML_FILES} DESTINATION "${QML_INSTALL_DIR}/${PROJECT_NAME}")
