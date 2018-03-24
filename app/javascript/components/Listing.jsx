import React, { Component } from 'react';
import { Table } from 'reactstrap';

class Listing extends Component {
  createTableHeadings(headings) {
    return headings.map((heading, idx) => (
      <th key={idx} {...heading.attributes}>
        {heading.name}
      </th>
    ));
  }

  createTableRows(rows, keys) {
    return rows.map((row, idx) => (
      <tr key={idx}>
        {this.createTableRowColumns(row, keys)}
      </tr>
    ));
  }

  createTableRowColumns(row, keys) {
    return keys.map((key, idx) => {
      const { text, link, attributes } = row[key];
      if (link) {
        return <td key={idx}><a {...attributes}>{text}</a></td>
      }
      return <td key={idx}>{text}</td>;
    });
  }

  render() {
    const { headings, keys, rows } = this.props;

    return (
      <Table>
        <thead>
          <tr>
            {this.createTableHeadings(headings)}
          </tr>
        </thead>
        <tbody>
          {this.createTableRows(rows, keys)}
        </tbody>
      </Table>
    );
  }
}

export default Listing;
