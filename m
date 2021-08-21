Return-Path: <jailhouse-dev+bncBCDKXZOSXMDRBJWEQSEQMGQEVMS5QYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 226A93F3B49
	for <lists+jailhouse-dev@lfdr.de>; Sat, 21 Aug 2021 17:56:24 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id e3-20020ac80b030000b029028ac1c46c2asf6586674qti.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 21 Aug 2021 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CYremgD6TjlqLiCr/JOuXrUHJ8h/HEbM6fApeD81E/0=;
        b=EdlJwgbMKgt5L/SQNfmm8d6tIVJvzLoHOT0Dkdvp510GFkGB7II5aD3qUvkQ8dBBjI
         6r6PTr/kXeOyd4AO1Zn934lSv87cmp1Xr60AfrYe9433WxRqtakdYOW+Bf9vsEait30y
         VC5QHvrgDoVr1nxGt0ktCcN3nxUSzUcixdt3DKuEC2puwg63daHFq3/u/Grftjoz1ywW
         MzEUN322irZJWnhDBRDhr8TIESb2WQ/JIxl2m/JW1v+aPYI+vitJ+SxGljc6LRHvzFza
         MR3jDchsD6SXmKqAplbiB0oZc5Dny8jmu0xPkBdpOl07lZjb3TDeTEX+PXJPlA0Tl8MU
         rTUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CYremgD6TjlqLiCr/JOuXrUHJ8h/HEbM6fApeD81E/0=;
        b=Vryv5lProdjibttfr3orCzm0IvtbhrlSu97H0sxCkwjALJRsJ8eI1bC9xZQPhi0I0l
         gGtJKpM8GSx/4zo7qMK+ZtKfHTOcJEjJbU+a1C/nQbI4q1j0uyinb2FcKY1VmyFuaRYK
         Y9X8BVtM9nXzd10S/CD7lWTQTnX23SFCejPbHoVJGuV28LuTQW2Tjl2dYeiitNyhrYXj
         y/F5+pYjG5bqt7UjxZRYJMFfty/iPNbMAGJqri0b+5ppVFHazBpW3aIG+MRqLIW1BhbQ
         VxHtvHeHyNrzHe9nRP5TV3ZXVsnyL8i73tfI+j/zo+HzEfcuECbx3SuOP/jvtpbO14lG
         EEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CYremgD6TjlqLiCr/JOuXrUHJ8h/HEbM6fApeD81E/0=;
        b=GJWye+42l5/Qgwn1xBS3/FxxhPhbKtP+V08TuA0T6XrxhX5j1z/pMNd0OVzZukr2be
         ExNlkxfUOHxlWHATugKJoR45/p5dCL2HNjRybFvvYOx884prVDmDiRwJfL2zpq935oro
         GAk+jVcu3yMCtbbTuqyLxh23o0RDEo96kZtWYi4xP95CAMkAMrqZhgrfTKNMaS1uRYKB
         cBmaISo6gqnMtU378sKHwn5rox6HUbp9Sc+WW3XeKR6dn46DYnAlDGA1ciGFpQksCGfJ
         diBI7YNahPguxxV/LJzRU1qODvaJEfEbN18DvbdzEH2TJACgMYJso2UEbrnDSY/IGs/t
         6nMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530UhHxqGD22wGQ9IVHgVeyYK1I6E3GtwL+0Qdtds7sodn2E2vuv
	xMjq+kgmRgJDOS7EIgLVCHI=
X-Google-Smtp-Source: ABdhPJxuoqafMg55JQ0uhSY60+jxDJOX5x+mM0fW/OXVtw2Np6WZC2y/pHxO3GW7fvPMuC4eCP7CSQ==
X-Received: by 2002:ad4:5f06:: with SMTP id fo6mr1709844qvb.32.1629561382929;
        Sat, 21 Aug 2021 08:56:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:c5:: with SMTP id d5ls4040088qtg.1.gmail; Sat, 21 Aug
 2021 08:56:22 -0700 (PDT)
X-Received: by 2002:a05:622a:81:: with SMTP id o1mr22438737qtw.361.1629561382194;
        Sat, 21 Aug 2021 08:56:22 -0700 (PDT)
Date: Sat, 21 Aug 2021 08:56:21 -0700 (PDT)
From: Cri Vitali <cccrrriii95@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <43217b5d-b38f-40ac-91f3-b28178514356n@googlegroups.com>
In-Reply-To: <7b26fdc8-3ea6-4275-9c1e-bc8de873f906n@googlegroups.com>
References: <7b26fdc8-3ea6-4275-9c1e-bc8de873f906n@googlegroups.com>
Subject: Re: Share Memory beetween Linux & FreeRTOS
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5094_878838749.1629561381677"
X-Original-Sender: cccrrriii95@gmail.com
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

------=_Part_5094_878838749.1629561381677
Content-Type: multipart/alternative; 
	boundary="----=_Part_5095_1093939736.1629561381677"

------=_Part_5095_1093939736.1629561381677
Content-Type: text/plain; charset="UTF-8"

Anyone have an idea?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/43217b5d-b38f-40ac-91f3-b28178514356n%40googlegroups.com.

------=_Part_5095_1093939736.1629561381677
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anyone have an idea?<br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/43217b5d-b38f-40ac-91f3-b28178514356n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/43217b5d-b38f-40ac-91f3-b28178514356n%40googlegroups.co=
m</a>.<br />

------=_Part_5095_1093939736.1629561381677--

------=_Part_5094_878838749.1629561381677--
