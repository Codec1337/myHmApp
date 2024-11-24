@Entry
@Component
struct StylePolyCase {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 10 }) {
      Row() {
        Text("学习样式多态")
      }
      .border({
        width: 1,
        color: Color.Gray
      })
      .backgroundColor(Color.Orange)
      .width("100%")
      .height('50')
      .stateStyles({
        pressed: {
          .backgroundColor(Color.Green)
        }
      })

      TextInput()
        .border({
          width: 2,
          color: Color.Red
        })
        .stateStyles({
          normal: {
            .border({
              color: Color.Red,
              width: 0
            })
          },
          focused: {
            .border({
              color: Color.Orange,
              width: 1,
            })
          }
        })
      TextInput()
        .border({
          width: 2,
          color: Color.Red
        })
        .stateStyles({
          normal: {
            .border({
              color: Color.Red,
              width: 0
            })
          },
          focused: {
            .border({
              color: Color.Orange,
              width: 10,
            })
          }
        })

    }
  }
}
