@Entry
@Component
struct MvvmCase {
  @State message: string = 'Hello World';
  @State isSelected: boolean = false;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Checkbox()
          .select(this.isSelected)
          .onChange((value) => {
            console.log("", this.isSelected, value);
            this.isSelected = value
          })
        Text(`${this.isSelected}`)

      }
      .width('100%')
    }
    .height('100%')
  }
}