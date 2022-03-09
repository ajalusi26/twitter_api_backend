import {useEffect, useState} from 'react'
import { useNavigate } from 'react-router-dom'
import Sidebar from './Sidebar/Sidebar.jsx'
import Feed from './Feed/Feed.jsx'
import RightPanel from '../Right_panel/RightPanel'
import './BaseLineCss.css'

function HomePage() {
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
            <Feed />
            <RightPanel/>
        </div>
        )
    }else{
        return(
            <></>
        )
    }
}

export default HomePage