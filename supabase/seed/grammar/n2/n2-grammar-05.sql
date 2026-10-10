-- n2-grammar-05 — 〜ばかりか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-05',
    'grammar',
    'N2',
    $$〜ばかりか$$,
    $$bakari ka$$,
    $$Não só... como até / Não apenas... mas também$$,
    $$ばかりか é usado para dizer que, além de uma coisa, existe outra ainda mais surpreendente ou extrema. Equivale a "não só..., como até" ou "não apenas..., mas também".

A primeira parte apresenta algo, e a segunda acrescenta algo a mais, geralmente com も, まで ou さえ, que reforçam a ideia de "até mesmo".

Por exemplo, "ele não só não pediu desculpas, como até reclamou" ou "não só choveu, como até começou a trovejar".

Pode ser usado para coisas positivas ou negativas. O ponto principal é que a segunda parte vai além da primeira.

Comparado a ばかりでなく e だけでなく, ばかりか é mais enfático e soa mais formal.$$,
    $$ばかりか não é usado com pedidos ou ordens na segunda parte. Ela descreve fatos.

まで e さえ na segunda parte deixam a surpresa ainda mais evidente.

É comum em textos escritos e narrativas, para mostrar uma situação que foi se agravando ou melhorando além do esperado.$$,
    $$Substantivo + ばかりか、 + … + も / まで / さえ
Verbo / Adjetivo い (forma simples) + ばかりか
Adjetivo な + な + ばかりか$$,
    $$ばかりか$$,
    $$ばかりか$$,
    ARRAY['ばかり', 'か']::text[],
    ARRAY['ばかりか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-05', $$彼は英語ばかりか、フランス語も話せる。$$, $$かれはえいごばかりか、フランスごもはなせる。$$, $$Ele fala não só inglês, como também francês.$$),
    ('n2-grammar-05', $$この店は安いばかりか、味もいい。$$, $$このみせはやすいばかりか、あじもいい。$$, $$Esta loja não só é barata, como também é gostosa.$$),
    ('n2-grammar-05', $$彼は謝らないばかりか、文句まで言った。$$, $$かれはあやまらないばかりか、もんくまでいった。$$, $$Ele não só não pediu desculpas, como até reclamou.$$),
    ('n2-grammar-05', $$雨ばかりか、雷まで鳴り出した。$$, $$あめばかりか、かみなりまでなりだした。$$, $$Não só choveu, como até começou a trovejar.$$),
    ('n2-grammar-05', $$彼女は勉強ばかりか、スポーツも得意だ。$$, $$かのじょはべんきょうばかりか、スポーツもとくいだ。$$, $$Ela vai bem não só nos estudos, como também nos esportes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供____、大人もこのゲームに夢中だ。$$, $$Não só as crianças, como até os adultos estão viciados neste jogo.$$),
        (2, $$彼は約束を忘れた____、うそまでついた。$$, $$Ele não só esqueceu o compromisso, como até mentiu.$$),
        (3, $$この薬は効かない____、副作用もある。$$, $$Este remédio não só não funciona, como ainda tem efeitos colaterais.$$),
        (4, $$旅行中、財布____、パスポートまでなくした。$$, $$Na viagem, perdi não só a carteira, como até o passaporte.$$),
        (5, $$彼女は料理が上手な____、裁縫も得意だ。$$, $$Ela não só cozinha bem, como também é ótima na costura.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりか$$),
        (2, $$ばかりか$$),
        (3, $$ばかりか$$),
        (4, $$ばかりか$$),
        (5, $$ばかりか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
