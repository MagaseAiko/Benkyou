-- n1-grammar-25 — 〜では済まない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-25',
    'grammar',
    'N1',
    $$〜では済まない$$,
    $$dewa sumanai$$,
    $$Não basta / Não fica só nisso / Não se resolve com$$,
    $$では済まない indica que algo não pode ser resolvido de forma simples, porque a situação é grave. Equivale a "não basta" ou "não fica só nisso".

A pessoa mostra que será preciso algo mais sério, como uma punição, uma responsabilidade ou uma ação maior. Por exemplo, "pedir desculpas não basta" ou "se descobrirem, não vai ficar só numa bronca".$$,
    $$Expressões comuns são 謝って済む問題ではない e 冗談では済まない.

A forma positiva, で済む, significa "basta" ou "dá para resolver com".$$,
    $$Substantivo + では済まない
Verbo (forma simples) + だけでは済まない
Verbo (forma て) + は済まない$$,
    $$では済まない$$,
    $$では済まない|では済まされない|ではすまない|では済みません|だけでは済まない$$,
    ARRAY['では', '済まない']::text[],
    ARRAY['では済まない', 'では済まされない', 'では済みません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-25', $$これは謝罪だけでは済まない問題だ。$$, $$これはしゃざいだけではすまないもんだいだ。$$, $$Este é um problema que não se resolve só com um pedido de desculpas.$$),
    ('n1-grammar-25', $$そんなことをしたら、冗談では済まないよ。$$, $$そんなことをしたら、じょうだんではすまないよ。$$, $$Se fizer uma coisa dessas, não vai ficar só na brincadeira.$$),
    ('n1-grammar-25', $$会社のお金を使ったら、注意では済まされない。$$, $$かいしゃのおかねをつかったら、ちゅういではすまされない。$$, $$Se usar o dinheiro da empresa, não vai ficar só numa advertência.$$),
    ('n1-grammar-25', $$けがをさせたのだから、ごめんでは済まない。$$, $$けがをさせたのだから、ごめんではすまない。$$, $$Você machucou alguém, então só desculpa não basta.$$),
    ('n1-grammar-25', $$今回のミスは知らなかったでは済みません。$$, $$こんかいのミスはしらなかったではすみません。$$, $$Neste erro, dizer que não sabia não basta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束を破ったら、それ____。$$, $$Se quebrar a promessa, não vai ficar só nisso.$$),
        (2, $$この事故は、運が悪かった____。$$, $$Neste acidente, dizer que foi azar não basta.$$),
        (3, $$お金で解決____。$$, $$Isso não se resolve com dinheiro.$$),
        (4, $$嘘をついたのがばれたら、怒られるだけ____。$$, $$Se descobrirem a mentira, não vai ficar só numa bronca.$$),
        (5, $$子供のいたずら____ことだ。$$, $$Isso não dá para tratar como uma simples travessura de criança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$では済まない$$),
        (1, $$では済まされない$$),
        (1, $$では済みません$$),
        (2, $$では済まない$$),
        (2, $$では済まされない$$),
        (2, $$では済みません$$),
        (3, $$では済まない$$),
        (3, $$では済まされない$$),
        (3, $$では済みません$$),
        (4, $$では済まない$$),
        (4, $$では済まされない$$),
        (4, $$では済みません$$),
        (5, $$では済まない$$),
        (5, $$では済まされない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
