-- n4-grammar-09 — 〜出す
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-09',
    'grammar',
    'N4',
    $$〜出す$$,
    $$dasu$$,
    $$Começar a (de repente) / Pôr-se a$$,
    $$出す, ligado a outro verbo, indica que uma ação começou de repente, muitas vezes de forma inesperada. Equivale a "começar a" ou "pôr-se a".

A estrutura junta o verbo na forma ます sem ます com 出す. O resultado funciona como um novo verbo do grupo 1 e se conjuga normalmente: 出します, 出した, 出して.

É muito usado com ações que surgem de forma súbita ou fora do controle, como chover, chorar, rir, correr ou começar a se mover.

A diferença para 始める é o tom: 始める indica um começo planejado ou neutro, enquanto 出す destaca que o início foi repentino e muitas vezes inesperado.$$,
    $$Por indicar algo súbito, 出す aparece muito com 急に e 突然 (de repente).

Em geral, 出す não é usado para uma ação que você decide começar com calma, como começar a estudar seguindo um plano. Nesse caso, 始める é mais natural.

Sozinho, 出す significa "tirar", "enviar" ou "entregar". O sentido de "começar a" aparece apenas quando ele vem depois de outro verbo.$$,
    $$Verbo na forma ます sem ます + 出す

Educado: 出します
Passado: 出した / 出しました

Escrita: 出す / だす$$,
    $$出す$$,
    $$出す|出し|だす|だした|だして$$,
    ARRAY['出す']::text[],
    ARRAY['出す', '出します', '出した', '出しました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-09', $$急に雨が降り出しました。$$, $$きゅうにあめがふりだしました。$$, $$De repente, começou a chover.$$),
    ('n4-grammar-09', $$赤ちゃんが泣き出した。$$, $$あかちゃんがなきだした。$$, $$O bebê começou a chorar.$$),
    ('n4-grammar-09', $$話を聞いて、みんなが笑い出しました。$$, $$はなしをきいて、みんながわらいだしました。$$, $$Ao ouvir a história, todos começaram a rir.$$),
    ('n4-grammar-09', $$彼は突然走り出した。$$, $$かれはとつぜんはしりだした。$$, $$Ele começou a correr de repente.$$),
    ('n4-grammar-09', $$犬が急に吠え出したので、びっくりしました。$$, $$いぬがきゅうにほえだしたので、びっくりしました。$$, $$O cachorro começou a latir de repente e eu me assustei.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$映画を見て、妹が泣き____。$$, $$Vendo o filme, minha irmã mais nova começou a chorar.$$),
        (2, $$信号が青になって、車が動き____。$$, $$O sinal ficou verde e os carros começaram a andar.$$),
        (3, $$夜になって、急に風が吹き____。$$, $$À noite, o vento começou a soprar de repente.$$),
        (4, $$先生の冗談に、学生たちが笑い____。$$, $$Com a piada do professor, os alunos começaram a rir.$$),
        (5, $$母の顔を見て、子供は急に泣き____。$$, $$Ao ver o rosto da mãe, a criança começou a chorar de repente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$出した$$),
        (1, $$出しました$$),
        (1, $$だした$$),
        (2, $$出した$$),
        (2, $$出しました$$),
        (2, $$だした$$),
        (3, $$出した$$),
        (3, $$出しました$$),
        (3, $$だした$$),
        (4, $$出した$$),
        (4, $$出しました$$),
        (4, $$だした$$),
        (5, $$出した$$),
        (5, $$出しました$$),
        (5, $$だした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
