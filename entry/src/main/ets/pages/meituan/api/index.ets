import { http } from '@kit.NetworkKit'
import { promptAction } from '@kit.ArkUI'
import { CategoryModel } from '../models/MTModelIndex'

export const getFoodList = async () => {
  const xhr = http.createHttp()
  try {
    const res = await xhr.request("https://zhousg.atomgit.net/harmonyos-next/takeaway.json")
    return (JSON.parse(res.result as string) as CategoryModel[])
  }
  catch (e) {
    promptAction.showToast({ message: e.message })
    return Promise.reject(e)
  }
  finally {
    xhr.destroy()
  }
}