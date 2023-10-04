type NSlibrary = {
    [key: string]: {};
};
type Profile = {
    id: string;
    description: string;
    modules: [string];
};
declare function library(name: string): NSlibrary;
declare function profiles(): [Profile];
export { profiles, library };
