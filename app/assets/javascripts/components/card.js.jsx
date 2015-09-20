class Card extends React.Component {
  render () {
    var {title, votes} = this.props;

    return (
      <div style={this.cardStyle()}>
        <div style={this.titleStyle()}>{title}</div>
        <div style={this.votesStyle()}>{votes}</div>
      </div>
    );
  }

  cardStyle () {
    return {
      background: '#' + (this.props.color || 'eee')
    }
  }

  titleStyle () {
    return {
      color: '#333'
    }
  }

  votesStyle () {
    return {
      color: '#3a7'
    }
  }
}

Card.propTypes = {
  title: React.PropTypes.string,
  votes: React.PropTypes.number
};
