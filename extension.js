const vscode = require('vscode');
const path = require('path');

/**
 * @param {vscode.ExtensionContext} context
 */
function activate(context) {
    console.log('PICO-8 Enhanced extension is now active!');

    // Register completion provider for PICO-8 API
    const completionProvider = vscode.languages.registerCompletionItemProvider(
        ['pico8', 'lua'],
        {
            provideCompletionItems(document, position) {
                // Check if we're in a .p8 file
                if (!document.fileName.endsWith('.p8') && !document.fileName.endsWith('.lua')) {
                    return undefined;
                }

                // Create completion items for common PICO-8 functions
                const completions = [
                    createCompletion('_init', 'function _init()\n $0\nend', 'Program initialization callback'),
                    createCompletion('_update', 'function _update()\n $0\nend', 'Update callback (30fps)'),
                    createCompletion('_draw', 'function _draw()\n $0\nend', 'Draw callback'),
                    createCompletion('btn', 'btn($1)', 'Get button state'),
                    createCompletion('btnp', 'btnp($1)', 'Get button pressed'),
                    createCompletion('pset', 'pset($1, $2, $3)', 'Set pixel'),
                    createCompletion('pget', 'pget($1, $2)', 'Get pixel'),
                    createCompletion('spr', 'spr($1, $2, $3)', 'Draw sprite'),
                    createCompletion('cls', 'cls($1)', 'Clear screen'),
                    createCompletion('circfill', 'circfill($1, $2, $3, $4)', 'Draw filled circle'),
                    createCompletion('rectfill', 'rectfill($1, $2, $3, $4, $5)', 'Draw filled rectangle'),
                    createCompletion('print', 'print($1, $2, $3, $4)', 'Print text'),
                ];

                return completions;
            }
        }
    );

    context.subscriptions.push(completionProvider);

    // Register hover provider for documentation
    const hoverProvider = vscode.languages.registerHoverProvider(
        ['pico8', 'lua'],
        {
            provideHover(document, position, token) {
                if (!document.fileName.endsWith('.p8') && !document.fileName.endsWith('.lua')) {
                    return undefined;
                }

                const range = document.getWordRangeAtPosition(position);
                const word = document.getText(range);

                // Get documentation for the word
                const doc = getDocumentation(word);
                if (doc) {
                    return new vscode.Hover(doc);
                }

                return undefined;
            }
        }
    );

    context.subscriptions.push(hoverProvider);
}

function createCompletion(label, insertText, documentation) {
    const item = new vscode.CompletionItem(label, vscode.CompletionItemKind.Function);
    item.insertText = new vscode.SnippetString(insertText);
    item.documentation = new vscode.MarkdownString(documentation);
    return item;
}

function getDocumentation(functionName) {
    const docs = {
        'btn': '**btn(b, [pl])**\n\nGet button state (returns true while held down)\n\nButton indices: 0=left, 1=right, 2=up, 3=down, 4=O, 5=X\n\n```lua\nif btn(0) then x -= 1 end\n```',
        'btnp': '**btnp(b, [pl])**\n\nGet button pressed (with auto-repeat)\n\n```lua\nif btnp(4) then shoot() end\n```',
        'pset': '**pset(x, y, [col])**\n\nSet pixel at position x,y to color col\n\n```lua\npset(64, 64, 8)  -- red pixel at center\n```',
        'pget': '**pget(x, y)**\n\nGet color of pixel at position x,y\n\n```lua\nlocal c = pget(64, 64)\n```',
        'spr': '**spr(n, x, y, [w, h], [flip_x], [flip_y])**\n\nDraw sprite n at position x,y\n\n```lua\nspr(1, 64, 64)  -- draw sprite 1 at center\n```',
        'cls': '**cls([col])**\n\nClear screen to color\n\n```lua\ncls()    -- clear to black\ncls(1)   -- clear to dark blue\n```',
        'circfill': '**circfill(x, y, r, [col])**\n\nDraw filled circle\n\n```lua\ncircfill(64, 64, 20, 8)  -- red circle\n```',
        'rectfill': '**rectfill(x0, y0, x1, y1, [col])**\n\nDraw filled rectangle\n\n```lua\nrectfill(10, 10, 50, 50, 7)  -- white box\n```',
        'print': '**print(str, [x, y], [col])**\n\nPrint text to screen\n\n```lua\nprint("hello", 10, 10, 7)\n```',
        '_init': '**_init()**\n\nCalled once when the program starts\n\n```lua\nfunction _init()\n  player = {x=64, y=64}\nend\n```',
        '_update': '**_update()**\n\nCalled once per frame (30fps)\n\n```lua\nfunction _update()\n  if btn(0) then x -= 1 end\nend\n```',
        '_draw': '**_draw()**\n\nCalled once per visible frame\n\n```lua\nfunction _draw()\n  cls()\n  spr(1, x, y)\nend\n```',
        'add': '**add(tbl, val, [index])**\n\nAdd value to table\n\n```lua\nadd(bullets, {x=64, y=64})\n```',
        'del': '**del(tbl, val)**\n\nDelete value from table\n\n```lua\ndel(bullets, bullet)\n```',
        'all': '**all(tbl)**\n\nIterate over table\n\n```lua\nfor b in all(bullets) do\n  b.y -= 1\nend\n```',
        'rnd': '**rnd(x)**\n\nRandom number 0 to x (exclusive)\n\n```lua\nlocal r = rnd(100)  -- 0 to 99.99\n```',
        'flr': '**flr(x)**\n\nFloor (round down)\n\n```lua\nlocal i = flr(4.7)  -- 4\n```',
        'mid': '**mid(x, y, z)**\n\nMiddle value (clamp)\n\n```lua\nx = mid(0, x, 120)  -- keep between 0-120\n```',
        'cos': '**cos(x)**\n\nCosine (0..1 range)\n\n```lua\nx = 64 + cos(t()) * 20\n```',
        'sin': '**sin(x)**\n\nSine (0..1 range, inverted)\n\n```lua\ny = 64 + sin(t()) * 20\n```',
    };

    return docs[functionName];
}

function deactivate() {}

module.exports = {
    activate,
    deactivate
};

