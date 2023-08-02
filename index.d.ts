type NSlibrary = {
    [key: string]: {};
};
declare function library(name: string): NSlibrary;
declare function names(): string[];
export { names, library };
