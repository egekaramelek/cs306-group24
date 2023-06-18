import React from "react";
import { Container, Row } from "reactstrap";
import Helmet from "../components/Helmet/Helmet";
import CommonSection from "../components/UI/CommonSection";
import LivingList from "../components/UI/LivingList";

const Living = () => {
  return (
    <Helmet title="Outdoor Living">
      <CommonSection title="Outdoor Living" />
      
        <Container>
          <Row>
            <LivingList />
          </Row>
        </Container>
      
    </Helmet>
  );
};

export default Living;