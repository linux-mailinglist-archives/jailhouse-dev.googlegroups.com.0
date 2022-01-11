Return-Path: <jailhouse-dev+bncBC653PXTYYERB6X36WHAMGQEAXL665Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3175F48ADF4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 13:54:19 +0100 (CET)
Received: by mail-qv1-xf3b.google.com with SMTP id u2-20020ad45aa2000000b00419428ca0cbsf666067qvg.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 04:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ArlZszxA9LATYGtsUT6ury7l5T/74Vu+Cm3Gr3WhBA8=;
        b=m4lGkK00d36B65WjB8kxRdheccJdgYyCupmJIoRaRrKvVDlqv+Voe8pNNQDkmT3iof
         NBS0/7YO+3AbjgkLm73Ae/Aa1j41CVC3JcSF8mZ0JiX4YXH69YLTasomX1T09VvphIBR
         y21IysKCwJZq58w/iN67SLaKL2kLq0ODGa1WrrSHy7Gajy2e02dDxJ5DxRsSuuHdchCZ
         9CFC4exliWdwQQV+1HtQBVTjRCZm0AVy7XYtVNj0+PEwEqv634wlcOctMlYXtqDphYtg
         uNZyc8pW8fadcDdRF2PwtK9LQWCsZ3L7N1ZW8gwAMwMdpn4TGRVcdpbBZFWPnv/G4sHU
         /2PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ArlZszxA9LATYGtsUT6ury7l5T/74Vu+Cm3Gr3WhBA8=;
        b=NvBXrMRUCttLuXPma1sfKZZIqjGrKG58v+5qJ8dNwfsDT5wVAicHAum8ER2Dzta9JJ
         dKvZuHSErprUpqBADLMFI+xwgzZjOpUOVsGZ0Kf4FXltmN21dw1E/ysFR3YqqLLA+JKU
         qD7bMp2QorhY0FEdqSqhF+SNH3zPwfhCej5dWPCr7KQHtF30frtNA6hqd5RSqLa4U9PD
         B92+Kk0WP3gHa+gr/v46uV+RuXAIaQ4hfcRrwMIT50RA2OCM3/MbPgTeoxI87T3K5U1Y
         kDYGVFR0TZbZ3FhD17rT7kFul7UUsvlOeCoyvsaRdkK1YHnnxJ8Gs2WU0jEX/mQuQIDm
         P/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ArlZszxA9LATYGtsUT6ury7l5T/74Vu+Cm3Gr3WhBA8=;
        b=b/v9I69LtJ99MvwJqawTr+bVkf0mFjtMiMTu/m+eEN2Vvcb1lF3CJMUDlY/Hvzj+0J
         aL25J5nUdN0Ry5AZ1FxSqL6zLvDAuUE6NsNvdYZ3Xz6t61Jj63N8qN2oEtYh1G2Z+x4B
         kxPQwxUcOe8HgyddBV2Op+jAz0mJZNvzU3AUXARpDuc0u3Oi8TpOKOFBsgmeNlUj/0nl
         ZLDZiYMr5vWl2hltd56Mei/mTEfXxmzCiqBFnO9ruzEOwZ0EIRJjJnBQKj6WZ6iyLvns
         ejx6pXxW5M0cHr1a1l7qnWtmlH3tmrXI5V1NSTNZT44UykZKArYHEoZYtiKF6Uh9ahwF
         xWyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533jpl3gW7yrdg/DT3VRZYN1yTEDoFTHwVoY5Lpzy9M8boo/vLlC
	GaNCLfwWeDf9fes2vq7sA1M=
X-Google-Smtp-Source: ABdhPJwGrZdSzwAoq2AvJrs9OIRx3Ur9hcxxrndTiNBhMb+gxXRaTOVXZ2n8Mou7gYzI2cvtMbbHYA==
X-Received: by 2002:ad4:5cac:: with SMTP id q12mr3586614qvh.37.1641905658305;
        Tue, 11 Jan 2022 04:54:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5a46:: with SMTP id o6ls5933865qta.8.gmail; Tue, 11 Jan
 2022 04:54:17 -0800 (PST)
X-Received: by 2002:ac8:5845:: with SMTP id h5mr3473537qth.365.1641905657569;
        Tue, 11 Jan 2022 04:54:17 -0800 (PST)
Date: Tue, 11 Jan 2022 04:54:17 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8fc34409-ec7f-4306-9f97-3bb380f7c08dn@googlegroups.com>
In-Reply-To: <84ebb12e-49ba-49ed-9719-063064e3c8e6n@googlegroups.com>
References: <e630d89c-45ab-40c1-ab9e-222fbbe26f30n@googlegroups.com>
 <20220111103848.5abbc20e@md1za8fc.ad001.siemens.net>
 <84ebb12e-49ba-49ed-9719-063064e3c8e6n@googlegroups.com>
Subject: Re: Adding another vpci
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_596_1835938064.1641905657068"
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

------=_Part_596_1835938064.1641905657068
Content-Type: multipart/alternative; 
	boundary="----=_Part_597_1133592427.1641905657068"

------=_Part_597_1133592427.1641905657068
Content-Type: text/plain; charset="UTF-8"

Hi, 
Everything is working smoothly now. I have now only question regarding 
these two memory regions:

                /* MMIO 1 (permissive) */ {
                        .phys_start = 0xfd500000,
                        .virt_start = 0xfd500000,
                        .size =        0x1b00000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO,
                },
                /* MMIO 2 (permissive) */{
                        .phys_start = 0x600000000,
                        .virt_start = 0x600000000,
                        .size =         0x4000000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO,
                },  

>
>>
>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8fc34409-ec7f-4306-9f97-3bb380f7c08dn%40googlegroups.com.

------=_Part_597_1133592427.1641905657068
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,&nbsp;<br>Everything is working smoothly now. I have now only question r=
egarding these two memory regions:<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; /* MMIO 1 (permissive) */ {<br>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .phys_start =
=3D 0xfd500000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; .virt_start =3D 0xfd500000,<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =
=3D &nbsp; &nbsp; &nbsp; &nbsp;0x1b00000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JA=
ILHOUSE_MEM_IO,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* MMIO 2 (pe=
rmissive) */{<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0x600000000,<br>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .virt_st=
art =3D 0x600000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D &nbsp; &nbsp; &nbsp; &nbsp; 0x40=
00000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br=
>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_IO,<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },&nbsp;&nbsp;<br><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; b=
order-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br><br></blockqu=
ote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8fc34409-ec7f-4306-9f97-3bb380f7c08dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/8fc34409-ec7f-4306-9f97-3bb380f7c08dn%40googlegroups.co=
m</a>.<br />

------=_Part_597_1133592427.1641905657068--

------=_Part_596_1835938064.1641905657068--
