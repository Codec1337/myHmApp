import { preferences } from '@kit.ArkData'
import { Context } from '@kit.AbilityKit'

interface IPreferences{
  context?: Context
  preferencesName?: string
}

export class PreferencesManager {

  context?: Context
  preferencesName?: string = "MY_STORE"

  static DEFAULT_STORE_KEY: string = "MY_TOKEN"

  constructor(item?: IPreferences) {
    if (item?.context) {
      this.context = item.context
    }
    if (item?.preferencesName) {
      this.preferencesName = item.preferencesName
    }
  }

  callback(store: preferences.Preferences): Promise<preferences.Preferences> {
    return new Promise((resolve) => {
      resolve(store)
    })
  }

  async getPreference() {
    let store: preferences.Preferences;
    return preferences.getPreferences(this.context || getContext(), this.preferencesName)
      .then((value: preferences.Preferences) => {
        store = value
        return store
      })
    // const store = await preferences.getPreferences(this.context || getContext(), this.preferencesName)
    // return store
  }
  getPreferenceSync() {
    const preference = preferences.getPreferencesSync(this.context || getContext(), {
      name: this.preferencesName
    })
    return preference
  }

  async setPreferencesData(value: preferences.ValueType, storeKey: string = PreferencesManager.DEFAULT_STORE_KEY) {
    const store = await this.getPreference()
    await store.put(storeKey, value)
    await store.flush()
    console.log("设置首选项成功了", { storeKey, value });
  }

  setPreferencesDataSync(value: preferences.ValueType, storeKey: string = PreferencesManager.DEFAULT_STORE_KEY) {
    const store = this.getPreferenceSync()
    store.putSync(storeKey, value)
    store.flush(() => {
      console.log("设置首选项成功了", { storeKey, value });
    })
  }

  async getPreferencesData(storeKey: string = PreferencesManager.DEFAULT_STORE_KEY) {
    const store = await this.getPreference()
    const storeData = await store.get(storeKey, "")
    console.log("获取首选项成功了", { storeKey, storeData })
    return storeData
  }
  getPreferencesDataSync(storeKey: string = PreferencesManager.DEFAULT_STORE_KEY) {
    const store = this.getPreferenceSync()
    const storeData = store.getSync(storeKey, "")
    console.log("获取首选项成功了", { storeKey, storeData })
    return storeData
  }

}