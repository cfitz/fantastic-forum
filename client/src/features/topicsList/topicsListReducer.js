import {createReducer} from 'common/utils/reducerUtils';
import { LIST_TOPICS, TOPICS_FOUND } from './topicsListConstants';


const initialState = [];


export function loadResults(state = {}, payload) { 
   return payload
}

export default createReducer(initialState, {
  [TOPICS_FOUND]: loadResults
})
