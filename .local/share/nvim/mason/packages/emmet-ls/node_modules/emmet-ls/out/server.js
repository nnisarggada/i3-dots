#!/usr/bin/env node
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const emmet_1 = require("emmet");
const vscode_languageserver_textdocument_1 = require("vscode-languageserver-textdocument");
const node_1 = require("vscode-languageserver/node");
const connection = (0, node_1.createConnection)(node_1.ProposedFeatures.all);
// Create a simple text document manager.
const documents = new node_1.TextDocuments(vscode_languageserver_textdocument_1.TextDocument);
let hasConfigurationCapability = false;
let hasWorkspaceFolderCapability = false;
let globalConfig = {};
connection.onInitialize((params) => {
    const capabilities = params.capabilities;
    // Does the client support the `workspace/configuration` request?
    // If not, we fall back using global settings.
    hasConfigurationCapability = !!(capabilities.workspace && !!capabilities.workspace.configuration);
    hasWorkspaceFolderCapability = !!(capabilities.workspace && !!capabilities.workspace.workspaceFolders);
    globalConfig = params.initializationOptions || {};
    const triggerCharacters = [
        ">",
        ")",
        "]",
        "}",
        "@",
        "*",
        "$",
        "+",
        // alpha
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z",
        // num
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
    ];
    const result = {
        capabilities: {
            textDocumentSync: node_1.TextDocumentSyncKind.Incremental,
            // Tell the client that this server supports code completion.
            completionProvider: {
                resolveProvider: true,
                triggerCharacters: triggerCharacters,
            },
        },
    };
    if (hasWorkspaceFolderCapability) {
        result.capabilities.workspace = {
            workspaceFolders: {
                supported: true,
            },
        };
    }
    return result;
});
connection.onInitialized(() => {
    if (hasConfigurationCapability) {
        // Register for all configuration changes.
        connection.client.register(node_1.DidChangeConfigurationNotification.type, undefined);
    }
    if (hasWorkspaceFolderCapability) {
        connection.workspace.onDidChangeWorkspaceFolders((_event) => {
            connection.console.log("Workspace folder change event received.");
        });
    }
});
// For list of language identifiers, see:
// https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocumentItem
// For list of supported syntax options, see:
// https://github.com/emmetio/emmet/blob/master/src/config.ts#L280-L283
const markupIdentifierOverrides = {
    // Identifiers not in stylesheetIdentifiers are treated as markup.
    // Markup languages are treated as html syntax by default.
    // So html, blade, razor and the like don't need to be listed.
    javascriptreact: 'jsx',
    typescriptreact: 'jsx',
};
const stylesheetIdentifiers = [
    'css',
    'sass',
    'scss',
    'less'
];
connection.onCompletion((_textDocumentPosition) => {
    var _a;
    try {
        const docs = documents.get(_textDocumentPosition.textDocument.uri);
        if (!docs)
            throw "failed to find document";
        const languageId = docs.languageId;
        const content = docs.getText();
        const linenr = _textDocumentPosition.position.line;
        const line = String(content.split(/\r?\n/g)[linenr]);
        const character = _textDocumentPosition.position.character;
        // Non-stylesheet identifiers are treated as markup.
        const isStylesheet = stylesheetIdentifiers.includes(languageId);
        // Emmet syntax names are the same as language server identifiers for stylesheets,
        // but not for markup languages.
        // Treat markup languages as html if not in markupIdentifierOverrides.
        const syntax = isStylesheet ? languageId : (_a = markupIdentifierOverrides[languageId]) !== null && _a !== void 0 ? _a : 'html';
        const type = isStylesheet ? 'stylesheet' : 'markup';
        const extractedPosition = (0, emmet_1.extract)(line, character, { type });
        if ((extractedPosition === null || extractedPosition === void 0 ? void 0 : extractedPosition.abbreviation) == undefined) {
            throw "failed to parse line";
        }
        const left = extractedPosition.start;
        const right = extractedPosition.end;
        const abbreviation = extractedPosition.abbreviation;
        const emmetConfig = (0, emmet_1.resolveConfig)({
            syntax,
            type,
            options: {
                "output.field": (index, placeholder) => `\$\{${index}${placeholder ? ":" + placeholder : ""}\}`,
            },
        }, globalConfig);
        let textResult = "";
        if (!isStylesheet) {
            const markup = (0, emmet_1.parseMarkup)(abbreviation, emmetConfig);
            textResult = (0, emmet_1.stringifyMarkup)(markup, emmetConfig);
        }
        else {
            const markup = (0, emmet_1.parseStylesheet)(abbreviation, emmetConfig);
            textResult = (0, emmet_1.stringifyStylesheet)(markup, emmetConfig);
        }
        const range = {
            start: {
                line: linenr,
                character: left,
            },
            end: {
                line: linenr,
                character: right,
            },
        };
        return [
            {
                insertTextFormat: node_1.InsertTextFormat.Snippet,
                label: abbreviation,
                detail: abbreviation,
                documentation: textResult,
                textEdit: {
                    range,
                    newText: textResult,
                    // newText: textResult.replace(/\$\{\d*\}/g,''),
                },
                kind: node_1.CompletionItemKind.Snippet,
                data: {
                    range,
                    textResult,
                },
            },
        ];
    }
    catch (error) {
        connection.console.log(`ERR: ${error}`);
    }
    return [];
});
documents.listen(connection);
connection.listen();
//# sourceMappingURL=server.js.map