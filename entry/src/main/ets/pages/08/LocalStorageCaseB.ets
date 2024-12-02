import { localStorage, IUserProfileModel } from "./storage/localStorageModel"
import { router } from '@kit.ArkUI';

@Entry(localStorage)
@Component
struct LocalStorageCaseB {
  @State message: string = 'Hello World';

  @LocalStorageLink("user")
  user: IUserProfileModel = new IUserProfileModel({
    username: "",
    age: 0
  })

  build() {
    Row() {
      Column() {
        Text(this.user.username)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.user.age += 1
            setTimeout(() => {
              router.pushUrl({
                url: "pages/08/LocalStorageCase"
              })
            }, 1000)
          })
        Text(this.user.age.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.user.age += 1
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}