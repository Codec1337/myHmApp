import { MyAppLoading } from "./components/myAppLoading"

@Entry
@Component
struct LoadingCase {

  @State showLoading: boolean = false

  timeoutTimerId: number = -1

  aboutToAppear(): void {
    this.showLoading = true
    this.timeoutTimerId = setTimeout(() => {
      this.showLoading = false
    }, 3000)
  }

  aboutToDisappear(): void {
    clearTimeout(this.timeoutTimerId)
  }

  build() {
    Row() {
      Column() {
        if (this.showLoading) {
          MyAppLoading()
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}