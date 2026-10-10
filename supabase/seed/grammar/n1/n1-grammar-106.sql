-- n1-grammar-106 — 〜にあって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-106',
    'grammar',
    'N1',
    $$〜にあって$$,
    $$ni atte$$,
    $$Em / Numa situação de / Sendo$$,
    $$にあって indica uma situação ou posição especial em que alguém se encontra. Equivale a "em" ou "numa situação de".

A pessoa destaca que, mesmo naquela condição, algo acontece, ou que, por causa dela, algo é natural. Por exemplo, "mesmo em meio à crise, ele manteve a calma" ou "sendo líder, ele tem grande responsabilidade".

É uma expressão formal e literária.$$,
    $$É parecido com で e において, mas にあって destaca que a situação é especial.

A forma にあっても significa "mesmo em".$$,
    $$Substantivo (situação / posição) + にあって
Substantivo + にあっても (mesmo em)$$,
    $$にあって$$,
    $$にあって|にあっては|にあっても$$,
    ARRAY['に', 'あって']::text[],
    ARRAY['にあって', 'にあっては', 'にあっても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-106', $$厳しい状況にあって、彼は冷静さを失わなかった。$$, $$きびしいじょうきょうにあって、かれはれいせいさをうしなわなかった。$$, $$Numa situação difícil, ele não perdeu a calma.$$),
    ('n1-grammar-106', $$社長という立場にあって、彼の責任は重い。$$, $$しゃちょうというたちばにあって、かれのせきにんはおもい。$$, $$Na posição de presidente, a responsabilidade dele é grande.$$),
    ('n1-grammar-106', $$この不景気にあっても、あの会社は成長を続けている。$$, $$このふけいきにあっても、あのかいしゃはせいちょうをつづけている。$$, $$Mesmo nesta recessão, aquela empresa continua crescendo.$$),
    ('n1-grammar-106', $$病床にあって、彼女は家族のことを心配していた。$$, $$びょうしょうにあって、かのじょはかぞくのことをしんぱいしていた。$$, $$Mesmo no leito de doente, ela se preocupava com a família.$$),
    ('n1-grammar-106', $$情報化社会にあっては、正しい情報を選ぶ力が必要だ。$$, $$じょうほうかしゃかいにあっては、ただしいじょうほうをえらぶちからがひつようだ。$$, $$Na sociedade da informação, é preciso saber escolher a informação certa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$困難な時代____、人々は助け合った。$$, $$Numa época difícil, as pessoas se ajudaram.$$),
        (2, $$リーダーの立場____、弱音を吐くわけにはいかない。$$, $$Na posição de líder, não posso me queixar.$$),
        (3, $$異国の地____、彼は一人で頑張った。$$, $$Numa terra estrangeira, ele se esforçou sozinho.$$),
        (4, $$戦争中____も、人々は希望を失わなかった。$$, $$Mesmo durante a guerra, as pessoas não perderam a esperança.$$),
        (5, $$高齢化社会____、介護の問題は深刻だ。$$, $$Numa sociedade que envelhece, o problema dos cuidados com idosos é sério.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-106', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にあって$$),
        (1, $$にあっても$$),
        (2, $$にあって$$),
        (2, $$にあっては$$),
        (3, $$にあって$$),
        (3, $$にあっても$$),
        (4, $$にあって$$),
        (5, $$にあって$$),
        (5, $$にあっては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
