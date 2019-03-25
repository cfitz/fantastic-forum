import React, {Component} from "react";                                                                                                         
import { withStyles } from '@material-ui/core/styles';                                                                                          
import { connect } from 'react-redux';       
import {Link} from 'react-router-dom' 

import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import Paper from '@material-ui/core/Paper';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import Avatar from '@material-ui/core/Avatar';


import {findTopics} from './topicsListActions';

const styles = theme => ({
  root: {
    width: '100%',
    backgroundColor: theme.palette.background.paper,
  },
  inline: {
    display: 'inline',
  },
});


export class TopicsList extends Component {

  componentDidMount() {
    this.props.dispatch(findTopics());
  }

  render() {
    const {topics, classes} = this.props;
    console.log(topics)
    return( 
        <Grid container direction='column' justify='center' alignItems='center' spacing={16}>  
          <Grid item xs={12} > 
            <List className={classes.root}>
            { topics.map( topic => {
                return (
                 <ListItem key={topic.id} alignItems="flex-start" component={Link} to={`/t/${topic.id}`}>
                    <ListItemAvatar>
                     <Avatar alt="{topic.author}" />
                    </ListItemAvatar>
                    <ListItemText primary={topic.title}
                                  secondary={
                                     <React.Fragment>
                                      <Typography component="span"  color="textPrimary"> 
                                        By {topic.author} 
                                      </Typography>
                                      { topic.body }
                                    </React.Fragment>
                                  } />
                </ListItem>)
              })
            }
            </List>
          </Grid> 
        </Grid> 
     )
  }
}


const mapStateToProps = ({topics}) => {
  return {topics};
}

export default withStyles(styles)(connect(mapStateToProps)(TopicsList));
