import { PreferencesManager } from "./hooks/perferencesManage"

@Entry
@Component
struct PreferencesLoginCase {
  @State message: string = '登陆页面';

  @State token: string = new PreferencesManager().getPreferencesDataSync() as string

  loginMethod() {
    new PreferencesManager().setPreferencesData("123456777")
  }

  build() {
    Row() {
      Column() {
        Text(this.token)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("登录")
          .onClick(() => {
            this.loginMethod()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}