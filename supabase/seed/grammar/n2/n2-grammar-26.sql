-- n2-grammar-26 — 逆に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-26',
    'grammar',
    'N2',
    $$逆に$$,
    $$gyaku ni$$,
    $$Pelo contrário / Ao contrário / Em vez disso$$,
    $$逆に é um advérbio que significa "pelo contrário" ou "ao contrário". Ele indica que o resultado foi o oposto do esperado, ou apresenta uma situação contrária a outra.

Ele tem dois usos principais.

O primeiro é mostrar um resultado oposto à intenção: "tomei o remédio e, pelo contrário, passei mal" ou "tentei ajudar e, ao contrário, levei bronca".

O segundo é contrastar duas situações opostas: "Tóquio tem muita gente; já o interior, ao contrário, tem pouca".

逆 significa "inverso" ou "contrário". Na conversa, 逆に também é usado para apresentar um ponto de vista diferente: "pelo contrário, acho que é melhor assim".$$,
    $$Na fala jovem, 逆に às vezes é usado de forma exagerada, só para dar ênfase, mesmo sem um contraste real.

Comparado a むしろ, 逆に destaca mais a inversão da situação.

A expressão 逆に言えば significa "por outro lado" ou "dito de outra forma".$$,
    $$Ação / Expectativa + 逆に + Resultado oposto
A + は〜が、 + 逆に + B + は〜 (contraste)

Escrita: 逆に / ぎゃくに$$,
    $$逆に$$,
    $$逆に|ぎゃくに$$,
    ARRAY['逆', 'に']::text[],
    ARRAY['逆に', 'ぎゃくに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-26', $$薬を飲んだら、逆に具合が悪くなった。$$, $$くすりをのんだら、ぎゃくにぐあいがわるくなった。$$, $$Tomei o remédio e, pelo contrário, passei mal.$$),
    ('n2-grammar-26', $$助けようとしたら、逆に怒られた。$$, $$たすけようとしたら、ぎゃくにおこられた。$$, $$Tentei ajudar e, ao contrário, levei bronca.$$),
    ('n2-grammar-26', $$安い物を買ったら、すぐ壊れて逆に高くついた。$$, $$やすいものをかったら、すぐこわれてぎゃくにたかくついた。$$, $$Comprei algo barato, quebrou logo e, no fim, saiu mais caro.$$),
    ('n2-grammar-26', $$東京は人が多いが、逆に地方は人が少ない。$$, $$とうきょうはひとがおおいが、ぎゃくにちほうはひとがすくない。$$, $$Tóquio tem muita gente; já o interior, ao contrário, tem pouca.$$),
    ('n2-grammar-26', $$休んだら、逆に疲れてしまった。$$, $$やすんだら、ぎゃくにつかれてしまった。$$, $$Descansei e, pelo contrário, fiquei mais cansado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$慰めたつもりが、____彼女を泣かせてしまった。$$, $$Achei que estava consolando, mas, pelo contrário, fiz ela chorar.$$),
        (2, $$近道をしたら、____時間がかかった。$$, $$Peguei um atalho e, ao contrário, demorei mais.$$),
        (3, $$詳しい説明を聞いて、____わからなくなった。$$, $$Ouvi uma explicação detalhada e, pelo contrário, fiquei mais confuso.$$),
        (4, $$この地域は夏は暑いが、____冬はとても寒い。$$, $$Nesta região o verão é quente; já o inverno, ao contrário, é muito frio.$$),
        (5, $$急いだら、道を間違えて____遅くなった。$$, $$Corri, errei o caminho e, no fim, cheguei mais tarde.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$逆に$$),
        (1, $$ぎゃくに$$),
        (2, $$逆に$$),
        (2, $$ぎゃくに$$),
        (3, $$逆に$$),
        (3, $$ぎゃくに$$),
        (4, $$逆に$$),
        (4, $$ぎゃくに$$),
        (5, $$逆に$$),
        (5, $$ぎゃくに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
