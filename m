Return-Path: <jailhouse-dev+bncBDKOFDFS5IKBBVNXV2RQMGQE7Y3WJCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 854EC70C3AD
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 May 2023 18:44:07 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id 38308e7fff4ca-2af23cfd23asf17447631fa.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 May 2023 09:44:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684773847; cv=pass;
        d=google.com; s=arc-20160816;
        b=GHjj07hnBE9V6xMHM1gbjTEgQXD2AwMpjXg7xruZc71b0cDkgazLrZb2U31AZQu4Oh
         JUOpdFgWqKAOGvpilZMUJtGJBHYlu9oGSG1unRKRxAoKlVi4mxXFpRi9EZ05nsTHkyWo
         D5IKkOtJCvbAH9/XV4kIJ1WlqcuJTZUEumc3Lm3XO+g8IxTe1HVzSNrLMtkIgvIag6VQ
         TPtp+8AfWRbu05tZn1C2Yb7VteQrAZNCpDWM0WZD4p9VfWTTLh+G2FAWDKDkB9g1swnP
         xVhQUbdElWkHvPfDyulOaQu+7TC9z3/fr2z495VKKADY7XGjhSuIuaUwaiJDevt4Xndy
         6wgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=k1iZfoNWg8TVKqHbO1J1Zx1gVDIjtgdF9zS6AfD+z6I=;
        b=jLgkm63HK15TTHHK6hL9Ql8DGptO7t9ljXrRRKbTMpgzPBYwZj3azFImijdeVIZ+sb
         A8rRENocDRjhuy5xRrOHnVV8WrsvmX/ec0fzQ4WHhTeIUbyC0x/gdY+Tcf16+dRpYs7+
         HLMHsueqaCm4wQQZsrXhjIHJVeq9+txBnp/F+dJOKHrs6R8hEioKV0eILR1CNVoOgxvH
         Y+tXk2q4uRTaDgfFkv8TPxdtiiVHFCRZABU44koivaalO1KyscruMVbVy1EkR1/hoUjO
         w56J4NHiDn8en/GF5edUKhi9bS0xPs4WH2LbVDY6lYAFeJWnMD/ZrwjJSJsE0QE5eUCf
         cuwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=FUGW8uN0;
       spf=pass (google.com: domain of tributariadelegacia@gmail.com designates 2a00:1450:4864:20::42b as permitted sender) smtp.mailfrom=tributariadelegacia@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684773847; x=1687365847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:reply-to
         :mime-version:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k1iZfoNWg8TVKqHbO1J1Zx1gVDIjtgdF9zS6AfD+z6I=;
        b=rPQOPjiRsg+8SHDUHP6AFKpCcLAbvZL3kCeka7ptt3H5QHPe97++yMv1gaR/uf+Tyu
         7oTvnovYBhyZU7XW4fu/EE9qc4yPOhJSR48nZkOzHsJvLqrOdOOv7tEMIsiY/HS9fMob
         GWmBHbpZDrgzSFjnxWOJmflfpg6KDtDv2yA+YgkfF504oMGRPWjF+LUx8LpqXEY2uPHd
         mfFJ28ngzqaP1SKO90YCUhxUPc+PjfZyS0709gt3QsZ3bA22G1e0Ewi1yDcqhm+bnpc/
         JsqXlDHL3DQZZIhyJvKBsFPuEztnJNgTBt8o7QkcBrkNt+G/Tv8tOpGf7GmSU1uTdmfx
         YIYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684773847; x=1687365847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k1iZfoNWg8TVKqHbO1J1Zx1gVDIjtgdF9zS6AfD+z6I=;
        b=iv9bgDKy8/luaFSJvj0H1hDjVhZbeVPrC49CuplHjuVBfmgWgy8yN+wRWmwhEFJn6E
         R6EylYbzj/vzfmvWWDXH8SdBZdKBOgXoObVmDTLC4UJjangJ4D+WWtmv2kjZ0JMIWTFl
         b77G66VYbwnERZdjeKKvME1JoaI2Ed24mYDIxs0IxfwHc9daiTlbulkkyV8QQI1hDbyS
         YQbMQlliEma+Zw5RQ95con2UC+MOiLi9FwifUgQH24TLc4acZYr0ASjylFUW+BTgQDhF
         VsKwV6mFmOSq5isxA9c2e1be6vQpv27B1tfYRIwKvxRZw7QldGiq3r+HnOYvDTbchpIk
         aBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684773847; x=1687365847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:reply-to:mime-version:x-beenthere
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1iZfoNWg8TVKqHbO1J1Zx1gVDIjtgdF9zS6AfD+z6I=;
        b=UH/dSbO2DcxNKGU49MCKObETPu9/ZkGO0bZiNe9rlos9zUcHutU8jekqBO+MmZFPDZ
         rVD+TKHX7m0thIuJZiynGOArajvmFMdPytPzWQQm66PINaAmxIKwPQ2qc/nz9ZpA1m9A
         14rYdG0e2va8+L7LLIvQU75E5xc1QIEBzQuF8AMyV8HQygMVGluQ0t9zjqlqLqH0zbYd
         3PW1fwJlFgyY1IwRibgSRm33BsY/9nISu7oLWQplQT46sACkzCo9ST0eqNDNVdsNUz0x
         QJ+CDIUYOGdN1x1b0UaRvjfrxJ/8G9AT39wklh5+Tg1uX3P7PwkEc0S+EusSK/AC1MA6
         U46A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDy8YpS7qlmVya55qDFiVBLNeZ8beuhp26BZmbJnXvigqsrFv+iZ
	DZg7tw9xJwG2/aDabfgb4Hw=
X-Google-Smtp-Source: ACHHUZ6SwoNQcqdDYfPPAgVokQ1QN+jgCmYKoBj9/J5biluQN8c9Al+cXBSIOwf2luLoxjxRDqhu4w==
X-Received: by 2002:a2e:7811:0:b0:2ac:771b:ca4a with SMTP id t17-20020a2e7811000000b002ac771bca4amr2735919ljc.9.1684773846306;
        Mon, 22 May 2023 09:44:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:381b:0:b0:4f0:9517:7dff with SMTP id f27-20020a19381b000000b004f095177dffls208584lfa.0.-pod-prod-02-eu;
 Mon, 22 May 2023 09:44:04 -0700 (PDT)
X-Received: by 2002:ac2:5d64:0:b0:4ef:f1f4:14db with SMTP id h4-20020ac25d64000000b004eff1f414dbmr3099066lft.16.1684773844531;
        Mon, 22 May 2023 09:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684773844; cv=none;
        d=google.com; s=arc-20160816;
        b=UCDMK2uft7oGCHZz6OwXq0J334XMleUesiORUYwi+P3cvDCeRQ/RB5NgH2qdQihfCj
         +vaYFC7GSH90Iq7ucS7zUR0MWUmGKI70hJkn6pCR6CYfmXAliOLUwZX8wenaivGqWWJx
         0JpoWzLnJ4icfsVTkVDV3I0fbJmOTLWvvlqXkGL6HsIi9kZQxAVt9GM6MlWhDNozOQ2V
         yAKVpDH0Nys/OmySZUI1haJOs89EDbjUTBbH6Wv+16HrZ7HHGYrox195yIySD1CDGpVO
         GYU/FwcjygBPf8LJ0XhrNzdRyNlpBPB4GXwA9x/eG6XJgkVcCfIuEaI1kYSPNVaRBqjp
         L2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=ttxWxg4NmNLMMEC75APAPWoDx3ADt6AlWkuCb4WpZKw=;
        b=YBe3CR1yyWeryrCHRB5BUNLQtTDC1sQe7zbDf/6mVNWA7Ypk4JUFa9iAVkQFhZ8MiO
         fS2xM+Hnfm6+J77YaTmHQrZJ8yGGJX02glwPfKWR8VxsbcX2rX+RfN0ZdbsxuOSnhjkk
         2v3DTj7zeZAqziFpEBYZLYRCqYmab09jDws4gX9uJXHivGc3peeteZBJsmyzz3uDGbg7
         dMLJHD0q3x1sug3A7lsBz9VeKMRXoxi4bQOKzz+DV70GdHAqWxXgWCKwWO5NGVVQ+b55
         VibHIdN7anLOhTgtyQVXCbJ4skMS7+Jb0IP3cYnsUiS/YUXHtgbtJRnHRfGWc5SGqDCe
         JoLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=FUGW8uN0;
       spf=pass (google.com: domain of tributariadelegacia@gmail.com designates 2a00:1450:4864:20::42b as permitted sender) smtp.mailfrom=tributariadelegacia@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com. [2a00:1450:4864:20::42b])
        by gmr-mx.google.com with ESMTPS id d24-20020a0565123d1800b004f2538cbe55si488136lfv.1.2023.05.22.09.44.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 09:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of tributariadelegacia@gmail.com designates 2a00:1450:4864:20::42b as permitted sender) client-ip=2a00:1450:4864:20::42b;
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-309553c5417so3633845f8f.2
        for <jailhouse-dev@googlegroups.com>; Mon, 22 May 2023 09:44:04 -0700 (PDT)
X-Received: by 2002:adf:e912:0:b0:309:3bb5:7968 with SMTP id
 f18-20020adfe912000000b003093bb57968mr9548212wrm.16.1684773843589; Mon, 22
 May 2023 09:44:03 -0700 (PDT)
MIME-Version: 1.0
Reply-To: monika-herzog@hotmail.com
From: Monika Herzon <tributariadelegacia@gmail.com>
Date: Mon, 22 May 2023 16:43:48 +0000
Message-ID: <CAA4doa+SP+AtbLJ4u14qkaCxiKHj5DG=qTBy6F3U7xMcEJ2j-A@mail.gmail.com>
Subject: Re; May the grace of God be with you
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000795f6a05fc4afa6e"
X-Original-Sender: tributariadelegacia@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20221208 header.b=FUGW8uN0;       spf=pass
 (google.com: domain of tributariadelegacia@gmail.com designates
 2a00:1450:4864:20::42b as permitted sender) smtp.mailfrom=tributariadelegacia@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

--000000000000795f6a05fc4afa6e
Content-Type: text/plain; charset="UTF-8"

God bless you.

May the grace of God be with you, My name is Monika Herzog, I want to know
if you received the email I sent you,

If you didn't receive the email, reply to me so I can resend it, because I
have something very important to discuss with you, which will be very
meaningful for you and for the people around you.

stay blessed
Mrs. Monika Herzog

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAA4doa%2BSP%2BAtbLJ4u14qkaCxiKHj5DG%3DqTBy6F3U7xMcEJ2j-A%40mail.gmail.com.

--000000000000795f6a05fc4afa6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">God bless you.<br><br>May the grace of God be with you, My=
 name is Monika Herzog, I want to know if you received the email I sent you=
,<br><br>If you didn&#39;t receive the email, reply to me so I can resend i=
t, because I have something very important to discuss with you, which will =
be very meaningful for you and for the people around you.<br><br>stay bless=
ed<br>Mrs. Monika Herzog<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAA4doa%2BSP%2BAtbLJ4u14qkaCxiKHj5DG%3DqTBy6F3U7xM=
cEJ2j-A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAA4doa%2BSP%2BAtbLJ4u14qkaCxiKHj5DG%=
3DqTBy6F3U7xMcEJ2j-A%40mail.gmail.com</a>.<br />

--000000000000795f6a05fc4afa6e--
