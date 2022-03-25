import { Col,Row,Container } from "react-bootstrap";
import nft from "../assets/images/portfolio.jpg"
import { Link } from "react-router-dom";

function Collection(){

    return(

        <>
        
           <Container className="pt-5">

                {/* <div className="section-title">
                    <h2>Collection</h2>
                </div> */}

                <Row className="my-5 justify-content-center">

                    <Col lg={2}>

                        <div className="collection-box blue">

                            <img src={nft}/>
                            <h4>Viserion</h4>

                        </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box blue">

                        <img src={nft}/>
                        <h4>Crypto Jumbo</h4>

                    </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box blue">

                        <img src={nft}/>
                        <h4>Crypto Jumbo</h4>

                    </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box blue">

                        <img src={nft}/>
                        <h4>Crypto Punishment</h4>

                    </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box blue">

                        <img src={nft}/>
                        <h4>Crypto Cuack</h4>

                    </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box blue">

                        <img src={nft}/>
                        <h4>Bark Crypto Pug</h4>

                    </div>

                    </Col>
    

                </Row>

                <Row className="mb-5 justify-content-center">
                    
                    <Col lg={2}>

                        <div className="collection-box yellow">

                            <img src={nft}/>
                            <h4>SpeechLESS</h4>

                        </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box yellow">

                        <img src={nft}/>
                        <h4>BRAVETY</h4>

                    </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box yellow">

                        <img src={nft}/>
                        <h4>Always on My HEAD</h4>

                    </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box yellow">

                        <img src={nft}/>
                        <h4>Caribbean Crypto Exotics</h4>

                    </div>

                    </Col>


                </Row>

                <Row className="mb-5 justify-content-center">
                    
                    <Col lg={2}>

                        <div className="collection-box pink">

                            <img src={nft}/>
                            <h4>It never happened</h4>

                        </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box pink">

                        <img src={nft}/>
                        <h4>Unoccupied</h4>

                    </div>

                    </Col>

                    <Col lg={2}>

                    <div className="collection-box pink">

                        <img src={nft}/>
                        <h4>Bare SOLO Lights</h4>

                    </div>

                    </Col>


                </Row>


                {/* <div className="d-flex justify-content-center p-5">
                    <Link to={"#"} className="custom-btn primary-btn">More</Link>
                </div> */}

           </Container>

        </>

    )

}

export default Collection;