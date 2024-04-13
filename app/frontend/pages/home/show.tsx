type Props = {
  name: string;
};

function Show({ name }: Props) {
  return (
    <div>
      <h1>Hello {name}</h1>
    </div>
  );
}

Show.displayName = "home/show";

export default Show;
