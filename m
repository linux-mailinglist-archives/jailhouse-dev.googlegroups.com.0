Return-Path: <jailhouse-dev+bncBC653PXTYYERBL4MWCGAMGQETJOHECI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id A170C44C670
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 18:49:36 +0100 (CET)
Received: by mail-qk1-x739.google.com with SMTP id j6-20020a05620a288600b0045e5d85ca17sf2373665qkp.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Pejgl57p5o+h2W1XdMwgIXa/RtHfTgP1XBen79UJmeE=;
        b=PXKpLGLenhUaPTZAsGQ2KhkXEWkhqdqWcuLuBER+0IchJCOeYofA08yrYp6lArsGVB
         5f4z9eqGmxd86AaJMMrUJpbMaACY/hk42abv8FfhHZX2oTw9qMveXuslaq9AgrLb2pOm
         CQgcobP6W3tRdC6sIpwbO47HfpGKoI3m47e5NMYnBGaVRnW5FOoteiZL6GzO37XIItEm
         1zxNXldNRpWE1mQenkDN1ZgIFe5YZSH4qtp3KmwMsl0s2XgwpA2Ni9WN0NWR4KLk4k2y
         tyDJthE2TNg+jPiyzTVjfhSGXxM6t4fvUpMq6Af59ZJgMx9fQEWsJ/eYKKUbKIeThwSq
         IT7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Pejgl57p5o+h2W1XdMwgIXa/RtHfTgP1XBen79UJmeE=;
        b=YiVioHYY73NCr99Oeah4iEyaYjVQPc3wGEDmb0FJS6BU8DcJZ/BtUoC0LWJMo2Bm8H
         jNIPAVesYhv/CJ2H2hs7v2pL74ntqZEx5aZiVDL+XUsVIyp2FRVj5emwJMa4EQbPuDfR
         dK9Cxyc0wsowO7/xsLLexpmnrhhIXMkR7CtHwKpFm4DLSZQM83l3ZlAHuBottnef5FYP
         zzP6UxDoBoUz1KGBXZWGX3LN06HnUVCA277876UKTx+Jy1NNo8n3EUT7YdtFOSmjgG4b
         kbmwzgzbNRxZT6tH58Ri4vZCYmsYaaX5YN9iPGKhVJaLVvvsWMDXRDJOgaOvtVPHBh9N
         LumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Pejgl57p5o+h2W1XdMwgIXa/RtHfTgP1XBen79UJmeE=;
        b=TIz0LvmpmPnZsv45v53+Vt4YsPHq/p6WRp/b86RSQV10MzJS56vJdKV37LyoIUvSgX
         deyPPGRV3jIxc2TFSzoTwTqTFcezUpT3XSR/hge30A9+d+Nc4VrRv+sHF0FaeTzzRmDV
         vT+UkY1MKtquBgbIEvIPaXIYEJcySO349Ogzmp4TGBh4cu5GSQ+wNDdKyH/+a+plV0MP
         7JXQOAs46KH50mPuQTyWNNmFoXeiU/TSrytYr/CiTMyZGvw/5sQ/nc16YBqqj1SU3Aqo
         CdnFolrOHGmq2XRE9aZOQW395iZqo1IykX67EgbsQ7RsQjwbwLncB31TmSkyqiZcm1vv
         eL7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WEKXKLNh76xCB0egt5X/YtQpVe/RqGoiZ+UiFyai5oLxiGQYI
	eqaXdVarx+osBnc92Yxbngs=
X-Google-Smtp-Source: ABdhPJz2zwVuRC9+zu2E3jIT3Q07CDoqjFY2omJPgi2R8WxAJwP6ag4U9LGCKnCQm2JddSpfokS/Ew==
X-Received: by 2002:a05:620a:24ce:: with SMTP id m14mr993184qkn.212.1636566575746;
        Wed, 10 Nov 2021 09:49:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:e589:: with SMTP id t9ls191519qvm.11.gmail; Wed, 10 Nov
 2021 09:49:35 -0800 (PST)
X-Received: by 2002:a05:6214:27ee:: with SMTP id jt14mr456221qvb.5.1636566575147;
        Wed, 10 Nov 2021 09:49:35 -0800 (PST)
Date: Wed, 10 Nov 2021 09:49:34 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <beed3e8e-09bf-4d9a-9966-e042e982377dn@googlegroups.com>
In-Reply-To: <43bd55d7-a77f-b979-102c-a947f07b8273@siemens.com>
References: <5e84c231-838f-433d-b584-5876c477087dn@googlegroups.com>
 <8717f502-5701-bfaa-2327-cfb6fc99123e@siemens.com>
 <f3c70343-1f25-4540-ad1f-b0831d31dabdn@googlegroups.com>
 <43bd55d7-a77f-b979-102c-a947f07b8273@siemens.com>
Subject: Re: implicit declaration of add_cpu and remove_cpu
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_518_1172976344.1636566574726"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_518_1172976344.1636566574726
Content-Type: multipart/alternative; 
	boundary="----=_Part_519_1652520863.1636566574727"

------=_Part_519_1652520863.1636566574727
Content-Type: text/plain; charset="UTF-8"


>
> >Yes, that is a precondition and likely explains the build error. 
> >In general, reference configurations (kernel, jailhouse) and 
> >integrations can be found in jailhouse-images. Deriving from there is 
> >simpler than starting from scratch. 
>
Yes, I am doing this exactly, but I am trying to extract kernel 
requirement, that jailhouse needs, to be portable on arm64. I was able to 
understand many things, but some deep details are a little bit tricky. 

Best regards, 
Moustafa Noufale 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/beed3e8e-09bf-4d9a-9966-e042e982377dn%40googlegroups.com.

------=_Part_519_1652520863.1636566574727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;">&gt;Yes, that is a precondition and likely explains the build error.
<br>&gt;In general, reference configurations (kernel, jailhouse) and
<br>&gt;integrations can be found in jailhouse-images. Deriving from there =
is
<br>&gt;simpler than starting from scratch.
<br></blockquote><div>Yes, I am doing this exactly, but I am trying to extr=
act kernel requirement, that jailhouse needs, to be portable on arm64. I wa=
s able to understand many things, but some deep details are a little bit tr=
icky.&nbsp;</div><div><br>Best regards,&nbsp;<br>Moustafa Noufale&nbsp;</di=
v></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/beed3e8e-09bf-4d9a-9966-e042e982377dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/beed3e8e-09bf-4d9a-9966-e042e982377dn%40googlegroups.co=
m</a>.<br />

------=_Part_519_1652520863.1636566574727--

------=_Part_518_1172976344.1636566574726--
