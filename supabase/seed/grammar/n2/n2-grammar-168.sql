-- n2-grammar-168 — 〜ということは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-168',
    'grammar',
    'N2',
    $$〜ということは$$,
    $$to iu koto wa$$,
    $$Isso significa que / Então quer dizer que / Ou seja$$,
    $$ということは serve para tirar uma conclusão a partir de uma informação. Equivale a "isso significa que" ou "então quer dizer que".

A pessoa recebe uma informação e interpreta o que ela implica. Por exemplo, "a luz está apagada. Isso significa que ele não está em casa".

Também é usado para explicar o sentido de algo, como "estudar significa...".$$,
    $$A conclusão muitas vezes termina com ということだ, だろう ou わけだ.

Na fala, aparece como ってことは.$$,
    $$Frase + ということは、 + Conclusão
Substantivo / Frase + ということは + Explicação$$,
    $$ということは$$,
    $$ということは|ってことは$$,
    ARRAY['と', 'いう', 'こと', 'は']::text[],
    ARRAY['ということは', 'ってことは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-168', $$電気が消えている。ということは、彼は留守だ。$$, $$でんきがきえている。ということは、かれはるすだ。$$, $$A luz está apagada. Isso significa que ele não está em casa.$$),
    ('n2-grammar-168', $$「明日は祝日です。」「ということは、会社は休みですね。」$$, $$「あしたはしゅくじつです。」「ということは、かいしゃはやすみですね。」$$, $$Amanhã é feriado. Então quer dizer que a empresa estará fechada, né?$$),
    ('n2-grammar-168', $$返事がないということは、まだ決まっていないのだろう。$$, $$へんじがないということは、まだきまっていないのだろう。$$, $$Não ter resposta significa que ainda não foi decidido.$$),
    ('n2-grammar-168', $$「チケットが売り切れた。」「ってことは、行けないの？」$$, $$「チケットがうりきれた。」「ってことは、いけないの？」$$, $$Os ingressos esgotaram. Então quer dizer que não vamos poder ir?$$),
    ('n2-grammar-168', $$働くということは、責任を持つことだ。$$, $$はたらくということは、せきにんをもつことだ。$$, $$Trabalhar significa ter responsabilidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女が笑っている。____、試験はうまくいったのだろう。$$, $$Ela está sorrindo. Isso significa que a prova deve ter ido bem.$$),
        (2, $$「店が閉まっている。」「____、今日は定休日だね。」$$, $$A loja está fechada. Então quer dizer que hoje é dia de folga, né?$$),
        (3, $$連絡がない____、元気だということだ。$$, $$Não ter notícias significa que está tudo bem.$$),
        (4, $$「彼は来月転勤するそうだ。」「____、もう会えないね。」$$, $$Dizem que ele vai ser transferido no mês que vem. Então quer dizer que não vamos mais nos ver, né?$$),
        (5, $$親になる____、子供の人生に責任を持つことだ。$$, $$Ser pai significa ter responsabilidade pela vida do filho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-168', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ということは$$),
        (1, $$ってことは$$),
        (2, $$ということは$$),
        (2, $$ってことは$$),
        (3, $$ということは$$),
        (4, $$ということは$$),
        (4, $$ってことは$$),
        (5, $$ということは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
