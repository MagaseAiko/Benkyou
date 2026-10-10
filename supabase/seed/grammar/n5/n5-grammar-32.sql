-- n5-grammar-32 — 〜ましょう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-32',
    'grammar',
    'N5',
    $$〜ましょう$$,
    $$mashou$$,
    $$Vamos... / Façamos...$$,
    $$ましょう é usado para propor ou combinar uma ação que será feita junto com outras pessoas. Equivale a "vamos...".

Ele tem um tom mais decidido que ませんか: em vez de perguntar se o outro quer, ele já sugere que todos façam a ação. Por isso, é muito usado quando a ideia já foi aceita, ou quando a pessoa está organizando um grupo.

Também é a resposta natural para aceitar um convite. Se alguém pergunta "vamos?" com ませんか, responder com ましょう significa "sim, vamos".

Em avisos, regras e instruções educadas, ましょう também aparece com o sentido de "vamos fazer assim", indicando um comportamento esperado de todos.$$,
    $$Para convidar alguém pela primeira vez, ませんか costuma soar mais gentil. ましょう funciona melhor quando o grupo já está de acordo ou quando quem fala está liderando.

Em escolas e lugares públicos, avisos com ましょう são muito comuns, como lembretes de boas maneiras.

A forma informal de ましょう é a forma volitiva, que aparece no N4. Entre amigos, ela é muito mais comum do que ましょう.$$,
    $$Verbo na forma ます sem ます + ましょう
一緒に + Verbo ましょう

Informal: forma volitiva do verbo (う / よう)$$,
    $$ましょう$$,
    $$ましょう$$,
    ARRAY['ましょう']::text[],
    ARRAY['ましょう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-32', $$さあ、始めましょう。$$, $$さあ、はじめましょう。$$, $$Bom, vamos começar.$$),
    ('n5-grammar-32', $$駅の前で会いましょう。$$, $$えきのまえであいましょう。$$, $$Vamos nos encontrar em frente à estação.$$),
    ('n5-grammar-32', $$疲れましたね。少し休みましょう。$$, $$つかれましたね。すこしやすみましょう。$$, $$Cansamos, né. Vamos descansar um pouco.$$),
    ('n5-grammar-32', $$「何か食べに行きませんか。」「ええ、行きましょう。」$$, $$「なにかたべにいきませんか。」「ええ、いきましょう。」$$, $$"Quer ir comer alguma coisa?" "Sim, vamos."$$),
    ('n5-grammar-32', $$図書館の中では静かにしましょう。$$, $$としょかんのなかではしずかにしましょう。$$, $$Dentro da biblioteca, vamos fazer silêncio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$もう時間ですね。じゃ、帰り____。$$, $$Já está na hora, né. Então, vamos voltar.$$),
        (2, $$「一緒に写真を撮りませんか。」「ええ、撮り____。」$$, $$"Quer tirar uma foto juntos?" "Sim, vamos tirar."$$),
        (3, $$明日は七時に駅で会い____。$$, $$Amanhã, vamos nos encontrar na estação às sete.$$),
        (4, $$みんなで一緒に歌を歌い____。$$, $$Vamos todos cantar uma música juntos.$$),
        (5, $$ゴミは決められた日に出し____。$$, $$Vamos colocar o lixo para fora nos dias determinados.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ましょう$$),
        (2, $$ましょう$$),
        (3, $$ましょう$$),
        (4, $$ましょう$$),
        (5, $$ましょう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
