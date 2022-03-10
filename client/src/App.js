import {Routes, Route} from 'react-router-dom'


import Login from './Components/Sign_in_up/Login'
import CreateAccount from './Components/Sign_in_up/CreateAccount';
import HomePage from './Components/Main_page/HomePage'
import IndividualTweetPage from './Components/Individual_Tweet_Page/IndividualTweetPage'
import Mytweets from './Components/My_Tweets/myTweets';
function App() {
  return (
   <Routes>
     <Route  exact path={"/"} element={ <Login/>}/>
     <Route exact path={"createAccount"} element={ <CreateAccount/>}/>
     <Route exact path={"HomePage"} element={ <HomePage/>}/>
     <Route exact path={"moreInfo"} element={ <IndividualTweetPage/>}/>
     <Route exact path={"my-tweets"} element={ <Mytweets/>} />
   </Routes>
  );
}

export default App;
