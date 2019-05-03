Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBNGZWHTAKGQEOYKFSRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5213233
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 May 2019 18:30:46 +0200 (CEST)
Received: by mail-ot1-x33f.google.com with SMTP id h26sf2872985otm.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 May 2019 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8W9zAMqOHutQGyfbplSvKHdQOENywsUN6v3wrnn6J1I=;
        b=IuMjZER0Tdktr8P27EOvcWED5M4aqmvmy/VAb3W43LB9WW4x5g3UaANlzaDMhw4Xr9
         Bl5r3Z87w+EmTuej4UMOT8svsxlWR2aixTMx8SBeW3phpqwnHE4YtQDC69gY7wDl/I6P
         rdVCHBlumuxA4UazrvM2XMUvFRzstZOUDu8zyjKDLOMXhDhV/C+E7DspoKRIawn17Sbr
         ekpf2R9QUeJGMJtZDoFGmxAblnjv0w94cus+S2A/UjSKA/dgnmAtRlixQDej3xqgAcO1
         5xweNaRS40Xweb51yKdXw+81uD5+LCbRRDKLgdxc/FQoC1Lxn2vuumfCRXMs/ovR8F3k
         RpEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8W9zAMqOHutQGyfbplSvKHdQOENywsUN6v3wrnn6J1I=;
        b=kyBwPAjgOTg5eYSGuUrPUMvzw7Zd96Rfn+izjlcHDsni4fRhrHenm9+Q9SljDGgEcw
         q2Wkqa1VsvKRF8EDcQTEBtUbWSBtmr+r6FqwUwOxpAxA8QToq7TZPhKSA1e4idT/ht7n
         Jrw0YlS8RErqf+5ojPYgGDqXBaNVs7xS4TDsnuiCtQJbBw23+jKOcD3LsbPOqHfIlNBq
         BLPmyyKNDaZuIjq5iP4TqtBdyHbvYyZlMSPpf4tCi+hOGaRtrocSeNDXuB+AOMopk3xp
         IPWsP5xys9rUVG6IT7woiHs1beuDT46KnoBFJu+RkBEtVjNzSjQbe0XgFZ9Q+Nx20vVN
         uAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8W9zAMqOHutQGyfbplSvKHdQOENywsUN6v3wrnn6J1I=;
        b=UviG9p7OFKj/5Z45Hph/sxZ2ke46duk728SFD4CP5Ffz7lzjXMGS1D3G523VYI9Gwr
         mLjuZAHBFBvRn6VbmndF0BMcBP8nIp5rzQ1cOAumdJqsqqBM6qygYfH8p+dAi1vh9mjW
         b5KR84bIhltzkh/shSuTktOt06H3DlvgRxZ6qRMgbc9aHz5BAMcMn1gvQr7FjpQN0zL+
         o33bqXsg87k7bSwp1EDOplp5cBJU1fs2Td6Ee+ta2U0Z9rkxKSHIY2jnCMlSix8nvtZk
         lorq/20p0l9ERfoLN6eX+5Yg3ixU9b4GVtpNW0Rzd6a20PlpA0W0EqgN7zetmVJBBj6n
         eR8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVyAqKXYVSOvnskI058n67ITmt7CW/cdjZqB159fcB4f1ZXWZKK
	eHQzppkRCIni6HZ4ZtEQwbk=
X-Google-Smtp-Source: APXvYqwMzVaMohcrvBF0x17sFn1XSuOmSV0SspuO3Lp8o/9N22hTMV6dGOdVVsoAzSOQ0sBUXXA7TA==
X-Received: by 2002:aca:e38f:: with SMTP id a137mr6847134oih.87.1556901045123;
        Fri, 03 May 2019 09:30:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:5f1a:: with SMTP id f26ls957799oti.2.gmail; Fri, 03 May
 2019 09:30:44 -0700 (PDT)
X-Received: by 2002:a05:6830:14c2:: with SMTP id t2mr1598142otq.64.1556901044460;
        Fri, 03 May 2019 09:30:44 -0700 (PDT)
Date: Fri, 3 May 2019 09:30:43 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <81dd76a5-12a2-442a-9b2e-2f88ccd807f2@googlegroups.com>
Subject: Uncacheable synchronization between inmates
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1121_1048714250.1556901043751"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_1121_1048714250.1556901043751
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I am trying to synchronize inmates using uio_ivshmem driver, but the synchr=
onization requires calling functions such as blocking read (to receive inte=
rrupt) or writing to mapped memory registers such as Doorbell (to send inte=
rrupt) on linux side. This synchronization code will likely "pollute" the c=
ache. I want to know if there is a way, or if jailhouse provides a way, to =
execute these few lines of code (calling blocking read and writing to doorb=
ell) without using the cache.

I've noticed that in the non-root cell side, we can use uncacheable memory =
by passing MAP_UNCACHED as argument to map_range(), but in the root cell si=
de i didn't find a way to do this.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1121_1048714250.1556901043751--
