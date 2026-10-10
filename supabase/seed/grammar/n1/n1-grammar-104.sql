-- n1-grammar-104 — 〜に〜
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-104',
    'grammar',
    'N1',
    $$〜に〜$$,
    $$ni$$,
    $$Muito e muito / Demais / Sem parar$$,
    $$Quando o mesmo verbo se repete com に no meio, a expressão indica que a ação foi feita com muita intensidade ou por muito tempo. Equivale a "muito e muito" ou "sem parar".

Por exemplo, 待ちに待った significa "esperado por muito, muito tempo", e 泣きに泣いた significa "chorou e chorou".

É uma expressão enfática, comum na escrita e em narrações.$$,
    $$Combinações comuns são 待ちに待った, 泣きに泣いた, 考えに考えた, 走りに走った e 迷いに迷った.

Só funciona com alguns verbos fixos.$$,
    $$Verbo (forma ます sem ます) + に + Mesmo verbo (forma た)$$,
    $$〜に〜$$,
    $$待ちに待|泣きに泣|考えに考|走りに走|迷いに迷|売れに売|揺れに揺|悩みに悩$$,
    ARRAY['に']::text[],
    ARRAY['待ちに待った', '泣きに泣いた', '考えに考えた', '迷いに迷った']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-104', $$待ちに待った夏休みがやってきた。$$, $$まちにまったなつやすみがやってきた。$$, $$Chegaram as tão esperadas férias de verão.$$),
    ('n1-grammar-104', $$彼女は別れた後、泣きに泣いた。$$, $$かのじょはわかれたあと、なきにないた。$$, $$Depois do término, ela chorou e chorou.$$),
    ('n1-grammar-104', $$考えに考えた末、留学することにした。$$, $$かんがえにかんがえたすえ、りゅうがくすることにした。$$, $$Depois de pensar muito e muito, decidi fazer intercâmbio.$$),
    ('n1-grammar-104', $$迷いに迷って、結局赤い服を買った。$$, $$まよいにまよって、けっきょくあかいふくをかった。$$, $$Depois de muita dúvida, acabei comprando a roupa vermelha.$$),
    ('n1-grammar-104', $$駅まで走りに走ったが、電車に乗り遅れた。$$, $$えきまではしりにはしったが、でんしゃにのりおくれた。$$, $$Corri e corri até a estação, mas perdi o trem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$待ち____待った結果発表の日が来た。$$, $$Chegou o tão esperado dia do anúncio dos resultados.$$),
        (2, $$悩み____悩んで、ようやく答えを出した。$$, $$Depois de me angustiar muito, finalmente cheguei a uma resposta.$$),
        (3, $$その新商品は売れ____売れた。$$, $$Esse novo produto vendeu e vendeu.$$),
        (4, $$船は嵐の中で揺れ____揺れた。$$, $$O navio balançou sem parar no meio da tempestade.$$),
        (5, $$考え____考えて、この作品を完成させた。$$, $$Depois de pensar muito e muito, concluí esta obra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-104', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に$$),
        (2, $$に$$),
        (3, $$に$$),
        (4, $$に$$),
        (5, $$に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
