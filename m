Return-Path: <jailhouse-dev+bncBDSNT4HYQUIRBJXRYWJAMGQEF242J4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D54FA78E
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 Apr 2022 14:14:31 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id c62-20020a1c3541000000b003815245c642sf7404728wma.6
        for <lists+jailhouse-dev@lfdr.de>; Sat, 09 Apr 2022 05:14:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1649506471; cv=pass;
        d=google.com; s=arc-20160816;
        b=ubwg6FKaEnpm0/2LBJaFS3bvgDOyc5PDm3pS9stqhhzjatgNtGBCfFM7/0xuZ1hQyI
         MrRwbKD8WyT2ZsyenxBlv30d5wuHHn8Is7fxOc3rxjXjO3QW0VqgR5Gmz+Ur6KLPJeGh
         Iz4H0XPT0lDmsJZ3vfvSUXlfz7ToikS69cmbcKirlXHKaBMV8JPouh5cyVlkeHxt4o3D
         ud/BdnOHwIcuNJDz/KtxtToIDuBBOZLEvLRIZj2IH1rQoQaRmEwjt0ZeecxjKtA1kgQu
         Bt91XQuxnu+/fbIBrqSaRDV0GNrYnE62336w9R/+Kwgr/l4sORrnYuornyNsnf/MGBW8
         V52g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=f1X4bKb306GzF7kvJgcr9NpHsEJrdd7tsQLMqcdzwvI=;
        b=QrjUue5yrvR/uc9b4WHpjjbQPjoo3UnWpilAWcM5/Oc4xc4TFS8ClyBv7Vtw2tXPVu
         A2w65CLK2WwlMY7zxTcHmpRlsmMSF5baBzlIjBb9toAPHo55h7M0lTTBRxnSJ7XBmlnH
         JfB/LWueagnE0+aQtmdik6len/kET7A7YygMMfI449LyBjP0JWSUKmHD6FfqWN4gJWGC
         L76bV4jyTUMHg40eP6TiXLHr4kHeWFe1yqZnUNDybjb7In6xpADZZkym07LAsnTphJMN
         5F/d0awxpFb71+DcVt+tK8DlpsUwwU8d04c8ma33mHld+plrJl423q8simE6cYX9h3pC
         0nAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dIaK5YMC;
       spf=pass (google.com: domain of chibuikejoe429@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=chibuikejoe429@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f1X4bKb306GzF7kvJgcr9NpHsEJrdd7tsQLMqcdzwvI=;
        b=cpu5NpUviqpuBEhmkFzzIQ7yVACVOjyp1oIniACPY/t3UT3k/oSA1fFgGMo11POJQc
         fcL7CI9CRDMiGhqgogJO4DK1CdSppqnR/lA/gKTKPv0mtQNY10WpMJvIVGGh5I3ThWE/
         w7lozwiaqZX/ckTNwdxDkz4UnSGxe31z4b/+dYdCUZIUkDWW3jXXsZEfw0qR5cujFltD
         LHbDn8WpBtvatbfwMG4LaflXJWcsZ27cBQ5RfhjvAGT5AFoftpG+inDD6webHkNEhHy0
         j7ZRiNdcIJFdJR5OzTSxCuCnnqP0jX3wGbP53Vhpi8yoh15T6zPil2EUn1tF2/HhLhJl
         IUwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f1X4bKb306GzF7kvJgcr9NpHsEJrdd7tsQLMqcdzwvI=;
        b=UeKDYd6qZffrnsiNrOf617NhC4PhqIq/Yb2JkUADzvYEEAvBkST8Cbcr4QDJAiBD2s
         b3ZSoH7BkP92F38InO124QxDMTSFGaNTO4QLiPxuALTqWxXmKOE76deNro5JfBBoU06x
         k1APGzAo/69qo5HHmN6iX50TkE+B9I6TH2NkBPZfNtBL1yrvt0bRsK/R0/uMRMu7vPSR
         gdxmuP3LIv9kd/XNA2gpS7PIabyMA7LX/aFLSgbrCSZHK9AZuEt01v2BfgZzISjv9POx
         jgB8jomqpyAbJaiHBJVInk5vaxre0O/aIHOi6eH19HAOPf3rkcywNGCOHQptISh/whwH
         NNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:reply-to:from:date
         :message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f1X4bKb306GzF7kvJgcr9NpHsEJrdd7tsQLMqcdzwvI=;
        b=eewg+/bf0psNmIpbsjgI/t8dLZOIB8+3JtagQoqQ1OzR8Uj4QXuDn7IaB9t/aSDfoP
         r2qRe5ncH+Zi0pz0j8qKPriM23wFR58jGmUluyF0N3CoYF85XfsqQUU+tCFv/X9f4rMs
         ZZGf00v7KKhVzXZFXoHmX6RRM+o3KyO+4oa8NdomwqIMuxplSxEbVG7/Av77UqKv1bUj
         DMG23sZ2GN0chojgQa9vQY6AoRzkPQpD01/2fo7+vLlTjr0ZmFW/DFYEW7QlMtc8sBNo
         nryIjxw03Dudu1ZGGC4W58wgdCPN7YTQERJkRTkWtbkv1wcLdsjkhAO/if+NYoAVwtf9
         QulQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532zArSaz3+gk7yoQ3nIX8wUjPIymiNAIMHia1l5De/VplJ7mXrX
	aXnoU23VJ5isQL6StZTQYoc=
X-Google-Smtp-Source: ABdhPJxM+guNDySghuiSBwPFmnFsH5if6bubLTNN4FemxoMG8/pgXr8sSH/UHdlfO1yl4cH7FqQT0g==
X-Received: by 2002:a05:600c:384e:b0:38c:9a8a:d205 with SMTP id s14-20020a05600c384e00b0038c9a8ad205mr20506271wmr.44.1649506471382;
        Sat, 09 Apr 2022 05:14:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:15ce:b0:1f1:dc97:d9c4 with SMTP id
 y14-20020a05600015ce00b001f1dc97d9c4ls1083491wry.3.gmail; Sat, 09 Apr 2022
 05:14:30 -0700 (PDT)
X-Received: by 2002:adf:efcb:0:b0:206:1b0a:5270 with SMTP id i11-20020adfefcb000000b002061b0a5270mr18439439wrp.322.1649506469995;
        Sat, 09 Apr 2022 05:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649506469; cv=none;
        d=google.com; s=arc-20160816;
        b=thEkAimFfzBB0pmVfHnf8A+YmWErP7DrYodvZuLwWLHIuGU57lEwpVLO0vvF3EoC91
         tn5IXeCjr/WFZ57I0wuGhmL9HlIUAIrkSpjF8+Edr5iKpvl17WEA+SVNBxXHJzb0b/ve
         p4GAvP5PW8JEjvCeZZgBBGBw1vZaGU08LmmGAcufkcQLkqvnR5W7pLETd2v/Citbdm+o
         0I0U23gfRXq6PaQLg+VMiJ8bwd6WNbNqlayZooAVB6oL537kKc/vYdTzac0Yff0sr5Se
         gnZ/57ZBtX1B0pB8YLYoUnGD4p2T9lTPgGo9sJuEB3R9GcH1wsY3e1hXdc2g4HGZMSI1
         N+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=KD+7LUh13xay2TU7PrGW0N3xGt/fvIfFeTpBoeANRG8=;
        b=V9L65CMg3i41oSa97eklFu38sCHte8qPBrMWDSHv8CrfqmglOhKS4RlZN5WZdM0v7i
         1h7UvuOFX71VKipmscZTmkrC3oYDwec9PtekJrFxfvHOsVCoqA/Hv/ikVW8YvCkCO5GL
         JTkxLwudqQdBkK9VHj9qJv86yb6DhfZe2m9oFhJ+IrA4ONzMKYfQPOopA+0GgEr9a9Uu
         RPqcTCWWzmd6mMj/WPrGNHO90egfWHvUOiHEIhD6vHNGVd1XVJuaFJsOwk/HizoPSx8h
         L5pPpef6PD2TEBFodOfO8bbNZFYkSvCR9Ut4To8B7ECK30M+iCxkF80/92Fr8nWNgNfz
         AbWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dIaK5YMC;
       spf=pass (google.com: domain of chibuikejoe429@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=chibuikejoe429@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com. [2a00:1450:4864:20::541])
        by gmr-mx.google.com with ESMTPS id a9-20020adfe5c9000000b002079112400asi144073wrn.2.2022.04.09.05.14.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 05:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of chibuikejoe429@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) client-ip=2a00:1450:4864:20::541;
Received: by mail-ed1-x541.google.com with SMTP id q26so12798181edc.7
        for <jailhouse-dev@googlegroups.com>; Sat, 09 Apr 2022 05:14:29 -0700 (PDT)
X-Received: by 2002:aa7:ce11:0:b0:41d:5b84:eecd with SMTP id
 d17-20020aa7ce11000000b0041d5b84eecdmr5015058edv.15.1649506469514; Sat, 09
 Apr 2022 05:14:29 -0700 (PDT)
MIME-Version: 1.0
Reply-To: anhthuong554@gmail.com
From: Joe Chibuike <chibuikejoe429@gmail.com>
Date: Sat, 9 Apr 2022 16:14:17 +0400
Message-ID: <CANP9YKPCQU-nAHRSaq1Fmh7z1cqsjenXtCNnOG=iJM7MnADiLA@mail.gmail.com>
Subject: contact me
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002b95b605dc37a719"
X-Original-Sender: chibuikejoe429@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=dIaK5YMC;       spf=pass
 (google.com: domain of chibuikejoe429@gmail.com designates
 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=chibuikejoe429@gmail.com;
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

--0000000000002b95b605dc37a719
Content-Type: text/plain; charset="UTF-8"

There's something important I would like us to discuss, if you don't mind
reply

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CANP9YKPCQU-nAHRSaq1Fmh7z1cqsjenXtCNnOG%3DiJM7MnADiLA%40mail.gmail.com.

--0000000000002b95b605dc37a719
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>There&#39;=
s something important I would like us to discuss, if you don&#39;t mind rep=
ly</div><div><br></div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CANP9YKPCQU-nAHRSaq1Fmh7z1cqsjenXtCNnOG%3DiJM7MnAD=
iLA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CANP9YKPCQU-nAHRSaq1Fmh7z1cqsjenXtCNnOG%3=
DiJM7MnADiLA%40mail.gmail.com</a>.<br />

--0000000000002b95b605dc37a719--
