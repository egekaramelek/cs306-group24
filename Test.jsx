import React from "react";
import { Container, Row, Col } from "reactstrap";
import Helmet from "../components/Helmet/Helmet";
import CommonSection from "../components/UI/CommonSection";
import KitchenItem from "../components/UI/KitchenItem";
import testData from "../assets/data/testData";

const Test = () => {
  return (
    <Helmet title="Cars">
      <CommonSection title="Outdoor Kitchen" />

      <section>
        <Container>
          <Row>
            

            {testData.map((item) => (
              <KitchenItem item={item} key={item.id} />
            ))}
          </Row>
        </Container>
      </section>
    </Helmet>
  );
};

export default Test;