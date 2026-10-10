-- n1-grammar-199 — 〜といえども
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-199',
    'grammar',
    'N1',
    $$〜といえども$$,
    $$to iedomo$$,
    $$Mesmo sendo / Embora / Ainda que$$,
    $$といえども indica que, mesmo considerando uma condição especial, a conclusão é diferente do que se esperaria. Equivale a "mesmo sendo" ou "embora".

Muitas vezes a primeira parte é alguém ou algo de alto nível, e a segunda mostra que nem assim algo é possível ou permitido. Por exemplo, "mesmo sendo criança, deve-se seguir as regras" ou "mesmo um especialista pode errar".

É uma expressão muito formal.$$,
    $$É uma forma formal de といっても e でも.

Expressões comuns são 子供といえども, プロといえども e 一日といえども.$$,
    $$Substantivo + といえども
Verbo / Adjetivo (forma simples) + といえども
たとえ / いかに + 〜といえども$$,
    $$といえども$$,
    $$といえども|と言えども$$,
    ARRAY['と', 'いえども']::text[],
    ARRAY['といえども', 'と言えども']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-199', $$子供といえども、ルールは守らなければならない。$$, $$こどもといえども、ルールはまもらなければならない。$$, $$Mesmo sendo criança, é preciso seguir as regras.$$),
    ('n1-grammar-199', $$専門家といえども、間違えることはある。$$, $$せんもんかといえども、まちがえることはある。$$, $$Mesmo um especialista às vezes erra.$$),
    ('n1-grammar-199', $$いかに忙しいといえども、食事はとるべきだ。$$, $$いかにいそがしいといえども、しょくじはとるべきだ。$$, $$Por mais ocupado que esteja, deve-se comer.$$),
    ('n1-grammar-199', $$一日といえども、練習を休むわけにはいかない。$$, $$いちにちといえども、れんしゅうをやすむわけにはいかない。$$, $$Não posso faltar ao treino, nem que seja um dia.$$),
    ('n1-grammar-199', $$社長といえども、法律には従わなければならない。$$, $$しゃちょうといえども、ほうりつにはしたがわなければならない。$$, $$Mesmo sendo presidente, é preciso obedecer à lei.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$プロ____、失敗することはある。$$, $$Mesmo um profissional às vezes falha.$$),
        (2, $$たとえ親____、子供の手紙を勝手に読んではいけない。$$, $$Mesmo sendo pai, não se deve ler as cartas dos filhos sem permissão.$$),
        (3, $$春____、朝晩はまだ寒い。$$, $$Embora seja primavera, de manhã e à noite ainda faz frio.$$),
        (4, $$一円____、無駄にしてはいけない。$$, $$Não se deve desperdiçar nem um único iene.$$),
        (5, $$大企業____、倒産する可能性はある。$$, $$Mesmo uma grande empresa pode falir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-199', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といえども$$),
        (1, $$と言えども$$),
        (2, $$といえども$$),
        (2, $$と言えども$$),
        (3, $$といえども$$),
        (3, $$と言えども$$),
        (4, $$といえども$$),
        (4, $$と言えども$$),
        (5, $$といえども$$),
        (5, $$と言えども$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
