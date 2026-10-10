-- n1-grammar-126 — 〜に耐える / 〜に耐えない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-126',
    'grammar',
    'N1',
    $$〜に耐える / 〜に耐えない$$,
    $$ni taeru / ni taenai$$,
    $$Digno de / Que vale a pena / Insuportável de$$,
    $$に耐える e に耐えない avaliam se algo tem qualidade suficiente para merecer uma ação.

に耐える significa "digno de" ou "que vale a pena". Por exemplo, "uma obra digna de ser lida por adultos".

に耐えない significa que algo é tão ruim ou triste que não dá para suportar. Equivale a "insuportável de". Por exemplo, "uma cena insuportável de ver".

Também aparece em expressões de sentimento forte, como 感謝に耐えない, "não tenho palavras para agradecer".$$,
    $$Expressões comuns são 見るに耐えない, 聞くに耐えない, 読むに耐える, 感謝に耐えない e 遺憾に耐えない.

É uma expressão formal.$$,
    $$Verbo (forma dicionário) + に耐える
Verbo (forma dicionário) + に耐えない
Substantivo (sentimento) + に耐えない$$,
    $$に耐える$$,
    $$に耐える|に耐えない|に耐えなかった|に耐えません|に堪える|に堪えない|に堪えません|にたえない|にたえる$$,
    ARRAY['に', '耐える']::text[],
    ARRAY['に耐える', 'に耐えない', 'に堪えない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-126', $$この作品は大人の鑑賞に耐える。$$, $$このさくひんはおとなのかんしょうにたえる。$$, $$Esta obra é digna da apreciação de adultos.$$),
    ('n1-grammar-126', $$事故の現場は見るに耐えなかった。$$, $$じこのげんばはみるにたえなかった。$$, $$A cena do acidente era insuportável de ver.$$),
    ('n1-grammar-126', $$彼の悪口は聞くに耐えない。$$, $$かれのわるぐちはきくにたえない。$$, $$As ofensas dele são insuportáveis de ouvir.$$),
    ('n1-grammar-126', $$皆様のご支援には、感謝に堪えません。$$, $$みなさまのごしえんには、かんしゃにたえません。$$, $$Não tenho palavras para agradecer o apoio de todos.$$),
    ('n1-grammar-126', $$この本は何度読んでも読むに耐える。$$, $$このほんはなんどよんでもよむにたえる。$$, $$Este livro vale a pena ser lido, não importa quantas vezes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その映画は暴力的な場面が多く、見る____。$$, $$Esse filme tem muitas cenas violentas e é insuportável de ver.$$),
        (2, $$彼の歌は下手すぎて聞く____。$$, $$O canto dele é tão ruim que é insuportável de ouvir.$$),
        (3, $$この論文は専門家の批判____内容だ。$$, $$Este artigo tem um conteúdo que resiste à crítica dos especialistas.$$),
        (4, $$ご協力いただき、感謝____。$$, $$Não tenho palavras para agradecer a sua cooperação.$$),
        (5, $$あの記事は読む____ひどい内容だった。$$, $$Aquela matéria tinha um conteúdo tão horrível que era insuportável de ler.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-126', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に耐えない$$),
        (1, $$に堪えない$$),
        (2, $$に耐えない$$),
        (2, $$に堪えない$$),
        (3, $$に耐える$$),
        (3, $$に堪える$$),
        (4, $$に堪えない$$),
        (4, $$に耐えない$$),
        (4, $$に堪えません$$),
        (5, $$に耐えない$$),
        (5, $$に堪えない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
