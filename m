Return-Path: <jailhouse-dev+bncBCWL5HFL4MBRBY55YK2QMGQEZWL4V4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8899C9478AC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2024 11:44:05 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-e0bcd04741fsf8612880276.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2024 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1722851044; x=1723455844; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK9gAb9x8uZGheWokaM0PFZr5Z9CHR9nByFiguEQqrk=;
        b=S7u3hTzWQ0PJ794FSaYkrfUqFI8YNAOoaUXr1cj26Kb3iZXO6jQP5WZs2Tvfl+nN6X
         23xeSr9CTsRFSjZDHrlZ/F5z+LJrHqhjQo+6gQVGlckw3lnbLAp76PMgnNy7GoCEL+ST
         uI06gylPIGp/087HzVxzwDuuRbr+OApBAO5vxAvlqjxlnaj5S/y8OWqMfEiufRySdjeQ
         ZZEB5N7g/UE5suJ+q5vYWcMCPyHHXAzZKGuIcreGsQgDN2jFGDOLslRlD2wjteRepikn
         L17UHoDUA9RqXhEHAUXfGXHncFmhkhw+Hh4xGBZ4xF+2BGjbv4ZkrB3XKnTMztBbgjFu
         dh6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722851044; x=1723455844; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VK9gAb9x8uZGheWokaM0PFZr5Z9CHR9nByFiguEQqrk=;
        b=LBfzooDDxKoqByooPMuVYyEWKknPHelAmNusJ9Imf12A6G8qLUWyiyUEYbrdfiXaAy
         Z5b9hV5K2HnscJWWvJe0I4S3Udutcr5TphEo59VZoTsXOaMhzrTwqINPuUIAoH40cAy4
         aRnUjKBhs6PhaYdVzBBRPGtW3Q5JkimSILFDEOsu2oGOOurr6+30AYiSQO14x6P6aHMJ
         m/W+2paM5iCXoy8o7l64jVR74FM4PSVQYp0jcbNWh1sYAtODl/KMSllc3dhn98wUT4Zl
         md4V1msmtVAVwfgtl+h4Vi804fDXNYbTJuvkRAh406Fm+u7L9Hhdrv2IDtjDxX9ZHX4s
         eu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722851044; x=1723455844;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK9gAb9x8uZGheWokaM0PFZr5Z9CHR9nByFiguEQqrk=;
        b=PwOr+chZ2QConsATIO8xzy2ES9+5ywrnbn25cpm+eU3O20jyCKovShLpFC5mZc1F34
         qvLq+RMv55opxXHz9Pbdp/XfW0K/9zFrCmaoBJMQCjd/p0wMD62J+N0FFyReZc3N2DH4
         fLEFMqGDWM0IyZ79PAGvK0cdkIE9iKYysIh0RNpWJhSUwupdf1arcTFofpYiMGyn21o0
         lqXXjKPMWJgFigkNBC0+/gLfLUdlTLLiH9nA2kbMljyJXETWfQzMIy10WvwpBSn9IRq9
         lXOuFUvPXMOr9gcFmENEppGvDu7feDJbe2tpKhK8DRRsTMtKIXaetTC3QPc36uBaC1Wg
         8qaA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXekCgyH04Zc3b1xPSiZw8gw8NR97o5FQ9LtvZU0WLys+wzvg4zpK5bH4jmN9ZZpoXskNovuUV3m68MaIFeqsYEQnP+VCPPBP+NHMQ=
X-Gm-Message-State: AOJu0YyBMwFwVeQN2f6ydS4a5vcj/T8OTN40clhSqnlJX4LAdWmiScSW
	nXU9jeAqWeS6ALs75iVofKLPtzyGYc3EsRVDbvun4h9Qtl1G5rOO
X-Google-Smtp-Source: AGHT+IEK7a+/Pvlv/51xZpw/kYte88fe2OogXN1IRlfRzMTbMfAtYe3tDLX+adUiDsgaJGFg0jcyFQ==
X-Received: by 2002:a05:6902:18d6:b0:e0b:2c11:bc4 with SMTP id 3f1490d57ef6-e0bde2d171cmr15114659276.6.1722851043903;
        Mon, 05 Aug 2024 02:44:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1881:b0:e0b:e0cd:e2af with SMTP id
 3f1490d57ef6-e0bf4c3083als298950276.2.-pod-prod-09-us; Mon, 05 Aug 2024
 02:44:02 -0700 (PDT)
X-Received: by 2002:a05:690c:714:b0:650:a16c:91ac with SMTP id 00721157ae682-68963bd9370mr2827807b3.8.1722851042627;
        Mon, 05 Aug 2024 02:44:02 -0700 (PDT)
Date: Mon, 5 Aug 2024 02:44:01 -0700 (PDT)
From: smith baron <baronsmith294@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <66c872d5-4678-458e-8489-a6c900ac5c9cn@googlegroups.com>
Subject: BUY DMT POWDER ONLINE / DMT VAPE CARTS FOR SALE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_477694_417863299.1722851041843"
X-Original-Sender: baronsmith294@gmail.com
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

------=_Part_477694_417863299.1722851041843
Content-Type: multipart/alternative; 
	boundary="----=_Part_477695_21978414.1722851041843"

------=_Part_477695_21978414.1722851041843
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/dannyw23official

Don=E2=80=99t mix. Do not mix DMT with alcohol or any other drugs buy 5 meo=
 DMT

https://t.me/dannyw23official

Positive mental state. Be sure to pick the right time to use DMT =E2=80=93 =
when you=20
are in a positive place and state of mind

https://t.me/dannyw23official

DO NOT use DMT if you are taking antidepressants, have a heart condition,=
=20
or have high blood pressure

What is DMT?

Have you ever longed to disconnect from the outside world and get buried in=
=20
your thoughts?

Dimethyltryptamine (DMT) is a naturally 5meo dmt for sale hallucinogenic=20
tryptamine substance that has been utilized for generations in religious=20
shaman ceremonies and rituals. It=E2=80=99s also called as the =E2=80=9Cspi=
rit molecule=E2=80=9D=20
because of its powerful psychedelic effects, which can =E2=80=A6

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/66c872d5-4678-458e-8489-a6c900ac5c9cn%40googlegroups.com.

------=_Part_477695_21978414.1722851041843
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/dannyw23official<br /><br />Don=E2=80=99t mix. Do not mix DMT =
with alcohol or any other drugs buy 5 meo DMT<br /><br />https://t.me/danny=
w23official<br /><br />Positive mental state. Be sure to pick the right tim=
e to use DMT =E2=80=93 when you are in a positive place and state of mind<b=
r /><br />https://t.me/dannyw23official<br /><br />DO NOT use DMT if you ar=
e taking antidepressants, have a heart condition, or have high blood pressu=
re<br /><br />What is DMT?<br /><br />Have you ever longed to disconnect fr=
om the outside world and get buried in your thoughts?<br /><br />Dimethyltr=
yptamine (DMT) is a naturally 5meo dmt for sale hallucinogenic tryptamine s=
ubstance that has been utilized for generations in religious shaman ceremon=
ies and rituals. It=E2=80=99s also called as the =E2=80=9Cspirit molecule=
=E2=80=9D because of its powerful psychedelic effects, which can =E2=80=A6<=
br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/66c872d5-4678-458e-8489-a6c900ac5c9cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/66c872d5-4678-458e-8489-a6c900ac5c9cn%40googlegroups.co=
m</a>.<br />

------=_Part_477695_21978414.1722851041843--

------=_Part_477694_417863299.1722851041843--
