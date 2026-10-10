-- n1-grammar-29 — 〜がましい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-29',
    'grammar',
    'N1',
    $$〜がましい$$,
    $$gamashii$$,
    $$Que soa como / Com jeito de / Parece$$,
    $$がましい é um sufixo que indica que algo parece ou tem o tom de algo, geralmente de forma negativa ou excessiva. Equivale a "que soa como" ou "com jeito de".

Por exemplo, 言い訳がましい significa "que soa como desculpa", 恩着せがましい significa "que joga na cara o favor feito" e 押し付けがましい significa "insistente".

É usado para criticar uma atitude ou maneira de falar.$$,
    $$Só funciona com algumas palavras fixas, como 言い訳がましい, 恩着せがましい, 押し付けがましい, 未練がましい e 催促がましい.

O tom é sempre de crítica.$$,
    $$Substantivo / Verbo (forma ます sem ます) + がましい
Substantivo + がましい + Substantivo$$,
    $$がましい$$,
    $$がましい|がましく|がましさ$$,
    ARRAY['がましい']::text[],
    ARRAY['がましい', 'がましく', 'がましさ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-29', $$言い訳がましいことは言いたくない。$$, $$いいわけがましいことはいいたくない。$$, $$Não quero dizer nada que soe como desculpa.$$),
    ('n1-grammar-29', $$彼の恩着せがましい態度が嫌いだ。$$, $$かれのおんきせがましいたいどがきらいだ。$$, $$Não gosto da atitude dele de jogar na cara os favores que faz.$$),
    ('n1-grammar-29', $$押し付けがましいアドバイスは困る。$$, $$おしつけがましいアドバイスはこまる。$$, $$Conselhos insistentes são um incômodo.$$),
    ('n1-grammar-29', $$別れた恋人に未練がましく電話した。$$, $$わかれたこいびとにみれんがましくでんわした。$$, $$Liguei para a ex de um jeito que mostrava que eu não tinha superado.$$),
    ('n1-grammar-29', $$催促がましくて申し訳ありませんが、お返事をお待ちしています。$$, $$さいそくがましくてもうしわけありませんが、おへんじをおまちしています。$$, $$Desculpe se parece cobrança, mas aguardo sua resposta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅刻の理由を言い訳____説明した。$$, $$Explicou o motivo do atraso de um jeito que soava como desculpa.$$),
        (2, $$彼は恩着せ____ことばかり言う。$$, $$Ele só diz coisas jogando na cara os favores que fez.$$),
        (3, $$押し付け____ようですが、この本を読んでください。$$, $$Pode parecer insistência, mas leia este livro.$$),
        (4, $$いつまでも未練____考えるのはやめよう。$$, $$Vamos parar de pensar nisso com apego para sempre.$$),
        (5, $$差し出____ことを言って、すみません。$$, $$Desculpe dizer algo que soa intrometido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がましく$$),
        (2, $$がましい$$),
        (3, $$がましい$$),
        (4, $$がましく$$),
        (5, $$がましい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
