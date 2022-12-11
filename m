Return-Path: <jailhouse-dev+bncBCDKHIWT5EIBB7P726OAMGQE7BRY5JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id BA94D649507
	for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Dec 2022 17:06:22 +0100 (CET)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-3cf0762f741sf106544147b3.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Dec 2022 08:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYlccTpNV+ANzL1p4x7ReGQNPpNOpFzgpdUgBUnOcFo=;
        b=JDroWDtV2MdmJG+HixD31Sd/RrkY4Z/ZwUe2CFDUv9RrZp6b+NH1ZhcrOv/zQwJAPt
         rBHBEOgED03rEMv1o6HfAYjS4XY2PblV0Y3BcgcSFlh6q1mhA3pmS790Vyx0fp6xo7qT
         bN+pUhpwjWltG7uzDhonWW13SRhSw333FIf6Lw+JChdpvtw7jLDqHFW/AeDpQqONVAqZ
         ijBs0KuvErRzf1cIVTl9CwMkmIusbZwuAlPW/iPoV9cBAiatztULgP507Jf7AtkuqLc1
         e2v4h09hIgKZJ7OIO8HhP8SX+kxMSN4LttgUshr1FwdXq22YBSIz0fswz5FNZHCTMxux
         K5rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYlccTpNV+ANzL1p4x7ReGQNPpNOpFzgpdUgBUnOcFo=;
        b=SQ6oETaS9Ih0eQRTQ3tseWjWdgu8ELoOBGBp4rzlmFpZ6EI2lu8B5aWbxPtVASu2oR
         f3DbuVyhf+ZaArTtkZqDdXrsGeie2Z8YyoE8ZSVE5LdAaDOZqXQxvJqsLrN5/m+G1eFm
         yfQ+1PGf2f++m0AKzdSowj3PtusrOSBocdnC24q5K7gPleJmfUmSrTd9Sr0K7WKYWChj
         9tSGdEgPwJfN6K6JJEF+88ofBbAdNc7lkmuV8fHPnInc0JEhtu5ROLc/RAvcWpyyBas6
         lDC2ac45Jm7bDnMye8ujxXSqO305Duo+EYYZuDpSiOoUpa3R49PnShfmjdY+aMdanmwa
         GUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYlccTpNV+ANzL1p4x7ReGQNPpNOpFzgpdUgBUnOcFo=;
        b=Ap1+aN9ZOvSLWwRpa13ZPOlxyFaR3fR3hNyB1D3WdnTDQEOmjvqipzBSxeMXEvN5Ri
         CgEiB5a5iMOpUUJE/tllzB9moIQYkOMiZdNhA0hFzzz4wK0BB68EYpIxEjIIaPO86JuP
         SKDUp+q6vntPl1JqosLymrc7i0DDz+kRDz5PrCAG6zl3ARkHIv/kma2vFHviE/+WXXXn
         C3QgamvXolJ/gFEGtvPL4qKJo/3Iyk87yHPCBhI3fq9ogYjTfRVIenfi2K0o6VZTqAQT
         Q3MiJupRmdC3kVRaS3muHEQTdC//9k6N4iPuhUoOw00oSR9VTSTuhJPHDqHODB19/TR0
         yeHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pmGHBVDdGRX2GCmpUEAGqBgmEi6GfDIQKq3f8XNJUBfmYdvjlda
	5Jeo6U6CK1B9Us4C+42ucpg=
X-Google-Smtp-Source: AA0mqf5p8QoPq7jjnayxJMKqN6SkmoW19hCUzC31V6uyCamlCor0fBmWlMgqnATQSz9+G7psZPJICQ==
X-Received: by 2002:a81:ae07:0:b0:378:42d5:faed with SMTP id m7-20020a81ae07000000b0037842d5faedmr26478834ywh.73.1670774781477;
        Sun, 11 Dec 2022 08:06:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:9b47:0:b0:360:d89f:2b52 with SMTP id s68-20020a819b47000000b00360d89f2b52ls7393259ywg.2.-pod-prod-gmail;
 Sun, 11 Dec 2022 08:06:20 -0800 (PST)
X-Received: by 2002:a81:3c7:0:b0:3eb:447b:56cc with SMTP id 190-20020a8103c7000000b003eb447b56ccmr19851512ywd.296.1670774780544;
        Sun, 11 Dec 2022 08:06:20 -0800 (PST)
Date: Sun, 11 Dec 2022 08:06:19 -0800 (PST)
From: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2490e851-5d1b-4608-b7b9-d960dc2cb714n@googlegroups.com>
Subject: Question: IVSHMEM Inter-cell communication
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6214_1324098057.1670774779970"
X-Original-Sender: j.jyaming@gmail.com
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

------=_Part_6214_1324098057.1670774779970
Content-Type: multipart/alternative; 
	boundary="----=_Part_6215_686890899.1670774779970"

------=_Part_6215_686890899.1670774779970
Content-Type: text/plain; charset="UTF-8"

Hi,

Recently, I have used inmate-demo(inmates/demos/ivshmem-demo.c) and 
ivshmem-demo(tools/ivshmem-demo.c) on rpi4 to study how to communicate 
between two cells. I have following problems:

1. I found this result, However, I'm not sure it is correct. The 
inmate-demo's Privileged Control=0 and the ivshmem-demo in root-cell, 
Privileged Control=1 ?

2. In ivshmem-demo. If I want to change the Privileged Control, What should 
I do? What means, how to open/close one-shot interrupt mode?

Thanks,
Jiaming

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2490e851-5d1b-4608-b7b9-d960dc2cb714n%40googlegroups.com.

------=_Part_6215_686890899.1670774779970
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div>Recently, I have used inmate-demo(inmates/demo=
s/ivshmem-demo.c) and ivshmem-demo(tools/ivshmem-demo.c) on rpi4 to study h=
ow to communicate between two cells. I have following problems:<div><br></d=
iv><div>1. I found this result, However, I'm not sure it is correct. The in=
mate-demo's Privileged Control=3D0 and the ivshmem-demo in root-cell, Privi=
leged Control=3D1 ?</div><div><br></div><div>2. In ivshmem-demo. If I want =
to change the Privileged Control, What should I do? What means, how to open=
/close one-shot interrupt mode?</div><div><br></div><div>Thanks,</div><div>=
Jiaming</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2490e851-5d1b-4608-b7b9-d960dc2cb714n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2490e851-5d1b-4608-b7b9-d960dc2cb714n%40googlegroups.co=
m</a>.<br />

------=_Part_6215_686890899.1670774779970--

------=_Part_6214_1324098057.1670774779970--
