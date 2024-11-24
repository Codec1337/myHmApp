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
      Text("Flex测试")
      Text("Flex测试")
      Text("Flex测试")
    }.width("100%")
    .height("100%")
  }
}