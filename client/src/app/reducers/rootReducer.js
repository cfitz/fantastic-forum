import {combineReducers} from 'redux'

import {reduceReducers} from 'common/utils/reducerUtils'
import topicsListReducer from 'features/topicsList/topicsListReducer'
import topicReducer from 'features/topic/topicReducer' 

const combinedReducer = combineReducers({
  topics: topicsListReducer,
  topic: topicReducer
})

const rootReducer = reduceReducers(
  combinedReducer
)

export default rootReducer
