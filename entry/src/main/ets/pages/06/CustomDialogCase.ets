@Entry
@Component
struct CustomDialogCase {

  imgUrl: ResourceStr = "/assets/1.webp"

  previewDialog: CustomDialogController = new CustomDialogController({
    builder: PreviewImageDialog({ imgUrl: this.imgUrl }),
    customStyle: true
  })

  build() {
    Row() {
      Column() {
        Image(this.imgUrl)
          .width(100)
          .aspectRatio(1)
          .onClick(() => {
            this.previewDialog.open()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@CustomDialog
@Component
struct PreviewImageDialog {
  controller: CustomDialogController

  imgUrl: ResourceStr = ''

  build() {
    Column() {
      Row() {
        Image(this.imgUrl)
          .width("100%")
      }.width("100%")
      .height("100%")
      .backgroundColor(Color.Grey)
      .padding(10)
    }
    .height("100%")
    .position({
      x: 0,
      y: 0
    })
  }
}