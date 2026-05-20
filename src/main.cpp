#include <QGuiApplication>
#include <QCoreApplication>
#include <QUrl>
#include <QString>

int main(int argc, char *argv[]){
    //Fuerza el uso de wayland de a huevo
    qputenv("QT_QPA_PLATAFORM", "Wayland;xcb");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    

    //Ruta global que apunta al doc
    QString qmlPath = QStringLiteral(QML_SRC_DIR) + "/main.qml";
    const QUrl url = QUrl::fromLocalFile(qmlPath); 

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    
    return app.exec();
}
