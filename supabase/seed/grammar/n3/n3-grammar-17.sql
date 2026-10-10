-- n3-grammar-17 — 〜だけでなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-17',
    'grammar',
    'N3',
    $$〜だけでなく$$,
    $$dake de naku$$,
    $$Não só... mas também / Além de$$,
    $$だけでなく é usado para dizer que algo não se limita a um elemento, mas inclui outro também. Equivale a "não só... mas também" ou "além de".

A primeira parte apresenta o elemento mais óbvio, e a segunda acrescenta outro, geralmente com も.

Por exemplo, "ele fala não só japonês, mas também coreano" ou "este exercício faz bem não só para o corpo, mas também para a mente".

É muito comum na conversa e na escrita. A versão ばかりでなく tem o mesmo sentido, mas soa um pouco mais formal.

Ele vem depois de substantivos, verbos e adjetivos na forma simples. Com adjetivos な, usa-se な antes.$$,
    $$Com partículas, だけでなく pode vir depois delas: 東京にだけでなく, ou antes, conforme a frase.

だけじゃなく é a forma mais comum na fala do dia a dia.

Para um tom mais forte, como "não só isso, como até...", usa-se ばかりか, que aparece no N2.$$,
    $$Substantivo + だけでなく、 + … + も
Verbo / Adjetivo い (forma simples) + だけでなく
Adjetivo な + な + だけでなく

Variações: だけではなく / だけじゃなく (fala)$$,
    $$だけでなく$$,
    $$だけでなく|だけではなく|だけじゃなく$$,
    ARRAY['だけ', 'で', 'なく']::text[],
    ARRAY['だけでなく', 'だけではなく', 'だけじゃなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-17', $$彼は日本語だけでなく、韓国語も話せる。$$, $$かれはにほんごだけでなく、かんこくごもはなせる。$$, $$Ele fala não só japonês, mas também coreano.$$),
    ('n3-grammar-17', $$この店は料理だけでなく、サービスもいい。$$, $$このみせはりょうりだけでなく、サービスもいい。$$, $$Este restaurante tem não só boa comida, mas também bom atendimento.$$),
    ('n3-grammar-17', $$子供だけでなく、大人もこのゲームに夢中だ。$$, $$こどもだけでなく、おとなもこのゲームにむちゅうだ。$$, $$Não só as crianças, mas também os adultos estão viciados neste jogo.$$),
    ('n3-grammar-17', $$彼女はきれいなだけでなく、頭もいい。$$, $$かのじょはきれいなだけでなく、あたまもいい。$$, $$Ela não só é bonita, como também é inteligente.$$),
    ('n3-grammar-17', $$運動は体だけじゃなく、心にもいい。$$, $$うんどうはからだだけじゃなく、こころにもいい。$$, $$O exercício faz bem não só para o corpo, mas também para a mente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この町は夏____、冬も観光客が多い。$$, $$Esta cidade tem muitos turistas não só no verão, mas também no inverno.$$),
        (2, $$彼は歌う____、曲も作る。$$, $$Ele não só canta, como também compõe músicas.$$),
        (3, $$その店は東京____、大阪にもある。$$, $$Essa loja existe não só em Tóquio, mas também em Osaka.$$),
        (4, $$この部屋は広い____、明るい。$$, $$Este quarto não só é amplo, como também é claro.$$),
        (5, $$漢字を読む____、書く練習もしましょう。$$, $$Vamos praticar não só a leitura, mas também a escrita dos kanji.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけでなく$$),
        (1, $$だけではなく$$),
        (1, $$だけじゃなく$$),
        (2, $$だけでなく$$),
        (2, $$だけではなく$$),
        (2, $$だけじゃなく$$),
        (3, $$だけでなく$$),
        (3, $$だけではなく$$),
        (3, $$だけじゃなく$$),
        (4, $$だけでなく$$),
        (4, $$だけではなく$$),
        (4, $$だけじゃなく$$),
        (5, $$だけでなく$$),
        (5, $$だけではなく$$),
        (5, $$だけじゃなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
