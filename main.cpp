#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
   // load our selected style
    QQuickStyle::setStyle("Material");
    // QQuickStyle::setStyle("Universal");
    // QQuickStyle::setStyle("Fusion");
    // QQuickStyle::setStyle("Imagine");
    // QQuickStyle::setStyle("Default");
    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("qtQmlPracticeBeginnerp2", "Main");

    return app.exec();
}
