import React from "react";
import { Container, Row } from "reactstrap";
import Helmet from "../components/Helmet/Helmet";
import CommonSection from "../components/UI/CommonSection";
import ProductList from "../components/UI/ProductList";

const Products = () => {
  return (
    <Helmet title="Products">
      <CommonSection title="Products" />
      
        <Container>
          <Row>
            <ProductList />
          </Row>
        </Container>
      
    </Helmet>
  );
};

export default Products;