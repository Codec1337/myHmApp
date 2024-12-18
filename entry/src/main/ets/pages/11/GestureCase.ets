import { display, promptAction } from '@kit.ArkUI';

@Entry
@Component
struct GestureCase {
  @State message: string = 'Hello World';

  @State
  showDialog: boolean = false;

  @State
  selectType: SelectTypeEnum = SelectTypeEnum.DELETE

  @State
  winWidth: number = 0


  async getWinWidth() {
    const displays = await display.getAllDisplays()
    promptAction.showToast({
      message: displays[0].width.toString(),
      duration: 3000
    })
    this.winWidth = px2vp(displays[0].width)
  }

  aboutToAppear(): void {
    this.getWinWidth()
  }


  @Builder
  getContent() {
    Column() {
      Row() {
        Row() {
          Text("删")
            .width(80)
            .aspectRatio(1)
            .backgroundColor(this.selectType === SelectTypeEnum.DELETE ? Color.Green : Color.Grey)
            .borderRadius(40)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .fontSize(30)
        }.rotate({
          angle: -20
        })
        Row() {
          Text("文")
            .width(80)
            .aspectRatio(1)
            .backgroundColor(this.selectType === SelectTypeEnum.TEXT ? Color.Green : Color.Grey)
            .borderRadius(40)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .fontSize(30)
        }.rotate({
          angle: 20
        })
      }.justifyContent(FlexAlign.SpaceBetween)
      .width("100%")
    }.width("100%")
    .height("100%")
    .backgroundColor("rgba(0,0,0,0.3)")
    .justifyContent(FlexAlign.End)
    .padding({
      bottom: 100,
      left: 20,
      right: 20,
    })
  }

  build() {
    Row() {
      Column() {
        Button("语音")
          .type(ButtonType.Normal)
          .width("100%")
          .gesture(
            GestureGroup(
              GestureMode.Parallel,
              LongPressGesture()
                .onAction(() => {
                  this.showDialog = true
                })
                .onActionEnd(() => {
                  this.showDialog = false
                }),
              PanGesture()
                .onActionUpdate((event: GestureEvent) => {
                  const finger0X = event.fingerList[0].globalX
                  if (finger0X < (this.winWidth / 2)) {
                    this.selectType = SelectTypeEnum.DELETE
                  } else {
                    this.selectType = SelectTypeEnum.TEXT
                  }
                })
                .onActionEnd(() => {
                  this.selectType = SelectTypeEnum.NONE
                })
            )
          )

      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .height("100%")
      .padding(10)
    }
    .height('100%')
    .bindContentCover($$this.showDialog, this.getContent(), {
      modalTransition: ModalTransition.NONE
    })
  }
}

enum SelectTypeEnum {
  DELETE,
  VOICE,
  TEXT,
  NONE
}