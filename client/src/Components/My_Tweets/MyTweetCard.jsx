import { useState } from "react"
import './MyTweetCard.css'
// import VerifiedUserIcon from "@material-ui/icons/VerifiedUser";
import { Avatar } from "@material-ui/core";

import DeleteIcon from '@material-ui/icons/Delete';
import {useNavigate} from 'react-router-dom'


function MyTweetCard({displayName, username, tweet, profile_pic, userTweets, setUserTweets, tweet_id}){

  let navigate = useNavigate()
  
  function deleteTweet(){
    fetch(`/tweets/${tweet_id}`, {
    method: 'DELETE',
    }).then(r => r.json())
    .then(data => setUserTweets(data))

  }
 
    return (
        <div className="post"  >
          <div className="post__avatar">
            <Avatar src={profile_pic} />
          </div>
          
          <div className="post__body">
            <div className="post__header">
              <div className="post__headerName">
                <h3>
                  {displayName}{" "}
                  <span className="post__header-Special">
                     @{username}
                  </span>
                </h3>
              </div>
              <div className="post__header" id={'more'}>
                <p>{tweet}</p>
              </div>
            </div>
            {/* <img src={image} alt="" /> */}
            <div className="post__footer">
            <span className="icon-comment icon" onClick={deleteTweet}>
              <DeleteIcon fontSize="small" />
            </span>
            </div>
          </div>
        </div>
      );
    }


export default MyTweetCard