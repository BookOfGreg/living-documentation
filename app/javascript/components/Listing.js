import React, { Component } from 'react';
import { Table } from 'reactstrap';

class Listing extends Component {
  createTableHeadings(headings) {
    return headings.map((heading, idx) => <th key={idx}>{heading}</th>);
  }

  createTableRows(rows) {
    return rows.map((row) => (
      <tr key={row.id}>
        <th scope="row">{row.title}</th>
        <td>{row.content}</td>
        <td>{row.category_id}</td>
      </tr>
    ));
  }

  render() {
    console.log('---- this.props', this.props);

    const { headings, rows } = this.props;

    return (
      <Table>
        <thead>
          <tr>
            {this.createTableHeadings(headings)}
          </tr>
        </thead>
        <tbody>
          {this.createTableRows(rows)}
        </tbody>
      </Table>
    );
  }
}

export default Listing;
