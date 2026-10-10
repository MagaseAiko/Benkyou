-- n2-grammar-186 — 〜やら〜やら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-186',
    'grammar',
    'N2',
    $$〜やら〜やら$$,
    $$yara ~ yara$$,
    $$Entre... e / Não só... como também / Tanto... quanto$$,
    $$やら〜やら serve para listar alguns exemplos de uma situação, geralmente para mostrar que havia muitas coisas acontecendo ao mesmo tempo. Equivale a "entre... e..." ou "tanto... quanto...".

Muitas vezes transmite a ideia de confusão, cansaço ou sentimentos misturados. Por exemplo, "entre trabalho e tarefas de casa, estou muito ocupado" ou "fiquei entre feliz e envergonhado".$$,
    $$É parecido com 〜や〜など e 〜とか〜とか, mas やら〜やら destaca a sensação de muita coisa junta.

Uma expressão comum é うれしいやら恥ずかしいやら, "entre feliz e envergonhado".$$,
    $$Substantivo + やら + Substantivo + やら
Verbo / Adjetivo い (forma dicionário) + やら + Verbo / Adjetivo い + やら$$,
    $$やら〜やら$$,
    $$やら$$,
    ARRAY['やら']::text[],
    ARRAY['やら〜やら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-186', $$仕事やら家事やらで、毎日忙しい。$$, $$しごとやらかじやらで、まいにちいそがしい。$$, $$Entre trabalho e tarefas de casa, estou ocupado todos os dias.$$),
    ('n2-grammar-186', $$褒められて、うれしいやら恥ずかしいやら。$$, $$ほめられて、うれしいやらはずかしいやら。$$, $$Me elogiaram e fiquei entre feliz e envergonhado.$$),
    ('n2-grammar-186', $$引っ越しで、掃除やら荷造りやら大変だった。$$, $$ひっこしで、そうじやらにづくりやらたいへんだった。$$, $$Com a mudança, entre limpar e empacotar, foi muito trabalhoso.$$),
    ('n2-grammar-186', $$雨は降るやら風は吹くやら、ひどい天気だった。$$, $$あめはふるやらかぜはふくやら、ひどいてんきだった。$$, $$Chovia e ventava, foi um tempo horrível.$$),
    ('n2-grammar-186', $$お菓子やらジュースやら、たくさん買ってきた。$$, $$おかしやらジュースやら、たくさんかってきた。$$, $$Comprei muita coisa, entre doces e sucos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頭が痛いやら熱がある____で、大変だった。$$, $$Foi difícil, entre dor de cabeça e febre.$$),
        (2, $$試験やらレポート____で、寝る時間もない。$$, $$Entre provas e relatórios, não tenho nem tempo para dormir.$$),
        (3, $$驚く____喜ぶやら、みんな大騒ぎだった。$$, $$Entre surpresa e alegria, todos fizeram uma grande festa.$$),
        (4, $$服____靴やら、部屋が散らかっている。$$, $$O quarto está bagunçado, com roupas e sapatos por todo lado.$$),
        (5, $$悲しいやら悔しい____、涙が止まらなかった。$$, $$Entre triste e frustrado, as lágrimas não paravam.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-186', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やら$$),
        (2, $$やら$$),
        (3, $$やら$$),
        (4, $$やら$$),
        (5, $$やら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
