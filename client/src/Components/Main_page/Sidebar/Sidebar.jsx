import React from "react";
import "./Sidebar.css";
import TwitterIcon from "@material-ui/icons/Twitter";

import { useNavigate } from "react-router-dom";
import HomeIcon from "@material-ui/icons/Home";
import SearchIcon from "@material-ui/icons/Search";
import NotificationsNoneIcon from "@material-ui/icons/NotificationsNone";
import MailOutlineIcon from "@material-ui/icons/MailOutline";
import BookmarkBorderIcon from "@material-ui/icons/BookmarkBorder";
import ListAltIcon from "@material-ui/icons/ListAlt";
import PermIdentityIcon from "@material-ui/icons/PermIdentity";
import MoreHorizIcon from "@material-ui/icons/MoreHoriz";
import { Button } from "@material-ui/core";
import SidebarOption from "./SidebarOption";

function Sidebar() {
  let navigate = useNavigate()
  function myTweets(){
    navigate('/my-tweets')
  }
  function home(){ 
    navigate('/HomePage')
  }
  return (
    <div className="sidebar">
      <TwitterIcon className="sidebar__twitterIcon" />
      <div onClick={home}>
      <SidebarOption active Icon={HomeIcon} text="Home" />
      </div>
      <SidebarOption Icon={SearchIcon} text="Explore" />
      <SidebarOption Icon={NotificationsNoneIcon} text="Notifications" />
      <SidebarOption Icon={MailOutlineIcon} text="Messages" />
      <SidebarOption Icon={BookmarkBorderIcon} text="Bookmarks" />
      <div onClick={myTweets}>
      <SidebarOption Icon={ListAltIcon} text="My Tweets"/>
      </div>
      <SidebarOption Icon={PermIdentityIcon} text="Profile" />
      <SidebarOption Icon={MoreHorizIcon} text="More" />

      {/* Button -> Tweet */}
      <Button variant="outlined" className="sidebar__tweet" fullWidth>
        Tweet
      </Button>
    </div>
  );
}

export default Sidebar;