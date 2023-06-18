import React from "react";
import CommonSection from "../components/UI/CommonSection";
import Helmet from "../components/Helmet/Helmet";
import AboutSection from "../components/UI/AboutSection";
import { Container, Row, Col } from "reactstrap";

import "../styles/about.css";

const About = () => {
  return (
    <Helmet title="About Us">
      <CommonSection title="About Us" />
      <AboutSection aboutClass="aboutPage" />


      
    </Helmet>
  );
};

export default About;