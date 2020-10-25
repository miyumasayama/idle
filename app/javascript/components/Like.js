import React from "react"
import PropTypes from "prop-types"
import $ from 'jquery'

class Like extends React.Component {
  

  constructor(props) {
    super(props);
    this.state = { liked: props.liked };
  }

  onClickLike() {
    this.setState({
        liked: !this.state.liked
      });
    }

  render() {
    return (
      <div>
        <button onClick={() => this.onClickLike()}>{this.state.liked ? "いいね済み" : "いいね！"}</button>
      </div>
    );
  }
}

export default Like
