import { Col, Container, Row, Accordion } from "react-bootstrap";
import MainSection from "../components/Mainsection"
import Collection from "../components/Collection"
import Faq from "../components/Faq";
import Team from "../components/Team";
import portfolio from "../assets/images/portfolio.jpg"
import Roadmap from "../components/Roadmap";


function Home(props){



    return(

        <>
        
            {props.header}
           
                <div className="main">

                <Collection/>

                    <section className="about-section d-none">

                        <Container>

                            <Row>

                                <Col lg={4}>

                                <div>
                                    
                                    <img src={portfolio} className="animate"/>

                                </div>

                                </Col>

                                <Col lg={8}>

                                <div className="dual-heading">
                                    <h3>About Us</h3>
                                    <h2>Demo NFT COLLECTION</h2>
                                </div>

                                <p>Sed ut perspiciatis unde omnis iste natus enim ad minim veniam, quis nostrud exercit
                                        <br/><br/>
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat 
                                    nulla pariatur. Excepteur sint occae cat cupidatat non proident, sunt in culpa qui officia 
                                    dese runt mollit anim id est laborum velit esse cillum dolore eu fugiat nulla pariatu epteur sint occaecat</p>

                                </Col>
                            </Row>
                        </Container>

                    </section>

                    

                    <Faq/>

                    <Team/>

                    <Roadmap/>

                </div>

            {props.footer}


        </>

    )
}

export default Home;