import RightPanel from '../Right_panel/RightPanel'
import Sidebar from '../Main_page/Sidebar/Sidebar'
import MyTweetCard from './MyTweetCard'
import '../Main_page/BaseLineCss.css'
import {useState, useEffect} from 'react'
import '../Main_page/Feed/Feed.css'


function Mytweets(){
    const [userTweets, setUserTweets] = useState([])
    const [user, setUser] = useState([])
    const [userProfile, setUserProfile] = useState([])
    useEffect(()=>{
        fetch('/get_user_tweets')
        .then(r => r.json())
        .then(data => {
            setUserTweets(data.tweets)
            setUser(data.user)
            setUserProfile(data.profile)
        })
    }, [])
    return (
    <div className="app">
        <Sidebar/>
        <div className='feed'>
            <div className='feed__header'>
                <h2>Your Tweets</h2>
            </div>
            {userTweets.map((tweet) => (
          <MyTweetCard
            key={tweet.id}
            displayName={userProfile.display_name}
            username={user.username}
            tweet={tweet.tweet}
            profile_pic={userProfile.profile_pic}
            userTweets={userTweets}
            setUserTweets={setUserTweets}
            tweet_id={tweet.id}
          />
        ))}
          
        </div>
   
        <RightPanel/>
    </div>
    )
}

export default Mytweets