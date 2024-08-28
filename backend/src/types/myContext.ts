export default interface MyContext {
  user?: {
    id: string;
    name: string;
    mail: string;
    roles: string[];
  };
}
