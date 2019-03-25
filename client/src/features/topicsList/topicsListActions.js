import { LIST_TOPICS, TOPICS_FOUND } from './topicsListConstants';

export const findTopics = () => ({
  type: LIST_TOPICS
});

export const loadTopics = results => ({
  type: TOPICS_FOUND,
  results
});
