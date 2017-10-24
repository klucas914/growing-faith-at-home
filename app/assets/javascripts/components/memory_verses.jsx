var Memory_Verses = React.createClass({
	render: function() {
	  return (
	    <div>
	      {this.props.memory_verses.map(function(memory_verse) {
	        return (
	          <div className="memory_verses">
                {memory_verse.text}
                <p>{memory_verse.verse_address}</p>
              </div>
	        )
	      })}
	    </div>
	)
  }
});


