Return-Path: <jailhouse-dev+bncBAABBJ7PZWCQMGQED65SIZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BFC3950AB
	for <lists+jailhouse-dev@lfdr.de>; Sun, 30 May 2021 13:31:52 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id h104-20020adf90710000b029010de8455a3asf3128228wrh.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 May 2021 04:31:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622374311; cv=pass;
        d=google.com; s=arc-20160816;
        b=ThTDSW6V19vxJRevvPy2RxmbDRCctZXgcgzRUaloc9rtCvfMtOcfHHZyPf/w2/di0V
         5mzZNRKX4cfS+nMsZEJatqzQmDU/pJ7OOdqTnR0cEEgM89HTz0b2nkp9qyV0AlB0beF1
         q2N4hK+RjRHx8U7WUhg9QkhycQzDN/rosAljPFVNYltbk8QTHCuqnuJntuK+ubPn0Ly7
         VlnUIcxzSCktxcOa4hwVmDJ+/49eLavu/v9b4/+7+iR4LWKCrfICpxIKICpFri7gz9rj
         N19BkvW6XepZZlBhWw+ou55nyvJExCYHtseAAc4I2+5p77952Q6aN+27f2uIk8irOlTK
         3Rbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=FBTEdtozoCUJUVuVYH6PSj6RFQ5AWckwfHtVLUTaUt4=;
        b=eGeCkvYS/PlXlusD7hdVdrSjXHuoTn1HBovGrrSjB/9+fRZ5TG/bq1F4y5TcOY3m9x
         s1tg1cmXAyp+dRUh28gXMjNyJve3Ar/7js8rwIVt/BUPGhASnmDW29fQbKzyiXrUfunR
         rrPtDB9QfVmYzUzvlxA/9a9szm+BJ1pgbyRRk3dmSbEpFhwqbMfsTVFO30yXbkl/TKeZ
         1fc1h7qC4EqxTUkS6ni2p/xXvsXZfbyqOwiv0llT8iC2ZmIcy+1PjoJoO4ypLQu7Op0j
         2+1zeUL7c7p4ugmq8xvZn/TJYoroxNBOWiMy5qC5x19qdplmuz95myvC0fuLJVXXURIn
         v8Yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.s=itmze header.b=hNPASoDe;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=rS0PKVHs;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.72 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FBTEdtozoCUJUVuVYH6PSj6RFQ5AWckwfHtVLUTaUt4=;
        b=kVtXzMAtra/a1+f+Otum7p5tPyOSk6Zoi/iOTKiV51XMzfAW7bdfLA2Icjuf1unmOR
         mY89/Y0IBzvHrt3cwQOd4eqkGX7zCkoD9QzBBhFHNo7V7s/EBfaTh7JinnFhUPTEbDmY
         q0kV9sWfXJVSgSb62ZcAYlpR9HyX1d1hFk7HJ8npo3DdSkRODskEH3eDHMd4FBez5A0c
         ubq0mpnBmUVIedKXt0URIeoGow/p5gQkKxNtM+KPIQCvM79n3JajJWzKDCfuB3P0cgJf
         x1tM6NglipYrffDIO/KM0USp/CqhgXWSZbfuEHcyeCB7JIaseHtvDiwOtdrOx+yGSjyR
         4mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FBTEdtozoCUJUVuVYH6PSj6RFQ5AWckwfHtVLUTaUt4=;
        b=OVGzjHRzS7MWgLPTvlVWzcC3bt9N27E6S9dpYSZikpbTHvXILxKcls731h+1i+8HVR
         HkXL3c1Ot8e4r2bRCA0j6+1A+3FTkTpLQIbTqAsS128jSWcJW/zv/Zr2y1B6BTvnjdyI
         cZGco+8zfLpHuWUfi9x/Mx4T3/5TrJL82K1U1mC+ppLHZ4Ure4nRcZ27G+2+P4DA8BEP
         tYvs0QLvJ7KAYWXS55Xzi+/8tzHmQk+AcgLs1F98zS5FiK1zLJUz0eCrXu10YKUAEXxw
         q8w5UvRBXxr1TUmIi0X9IVicxVGUbuTpnA4i224Rpp8sFJ3cL4XIof6Tu0FKT2ucS1IR
         bf0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532OqltYJcinWXw3GKE97vv16q8zOoW/zha1E3kMFJO6MCSl+JwS
	YGf86kUpu6y3WhCZ0OJA6b0=
X-Google-Smtp-Source: ABdhPJwsCJtc4zOQiQGJxkEJr4Z+eJtPRTZJxCJm2nW5yZpHr0hMtvZF+trc8hT6WjjrGHDpanylcw==
X-Received: by 2002:a7b:c0da:: with SMTP id s26mr21115360wmh.83.1622374311689;
        Sun, 30 May 2021 04:31:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f52:: with SMTP id m18ls4131486wmq.0.canary-gmail;
 Sun, 30 May 2021 04:31:50 -0700 (PDT)
X-Received: by 2002:a1c:a184:: with SMTP id k126mr6083934wme.82.1622374310857;
        Sun, 30 May 2021 04:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622374310; cv=none;
        d=google.com; s=arc-20160816;
        b=IlmZ+SEdQ0qbGAKcn1Yx1YsQXyGWNsGcLgYuYw9AchSXsM5256GAcqLk+Dx+zt50qs
         +GfkrpN+wbuCfirYCpaFjoXB/4AnMBbveMfAJn7qduzzXwSg25qBMhyOyxzdTYhqPoHd
         f96kGNV9Fndf+ySjER93ZXrj6/NyJeoaYNHin7q0znzEYatFU3Aa3mOjijJuaK5LgS2u
         VtOq/U1gr4s3/RMJAyf9SK5VSDzsj0yzHb05uM/CrsB2eS+qQPrXUvU8PvkhEBMlrzeO
         mAmW4WMhClaGlkSvySmSPnA5fG0IKPX8YaPT4J7WY8BGFMr+LgQhiGp9zrmhHu9d7SOy
         ZuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=T94euDi8hOsoOICCG4h/zhzpt+PyAg+aPlOcTgeD38o=;
        b=MVb82RCORqM1zlDtH/1pZbjtDeQqhz21plewZWnkniOG2V+1jSv07WTf92RJT7wfJV
         qFbYpTRMndrTtfvB7f2VrSwOrt+7aVmFs9CnAXK6/8qJtxUgMvROzjZps/u1Aqgqtgxt
         MOQmCR2ncTEamtQPjTFhVmtIoxZgCIGIs/fPKwl0e9jI3PfT4pM9MoiGTlIZg7ErUbMS
         OH4Nty52NuffTa859yT2ZrdRPu4Od+rxi/8n8IeDulf4/17mcNr8PJKuSQzKFQuJFAb7
         FQQoTMzMQljH1MY4vPjB//8TtcRGyvWlvn+0uWOF93YVmudZCaCLWvJJbXYEDgCOh/f+
         12pQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.s=itmze header.b=hNPASoDe;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=rS0PKVHs;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.72 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx2.uni-rostock.de (mx2.uni-rostock.de. [139.30.22.72])
        by gmr-mx.google.com with ESMTPS id u131si656250wmg.1.2021.05.30.04.31.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 May 2021 04:31:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.72 as permitted sender) client-ip=139.30.22.72;
Received: from 139.30.22.82 by mx2.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Sun, 30 May 2021 11:31:44 GMT
Received: from Pickup by email2.uni-rostock.de with Microsoft SMTP Server id
 15.2.858.5; Sun, 30 May 2021 11:31:39 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email2.uni-rostock.de
 (139.30.22.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.12; Sun, 30 May
 2021 13:30:36 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0858.012; Sun, 30 May 2021 13:30:36 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Jan Kiszka <jan.kiszka@web.de>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: [EXT] AW: AW: Inquiry
Thread-Topic: [EXT] AW: AW: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xD//+LWgP/67wQwgApfIwD//qzLwIAD6CkA///bZqAABW1CgP/0//LQ/+neqwD/qQmIwA==
Date: Sun, 30 May 2021 11:30:35 +0000
Message-ID: <0f730442242846238f7a5695a4a04f2f@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
 <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
 <34742299-7898-adb3-30b8-760bc4596e92@web.de>
 <c53790d5ecf3411cb1990106e9663ecc@uni-rostock.de>
 <b53ac6b9-013d-f9b5-1543-4bef294914bd@web.de>
In-Reply-To: <b53ac6b9-013d-f9b5-1543-4bef294914bd@web.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.78.246]
x-tm-smex-dtas-header-wtp-uuid: 6FA5AC462EC90ED6C846430364831F83CA8C985C
x-tm-smex-dtas-header-wtp-flag: B61A37579996047758DE0A85552D06C907061C860000
	e6322fb2-4c55-4656-8fda-c15814855d5b
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26188.007
x-tm-as-result: No-10--5.507400-8.000000
x-tmase-matchedrid: ZTET7BtpkhkMPDZrnvcM98CxC+PryYbT7cb2TOoXceKqvcIF1TcLYJku
	GCuUDsaHF5diznbYrvvnIJz4hekJOdMJ3l35fcUpynaq9UJcJkEiJN3aXuV/ob59Yrw3aQCHgDr
	XRO35/gbm4xTugZJvP4e0LwAgHzGgQEsl4ThJXcXPeYa4q0cTH/g/s23WPBIpDSG7dmYh9boRRL
	fe6UPgvB0dD3DSmCtcxwHCsyp4R2vCRcihcuauMgzrPeIO/OIH3SkTY86NiDi8rUtbtWe8+m6wM
	qaUrL2tlTxd3yByzoy6zrcReRqlTkX2eeYt6mYTj0drvddoWESbYJTL8pwAnhcVsFZuLx0Uqbyq
	2B0AqsY9iqoxJbBtQPwcnP9OIj5440Q/mI9g4La0sO72q2op4axT+JfQDbCPBph69XjMbdnSF9S
	LfU7QRzoy00h+TFuZThknSgzVzTyZlYl0tsn/4znU1V+NaXs9ZZ5HkRNGNgMXBKqmu4VmoAk9qI
	PJpVA7NlhmIv+6YV7ZGGE6hr7LupsO9o0mINopa87CDXaKRVLESSxPxTa9gyDpMjxdYZ9XwpY6x
	Woyv5d2of1NbcqgU8dlt0F1b9WtGYT8Jom9JI3nzlXMYw4XMD3Al4zalJpFwrbXMGDYqV+J8YJg
	RrgXF369ZVaxF9H4BDKfxKXPebyTvx2yYHsWe3O6Qy4zVanR
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--5.507400-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26188.007
x-tm-snts-smtp: DACDEAD36975EC58A73458AE8E060133AD25EB82397CC8DCF33B93A8C0953F902002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de header.s=itmze header.b=hNPASoDe;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=rS0PKVHs;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de
 designates 139.30.22.72 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
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

Hi Mr. Kiszka,=20
>To enable Jailhouse on the Coral board as well, you likely have three
>options:
>- ad-hoc compilation on the board, using their "Mendel Linux" (also
>  Debian)
>- integrating Jailhouse into Mendel Linux
> - defining a new target "Coral dev board" in jailhouse-images, porting
>  the integration from Mendel Linux over
I have just got the Coral board and I think I would go with the first optio=
n. The planed workflow is:
1- duplicate imx8mm.c /imx8mm-inmate-demo.c/ imx8mm-linux-demo.c and edit i=
t with the memory addresses in Coral Board, which is also using an imx8m.
2- compile jailhouse on the board.
3- insemod jailhouse and run.
I am only asking, whether I am going in the right path.
Thanks in Advance
Moustafa Noufale

-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka <jan.kiszka@web.de>=20
Gesendet: Sonntag, 2. Mai 2021 14:28
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Ralf Ramsauer <ralf=
.ramsauer@oth-regensburg.de>; jailhouse-dev@googlegroups.com
Betreff: Re: [EXT] AW: AW: Inquiry

On 02.05.21 10:40, Moustafa Noufale wrote:
> Hi Mr. Kiszka and Mr. Ramsauer,
> I would like to thank you for your previous support. We are planning to t=
ry jailhouse on a Coral Dev Board with i.MX quad-core Arm Cortex A53. I hav=
e some questions and some conclusions, you can ignore my conclusions if it =
is correct:
> 1- Docker group is only required to build jailhouse-images in case of vir=
tual-machine demo, the reason is avoiding running start-image.sh with root =
privileges. Am I right?

Docker is needed on the host for the Isar build system that jailhouse-image=
s uses, irrespective of the selected target image.

To enable Jailhouse on the Coral board as well, you likely have three
options:

 - ad-hoc compilation on the board, using their "Mendel Linux" (also
   Debian)
 - integrating Jailhouse into Mendel Linux
 - defining a new target "Coral dev board" in jailhouse-images, porting
   the integration from Mendel Linux over

Simplest approach will likely be the first (but possibly not easy to reprod=
uce). Cleanest would be one of the other two. Which of them will be simpler=
 I cannot predict.

> 2- Communication between cells is possible, but how? Can you recommend me=
 any reading about this part.

https://github.com/siemens/jailhouse/blob/master/Documentation/inter-cell-c=
ommunication.md

> 3- How can I build the inmate or the .cell file? I found in /jailhouse-ma=
ster/configs/x86 c files, object files and .cell files but the procedure to=
 build a customised image is not still clear to me. I read your reply on ja=
ilhouse-dev.narkive.com and I think I should use "jailhouse config create" =
to build an inmate. I would appreciate any help or any information regardin=
g this question.

I've already shared the tutorial with you. That describes the principles.

The config generator so far only supports x86. For ARM/ARM64, study or deri=
ve from existing configs (configs/arm64/imx8mm* might be helpful for the Co=
ral dev board). Any own config source file (*.c) placed in the configs/<arc=
h>/ folders will be built along the rest of Jailhouse.

If you want a non-root Linux inmate, also check configs/arm64/dts/imate-*.d=
ts. Maybe inmate-imx8mm-evk.dts will be of help as well. And also here: any=
 *.dts file in those dts/ folders will be automatically picked up by the bu=
ild system.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0f730442242846238f7a5695a4a04f2f%40uni-rostock.de.
