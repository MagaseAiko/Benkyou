-- n2-grammar-160 — 〜て当然だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-160',
    'grammar',
    'N2',
    $$〜て当然だ$$,
    $$te touzen da$$,
    $$É natural que / É óbvio que / Não é para menos$$,
    $$て当然だ indica que algo é totalmente natural ou esperado diante da situação. Equivale a "é natural que" ou "é óbvio que".

A pessoa explica que, por algum motivo, aquele resultado ou atitude faz todo o sentido. Por exemplo, "ele treinou muito, então é natural que tenha vencido".

Também pode expressar que algo deveria ser assim, com o sentido de "é o mínimo".$$,
    $$É parecido com のも当然だ e のは当たり前だ.

A forma て当たり前だ é mais coloquial e tem o mesmo sentido.$$,
    $$Verbo (forma て) + 当然だ
Adjetivo い (sem い) + くて当然だ
Adjetivo な / Substantivo + で当然だ$$,
    $$て当然だ$$,
    $$て当然|で当然|てとうぜん$$,
    ARRAY['て', '当然', 'だ']::text[],
    ARRAY['て当然だ', 'で当然だ', 'て当然です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-160', $$あれだけ練習したのだから、勝って当然だ。$$, $$あれだけれんしゅうしたのだから、かってとうぜんだ。$$, $$Com tanto treino, é natural que tenha vencido.$$),
    ('n2-grammar-160', $$約束を破ったのだから、怒られて当然だ。$$, $$やくそくをやぶったのだから、おこられてとうぜんだ。$$, $$Ele quebrou a promessa, então é óbvio que levou bronca.$$),
    ('n2-grammar-160', $$この値段なら、品質がよくて当然です。$$, $$このねだんなら、ひんしつがよくてとうぜんです。$$, $$Com este preço, é óbvio que a qualidade seja boa.$$),
    ('n2-grammar-160', $$初めてなのだから、下手で当然だ。$$, $$はじめてなのだから、へたでとうぜんだ。$$, $$É a primeira vez, então é natural ser ruim nisso.$$),
    ('n2-grammar-160', $$お世話になったら、お礼を言って当然だ。$$, $$おせわになったら、おれいをいってとうぜんだ。$$, $$Se alguém te ajudou, é o mínimo agradecer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一晩中起きていたのだから、眠く____。$$, $$Fiquei acordado a noite toda, então é natural estar com sono.$$),
        (2, $$毎日勉強したのだから、合格し____。$$, $$Estudei todo dia, então é óbvio que passei.$$),
        (3, $$子供なのだから、わからなく____。$$, $$É criança, então é natural não entender.$$),
        (4, $$あんなひどいことを言ったら、嫌われ____。$$, $$Dizendo uma coisa tão horrível, é óbvio que vai ser odiado.$$),
        (5, $$プロなのだから、上手____。$$, $$É profissional, então é óbvio que seja bom.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-160', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て当然だ$$),
        (1, $$て当然です$$),
        (2, $$て当然だ$$),
        (2, $$て当然です$$),
        (3, $$て当然だ$$),
        (3, $$て当然です$$),
        (4, $$て当然だ$$),
        (4, $$て当然です$$),
        (5, $$で当然だ$$),
        (5, $$で当然です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
