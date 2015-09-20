class Board extends React.Component {
  render () {
    var {title, columns} = this.props;

    var columnWidth = 100 / columns.length;

    columns = columns.sort((a, b) => b.order - a.order);
    columns = columns.map(column => {
      return <Column key={'column-' + column.id} title={column.title} cards={column.cards} columnWidth={columnWidth} />
    })

    return (
      <div>
        {columns}
      </div>
    )
  }
}
