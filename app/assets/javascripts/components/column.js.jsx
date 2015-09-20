class Column extends React.Component {
  render () {
    cards = this.props.cards.map((card) => {
      return <Card key={'card-' + card.id} title={card.title} votes={card.votes} color={this.props.color} />
    });

    return (
      <div style={this.style()}>
        <div><strong>{this.props.title}</strong></div>
        {cards}
      </div>
    )
  }

  style() {
    return {
      width: this.props.columnWidth + '%',
      float: 'left'
    }
  }
}
