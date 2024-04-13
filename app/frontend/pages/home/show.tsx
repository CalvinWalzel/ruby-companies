interface Props {
  name: string;
}

function Show({ name }: Props) {
  return <h1>Hello {name}</h1>;
}

Show.displayName = "home/show";

export default Show;
