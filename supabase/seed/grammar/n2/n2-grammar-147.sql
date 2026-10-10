-- n2-grammar-147 — 〜末に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-147',
    'grammar',
    'N2',
    $$〜末に$$,
    $$sue ni$$,
    $$Depois de muito / Após / No fim de$$,
    $$末に indica que, depois de um processo longo e difícil, chegou-se a um resultado. Equivale a "depois de muito..." ou "após".

A primeira parte costuma ser um esforço, uma dúvida ou uma luta prolongada, como pensar muito, discutir muito ou treinar muito. Por exemplo, "depois de pensar muito, decidi mudar de emprego".

É uma expressão um pouco formal.$$,
    $$A forma 末の vem antes de substantivos, como 苦労の末の成功.

É parecido com あげく, mas あげく costuma indicar um resultado ruim, enquanto 末に pode ser bom ou ruim.$$,
    $$Verbo (forma た) + 末に / 末
Substantivo + の + 末に / 末$$,
    $$末に$$,
    $$末に|末の|末、|すえに$$,
    ARRAY['末', 'に']::text[],
    ARRAY['末に', '末', '末の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-147', $$よく考えた末に、会社を辞めることにした。$$, $$よくかんがえたすえに、かいしゃをやめることにした。$$, $$Depois de pensar muito, decidi sair da empresa.$$),
    ('n2-grammar-147', $$長い話し合いの末に、結論が出た。$$, $$ながいはなしあいのすえに、けつろんがでた。$$, $$Após uma longa discussão, chegamos a uma conclusão.$$),
    ('n2-grammar-147', $$苦労の末、ようやく成功した。$$, $$くろうのすえ、ようやくせいこうした。$$, $$Depois de muito sofrimento, finalmente tive sucesso.$$),
    ('n2-grammar-147', $$迷った末に、赤い服を買った。$$, $$まよったすえに、あかいふくをかった。$$, $$Depois de muita dúvida, comprei a roupa vermelha.$$),
    ('n2-grammar-147', $$激しい戦いの末に、日本チームが勝った。$$, $$はげしいたたかいのすえに、にほんチームがかった。$$, $$Após uma luta acirrada, a equipe japonesa venceu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いろいろ悩んだ____、留学をあきらめた。$$, $$Depois de me angustiar muito, desisti do intercâmbio.$$),
        (2, $$十年の研究の____、新しい薬が完成した。$$, $$Após dez anos de pesquisa, o novo remédio foi concluído.$$),
        (3, $$何度も失敗した____、やっと合格できた。$$, $$Depois de falhar várias vezes, finalmente consegui passar.$$),
        (4, $$努力の____成功だった。$$, $$Foi um sucesso conquistado depois de muito esforço.$$),
        (5, $$話し合った____、二人は別れることにした。$$, $$Depois de muito conversar, os dois decidiram se separar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-147', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$末に$$),
        (1, $$すえに$$),
        (2, $$末に$$),
        (2, $$すえに$$),
        (3, $$末に$$),
        (3, $$すえに$$),
        (4, $$末の$$),
        (5, $$末に$$),
        (5, $$すえに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
