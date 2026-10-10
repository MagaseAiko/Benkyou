-- n3-grammar-166 — 〜わけだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-166',
    'grammar',
    'N3',
    $$〜わけだ$$,
    $$wake da$$,
    $$Não é à toa que / Então é por isso que / Ou seja$$,
    $$わけだ é usado para mostrar que algo faz sentido, como uma conclusão lógica a partir de um fato. Equivale a "não é à toa que", "então é por isso que" ou "ou seja".

Ele tem dois usos principais. O primeiro é entender o motivo de algo depois de descobrir um fato: "ele morou dez anos no Japão? Não é à toa que fala tão bem japonês". O tom é de "ah, agora entendi".

O segundo é tirar uma conclusão lógica ou matemática a partir de dados: "estudando três horas por dia, são vinte e uma horas por semana".

わけ significa "motivo" ou "razão". Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な, e de substantivos com の ou という.$$,
    $$Expressões como どうりで e なるほど combinam muito com わけだ: どうりで寒いわけだ ("não é à toa que está frio").

Na conversa, わけだ mostra que a pessoa entendeu a situação.

わけ também aparece em outras gramáticas importantes, como わけではない, わけがない e わけにはいかない.$$,
    $$Verbo / Adjetivo い (forma simples) + わけだ
Adjetivo な + な + わけだ
Substantivo + の / という + わけだ

Educado: わけです
Escrita: わけ / 訳$$,
    $$わけだ$$,
    $$わけだ|わけです|訳だ$$,
    ARRAY['わけ', 'だ']::text[],
    ARRAY['わけだ', 'わけです', '訳だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-166', $$彼は十年日本に住んでいたのか。日本語が上手なわけだ。$$, $$かれはじゅうねんにほんにすんでいたのか。にほんごがじょうずなわけだ。$$, $$Ele morou dez anos no Japão? Não é à toa que fala tão bem japonês.$$),
    ('n3-grammar-166', $$窓が開いている。寒いわけだ。$$, $$まどがあいている。さむいわけだ。$$, $$A janela está aberta. Então é por isso que está frio.$$),
    ('n3-grammar-166', $$毎日練習しているから、上手になるわけだ。$$, $$まいにちれんしゅうしているから、じょうずになるわけだ。$$, $$Treina todo dia, então é natural que melhore.$$),
    ('n3-grammar-166', $$一日に三時間勉強すれば、一週間で二十一時間勉強するわけです。$$, $$いちにちにさんじかんべんきょうすれば、いっしゅうかんでにじゅういちじかんべんきょうするわけです。$$, $$Estudando três horas por dia, ou seja, são vinte e uma horas por semana.$$),
    ('n3-grammar-166', $$つまり、明日は休みというわけだ。$$, $$つまり、あしたはやすみというわけだ。$$, $$Ou seja, amanhã é folga.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女はフランスに住んでいたのか。フランス語が上手な____。$$, $$Ela morou na França? Não é à toa que fala bem francês.$$),
        (2, $$エアコンがついていない。暑い____。$$, $$O ar-condicionado não está ligado. Então é por isso que está quente.$$),
        (3, $$彼は毎日走っている。体が強い____。$$, $$Ele corre todo dia. Não é à toa que é tão resistente.$$),
        (4, $$時給千円で八時間働けば、八千円もらえる____。$$, $$Ganhando mil ienes por hora e trabalhando oito horas, ou seja, recebe oito mil ienes.$$),
        (5, $$道が工事中だ。だから混んでいる____。$$, $$A rua está em obras. Então é por isso que está congestionada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-166', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わけだ$$),
        (1, $$わけです$$),
        (2, $$わけだ$$),
        (2, $$わけです$$),
        (3, $$わけだ$$),
        (3, $$わけです$$),
        (4, $$わけだ$$),
        (4, $$わけです$$),
        (5, $$わけだ$$),
        (5, $$わけです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
