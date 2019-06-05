#include <QGuiApplication>
#include <QQuickView>
#include <QUrl>
#include <QFont>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setFont(QFont(QStringLiteral("微软雅黑")));
    QQuickView view;
    view.setTitle("Qt Python Example");
    view.setSource(QUrl("qrc:/qrc_example.qml"));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.show();
    return app.exec();
}
