-- n2-grammar-70 — 〜ものだから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-70',
    'grammar',
    'N2',
    $$〜ものだから$$,
    $$mono dakara$$,
    $$É que / Porque / Como$$,
    $$ものだから serve para explicar o motivo de algo, geralmente como justificativa ou desculpa. Equivale a "é que" ou "porque".

A pessoa explica que o resultado aconteceu por causa de uma situação que ela não conseguiu evitar. Por exemplo, "me atrasei porque o trem parou".

Na fala, aparece muito como もんだから.$$,
    $$Depois de ものだから não se usam pedidos, ordens ou convites. A segunda parte costuma ser um fato.

É parecido com から, mas ものだから dá mais ênfase à justificativa.

É muito usado para pedir desculpas de forma educada.$$,
    $$Verbo (forma simples) + ものだから
Adjetivo い + ものだから
Adjetivo な + な + ものだから
Substantivo + な + ものだから$$,
    $$ものだから$$,
    $$ものだから|もんだから|ものですから$$,
    ARRAY['もの', 'だから']::text[],
    ARRAY['ものだから', 'もんだから', 'ものですから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-70', $$電車が遅れたものだから、会議に間に合わなかった。$$, $$でんしゃがおくれたものだから、かいぎにまにあわなかった。$$, $$É que o trem atrasou, então não cheguei a tempo da reunião.$$),
    ('n2-grammar-70', $$あまりに安かったものだから、たくさん買ってしまった。$$, $$あまりにやすかったものだから、たくさんかってしまった。$$, $$Estava tão barato que acabei comprando muito.$$),
    ('n2-grammar-70', $$道が分からなかったもんだから、人に聞いた。$$, $$みちがわからなかったもんだから、ひとにきいた。$$, $$Como eu não sabia o caminho, perguntei para alguém.$$),
    ('n2-grammar-70', $$子供が熱を出したものですから、今日は休ませてください。$$, $$こどもがねつをだしたものですから、きょうはやすませてください。$$, $$É que meu filho está com febre, então me deixe faltar hoje.$$),
    ('n2-grammar-70', $$静かなものだから、つい寝てしまった。$$, $$しずかなものだから、ついねてしまった。$$, $$Estava tão silencioso que acabei dormindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$目覚ましが鳴らなかった____、寝坊しました。$$, $$É que o despertador não tocou, então dormi demais.$$),
        (2, $$あまりにおいしかった____、全部食べてしまった。$$, $$Estava tão gostoso que acabei comendo tudo.$$),
        (3, $$初めてな____、よく分かりません。$$, $$É que é a primeira vez, então não entendo bem.$$),
        (4, $$急いでいた____、財布を忘れた。$$, $$Como eu estava com pressa, esqueci a carteira.$$),
        (5, $$寒かった____、窓を閉めました。$$, $$É que estava frio, então fechei a janela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものだから$$),
        (1, $$もんだから$$),
        (1, $$ものですから$$),
        (2, $$ものだから$$),
        (2, $$もんだから$$),
        (2, $$ものですから$$),
        (3, $$ものだから$$),
        (3, $$もんだから$$),
        (3, $$ものですから$$),
        (4, $$ものだから$$),
        (4, $$もんだから$$),
        (4, $$ものですから$$),
        (5, $$ものだから$$),
        (5, $$もんだから$$),
        (5, $$ものですから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
