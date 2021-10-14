import { init } from "@rematch/core"

import procedure from '../models/procedure'

const store = init({ models: { procedure } })

export default store
