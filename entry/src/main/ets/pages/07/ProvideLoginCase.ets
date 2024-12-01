import { promptAction, router } from '@kit.ArkUI'

@Entry
@Component
struct ProvideLoginCase {

  @State
  phone: string = "13112345678"

  @State
  code: string = "123456"

  loginFunc() {
    if (this.phone === "13112345678" && this.code === "123456") {
      router.pushUrl({
        url: "pages/07/ProvideHomeCase"
      })
    } else {
      promptAction.showToast({ message: "手机号或验证码错误" })
    }
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Image($r("app.media.startIcon"))
          .width(80)
          .aspectRatio(1)
        Text("登录页面")
          .fontSize(24)
        TextInput({ text: $$this.phone, placeholder: "请输入手机号"})
          .height(40)
          .width("100%")
        TextInput({ text: $$this.code, placeholder: "请输入验证码"})
          .height(40)
          .width("100%")
        Button("登录")
          .height(40)
          .width("100%")
          .onClick(() => {
            this.loginFunc()
          })
      }
      .width('100%')
      .padding(30)
    }
    .height('100%')
  }
}