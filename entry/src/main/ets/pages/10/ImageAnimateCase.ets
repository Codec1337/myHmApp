@Entry
@Component
struct ImageAnimateCase {
  @State message: string = 'Hello World';

  images: ImageFrameInfo[] = new Array(4).fill(1).map((item: number, index: number) => {
    const o = {
      src: `/assets/material/JDRunMan/app_refresh_people_${index}.png`
    } as ImageFrameInfo
    return o
  })

  @State
  animateState: AnimationStatus = AnimationStatus.Initial

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        ImageAnimator()
          .images(this.images)
          .width(200)
          .aspectRatio(0.5)
          // .height(100)
          .duration(200)
          .iterations(-1)
          .state(this.animateState)
        Button("切换")
          .onClick(() => {
            if (this.animateState === AnimationStatus.Running) {
              this.animateState = AnimationStatus.Paused
              return
            }
            this.animateState = AnimationStatus.Running
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}