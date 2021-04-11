Return-Path: <jailhouse-dev+bncBCF23YV2QAERB6WVZGBQMGQEDXKZWZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3a.google.com (mail-qv1-xf3a.google.com [IPv6:2607:f8b0:4864:20::f3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2A635B141
	for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Apr 2021 05:20:28 +0200 (CEST)
Received: by mail-qv1-xf3a.google.com with SMTP id p5sf5660097qvr.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 10 Apr 2021 20:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IDWE1aJT7fF9CjMPmkvEFOxpajX5vv49FVkXczUKfJc=;
        b=F2tdzTD1FkwZxtBZZ4DwZZZ+bp7N2f2LREIEayOa5CReIRFzAmkc3bgCOA1gF8PoO/
         QoziOjVHVqbB0czFJ855bgJaJOVppGKtyPwNIqksxgmvKH5mgMCLuYWhdzVUpBWl3n0H
         9qTagHUWeSuNVf4iqj2TtufQHHxy7Er/V2cH0qxzVQ8vuu26Bmb7azd+uCcSXGiU5esU
         Fm090fHKmPyXEa2U02d36WqX1i6Vq+ZDXuA0e9xEpfMjHnL7HCCsbZmIWzeZJEfRKb6c
         b4WpkCJ+QHwF555Hi8U7qhU2CYeYBKyBy3HyomxjHais2T25idEXwZksbRmA5XFM0cn7
         MP3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IDWE1aJT7fF9CjMPmkvEFOxpajX5vv49FVkXczUKfJc=;
        b=VHOrEPGTTC8yPz6/vpZp9lvIuhnfIUAIKxapB++SuTCDFT0CsWUG3fV53gAkG066lN
         XHSq4aMw5i2iThGPuRPNQXXpOYvilTMylp0e5D7fH/6ejfS2cFhcP7utzR9ZRGFxFfLQ
         IsKj2s2iCjlfK71x+JS/GoJzp8UT6H+LAjThkeEnG1Aei0dmtMANQRD09dkfVlhjXqXq
         Ru4Sqkru6/3oRBj9LG0NoOVtjEmCICFRA8pYTgyFUIGjA08V8c9Q8hBc0QSNMU1uqU1U
         Tszrri7tRTH+WEZtByAFjxVEG9yt5grxfKxZH5G6ZlkZ8LJ4VY9SkrF9tE5gxrwQqCpT
         m9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IDWE1aJT7fF9CjMPmkvEFOxpajX5vv49FVkXczUKfJc=;
        b=slXJlBr/qIsVtxaltYX8lq/ZS3JfV9u5KTnLSfEz51WOHZhsOSoafmIyrEhEfEYvkQ
         jFQN2HgIOxWvfIy7KTWXQtn8/zXfGXwLZ0gqIt0WUXkhLMWBsZ0U9XSR9t3Y9sTbGhoX
         fNLzxdE4b1TZVEii9ollCjYMzQhmksbwdejbwon2htBxvZILqKEQrIgZ/Hq1OMXMcJ6u
         dfWhc+6eQbTqtOXTUc/ck90VBrTNAKRmUOZq8x2yHJw5rGARTqDQimYs4n0iASVFfWke
         Y6Vn1Igg/vxN6YBA2ENes7VFCRSjkTfRvnpAYKoQ8lIu6Rh1QSDg/myoxRIu8oS8Qbnk
         BCUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+TFRy99iaVVo7pX42XvSdFp9C7+DGu1jCwtwGujGTeabxyqu/
	FpbBP3d4D3Nqp8FG3jLrxn8=
X-Google-Smtp-Source: ABdhPJyvENEWuX7mRr/hvraNE6Gsx9BTRe6RI87AhJPVV7a0NCUKFSsjHOMMCBfRBQgOXxWUMot8Ig==
X-Received: by 2002:ae9:c011:: with SMTP id u17mr21558184qkk.2.1618111227242;
        Sat, 10 Apr 2021 20:20:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:400e:: with SMTP id h14ls7419524qko.11.gmail; Sat,
 10 Apr 2021 20:20:26 -0700 (PDT)
X-Received: by 2002:ae9:e201:: with SMTP id c1mr7977193qkc.307.1618111226527;
        Sat, 10 Apr 2021 20:20:26 -0700 (PDT)
Date: Sat, 10 Apr 2021 20:20:25 -0700 (PDT)
From: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <96f74988-49c2-45b7-be31-67bf46c75cedn@googlegroups.com>
Subject: How to build jailhouse in Raspberry Pi 4b
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7320_1233116013.1618111225788"
X-Original-Sender: zhuzhuzhuzai@gmail.com
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

------=_Part_7320_1233116013.1618111225788
Content-Type: multipart/alternative; 
	boundary="----=_Part_7321_49898711.1618111225788"

------=_Part_7321_49898711.1618111225788
Content-Type: text/plain; charset="UTF-8"

I just want to build jailhouse in my Raspberry Pi 4b which is supported 
arm64. If jailhouse is support Raspberry Pi 4b arm board now? If there is 
any page for how to build it in Raspberry Pi? Can some one help me ? Thanks 
very much!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/96f74988-49c2-45b7-be31-67bf46c75cedn%40googlegroups.com.

------=_Part_7321_49898711.1618111225788
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just want to build jailhouse in my&nbsp;Raspberry Pi 4b which is supporte=
d arm64. If jailhouse is support Raspberry Pi 4b arm board now? If there is=
 any page for how to build it in Raspberry Pi? Can some one help me ? Thank=
s very much!

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/96f74988-49c2-45b7-be31-67bf46c75cedn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/96f74988-49c2-45b7-be31-67bf46c75cedn%40googlegroups.co=
m</a>.<br />

------=_Part_7321_49898711.1618111225788--

------=_Part_7320_1233116013.1618111225788--
