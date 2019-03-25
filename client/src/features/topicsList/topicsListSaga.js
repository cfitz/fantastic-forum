import { listTopics } from 'clients/ForumClient';
import { LIST_TOPICS, TOPICS_FOUND } from './topicsListConstants';

import {put, call} from 'redux-saga/effects'

export  function *  submitTopicsQuery() {
  try {
    const payload = yield call(listTopics);
    yield put({type: TOPICS_FOUND, payload});
  } catch (err) {
    yield put({type: 'TOPICS_ERROR', err })
  }
}
