import React, { Component } from 'react';
import {
  Card,
  CardImg,
  CardText,
  CardBody,
  CardTitle,
  CardSubtitle,
  Button
} from 'reactstrap';

class Posts extends Component {
  // createTableRowColumns(row, keys) {
  //   return keys.map((key, idx) => {
  //     const { text, link, attributes } = row[key];
  //     if (link) {
  //       return <td key={idx}><a {...attributes}>{text}</a></td>
  //     }
  //     return <td key={idx}>{text}</td>;
  //   });
  // }

  render() {
    const { posts } = this.props;
    console.log('posts =====>', posts);
    return posts.map((post) => (
      <React.Fragment key={post.id}>
        <Card>
          <CardBody>
            <CardTitle><a href={post.path}>{post.title}</a></CardTitle>
            <CardSubtitle>{post.datetime}</CardSubtitle>
            <CardText>{post.content}</CardText>
          </CardBody>
        </Card>
        <br />
      </React.Fragment>
    ));
  }
}

export default Posts;


/*
<Card>
        <CardImg top width="100%" src="https://placeholdit.imgix.net/~text?txtsize=33&txt=318%C3%97180&w=318&h=180" alt="Card image cap" />
        <CardBody>
          <CardTitle>Card title</CardTitle>
          <CardSubtitle>Card subtitle</CardSubtitle>
          <CardText>Some quick example text to build on the card title and make up the bulk of the card's content.</CardText>
          <Button>Button</Button>
        </CardBody>
      </Card>
      */
