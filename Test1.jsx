import React from "react";
import { Container, Row, Col } from "reactstrap";
import Helmet from "../components/Helmet/Helmet";
import CommonSection from "../components/UI/CommonSection";
import KitchenItem from "../components/UI/KitchenItem";
import testData1 from "../assets/data/testData1";

const Test1 = () => {
  return (
    <Helmet title="Cars">
      <CommonSection title="Outdoor Kitchen" />

      <section>
        <Container>
          <Row>
            

            {testData1.map((item) => (
              <KitchenItem item={item} key={item.id} />
            ))}
          </Row>
        </Container>
      </section>
    </Helmet>
  );
};

export default Test1;