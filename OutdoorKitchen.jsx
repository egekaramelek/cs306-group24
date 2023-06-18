import React from "react";
import { Container, Row, Col } from "reactstrap";
import Helmet from "../components/Helmet/Helmet";
import CommonSection from "../components/UI/CommonSection";
import KitchenItem from "../components/UI/KitchenItem";
import kitchenData from "../assets/data/kitchenData";
import "../styles/blog-item.css";
import img01 from "../assets/images/colors/sapphire.png";
import img02 from "../assets/images/colors/espresso.png";
import img03 from "../assets/images/colors/brightWhite.png";
import img04 from "../assets/images/colors/charcoal.png";
import img05 from "../assets/images/colors/chocolate.png";
import img06 from "../assets/images/colors/everglade.png";
import img07 from "../assets/images/colors/glacierGrey.png";
import img08 from "../assets/images/colors/graphite.png";
import img09 from "../assets/images/colors/tan.png";


const colorImages = [
  { src: img01, title: "Sapphire" },
  { src: img02, title: "Espresso" },
  { src: img03, title: "Bright White" },
  { src: img04, title: "Charcoal" },
  { src: img05, title: "Chocolate" },
  { src: img06, title: "Everglade" },
  { src: img07, title: "Glacier Grey" },
  { src: img08, title: "Graphite" },
  { src: img09, title: "Tan" },
];


const OutdoorKitchen = () => {
  return (
    <Helmet title="Cars">
      <CommonSection title="Outdoor Kitchen" />

      <section>
        <Container>
          <Row>
            <div className="about__section-content">
              <h2 className="section__title">Defining Durability and Style with Our HDPE Outdoor Cabinets</h2>
              <p className="section__description">
                At Dura Outdoor Furnitures and More, we are dedicated to the highest level of quality. We are proud to offer High
                Density Polyethylene (HDPE) cabinets. These cabinets are durable and water resistant, so they can
                endure all aspects of weather.</p>
              <p className="section__description">
                We believe everything comes down to the details. Our cabinets are as efficient as they are beautiful.
                Full-depth cabinets allows you to use the space in its entirety. Adjustable shelving in cabinets allow
                you to organize as you wish. Each cabinet also has concealed hinges inside. This little detail leaves
                cabinets looking clean. They offer a quiet and smooth functionality.</p>
              <p className="section__description">
                Pull your kitchen together with matching finishes for drawers and door styles. This gives everything a
                consistent look, inside and out. HDPE are easy to maintain- all you really need to clean them is a
                hose! These cabinets are offered in a variety of styles and colors, making the possibilities endless. To
                complete the high quality cabinets, we only use the highest quality outdoor accessories. This includes
                stainless steel hardware, accessories and more. There are no shortcuts with a good product, and we
                only offer the best. </p>
            </div>
          </Row>
          <Row>
            {kitchenData.map((item) => (
              <KitchenItem item={item} key={item.id} />
            ))}
          </Row>
          <h2 className="color-title">Color Options</h2>
          <Row className="color-container d-flex justify-content-center">
            {colorImages.map((color, index) => (
              <Col lg="3" md="4" sm="6" xs="6" key={index} className="d-flex justify-content-center">
                <div style={{ textAlign: 'center' }}>
                  <img src={color.src} alt={color.title} className="color-image" style={{ margin: "10px" }} />
                  <p style={{ width: '100%', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>{color.title}</p>
                </div>
              </Col>
            ))}
          </Row>
        </Container>
      </section>
    </Helmet>
  );
};

export default OutdoorKitchen;