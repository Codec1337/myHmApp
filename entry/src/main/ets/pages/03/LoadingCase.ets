import { MyAppLoading } from "./components/myAppLoading"

@Entry
@Component
struct LoadingCase {

  build() {
    Row() {
      Column() {
        MyAppLoading()
      }
      .width('100%')
    }
    .height('100%')
  }
}