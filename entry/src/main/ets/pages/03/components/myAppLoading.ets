@Preview
@Component
struct MyAppLoading {

  @State loadingValue: number = 0

  timerId: number = -1

  aboutToAppear(): void {
    this.timerId = setInterval(() => {
      if (this.loadingValue >= 100) {
        this.loadingValue = 0
      }
      this.loadingValue += 1
    }, 10)
  }

  aboutToDisappear(): void {
    clearInterval(this.timerId)
  }

  build() {
    Progress({
      type: ProgressType.Ring,
      value: this.loadingValue,
      total: 100
    })
      .color(Color.Orange)
  }
}

export {
  MyAppLoading
}