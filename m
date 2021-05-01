Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBS76WOCAMGQEKPNC5UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C06E0370624
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 May 2021 09:12:11 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id a5-20020a19ca050000b02901b72116329asf376798lfg.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 May 2021 00:12:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619853131; cv=pass;
        d=google.com; s=arc-20160816;
        b=F2443cSd1bztjGJVWTh/eQOJhaK6bbTpw2a6dMd6pzQ6YKh8PAxao6fPAdx+JlfxXI
         EOZEt2S6Wra678fEC06qmtv/+jBO7imRNJoPQosIqXp9wWpFwCBdJSp3JWws2ZXQ/V1+
         Wlf/+t2P+Up7si+jcnJz3BETjxepu4P1LK6fme7N+N7lRxK2J1fpEqPYPaqutLDyLQ8z
         Sn466dlS85FsObUyfizCsSTNzw/n6t1T0zEp2Z0SF+xIcnpIZ2Ok8XOp7LQq260HMoZp
         p9vTtmsNNEMWtPjItCI6ybudscQ+zif37aKUgo/XYNyJqCptqfffvOrbkAagcGxtvRO7
         9yUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=3gdFnNTjlBMPb1mUbD+wn2w2N19sjebH6hDGjqnGguc=;
        b=VdhG2R3T7HnHhiFti7V1eH7hiVgw/RFVf1GDRNjyUvSYTHLu18A5vIDE1zBr6j9g1k
         U2uPCfB8nfzLh3OoZBj5w/k2GU7EfAkGYlXN/VD4I+L7QgOZaEazLYeNma4ig/lvg5yz
         DQ3ONNnbC11uSl+L3ov3pzjiGldYyqD2psR89z73+H8aO5pGXLsFkc1n/iPmcA4IFkEE
         DVgNekNc1BajrATfxsBaAGUD6AtnX9du2o76tboYfKcAimvRa3JhWxyWOmp2lbLYVa5/
         UUGWzerVFIXOznxSSGBlX8o8o8NbqHBqLtG3DN8EGjU/IM+hB3h2QyIjDCU0s+7FkVDU
         MFVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nPCtDKDm;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3gdFnNTjlBMPb1mUbD+wn2w2N19sjebH6hDGjqnGguc=;
        b=YDLEGuKZlHxZBd+SXnojKrgqMstC08GGbqc8At4B/uHX7cJ9tCABKiw8TLFKPjHekI
         nGiStJTShRG9n2JAZ/d21egMZbTFOuSZGwuTKovCDE4cz5sdYNzYqeTinkIgkPIBPgud
         B9SCrtf2YtVZK4QWq2KdQoVLGyoJj01B1TfXhZmbhlV+B8NEhgUcM/l2SVqFFJIHso/x
         4FqQ3c7D/A2f80CMriMj3G5SvWOMhvS3Porg6/wOpImMTRugyhiRvQuqAE1KzN3Xrdo6
         f/Mxj5DWRdKzTxaEV8vwmqHOpCb57CQuSYPBAw/FeYI2aCI6MOms0IZxN0ne2/xwb1i6
         1wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3gdFnNTjlBMPb1mUbD+wn2w2N19sjebH6hDGjqnGguc=;
        b=taSdtz3VUd5Fk4WgJ8JJgxMTsAGR4p/JZn6KDU4FXQEZjXmTWoiLNCr5w8L5rfS2Nu
         kkvPWXqPLlXNd/xWy5xiDWsxGoxhr+nmneL7l8yl50ct8c7JECE5ZvsA2tdtPy+jD6Xa
         kGew9VkLkek864W+f9qH1c7d/4QfW7Jnp/CJrgSNT96D/nwDQuYavUCayi/wZKLgmkuX
         AvyCHMz3dQtztXAQSmBRP32mU7fXK9BTYNWDoZ2abzIWvaUXnkAbfQ81uMqP900p6czb
         7baDsTTi9iprim8uH1ZJJ07Ggt0qdywlg1ehTuLU1cD7IwolOLx2Bcgmzssxzk5Xa6fK
         OywA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311Ekz7lugD5kJC2lihVZ4iSjtxGgaaA6Newt2fAMwEj+cOB4vd
	/FiieFWRdQFz31TjYCR/wF4=
X-Google-Smtp-Source: ABdhPJxsA7zv0oBLzi5UuMkNWhCHVD3x/TCSyaKT1LspwsbXiqHn34m1iXQmhhL9Yil9ZRLdU8x1dA==
X-Received: by 2002:a2e:a551:: with SMTP id e17mr6293350ljn.389.1619853131350;
        Sat, 01 May 2021 00:12:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e2c:: with SMTP id o12ls318248lfg.2.gmail; Sat, 01 May
 2021 00:12:10 -0700 (PDT)
X-Received: by 2002:ac2:5288:: with SMTP id q8mr1436391lfm.460.1619853130315;
        Sat, 01 May 2021 00:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619853130; cv=none;
        d=google.com; s=arc-20160816;
        b=iElZZ9NmWTJ8BpHcGXIFPNFqYrwbT7ElnI+/M2z7zjoye2iQ4NPYtd/I0A9r4E+/YB
         336ERpdv3oEztKOvMbfVG9HmM7QpwmMUNCkH/wpGNbiGSlHAvufvIin0w/XXAId4Gm/l
         oE5kuQU4DUR/ivg9wkwnnSIiaYbB+0lhYxTbGGiSkgyhbNk7STuhZcgNMlKfToz3WR66
         wthqsStqClH56ngGeFazNcu2dSw366gO1iR7t0kiIuipEy61wxqPlvttPiMxRSPdlPeh
         pReebIVv+5xgsQMWM1seC13EROww3+J7hG0qfBF77LPdXXNF0BSybo+OUzCE5fTwSEx3
         eB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=pvagbNycjJjKbvUe2s5DbSKmLUyW8zR/DjHFQkDlqlQ=;
        b=p/ffqhXaQ5Eil9N2Dm7Hy2Lj/J2SZj6/R/dAHqw3P2P0W1UZm3T0zaa60IzWAp0TKB
         ptJmhLOSrcQPWOYZKyaui8+bMfxqEGk9cLAZgK2g+mderbGvOveXF/iRm6GnFmmIajiG
         fedA06J8fqMJTzlt3WnYLeDWUNOspxHnPO3XW20lfsWQkTccWE9gw8V50OKB5KbrOsn8
         +s54Hbc1nsXYeo3O/OlpvAeGBE9tpaIv6qAnKF+/hPiG/yICCtfzxoWDGzV/Yfl5rYrs
         PXBM0gdtmBEjss61kNhNnVmE/mP6RJXbTbErubzIgfSTro9ojimDdI5WzJW2wVqF5qCf
         6XRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nPCtDKDm;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id n10si548219lft.1.2021.05.01.00.12.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MLgQp-1ldYk60s0h-000vva; Sat, 01
 May 2021 09:12:09 +0200
Subject: Re: HELP about Jailhouse
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <743a492d.2b32.179176b845e.Coremail.caohp19@lzu.edu.cn>
 <a83de6d2-e84f-42f3-a1e7-84a782ffb28fn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <05440370-838b-8007-acb1-3e8c77f4a1ae@web.de>
Date: Sat, 1 May 2021 09:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <a83de6d2-e84f-42f3-a1e7-84a782ffb28fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v+ooIA+xlUB7aRCNCV5kFAPoeemfImPRGWeq/q3OR5RtLXt8Kjc
 bdeh/I9i2HEN+bL+2iNiF+VfugjXlZfdpZ5PCkJ5Re+flHzuY/RkXmLnAabEivcsZySq9yR
 qIce2s7glvxvZ5XLR+uDPovOgCQGQ3zRbFfoaJCP1qqFHNj+SZiIIrj3LEQgdDHovxhztfU
 7sjciKXWRQKxwolCXZe0A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7gpVN2cN0rc=:GO2B0cAdfo6KM2uC/tdYnf
 GZMM5vds/Cikt9DPZ1QkNSgQKiFsQS2rZ8Pq7QLXGY0sqI+PxYtPqrQiOIil4pDkLvmIhZXU7
 3PVKASzR8O368R0dqbYV/KPchP+tGdHnyNrc1VLSdgAFda/77zvaCt0vAC49NoJyOm18JGP/P
 NpAVCQSGfJHdIfhtmn8B4DE5RZAY7z0vpiS3BL4Tf5emHbow2jITnAfjZ76rwfOy9DaI6rVt3
 HTmUUWRMhGWFiXaRwochAHLAPcny2jghT4k4OOT5oFpfsf0CaTa6LYqBPb2pf0lj88dWAwMD4
 s517Qgl1eD2wsf0nBQVdhWmfbIRuxk3VmlDx5nviXzUEU2SRf+bgSknL8PvYyKKnqIUjEeo2B
 EHZJdczdBKQK81e88kpoGKya9C1x6C4wcdyut+SlLmsHK2TW2d6GY9/WrDlPTGmIU8aZj32Wr
 CeXUnMPMHym2oQtOVGuSLksVPbn83ZSNRS1V5H6h03bMpvFRVaC1wi3tdYrJd+xVVfSG4jMjt
 Wc9aJj/9b7/imqvoIWhznEZVPDfBj+ZQ/iRwr9yh1uVtuTjEoEY3FD+u7488cAB6zgXsuS6fN
 sPtW0aQ8vTLA7gaGoVa3L51NYiVRZTIogt5IJyuGJzPdfEXEnaVFy9F5p0uSOujmKA3XQrq9a
 mGDUNSbXJDWWoxoSwS2JFKjje4l/kSmG5mGxzRFyrBlPCs89uLWhY/4dGwfwHq9K6HU6UnkRr
 Iuv8OmwU/4pECU6LJ9bUvpWrUXxMToC3tsY4BRkHW5G7FcSI4uj4fu28DsCG5yDrZei/5Ew2z
 h7mzNLOVAaunYyBddCnVbuvTbCrNa/roCkDGtz+IRudJ/g9QYjJrAx5EJ3koahacqRGlmF47E
 IBg00W1dUXf4kNYJMyEjwYRmQfjlLjfXiMJ9Ow32loXizkueGbsWYH9VaVbbtfzDpgitMeuUZ
 PVKzzRBv+1M+mDTesqBDeN5lCqDSmTgkYd5uHVbIlebHq/AQ1+cGY9PJKMf7PoiP2sEOEABBg
 Zp0tdOlWe3RpTqbrz8pifjD+RdOM7Jnbp5DuvMFZ74Tz0//0xfx44gmWwklwVzXHC38wRlLPi
 Ma1GGriibX/TUh0/svOgjTgpqBJA0EBM9tPMbj5/UtCsX5aTadLMeFHhM3gLrRdCXSlOLmrq/
 Sv9mP5gZVKqUK3Y1V48VBiYIDpIyPRxxiKLGQbC6pyafdLkwPz5COwyHbB3ksPSV7ezbk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=nPCtDKDm;       spf=pass
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

On 30.04.21 04:41, along li wrote:
> the jailhouse from=C2=A0 jailhouse-images is=C2=A0 =C2=A0github.com/simen=
s/jailhouse=C2=A0
> "next" branch.=C2=A0=C2=A0
> not the=C2=A0 master branch.
> maybe it's different.
>

Yes, master and next branches are currently different. Next contains
major updates for the kernel and several firmware components. But both
master and next worked for me on the RPi4 - with default cell
configurations...

Jan

>
> =E5=9C=A82021=E5=B9=B44=E6=9C=8828=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UT=
C+8 =E4=B8=8B=E5=8D=883:39:57<=E6=9B=B9=E5=AE=8F=E9=B9=8F> =E5=86=99=E9=81=
=93=EF=BC=9A
>
>     Dear sir,
>     Last year, I used the rapi-linux-demo.cell to launch a second cell
>     on my Raspberry Pi 4 model B. And the memory size of second cell was
>     about 184M.
>     However, that is not enough to me to execute some test on it. So I
>     try to change the size of the cell in the rpi-linux-demo.c, but it
>     failed (maybe occupied
>     other's memory, I don't know). A good news is, someone fixed this
>     problem. The demo can provide 1G memory size=EF=BC=8C and I git clone=
 the
>     new project.
>
>     BUT when I executed the operations same with before, I can not build
>     the jailhouse
>
>     my operations is:
>     1. git clone https://github.com/siemens/jailhouse.git
>     <https://github.com/siemens/jailhouse.git>
>     2. sudo make &amp;&amp; make modules_install &amp;&amp; make install
>     3. sudo insmod driver/jailhouse.ko
>     4. sudo jailhouse enable configs/arm64/rpi4.cell
>
>     The 4th step is failed, the error is:
>     JAILHOUSE_ENABLE: Invalid argument
>
>     I don't know why it occurs. Because there are two project on my
>     Raspberry (one is new, the other is cloned in last year ), the old
>     one can run properly.
>     If I can get your generous help, I will appreciate.
>
>     Yours sincerely,
>     Hongpeng Cao.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/05440370-838b-8007-acb1-3e8c77f4a1ae%40web.de.
