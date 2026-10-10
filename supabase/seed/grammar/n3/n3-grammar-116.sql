-- n3-grammar-116 — 〜たとたん
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-116',
    'grammar',
    'N3',
    $$〜たとたん$$,
    $$ta totan$$,
    $$Assim que / No exato momento em que / Mal$$,
    $$たとたん é usado para dizer que, no instante em que uma ação terminou, outra coisa aconteceu imediatamente. Equivale a "assim que", "no exato momento em que" ou "mal...".

Ele é formado pelo verbo na forma た + とたん (途端). A ideia é de algo muito rápido e, geralmente, inesperado.

Por exemplo, "mal saí de casa, começou a chover" ou "assim que me levantei, fiquei tonto".

A segunda parte costuma ser um acontecimento que fugiu ao controle de quem fala, muitas vezes uma surpresa. Por isso, ela não pode ser uma ação intencional ou um pedido, como "assim que chegar, me ligue".

Com verbos cuja forma た termina em だ, usa-se だとたん.$$,
    $$Para ações planejadas, como "assim que chegar, ligue", usa-se たらすぐ ou 次第 (N2), e não たとたん.

とたんに, com に, tem o mesmo sentido e é um pouco mais enfático.

A estrutura destaca a surpresa. Por isso, é muito comum em narrativas e relatos de acontecimentos inesperados.$$,
    $$Verbo na forma た + とたん(に)、 + Acontecimento inesperado

Escrita: とたん / 途端$$,
    $$たとたん$$,
    $$たとたん|た途端|だとたん|だ途端$$,
    ARRAY['た', 'とたん']::text[],
    ARRAY['たとたん', 'た途端', 'だとたん', 'たとたんに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-116', $$家を出たとたん、雨が降り出した。$$, $$いえをでたとたん、あめがふりだした。$$, $$Mal saí de casa, começou a chover.$$),
    ('n3-grammar-116', $$急に立ち上がったとたん、めまいがした。$$, $$きゅうにたちあがったとたん、めまいがした。$$, $$Assim que me levantei de repente, fiquei tonto.$$),
    ('n3-grammar-116', $$彼は部屋に入ったとたん、寝てしまった。$$, $$かれはへやにはいったとたん、ねてしまった。$$, $$Mal entrou no quarto, ele caiu no sono.$$),
    ('n3-grammar-116', $$ドアを開けたとたん、猫が飛び出してきた。$$, $$ドアをあけたとたん、ねこがとびだしてきた。$$, $$No exato momento em que abri a porta, o gato saiu correndo.$$),
    ('n3-grammar-116', $$その薬を飲んだとたん、気分がよくなった。$$, $$そのくすりをのんだとたん、きぶんがよくなった。$$, $$Assim que tomei esse remédio, me senti melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電車に乗っ____、ドアが閉まった。$$, $$Mal entrei no trem, as portas se fecharam.$$),
        (2, $$母の顔を見____、子供は泣き出した。$$, $$Assim que viu o rosto da mãe, a criança começou a chorar.$$),
        (3, $$外に出____、強い風が吹いてきた。$$, $$Mal saí, começou a soprar um vento forte.$$),
        (4, $$席に座っ____、電話が鳴った。$$, $$No exato momento em que me sentei, o telefone tocou.$$),
        (5, $$お酒を飲ん____、顔が赤くなった。$$, $$Assim que bebi, meu rosto ficou vermelho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-116', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たとたん$$),
        (1, $$た途端$$),
        (2, $$たとたん$$),
        (2, $$た途端$$),
        (3, $$たとたん$$),
        (3, $$た途端$$),
        (4, $$たとたん$$),
        (4, $$た途端$$),
        (5, $$だとたん$$),
        (5, $$だ途端$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
