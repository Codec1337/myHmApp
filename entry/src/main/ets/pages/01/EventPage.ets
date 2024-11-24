import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct EventPage {
  @State message: string = 'Hello World';


  @State username: string = ""
  @State password: string = ""

  inputChange(value: string, type: string): void {
    // this. = value
    // AlertDialog.show({ message: value })
  }

  enabledLoginBtn(): boolean {
    return this.username !== "" && this.password !== ""
  }

  loginFunc(): void {
    if (this.username === 'admin' && this.password === 'admin123') {
      promptAction.showToast({
        message: '登录成功'
      })
    } else{
      promptAction.showToast({
        message: '用户名或密码错误'
      })
    }

  }

  build() {
    Column() {
      TextInput({ placeholder: "请输入用户名" })
        .width('80%')
        .margin({ top: 20, bottom: 20 })
        .onChange((value) => {
          this.username = value
          // AlertDialog.show({ message: value })
        })
      TextInput({ placeholder: "请输入密码" })
        .type(InputType.Password)
        .width('80%')
        .margin({ top: 20, bottom: 20 })
        .onChange((value) => {
          this.password = value
          // AlertDialog.show({ message: value })
        })
      Button("登录")
        .width('80%')
        .onClick(() => {
          this.loginFunc()
        })
        .enabled(this.enabledLoginBtn())
    }
    .width('100%')
  }
}
