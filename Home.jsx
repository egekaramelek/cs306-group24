import React from "react";
import HeroSlider from "../components/UI/HeroSlider";
import Helmet from "../components/Helmet/Helmet";

const Home = () => {
    return(
        <Helmet titke='Home'>
            
                <HeroSlider></HeroSlider>
                
        </Helmet>
    )
}

export default Home