-- n1-grammar-179 — 〜ためしがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-179',
    'grammar',
    'N1',
    $$〜ためしがない$$,
    $$tameshi ga nai$$,
    $$Nunca / Jamais aconteceu / Nem uma vez$$,
    $$ためしがない indica que algo nunca aconteceu, nem uma única vez, até agora. Equivale a "nunca" ou "jamais aconteceu".

O tom é de crítica ou insatisfação, geralmente sobre o comportamento de alguém. Por exemplo, "ele nunca chegou no horário".

É uma expressão coloquial.$$,
    $$É parecido com たことがない, mas ためしがない tem um tom de crítica.

Também é escrito 試しがない, mas a forma em hiragana é mais comum.$$,
    $$Verbo (forma た) + ためしがない$$,
    $$ためしがない$$,
    $$ためしがない|試しがない|ためしがありません$$,
    ARRAY['ためし', 'が', 'ない']::text[],
    ARRAY['ためしがない', '試しがない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-179', $$彼は約束の時間に来たためしがない。$$, $$かれはやくそくのじかんにきたためしがない。$$, $$Ele nunca chegou no horário combinado.$$),
    ('n1-grammar-179', $$宝くじを買っても、当たったためしがない。$$, $$たからくじをかっても、あたったためしがない。$$, $$Mesmo comprando bilhetes de loteria, nunca ganhei.$$),
    ('n1-grammar-179', $$天気予報が当たったためしがない。$$, $$てんきよほうがあたったためしがない。$$, $$A previsão do tempo nunca acertou.$$),
    ('n1-grammar-179', $$弟は部屋を片付けたためしがない。$$, $$おとうとはへやをかたづけたためしがない。$$, $$Meu irmão nunca arrumou o quarto.$$),
    ('n1-grammar-179', $$彼女は人の話を最後まで聞いたためしがない。$$, $$かのじょはひとのはなしをさいごまできいたためしがない。$$, $$Ela nunca ouviu ninguém até o fim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夫は家事を手伝った____。$$, $$Meu marido nunca ajudou nas tarefas de casa.$$),
        (2, $$この店で待たずに入れた____。$$, $$Nunca consegui entrar nesta loja sem esperar.$$),
        (3, $$彼が自分から謝った____。$$, $$Ele nunca pediu desculpas por conta própria.$$),
        (4, $$ダイエットが成功した____。$$, $$Minhas dietas nunca deram certo.$$),
        (5, $$あのチームが勝った____。$$, $$Aquele time nunca ganhou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-179', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ためしがない$$),
        (1, $$試しがない$$),
        (2, $$ためしがない$$),
        (2, $$試しがない$$),
        (3, $$ためしがない$$),
        (3, $$試しがない$$),
        (4, $$ためしがない$$),
        (4, $$試しがない$$),
        (5, $$ためしがない$$),
        (5, $$試しがない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
