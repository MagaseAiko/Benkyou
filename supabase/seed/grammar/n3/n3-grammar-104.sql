-- n3-grammar-104 — さて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-104',
    'grammar',
    'N3',
    $$さて$$,
    $$sate$$,
    $$Bem / Então / Agora$$,
    $$さて é uma palavra usada para mudar de assunto, começar algo novo ou passar para a próxima etapa. Equivale a "bem", "então" ou "agora".

Ela aparece muito no começo de frases, em três situações principais:
• Começar algo: em aulas, reuniões e discursos, para iniciar o assunto principal.
• Passar para o próximo ponto: depois de terminar uma parte, para ir à seguinte.
• Falar consigo mesmo: quando a pessoa está decidindo o que fazer, como "bem, o que eu faço agora?".

Em cartas e e-mails formais, さて aparece depois das saudações iniciais, para introduzir o assunto da mensagem.

O tom é neutro e serve tanto para situações formais quanto informais.$$,
    $$Em cartas formais japonesas, a estrutura tradicional é: saudação de estação do ano, depois さて, e então o assunto principal.

さて é diferente de ところで, que muda de assunto de forma mais repentina, como "a propósito".

Falado com uma pausa, さて… soa como alguém se preparando para agir.$$,
    $$さて、 + Frase (início / mudança de assunto)
さて、 + Pergunta para si mesmo (どうしようか)$$,
    $$さて$$,
    $$さて$$,
    ARRAY['さて']::text[],
    ARRAY['さて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-104', $$さて、今日の授業を始めましょう。$$, $$さて、きょうのじゅぎょうをはじめましょう。$$, $$Bem, vamos começar a aula de hoje.$$),
    ('n3-grammar-104', $$さて、次の問題に移ります。$$, $$さて、つぎのもんだいにうつります。$$, $$Agora, vamos passar para a próxima questão.$$),
    ('n3-grammar-104', $$食事も終わったし、さて、帰ろうか。$$, $$しょくじもおわったし、さて、かえろうか。$$, $$Já terminamos de comer, então, vamos embora?$$),
    ('n3-grammar-104', $$さて、これからどうしようか。$$, $$さて、これからどうしようか。$$, $$Bem, e agora, o que eu faço?$$),
    ('n3-grammar-104', $$皆さん、こんにちは。さて、本日は新商品を紹介します。$$, $$みなさん、こんにちは。さて、ほんじつはしんしょうひんをしょうかいします。$$, $$Boa tarde a todos. Bem, hoje vamos apresentar um novo produto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$皆さん、そろったようですね。____、会議を始めます。$$, $$Parece que todos chegaram. Bem, vamos começar a reunião.$$),
        (2, $$前置きはこのくらいにして、____、本題に入りましょう。$$, $$Chega de introdução. Agora, vamos ao assunto principal.$$),
        (3, $$____、何から始めようかな。$$, $$Bem, por onde será que eu começo?$$),
        (4, $$宿題が終わった。____、ゲームでもしよう。$$, $$Terminei a lição. Bem, vou jogar um pouco de videogame.$$),
        (5, $$お待たせしました。____、次は皆さんお待ちかねの抽選会です。$$, $$Obrigado pela espera. Agora, o momento que todos esperavam: o sorteio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-104', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さて$$),
        (2, $$さて$$),
        (3, $$さて$$),
        (4, $$さて$$),
        (5, $$さて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
