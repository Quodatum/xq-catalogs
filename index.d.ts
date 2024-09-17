type NSlibrary = {
    [key: string]: Xqmodule;
};
type Profile = {
    id: string;
    description: string;
    modules: [string];
};
type Xqmodule = {
    ns: string;
    prefixes: [string];
    namespaces: [string];
    variables: {} | undefined;
    functions: {} | undefined;
    description: string | undefined;
    type: string | undefined;
    override: boolean | undefined;
};
declare function library(name: string): NSlibrary;
declare function profiles(): [Profile];
export { profiles, library };
