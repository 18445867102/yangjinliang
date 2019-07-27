import QtQuick 2.2
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 1800
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        color: "black"

        property real visibleInput: 1.0

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

//        ListView {
//            id: musicList
//            anchors.top: parent.top
//            anchors.topMargin: 50
//            width: parent.width
//            height: 200
//            orientation: ListView.Horizontal
//            snapMode: ListView.SnapToItem
//            model: model

//            property real imageScale: 1.0

//            delegate: ReflectImage {
//                id:mimage
//                width: 170
//                height: 300
//                source: image
//                scale : musicList.imageScale

//            }
//            onMovementStarted: {
//                imageScale = 0.9
//            }

//            onMovementEnded: {
//                imageScale = 1.0
//            }
//        }

        PathView {
            id: imagePathView
            x: 130
            y: 120
            width: parent.width
            height: 400
            highlightRangeMode: PathView.StrictlyEnforceRange
            preferredHighlightBegin: 0
            preferredHighlightEnd: 0
            focus: true //接收按键事件

            model: model

            property real imageScale: 1.0

            delegate:  ReflectImage {
                id:mimage
                width: 170
                height: 300
                source: image
                scale : imagePathView.imageScale
                opacity: root.visibleInput
                z:PathView.zOrder

            }
            onMovementStarted: {
                imageScale = 0.9
            }
            onMovementEnded: {
                imageScale = 1.0
            }

            path: Path {
                startX:imagePathView.width/2 ; startY: 100
                PathAttribute { name: "zOrder"; value: 3 }
                PathAttribute { name: "itemAlpha"; value: 1.0 }
                PathAttribute { name: "itemScale"; value: 1.5 }
                PathQuad { x: imagePathView.width/2; y: 55; controlX: imagePathView.width/2+400; controlY: 75 }
                PathAttribute { name: "zOrder"; value: 0 }
                PathAttribute { name: "itemAlpha"; value: 0.2 }
                PathAttribute { name: "itemScale"; value: 0.6 }
                PathQuad { x: imagePathView.width/2; y: 100; controlX: imagePathView.width/2-400; controlY: 75 }
                PathAttribute { name: "zOrder"; value: 10 }
                PathAttribute { name: "itemAlpha"; value: 1.0 }
                PathAttribute { name: "itemScale"; value: 1.5 }
                Component.onCompleted: {
                    console.log(closed)
                }
            }
        }


//        ListView {
//            id: musicList
//            anchors.top: parent.top
//            anchors.topMargin: 50
//            width: parent.width
//            height: 200
//            orientation: ListView.Horizontal
//            snapMode: ListView.SnapToItem   //对齐模式
//            highlightMoveDuration: 200
//            highlightRangeMode: ListView.StrictlyEnforceRange
//            preferredHighlightBegin: musicList.width / 2 - 50
//            preferredHighlightEnd: musicList.width / 2 + 50

//            currentIndex: model.count / 2

//            model: model
//            delegate: Item {
//                width: musicList.currentIndex === index ? 170 : 70
//                height: 200
//                ReflectImage {
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    width: 170; height: 300
//                    source: image
//                    opacity: root.visibleInput
//                    scale: musicList.currentIndex === index ? 1.3 : 1
//                }

//                //排列顺序，层次
//                z: musicList.count -
//                   Math.abs(musicList.currentIndex - index)

//                //顺时针旋转角度
//                property int turnAngle: {
//                    if (index < musicList.currentIndex)
//                        return 50
//                    else if (index > musicList.currentIndex)
//                        return -50
//                    else
//                        return 0
//                }
//                Behavior on turnAngle {
//                    NumberAnimation {
//                        duration: 500
//                    }
//                }

//                transform: Rotation {
//                    origin.x: 50
//                    origin.y: 100
//                    axis { x: 0; y: 1; z: 0 }
//                    angle: turnAngle
//                }
//            }
//        }

        //调整倒影显示大小
         Slider {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            value: 1.0
            from: 0.0
            to: 1.0
            onValueChanged: {
                root.visibleInput = value
                //console.log(value)
            }
        }
    }

}
