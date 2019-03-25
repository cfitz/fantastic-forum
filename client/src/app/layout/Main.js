import React from 'react'
import {Switch, Route} from 'react-router-dom'
import {withStyles} from '@material-ui/core/styles'

import IndexPage from 'pages/IndexPage'
import TopicPage from 'pages/TopicPage'

import {createBrowserHistory} from 'history'

export const history = createBrowserHistory({
      basename: process.env.PUBLIC_URL
})

const styles = theme => ({
})

const Main = props => {
  const {classes} = props
  return (
    <main className={classes.root}>
      <Switch>
        <Route exact path="/" component={IndexPage}/>
        <Route exact path="/t/:topicId" component={TopicPage}/>
      </Switch>
    </main>
  )
}
export default withStyles(styles)(Main)
