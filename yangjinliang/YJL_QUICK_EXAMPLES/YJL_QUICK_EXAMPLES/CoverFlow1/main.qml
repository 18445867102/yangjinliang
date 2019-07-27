import QtQuick 2.2
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        color: "black"

        property real visibleInput: 0.5

        ListModel {
            id: model
            ListElement { image: "qrc:/image/1.jpg" }
            ListElement { image: "qrc:/image/2.jpg" }
            ListElement { image: "qrc:/image/3.jpg" }
            ListElement { image: "qrc:/image/4.jpg" }
            ListElement { image: "qrc:/image/5.jpg" }
            ListElement { image: "qrc:/image/6.jpg" }
            ListElement { image: "qrc:/image/7.jpg" }
            ListElement { image: "qrc:/image/8.jpg" }
            ListElement { image: "qrc:/image/9.jpg" }
            ListElement { image: "qrc:/image/10.jpg" }
            ListElement { image: "qrc:/image/11.jpg" }
            ListElement { image: "qrc:/image/12.jpg" }
            ListElement { image: "qrc:/image/13.jpg" }
            ListElement { image: "qrc:/image/14.jpg" }
            ListElement { image: "qrc:/image/15.jpg" }
            ListElement { image: "qrc:/image/16.jpg" }
            ListElement { image: "qrc:/image/17.jpg" }
            ListElement { image: "qrc:/image/18.jpg" }
        }

        ListView {
            id: musicList
            anchors.top: parent.top
            anchors.topMargin: 50
            width: parent.width
            height: 200
            orientation: ListView.Horizontal
            snapMode: ListView.SnapToItem
            model: model

            property real imageScale: 1.0

            delegate: ReflectImage {
                id:mimage
                width: 170
                height: 300
                source: image
                scale : musicList.imageScale

            }
            onMovementStarted: {
                imageScale = 0.9
            }

            onMovementEnded: {
                imageScale = 1.0
            }
        }

//        PathView {
//            x: 130
//            y: 120
//            width: parent.width
//            height: 200
//            model: model
//            delegate: delegate
//            path: Path {
//                startX: 120; startY: 100
//                PathAttribute { name: "itemZOrder"; value: 3 }
//                PathAttribute { name: "itemAlpha"; value: 1.0 }
//                PathAttribute { name: "itemScale"; value: 1.5 }
//                PathQuad { x: 120; y: 55; controlX: 300; controlY: 75 }
//                PathAttribute { name: "itemZOrder"; value: 0 }
//                PathAttribute { name: "itemAlpha"; value: 0.2 }
//                PathAttribute { name: "itemScale"; value: 0.6 }
//                PathQuad { x: 120; y: 100; controlX: -60; controlY: 75 }
//            }
//        }

        //调整倒影显示大小
         Slider {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            value: 0.5
            from: 0.0
            to: 1.0
            onValueChanged: {
                //visibleInput = value
                //console.log(value)
            }
        }
    }

}
