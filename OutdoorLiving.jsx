import React from "react";
import { Container, Row, Col } from "reactstrap";
import Helmet from "../components/Helmet/Helmet";
import CommonSection from "../components/UI/CommonSection";
import KitchenItem from "../components/UI/KitchenItem";
import livingData from "../assets/data/livingData";



const OutdoorLiving = () => {
  return (
    <Helmet title="Cars">
      <CommonSection title="Outdoor Living" />

      <section>
        <Container>
          <Row>
            

            {livingData.map((item) => (
              <KitchenItem item={item} key={item.id} />
            ))}
          </Row>
          <Row>
          
          </Row>
        </Container>
      </section>
    </Helmet>
  );
};

export default OutdoorLiving;