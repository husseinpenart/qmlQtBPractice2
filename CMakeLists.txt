cmake_minimum_required(VERSION 3.16)

project(qtQmlPracticeBeginnerp2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appqtQmlPracticeBeginnerp2
    main.cpp
)

qt_add_qml_module(appqtQmlPracticeBeginnerp2
    URI qtQmlPracticeBeginnerp2
    VERSION 1.0
    QML_FILES
    Main.qml
    QML_FILES LabeledTextInput.qml
    QML_FILES inputs.qml
    QML_FILES TextEdit.qml
    QML_FILES mouseArea.qml
    QML_FILES KeyPress.qml
    QML_FILES keyPositions.qml
    QML_FILES anchorsPositions.qml
    QML_FILES margins.qml
    QML_FILES siblings.qml
    QML_FILES layout.qml
    QML_FILES flows.qml
    QML_FILES QtControllers.qml
    RESOURCES
    images/image1.jpg
    images/image2.jpg
    images/image3.jpg
    images/copyIcon.png
    images/cutIcon.png
    images/info.png
    images/newFileIcon.png
    images/openIcon.png
    images/pasteIcon.png
    images/quitIcon.png
    images/redoIcon.png
    images/saveAsIcon.png
    images/saveIcon.png
    images/undoIcon.png
    RESOURCE_PREFIX /
    QML_FILES Page1.qml
    QML_FILES Page2.qml
    QML_FILES Page3.qml
    QML_FILES Navigation.qml
    QML_FILES Dialog.qml
    QML_FILES ListViewModel.qml
    QML_FILES pathView.qml
    QML_FILES tableView.qml
    QML_FILES ClickableRect.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqtQmlPracticeBeginnerp2 PROPERTIES
    #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqtQmlPracticeBeginnerp2
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqtQmlPracticeBeginnerp2
    PRIVATE Qt6::Quick Qt6::QuickControls2

)

include(GNUInstallDirs)
install(TARGETS appqtQmlPracticeBeginnerp2
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
