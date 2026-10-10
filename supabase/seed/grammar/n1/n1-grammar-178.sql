-- n1-grammar-178 — ただ〜のみだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-178',
    'grammar',
    'N1',
    $$ただ〜のみだ$$,
    $$tada ~ nomi da$$,
    $$Só resta / Apenas / Não há nada a fazer senão$$,
    $$ただ〜のみだ indica que só resta uma única ação ou possibilidade. Equivale a "só resta" ou "apenas".

É usado para mostrar determinação ou resignação. Por exemplo, "agora só resta esperar o resultado" ou "só resta dar o meu melhor".

É uma expressão formal, mais forte que だけだ.$$,
    $$É uma forma formal de ただ〜だけだ.

Também aparece como ただ〜のみである, ainda mais formal.$$,
    $$ただ + Verbo (forma dicionário) + のみだ
ただ + Substantivo + のみだ$$,
    $$ただ〜のみだ$$,
    $$のみだ|のみです|のみである$$,
    ARRAY['ただ', 'のみ', 'だ']::text[],
    ARRAY['ただ〜のみだ', 'ただ〜のみです', 'ただ〜のみである']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-178', $$準備はすべて終わった。あとはただ待つのみだ。$$, $$じゅんびはすべておわった。あとはただまつのみだ。$$, $$Os preparativos terminaram. Agora só resta esperar.$$),
    ('n1-grammar-178', $$ここまで来たら、ただ前に進むのみだ。$$, $$ここまできたら、ただまえにすすむのみだ。$$, $$Chegando até aqui, só resta seguir em frente.$$),
    ('n1-grammar-178', $$結果はわからない。ただ全力を尽くすのみです。$$, $$けっかはわからない。ただぜんりょくをつくすのみです。$$, $$Não sei o resultado. Só resta dar o meu melhor.$$),
    ('n1-grammar-178', $$今はただ、彼の無事を祈るのみだ。$$, $$いまはただ、かれのぶじをいのるのみだ。$$, $$Agora só resta rezar para que ele esteja bem.$$),
    ('n1-grammar-178', $$残された道は、ただ一つのみである。$$, $$のこされたみちは、ただひとつのみである。$$, $$Resta apenas um único caminho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$できることはやった。あとはただ結果を待つ____。$$, $$Fiz o que podia. Agora só resta esperar o resultado.$$),
        (2, $$試合まであと一日。ただ練習する____。$$, $$Falta um dia para a partida. Só resta treinar.$$),
        (3, $$今の私にできるのは、ただ謝る____。$$, $$A única coisa que posso fazer agora é pedir desculpas.$$),
        (4, $$もう迷わない。ただ夢に向かって進む____。$$, $$Não vou mais hesitar. Só resta seguir rumo ao meu sonho.$$),
        (5, $$ここではただ静かに見守る____。$$, $$Aqui só resta observar em silêncio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-178', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のみだ$$),
        (1, $$のみです$$),
        (2, $$のみだ$$),
        (2, $$のみです$$),
        (3, $$のみだ$$),
        (3, $$のみです$$),
        (4, $$のみだ$$),
        (4, $$のみです$$),
        (5, $$のみだ$$),
        (5, $$のみです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
