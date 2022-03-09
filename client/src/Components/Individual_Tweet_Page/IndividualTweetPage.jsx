import {useEffect, useState} from 'react'
import {useNavigate} from 'react-router-dom'
import Sidebar from '../Main_page/Sidebar/Sidebar'
import TweetPage from './Tweet_w_Comments/TweetPage'
import RightPanel from '../Right_panel/RightPanel'

import '../Main_page/BaseLineCss.css'

function IndividualTweetPage() {
    const [signedIn, setSignedIn] = useState(false)
    const navigate = useNavigate()
        useEffect(()=>{
            fetch('is_logged_in')
            .then(r => r.json())
            .then(data => {
                if(data.username){
                   setSignedIn(true)
                }else{
                    setSignedIn(false)
                    navigate('/')
                }
            })
        }, [])
    
    if(signedIn){
        return (
        
            <div className="app">
            <Sidebar/>
            <TweetPage/>
            <RightPanel/>
            </div>
        )
    }else{
        return(
            <></>
        )
    }

}

export default IndividualTweetPage