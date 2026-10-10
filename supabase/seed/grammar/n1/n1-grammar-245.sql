-- n1-grammar-245 — 〜ずにはおかない / 〜ないではおかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-245',
    'grammar',
    'N1',
    $$〜ずにはおかない / 〜ないではおかない$$,
    $$zu niwa okanai / nai dewa okanai$$,
    $$Não deixar de / Com certeza vai / Inevitavelmente$$,
    $$ずにはおかない e ないではおかない têm dois usos principais.

O primeiro indica que algo inevitavelmente causa uma reação ou sentimento nas pessoas. Equivale a "não deixar de" ou "inevitavelmente". Por exemplo, "este filme não deixa de emocionar quem assiste".

O segundo expressa uma determinação forte de fazer algo. Equivale a "com certeza vou". Por exemplo, "vou descobrir a verdade, custe o que custar".

É uma expressão formal e enfática.$$,
    $$Atenção à forma de する, que vira せずにはおかない.

No primeiro uso, o sujeito costuma ser algo que provoca uma reação, como uma obra ou um acontecimento.$$,
    $$Verbo (forma ない sem ない) + ずにはおかない
Verbo (forma ない) + ではおかない
する → せずにはおかない$$,
    $$ずにはおかない$$,
    $$ずにはおかない|ないではおかない|ずにはおかなかった|ずにはおきません$$,
    ARRAY['ず', 'に', 'は', 'おかない']::text[],
    ARRAY['ずにはおかない', 'ないではおかない', 'せずにはおかない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-245', $$この映画は、見る人を感動させずにはおかない。$$, $$このえいがは、みるひとをかんどうさせずにはおかない。$$, $$Este filme não deixa de emocionar quem assiste.$$),
    ('n1-grammar-245', $$彼の言葉は、聞く人の心を動かさずにはおかない。$$, $$かれのことばは、きくひとのこころをうごかさずにはおかない。$$, $$As palavras dele inevitavelmente tocam o coração de quem ouve.$$),
    ('n1-grammar-245', $$真実を明らかにせずにはおかない。$$, $$しんじつをあきらかにせずにはおかない。$$, $$Vou revelar a verdade, custe o que custar.$$),
    ('n1-grammar-245', $$彼の態度は、周りの人を怒らせないではおかない。$$, $$かれのたいどは、まわりのひとをおこらせないではおかない。$$, $$A atitude dele não deixa de irritar as pessoas em volta.$$),
    ('n1-grammar-245', $$今度こそ、犯人を捕まえずにはおかない。$$, $$こんどこそ、はんにんをつかまえずにはおかない。$$, $$Desta vez, vou pegar o culpado com certeza.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この写真は、見る人を驚かせ____。$$, $$Esta foto não deixa de surpreender quem vê.$$),
        (2, $$彼女の歌声は、聴く人を魅了せ____。$$, $$A voz dela inevitavelmente encanta quem ouve.$$),
        (3, $$こんな失礼なことをされたら、謝らせ____。$$, $$Depois de uma grosseria dessas, vou fazer ele pedir desculpas, com certeza.$$),
        (4, $$この事件は、社会に大きな影響を与え____だろう。$$, $$Este caso inevitavelmente vai ter grande impacto na sociedade.$$),
        (5, $$その小説は、読む人を考えさせ____。$$, $$Esse romance não deixa de fazer o leitor refletir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-245', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずにはおかない$$),
        (1, $$ないではおかない$$),
        (2, $$ずにはおかない$$),
        (3, $$ずにはおかない$$),
        (3, $$ないではおかない$$),
        (4, $$ずにはおかない$$),
        (4, $$ないではおかない$$),
        (5, $$ずにはおかない$$),
        (5, $$ないではおかない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
