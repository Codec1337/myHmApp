import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct RouterPageB {
  @State message: string = 'Hello World B';

  onBackPress(): boolean | void {
    this.handleRouterBackTips()
    return true
  }

  async handleRouterBackTips() {
    const dialogRes = await promptAction.showDialog({
      message: "确定要回退吗",
      title: "提示",
      buttons: [
        {
          text: "取消",
          color: "#ccc"
        },
        {
          text: "确定",
          color: "red"
        }
      ]
    })
    if (dialogRes.index === 1) {
      router.back()
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}