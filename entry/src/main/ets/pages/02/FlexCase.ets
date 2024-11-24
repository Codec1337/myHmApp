@Entry
@Component
struct FlexCase {
  @State message: string = 'Hello World';

  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center
    }) {
      Text("Flex测试")
        .height(50)
        .backgroundColor(Color.Red)
      Text("Flex测试")
        .height(50)
        .backgroundColor(Color.Green)
      Text("Flex测试")
        .height(50)
        .backgroundColor(Color.Blue)
      Text("Flex测试")
        .height(50)
        .backgroundColor(Color.Orange)
    }.width("100%")
    .height("100%")
  }
}