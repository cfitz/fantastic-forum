import {takeLatest} from 'redux-saga/effects'

// SAGAS
import {submitTopicsQuery} from 'features/topicsList/topicsListSaga'
import {submitTopicShow} from 'features/topic/topicSaga'

// CONSTANTS
import { LIST_TOPICS, TOPICS_FOUND } from 'features/topicsList/topicsListConstants';
import { FIND_TOPIC, TOPIC_FOUND } from 'features/topic/topicConstants';


export function * watchTopicsList() {
  yield takeLatest(LIST_TOPICS, submitTopicsQuery);
}

export function * watchTopicShow() {
  yield takeLatest(FIND_TOPIC, submitTopicShow);
}

