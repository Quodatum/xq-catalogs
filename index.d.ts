type Processor = {
    name: string;
    namespaces: object;
};
declare function processor(name: string): Processor;
declare function names(): string[];
export { names, processor };
