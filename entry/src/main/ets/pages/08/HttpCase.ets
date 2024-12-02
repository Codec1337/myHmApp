import { http } from '@kit.NetworkKit';

@Entry
@Component
struct HttpCase {
  @State message: string = 'Hello World';

  async requestData() {
    const httpRequest = await http.createHttp()
    AlertDialog.show({ message: "res.result as string" })

    try {
      const res = await httpRequest.request("")
      AlertDialog.show({ message: res.result as string })

    } catch (e) {
      console.log("请求", JSON.stringify(e))
    }

  }

  aboutToAppear(): void {
    this.requestData()
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