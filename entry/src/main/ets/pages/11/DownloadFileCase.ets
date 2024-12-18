import { request } from '@kit.BasicServicesKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct DownloadFileCase {
  @State message: string = 'Hello World';

  url: string = "https://img1.baidu.com/it/u=2743394743,692629981&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=800"

  @State
  filePath: string = ""

  async downloadFile() {
    try {
      const path = getContext().filesDir + "/" + Date.now() + ".jpg"
      const task = await request.downloadFile(getContext(), {
        url: this.url,
        filePath: path
      })
      task.on("progress", () => {

      })
      task.on("fail", (e) => {
        promptAction.showToast({
          message: e.toString()
        })
      })
      task.on("complete", () => {
        promptAction.showToast({
          message: "下载成功了"
        })
        this.filePath = path
      })
    }
    catch (e) {
      promptAction.showToast({
        message: e.message
      })
    }

  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Image(this.url)
          .width(200)
          .aspectRatio(1)
        Button("下载图片")
          .onClick(() => {
            this.downloadFile()
          })
        Image("file://" + this.filePath)
          .width(400)
          .aspectRatio(1)
      }
      .width('100%')
    }
    .height('100%')
  }
}