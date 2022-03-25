import { Col, Container, Row, Form, Button } from "react-bootstrap";

function Giveaway(props){

    return(

        <>
        
        {props.header}


        <div className="main">

                <Container className="h-100">
                    <Row className="giveaway g-0 justify-content-center">
                        <Col lg={5}>

                            <div className="giveaway-left">

                            </div>

                        </Col>

                        <Col lg={5}>

                            <div className="giveaway-right">

                                <h2>Giveaway</h2>

                                <Form>
                                <Form.Group className="mb-3" controlId="formBasicPassword">
                                    <Form.Label>Wallet Address</Form.Label>
                                    <Form.Control type="Text" placeholder="Wallet Address" />
                                </Form.Group>
                                <Button className="custom-btn secondary-btn" type="submit">
                                    Submit
                                </Button>
                                </Form>


                            <div className="py-5">
                                <ul class="social">

                                    <li>
                                        <a href="#" target="_blank"><i class="fa-brands fa-twitter"></i></a>
                                    </li>
                                    
                                    <li>
                                        <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                                    </li>

                                    <li>
                                        <a href="#" target="_blank"><i class="fa-brands fa-discord"></i></a>
                                    </li>

                                    </ul>

                                </div>

                            </div>

                        </Col>
                    </Row>
                </Container>

        </div>


        {props.footer}

        </>

    )

}

export default Giveaway;