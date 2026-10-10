-- n2-grammar-111 — 〜につき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-111',
    'grammar',
    'N2',
    $$〜につき$$,
    $$ni tsuki$$,
    $$Por motivo de / Devido a / Por cada$$,
    $$につき tem dois usos principais.

O primeiro indica o motivo de algo, de forma formal. Equivale a "por motivo de" ou "devido a". É muito usado em avisos e placas, como "fechado devido a reformas".

O segundo indica uma proporção, com o sentido de "por cada". Por exemplo, "mil ienes por pessoa" ou "um por cliente".$$,
    $$No uso de motivo, aparece principalmente em avisos escritos, como 工事中につき ou 準備中につき.

No uso de proporção, é parecido com あたり, mas につき é mais formal.$$,
    $$Substantivo + につき + Aviso (motivo)
Número / Unidade + につき + Quantidade (proporção)$$,
    $$につき$$,
    $$につき$$,
    ARRAY['に', 'つき']::text[],
    ARRAY['につき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-111', $$工事中につき、この道は通れません。$$, $$こうじちゅうにつき、このみちはとおれません。$$, $$Devido a obras, não é possível passar por esta rua.$$),
    ('n2-grammar-111', $$本日は定休日につき、お休みします。$$, $$ほんじつはていきゅうびにつき、おやすみします。$$, $$Hoje é nosso dia de folga, por isso estamos fechados.$$),
    ('n2-grammar-111', $$参加費は一人につき千円です。$$, $$さんかひはひとりにつきせんえんです。$$, $$A taxa de participação é de mil ienes por pessoa.$$),
    ('n2-grammar-111', $$お一人様につき、一点限りです。$$, $$おひとりさまにつき、いってんかぎりです。$$, $$Limitado a um item por cliente.$$),
    ('n2-grammar-111', $$雨天につき、試合は中止となりました。$$, $$うてんにつき、しあいはちゅうしとなりました。$$, $$Devido à chuva, a partida foi cancelada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$準備中____、しばらくお待ちください。$$, $$Estamos nos preparando, por favor aguarde um momento.$$),
        (2, $$駐車料金は一時間____三百円です。$$, $$O estacionamento custa trezentos ienes por hora.$$),
        (3, $$改装中____、休業しております。$$, $$Estamos fechados devido a reformas.$$),
        (4, $$このくじは一回____百円です。$$, $$Este sorteio custa cem ienes por vez.$$),
        (5, $$会議中____、入室をご遠慮ください。$$, $$Em reunião, por favor não entre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-111', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$につき$$),
        (2, $$につき$$),
        (3, $$につき$$),
        (4, $$につき$$),
        (5, $$につき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
