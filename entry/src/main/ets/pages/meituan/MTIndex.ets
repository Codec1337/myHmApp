import MTBottomCase from './components/MTBottom'
import MTMainCase from './components/MTMain'
import MTTopCase from './components/MTTop'

@Entry
@Component
struct MTIndex {
  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          MTTopCase()
          MTMainCase()
        }.height("100%")
        // .backgroundColor(Color.Pink)
        .width("100%")
        MTBottomCase()
      }.layoutWeight(1)
      .width("100%")
    }.height("100%")
    .width("100%")
  }
}