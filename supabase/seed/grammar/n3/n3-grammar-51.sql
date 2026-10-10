-- n3-grammar-51 — 〜ことはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-51',
    'grammar',
    'N3',
    $$〜ことはない$$,
    $$koto wa nai$$,
    $$Não precisa / Não há necessidade de$$,
    $$ことはない é usado para dizer que não há necessidade de fazer algo. Equivale a "não precisa" ou "não há necessidade de".

Ele vem depois do verbo na forma de dicionário. A ideia é tranquilizar ou aconselhar alguém, mostrando que aquela ação, preocupação ou esforço é desnecessário.

Por exemplo, "não precisa se preocupar", "não precisa vir até aqui" ou "não precisa pedir desculpas".

Comparado a なくてもいい, ことはない soa mais firme e muitas vezes carrega um tom de consolo ou encorajamento. Ele é muito usado para animar alguém que está preocupado ou se culpando à toa.$$,
    $$Não confunda com たことはない (nunca fiz), que usa a forma た e fala de experiência.

ことはない aparece muito junto com わざわざ, そんなに e 何も, reforçando que a ação é desnecessária.

Em níveis mais avançados, ないことはない significa "não é que não...", com sentido bem diferente.$$,
    $$Verbo na forma de dicionário + ことはない
Verbo + ことはありません (educado)

Com わざわざ / そんなに: わざわざ〜ことはない (não precisa se dar ao trabalho de...)$$,
    $$ことはない$$,
    $$ことはない|ことはありません|こともない$$,
    ARRAY['こと', 'は', 'ない']::text[],
    ARRAY['ことはない', 'ことはありません', 'こともない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-51', $$大丈夫だから、心配することはないよ。$$, $$だいじょうぶだから、しんぱいすることはないよ。$$, $$Está tudo bem, não precisa se preocupar.$$),
    ('n3-grammar-51', $$メールで十分ですから、わざわざ来ることはありません。$$, $$メールでじゅうぶんですから、わざわざくることはありません。$$, $$Um e-mail basta, não precisa se dar ao trabalho de vir.$$),
    ('n3-grammar-51', $$まだ時間があるから、そんなに急ぐことはない。$$, $$まだじかんがあるから、そんなにいそぐことはない。$$, $$Ainda temos tempo, não precisa ter tanta pressa.$$),
    ('n3-grammar-51', $$謝ることはないよ。君は悪くない。$$, $$あやまることはないよ。きみはわるくない。$$, $$Não precisa pedir desculpas. Você não tem culpa.$$),
    ('n3-grammar-51', $$小さな失敗で落ち込むことはない。$$, $$ちいさなしっぱいでおちこむことはない。$$, $$Não precisa ficar desanimado por causa de um errinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$簡単な試験だから、緊張する____。$$, $$A prova é fácil, não precisa ficar nervoso.$$),
        (2, $$電話で済むなら、わざわざ行く____。$$, $$Se dá para resolver por telefone, não precisa ir até lá.$$),
        (3, $$事故は君のせいじゃないから、君が責任を感じる____。$$, $$O acidente não foi culpa sua, não precisa se sentir responsável.$$),
        (4, $$まだ時間があるから、焦る____よ。$$, $$Ainda tem tempo, não precisa se afobar.$$),
        (5, $$ただの風邪だから、高い薬を買う____。$$, $$É só um resfriado, não precisa comprar remédio caro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことはない$$),
        (1, $$ことはありません$$),
        (2, $$ことはない$$),
        (2, $$ことはありません$$),
        (3, $$ことはない$$),
        (3, $$ことはありません$$),
        (4, $$ことはない$$),
        (4, $$ことはありません$$),
        (5, $$ことはない$$),
        (5, $$ことはありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
