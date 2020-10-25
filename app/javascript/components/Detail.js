import React from "react"
import PropTypes from "prop-types"

class Detail extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      detailOpen: false,
      title: "このアプリについて",
      explanation: "ここでは、「アイドルが好き」という共通の趣味を持った仲間を探すことができます。掲示板で仲間を集めることも、気になる人に個別にメッセージを送ることもできます。日本が誇るアイドルという文化の輪をもっともっと広げましょう。"
    };
  }

  clickDetailOpen() {
    this.setState({ detailOpen: true });
  }

  clickDetailClose() {
    this.setState({ detailOpen: false });
  }


  render() {
    let detail;
    if (this.state.detailOpen) {
      detail = (
      <div className="detail-interface">
        <div className='detail-inner'>
          <div className='detail-header'></div>
          <div className="detail-sentences">
            <h2 className = "detail-title">{this.state.title}</h2>
            <p className="detaile-explanation">{this.state.explanation}</p>
          </div>
          <div className= "detail-close-btn">
            <button className="detail-btn"
              onClick={() => { this.clickDetailClose() }}
            >とじる
            </button>
          </div>
        </div>
      </div >
      );
    }

    return(
      <div className='detailAbout'>
        <div className="detail-open-btn">
          <button className="detail-open-btn detail-btn"
                  onClick={() => { this.clickDetailOpen() }}
          >
            このサイトについて
          </button>
        </div>
        {detail}
      </div>
        
    );
  }
}

export default Detail
