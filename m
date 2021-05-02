Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBNNVXKCAMGQEU3E2MUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA3370B84
	for <lists+jailhouse-dev@lfdr.de>; Sun,  2 May 2021 14:27:33 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id c15-20020a056402100fb029038518e5afc5sf2533676edu.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 May 2021 05:27:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619958453; cv=pass;
        d=google.com; s=arc-20160816;
        b=nT5faJu/vMBesn/sj2letBM9ggGnOn4i7dk+DBYvYjdOVkANB12/PD6eNkPo2uf0Mz
         KCS/nfQN6h3Vu+7XkZVwzGQBaRryWQuR+5euZf/Ec4Gwq37Px1yemvMRlCbx/SPyKBde
         occImk/CI733YZBpdiAzgsNa2gioom73lKvr3TwocNHsLJwVL7grin5Aw0aAJl1q3S3B
         6U7vmAOV7tL1n/lWJ4WIg3rnOPymqQYr4xoblBEVfEjhaSmSG69lfaTjhnYcFdBSBbUF
         2dE2NV9zLCCnx4P1AoAMzVpZZ/HXK8f7uuG18v9QH8aXdz0iO1HVGiKrzFGsEfO/KFkL
         jQsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=xv5/PQ9HiYpVu/3mUfl2XRW6GxPr1C2S25ZDqX0HW0M=;
        b=ptk/y4IVkz/kEP+2cNTJJtcsI1EcdtS+g7q8s5rlHRY/TMzqB0ppPzA0O8oDnegi1x
         bQZnNJKk847aC0gP1nh0ZOCpPGeKYB1YyW/IVJFnyrgdPBCc8IqFQZuyJH+X7Pru4yIa
         Ujdqsy+P9oyvpxFrGEAjGgrFN1sWmKdiMdUlLrXf3+hTC+uxzWaDPXnxHfiB6QnsnOZo
         qLdi3ZAHMlh3mYAeXTmm53juwsM6IXCM+SfP9mpQV3k1tv8VTDKSEczEYJ5/qrbnKUVv
         65drx6Zlr/KcyzsKPHV1Sk3T06b4s/e2Zn7CF+7Xql4cWY4BGBYeIAbwCmS89kk2MuNx
         QtPA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="X/DT6emZ";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xv5/PQ9HiYpVu/3mUfl2XRW6GxPr1C2S25ZDqX0HW0M=;
        b=brv1VSa7ovDSn4B2QsJHrOZXdLifTy2JAZVCZqjC6ZdsE12ijDurhSgDfNozU59Rdx
         J5qecv3gTn7m1EFGpb5j7gqPh8EpGkzP2jvgpXIttsStsHq4zT38CtXOMosPCwdkT+KB
         gVID+l8AH6Fej9u6lBDODNOkZcvMpUTehYh0y2OczF4KmtLbwZoO2xS5YBkCv9s68Ka1
         +v8LuBSRNCAgNXnADhx++xB5K+gw/u9Vmmn2FxyTCZfysg9QEwW8twZ7IBRghnHUOz4O
         8Shgytsv+1PIFa+DZxFxp8FHgycmx49JxmR/ey+4TVaT++UHA7+9rjyZF9idXb1oWqRU
         s87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xv5/PQ9HiYpVu/3mUfl2XRW6GxPr1C2S25ZDqX0HW0M=;
        b=l2uIMLa95AOOmZUq5+HeMQN8vp2cTe4aQSJOYzZ9Gebpi4GBkLnPB6t9tG8dpIOtSG
         4xj9y4DEjV6TYmhpPbmZqa0Alj2Lr3E1Fy0tuXa8Sho8EZkl004FM698DxT0InwDOM7I
         O/Qg105C4Z3qG5QF1PSiBIVLJx+KLPa4qRqWhg0hOK2RMbgzJSO6jbgJVB/fONPU1p6c
         HsCcEsXZMUn4jH8WkHg7RA+NarYd4ZjSP5+9jsBG9jnRpZkePBMWgnmTH8vbbnjlHfdx
         JllFS0ycKNfMDezsfyJ9aAufq+z6siahmcZ1LZa5FWntgLAJnH5U/SDBZan78afVTRVO
         EK9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530BhAoWBADJIItkiHPuG9wXKFdMTrC3Bju9xDax0kcYrZjMuMJk
	1Zb4PLFoEMCNKZ+WQGLC2Hc=
X-Google-Smtp-Source: ABdhPJwTOj9wwUQgmfCkd/WbsH+jTp10V78qSvRhdHNVf64L7JO6g0jLT+nF9WuVxWhw5DHXvgCrXg==
X-Received: by 2002:a17:906:4e82:: with SMTP id v2mr6115615eju.278.1619958453564;
        Sun, 02 May 2021 05:27:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d04e:: with SMTP id n14ls4583520edo.0.gmail; Sun, 02 May
 2021 05:27:32 -0700 (PDT)
X-Received: by 2002:a05:6402:1516:: with SMTP id f22mr15252677edw.33.1619958452433;
        Sun, 02 May 2021 05:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619958452; cv=none;
        d=google.com; s=arc-20160816;
        b=yxWSVtj78avbrSmYoEgpxTKzswAEWRpepI4V82yFfZc1nuEDbV4pD67BOhQhsvJU33
         S5vuZOavouxSZOTBcA9s61L8EjyKTxwtdhPHg0kFFtd4l5xnNz57jtRL1V4Pmabmn7ia
         YqH1lzSWMED/ayyzcu0noMxBDiFRlaOYa9xomewRiBh5bo6e5NNP4zpVsuzqy6afHFnA
         hneCrDwt9beFbKX6bF2SB0Pug1ES/aDwamMYrihXmZ10gXK0XvnFlESHIuHV+T5omQZ6
         UyBrJxYOlcxtGu9dlia2i2RL+yxpl5dvzP+il0dVpa1brYIgd0Yf+DHxKdmiQNrzd7Ey
         vQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=IQ4Zo7XU4TUC7coUoo/lRdIgPLZI71JCm6kJVYu5FBE=;
        b=iWxGUIsMglrw8SeFs4ObCDAJ50BUo5X7D5iMaWKq2yZHn3LEKI3FEpqjd7oyhcbYCt
         l9ciEfQQPrFUsYFwXiufh35cYI8Fcdw0uw2y/VmxWxCSBAClyA2MXxCSncYD7Dfe8hUl
         5V+vjeg2tW5Fx8qxvSlaYXdBet2vg0Z8XapF0qsS92mdwiS1rUUAPPNlbi4pAN0nhcLM
         c4dt0/7bRdMp/CnfQqLCDylNAqevUcwvLBi8/dBV1JJpMMJWZdakhyGJwheLvh2jHx/2
         zv9TPANftwQ6fFHskMtxeH4xSfx/WWlrAZaEHUkHap00luAUmp8jTnLV3uTJvO/yS5XU
         C+Gg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="X/DT6emZ";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id y16si912258edq.2.2021.05.02.05.27.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 05:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.227] ([88.215.87.53]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M4KNf-1ldSJG2jcf-000Odc; Sun, 02
 May 2021 14:27:31 +0200
Subject: Re: [EXT] AW: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
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
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <b53ac6b9-013d-f9b5-1543-4bef294914bd@web.de>
Date: Sun, 2 May 2021 14:27:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c53790d5ecf3411cb1990106e9663ecc@uni-rostock.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6G62c9vZdWTCbisaucGEAiwJrrvbiL1RW/ovNWV1Ew+xQsBB/Bk
 mpS8rK64E14m4rI/G3h8zeDQY+jG8TwR0OvQPbmwlgvQ5vlclX9UmcerJC/0aAwVAogjQZZ
 yAQbprxfCH0OFweI2J5p2w5yjTcqD6wu5qQ07Yp5L4V2r4p4V3uQNU9ZM+VP6d+8/LWLRzP
 qT7WhrxLXz3tAhf7aYKLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pgCCaAwzt8Y=:SusHSjMb6gSDKjznWTU9JM
 jbdhftdv8gH6MmJfJsObaFwnqdhn0Ip/HD1RdWiNqu86Iuh1lC/MlyCJL5pvFIfgS48W0PNa2
 zz/aZAW2sm4cYfnYxK+nlnMBFxjbNY0V03Vmvb3PL+7tRJY4Vzwb02Xb0yL4LbeChBJlG5mdl
 peSV21p4idBOHkbWOfSHW9BqlIu+FMx3rcUTgpaBeKPU6W8IfKykxxl/HJ9xJPK1A0v5kA1c+
 +BP11LomH6u2+Yvljs/o6iC3Xy97ZxmjrsCwzvMNCQMdQDIqWiPq/uvZuobd6G0pIq9+JwAjv
 XBqkCpqOJ+HMQV2IHvU5oGmQYc9wo6BcnOWwPZc8ZW78TpyhPsGYnqRoPc0RjmdcjIkEjazaB
 F4odUOQy3hlXY0A+mT5OnrVGXu648JARwAO1Rd5kaVq4i+Cywf4dD2Lb50aTGNIh3DuTorpEk
 G3DGkXFzzWOlARNlrTlLaxCY0pDiP5UEf0q2IBjSq+AgVRRmaT4EXmQy9Yiw/6OT9bd6oCRwT
 1SzVvn46NCWirs/d0lPNQOZX4gZ9Yl7O/8EPCnStKxE+VFXw5ucv1C9rGgFDnUL//HAOWK5I2
 I4N6ff5sCAO5TNE2wQuvy7FBH3D1GxXfOZCuHZuMQ25LQbxQXG/pt1+VMXSeJ5oknlLNzcMyY
 UTe6ho/pwtb6970Z7q1lwIXILsZHIN5JZnqN9xJphvBKSWS/UyiSW3Br8AjuXMGGcypJy/eSc
 F0UGWuoRvdi/osipLq6Y2XV0B56ZjieVqzjnKJUlILnT3FCjj+OVs9T4zpcnCRZnWie3qJyqE
 UhL6jh1/jTUJL5GVbtTDz2AN2ZD+1rfh1uDkFB/bgcp0C06by9+++yLbMoPRAksAn84RSjljJ
 QW82ALpPIwIMz4uXrxbGtr6W/jSyomgd/j85vKpOZTCk71KOEjajWVmwKYUhLywH+v9IWwGa8
 VPF5lGpjenJjFEKZ20pPPvNXQ8RV46xuiT0tW7481Jogo6xyMQDmNrBaJUjnGhrJvnVVcck6V
 50tox0sMW+3FFhz8ZgdU3qPqtF5ltohOlCzgD7SByy7tIqryCvbgbbVAS3IH4EkS1cLq1+rlZ
 UvUGe2ZdIG86ONqXVlgQYKtSVlBoZSGHjeo8MeBwROTOdw+PJgOEW75Ppntfj4ar9dN02RFbG
 D+5G0ZKivtjCAH69xD1GmRaPS3MP3/+ba29p+jQ7K2WOa7jhYGm1QmzPSxXTgZXNicKeM=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="X/DT6emZ";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 02.05.21 10:40, Moustafa Noufale wrote:
> Hi Mr. Kiszka and Mr. Ramsauer,
> I would like to thank you for your previous support. We are planning to t=
ry jailhouse on a Coral Dev Board with i.MX quad-core Arm Cortex A53. I hav=
e some questions and some conclusions, you can ignore my conclusions if it =
is correct:
> 1- Docker group is only required to build jailhouse-images in case of vir=
tual-machine demo, the reason is avoiding running start-image.sh with root =
privileges. Am I right?

Docker is needed on the host for the Isar build system that
jailhouse-images uses, irrespective of the selected target image.

To enable Jailhouse on the Coral board as well, you likely have three
options:

 - ad-hoc compilation on the board, using their "Mendel Linux" (also
   Debian)
 - integrating Jailhouse into Mendel Linux
 - defining a new target "Coral dev board" in jailhouse-images, porting
   the integration from Mendel Linux over

Simplest approach will likely be the first (but possibly not easy to
reproduce). Cleanest would be one of the other two. Which of them will
be simpler I cannot predict.

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

The config generator so far only supports x86. For ARM/ARM64, study or
derive from existing configs (configs/arm64/imx8mm* might be helpful for
the Coral dev board). Any own config source file (*.c) placed in the
configs/<arch>/ folders will be built along the rest of Jailhouse.

If you want a non-root Linux inmate, also check
configs/arm64/dts/imate-*.dts. Maybe inmate-imx8mm-evk.dts will be of
help as well. And also here: any *.dts file in those dts/ folders will
be automatically picked up by the build system.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b53ac6b9-013d-f9b5-1543-4bef294914bd%40web.de.
