Return-Path: <jailhouse-dev+bncBC3J54VZ4EEBB6PN2GQAMGQEXJMT3NQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id A17126BEAFC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Mar 2023 15:19:38 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id j36-20020a05600c1c2400b003ed245a452fsf2338231wms.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Mar 2023 07:19:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679062778; cv=pass;
        d=google.com; s=arc-20160816;
        b=XxguBeIyp8YKDzWypDO7p+OZuOylTSv2P9YXZnyyC7KbdK5jiqnCCTm9ykatMpXRC1
         9c8F3Nznr4zSah9X4RYmfcZfDSWGEmp5fLXYIWthQZEledp3x6O4Hz404DAfja75W55F
         ZOOwWNYpOZEGWhHLfhAFZA4s3BjhfLSY63Up9qcLjIu5VPwqP8ySrknnI4K1J98UF+mV
         NhCZQOqSuphJawSE4PiNfprewo4IVffwKjDZTqFRqDNJwPb9rM8GEjp6tv2sz3qU6E6W
         hq4VyUBkYx6LbcrUs2RI8nb011JqdIfl9jD93DV3oZPc1LmtEb87+CJiWKIVvuuk5pRn
         79Cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=oWgiHI6tm34MvL/eMwX7JVDGHeC6uvL+dCv7RXTCRcY=;
        b=LlD8igEe9j267GHMGznQgpSZF3Sw2KbHNHM06vIzIJSpx5WMcxh6V5e+LCZZpOn2BF
         c5NqdRlleymTdrVeo3CqcF4k/ScunZceRNB7GvZKQawePIG71jJmONoLwXZmiKofm+UY
         qgmoBujZ1Ipp3lMWrnPoWOlA9lIr4fMxxFBT9GIevLCZit+fVUM1kObrP0rx6bGav21L
         wlYlmTT3DKG23BD5JQFhi7YYuc7MdZSlsduTrDnjJP1ivtgxPWmualUSn9KJNu20g4jZ
         7dCuTmjHhHY2K5l6aRqEw/PXoKnoiqFnEqrYtx+ToA1aXjb6+LA3zrE3HU73JDPiMK1Q
         rwRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=nSlMQnWX;
       spf=pass (google.com: domain of daniel.baluta@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=daniel.baluta@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1679062778;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWgiHI6tm34MvL/eMwX7JVDGHeC6uvL+dCv7RXTCRcY=;
        b=m6cZ4EhkEsUU0cbEUlGvRz0FiAt/CRbUIlaI20Imu4eH4wsaX3s4AoVebK25mFTQk7
         wS6oxMnB8BwPWgULa6AABrZrrBQKfeszL95a/zQPPRROPWRxMUbNVMrFdYlUKb5e7wIp
         /NxQ2p9O2HsBFgc/+sgoLuylgWFaI/4eGFu7692IHYAfgmu91S1JAXdr/XQMGfoWsN+J
         EZOHorxFhb/v9I63rbYOu8ioFgHI/pv5T7tLA2wiujN8MJKWmMalyvt9x/r+TFL7ocEo
         Vp9sWOwE+X3T45TXgCKW2iGb5DllsHVcas6dj+hbXWUTMc1QOstMzV8YtRBSY1i307Lw
         irww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679062778;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWgiHI6tm34MvL/eMwX7JVDGHeC6uvL+dCv7RXTCRcY=;
        b=WItkjnjtAzexxfKLSHgkJsO9w87EDazVVjOFRk9K34vdyfz2NN1imPZdcPAPn+JzKP
         Dc8V6UKtkUyLKUDNZMg58IjkVuPzjYewzE5jEkg2l4FndRnQLZOk6HEz7MOEh84pRzCo
         YRHjwDChwZo+xu/YdkjOav62O3FI0lSvxdNHHl0L4/t1llugj7OvUjzt0Tvva4CJvhJm
         F0deu3i+pAwb+NmDJjMzBJYDZYtOqiWDIdo2sELeR0kGcTLr0E119/VNByZuZqi9p4bw
         gwqVSuJnaE+dWcWty3aUc4EW0INgNjhXIxHByu6UCbrvhsCtl7SW4rOkOKev5dyACpRT
         yqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679062778;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oWgiHI6tm34MvL/eMwX7JVDGHeC6uvL+dCv7RXTCRcY=;
        b=c5k7/y5yoo+mVWWhy0dZGJxNcPFbY5eNjQYdyjP6SsKvlRZM1P5/vHcF706PoQX3TK
         CgG79mPAYJyMFfKy+SO0/Qwscty6xwGsp26WRmDSO2dotSio1TnAz5bbGGQhWE9cJFjO
         yQyNLLnu8pc4ySCCxxQuJ/afSlEf4ncbwtY6+44ynu6UTrMzEa6uRrhFeSLfJ+ywltWu
         BGtlXI9zSQ1IGPRflCyMOPtnzdLsOm9CYgmzfZfeL221IDqZnJAAnvz4ihHhFUWcRwh9
         0TD6xkYrtoIaICBiVN23sUd92u1dKPFKM5fx1osEbX3yiJnSUM7KKdU684sNtAfhuXMZ
         Osyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXkJM27Bc0Jeva8t5lFhi0lXIV7PuzNBXpYQbar3YmzCa46ychx
	hPDDkev33PGRPRQBH6+VpCc=
X-Google-Smtp-Source: AK7set81/380UZE3cjWg7KpVHKHiF18qBAbgR0QokDzDls0yLAkY8R9r6PMRTx3taf8xFTIr48CMXg==
X-Received: by 2002:a7b:c2b1:0:b0:3eb:5a1e:d524 with SMTP id c17-20020a7bc2b1000000b003eb5a1ed524mr7177065wmk.3.1679062778071;
        Fri, 17 Mar 2023 07:19:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f685:0:b0:2c5:557d:88a3 with SMTP id v5-20020adff685000000b002c5557d88a3ls7570172wrp.3.-pod-prod-gmail;
 Fri, 17 Mar 2023 07:19:36 -0700 (PDT)
X-Received: by 2002:a5d:4c84:0:b0:2c5:a38f:ca31 with SMTP id z4-20020a5d4c84000000b002c5a38fca31mr2700060wrs.7.1679062776385;
        Fri, 17 Mar 2023 07:19:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679062776; cv=none;
        d=google.com; s=arc-20160816;
        b=T+KOBei7XHNnwjgCRZRRTeFfV199g2xcHzGNGNp+VbEN9FWPzYlxw+0CWSL0j4wC8L
         KVOHH6auwy+UWmbfOM7DXXbZcObEmaoScfQ/xmbEJPsZ/6yaSFopiPEAcbHb3CkKVKTQ
         h6XPcZXzOliPoUZRQ3aNRIahw3IcPb9GFLs7BBMm7p5afALABX8BpvKXUUZ0Rn5Gpe6q
         LDmwfrBsuysF4UVGdgKIqrn8ae9sro3dIIXhYknlwPrMWldpUeDYUWs8XyySK5fGsmRH
         Yra/ZhRNIMwxSZiOdQcr7XgC2y0ihYDSHsXAloqnWy77cE3h0yJuUETjf6acmdTDZ27F
         iyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ksIYpWL57FIIlrZWe8w84huQvJKIxEoCW5CZlXvz6LM=;
        b=StPo8rL7xsvIzd4Jt4DtIxs4KfedKedC0dhqGzVGl8IiAM4/gAk3eq5uTs2Zm8xVBc
         yCNyire/7zAWuTbW3wT8TwrZIbWl/Y3R7BcHWdllhXu1e7aZUyrgV2e97GEugBd3k67f
         N63IlwoVoWQ2F6s7hQBngfKdnAandZ+PSNWyLx7BWDaadv5aNv5zBoQ+If4tkauUvnG9
         8GNX+bWE9Jq1YUjyVlkgrzw2c0wm86XxJlhbGfI3BoeypW0UjxW5y9o3tIfKKaxTm+eQ
         tnHHARln1ESf9F7QzrqySzemqtI3Ixunke0Nc/pobMq1OKZq15KmUaiU1M1v90OQdV4m
         HRew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=nSlMQnWX;
       spf=pass (google.com: domain of daniel.baluta@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=daniel.baluta@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com. [2a00:1450:4864:20::52f])
        by gmr-mx.google.com with ESMTPS id bn30-20020a056000061e00b002ceac242c41si109975wrb.4.2023.03.17.07.19.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 07:19:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of daniel.baluta@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) client-ip=2a00:1450:4864:20::52f;
Received: by mail-ed1-x52f.google.com with SMTP id fd5so20961453edb.7
        for <jailhouse-dev@googlegroups.com>; Fri, 17 Mar 2023 07:19:36 -0700 (PDT)
X-Received: by 2002:a50:8e02:0:b0:4fa:ff23:a87a with SMTP id
 2-20020a508e02000000b004faff23a87amr1808321edw.5.1679062775990; Fri, 17 Mar
 2023 07:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <VE1PR04MB6607BED3DA85B3BFC335000792BF9@VE1PR04MB6607.eurprd04.prod.outlook.com>
 <83472a1d-e6cf-3336-a4a8-df3c6bcc2cab@siemens.com> <a22210d5-6ea5-4926-acc4-fec65ca36884n@googlegroups.com>
 <e442d6f8-e9f3-467e-8a9e-5ef053b6e46d@oth-regensburg.de>
In-Reply-To: <e442d6f8-e9f3-467e-8a9e-5ef053b6e46d@oth-regensburg.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 17 Mar 2023 16:19:24 +0200
Message-ID: <CAEnQRZA+VCWGRPjuXSDwaRuadNAy2j9UOKpQr0KYiNdo8SNHyA@mail.gmail.com>
Subject: Re: Question: integrating Jailhouse in the Linux kernel tree
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: daniel.baluta@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=nSlMQnWX;       spf=pass
 (google.com: domain of daniel.baluta@gmail.com designates 2a00:1450:4864:20::52f
 as permitted sender) smtp.mailfrom=daniel.baluta@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Fri, Mar 17, 2023 at 4:13=E2=80=AFPM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
>
>
> On 17/03/2023 14:49, Daniel Baluta wrote:
> >
> >     What you can already do is pushing the setup into an initramfs.
> >
> >
> > This won't really help in our case. Our driver (Sound Open Firmware)
> > runs at boot and somehow
> > it already expects that the jailhouse to be enabled in a controlled way=
.
>
> Why? What happens?

Our driver loads the "inmate" firmware like here: (1)

https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/sof/cor=
e.c#L238

And then later "starts" it, like here (2)

https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/sof/cor=
e.c#L252

By the point our SOF driver code reaches point (1) we already need the
jailhouse hypervisor to already
have been setup and the inmate enabled.

So, we somehow need to be able to call into Jailhouse API from within
the kernel (or a linux kernel module).

Daniel.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEnQRZA%2BVCWGRPjuXSDwaRuadNAy2j9UOKpQr0KYiNdo8SNHyA%40mail.=
gmail.com.
