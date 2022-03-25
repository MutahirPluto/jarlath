import { Col, Container, Row, Form, Button } from "react-bootstrap";
import Web3Modal from "web3modal";
import {ethers, BigNumber} from "ethers";


function Giveaway(props){

    const loadProvider = async () => {
        try {
          const web3Modal = new Web3Modal();
          const connection = await web3Modal.connect();
          const provider = new ethers.providers.Web3Provider(connection);
          return provider.getSigner();
        } catch (e) {
          console.log("loadProvider default: ", e);
        }
      };

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