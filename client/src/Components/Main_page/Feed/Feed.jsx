import React, { useState, useEffect } from "react";
import TweetCard from "./TweetCard";
import PostTweet from "./PostTweet"

import "./Feed.css";


function Feed({setTweetPage, tweetPage}) {
  const [feed, setFeed] = useState([]);

  useEffect(() => {
     
   fetch(`/tweets`)
   .then(r => r.json())
   .then(data => {
    setFeed(data)
    
  })
  }, []);

  return (
    <div className="feed">
      <div className="feed__header">
        <h2>Home</h2>
      </div>
      {console.log(feed)}
      <PostTweet setFeed={setFeed} feed={feed}/>

    
        {feed.map((feed) => (
          <TweetCard
            key={feed.id}
            displayName={feed.profile.display_name}
            username={feed.user.username}
            comment_count={feed.comment_count}
            like_count={feed.like_count}
            retweet_count={feed.retweet_count}
            is_retweet={feed.is_retweet}
            tweet={feed.tweet}
            profile_pic={feed.profile.profile_pic}
            tweetPage={tweetPage}
            setTweetPage={setTweetPage}
            tweet_id={feed.id}
          />
        ))}
   
    </div>
  );
}

export default Feed;