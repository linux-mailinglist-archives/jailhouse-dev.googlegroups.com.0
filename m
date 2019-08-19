Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXOQ5LVAKGQEMRI2X3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D51192577
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 15:47:10 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id v8sf548180ljh.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 06:47:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566222430; cv=pass;
        d=google.com; s=arc-20160816;
        b=knCMQb0vBHT/h+OJWmhbRn8/KbxK9driRNGYYdSr/SMtJxbU7iY/e7MGvYwoq/D4cB
         fBHTGRUiInCEwDn97RTTHPoWPs39rUNGMz1hY8Kmrn/rvWG02zgQlx4HhghKgbY7xiNL
         LMCwdkiiPe8PH+rzr6wuH9S6uPSPsh9xDA8x7CJXAirH/202YBTZqbMOmazCzOQdrx3B
         cznFY1oZN/1ytqaw/8Aebr4qWutw3xouq9xobDGXiAR1g1dU82saBkvq4cTCwmMUVKGo
         o6gsI5Ju62dFXystmYFW8exzYrKH4kwubSd6stF32RNphQulSE0/NdOwHD8+S6Si8MPn
         xc0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=wuK/UWvZRyhUPPhQvqrwrC50n2gCDaImaCNyZvQO+uA=;
        b=HmAQYPv6Vf8TIBv4cGRJsy+fnmu0oK6XG1dHeZLgDC2wI/G/KEKX2TQWUW0dBWYaLv
         1p4FeOGbglFS8sfdYM1RgBQw49JAc8yf4pnZzZF5XGdicIq8cI2n5HLcZTPPMGC8ehkC
         oEV+O6GQedL6Dp+4Hppy7giDap6U/XX6BhdP72RvigxdTCwk0ea7BNWv1VTWvJZnIuZn
         gQYVbL4nfp9ORXkIBeFrHuY6jyaxXfIy+7uqg20twfwtUC40p6grQB9wyOr94thinfg7
         HthXnMgRiiUO+rBsXpdvp3toUmL9n20Ojhz8teDr0mPRzu+T2I89IVT3ExGccUFt0sEk
         Z+cw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wuK/UWvZRyhUPPhQvqrwrC50n2gCDaImaCNyZvQO+uA=;
        b=dM6f+Q+O8xa/HkMP7iYAvmnUb1yk0/khZWCxxoylqtv+4IYrUAeiLeDWwRGamGeF/s
         CR9TyfSbc06ERWC0wuBOCjhlf5GtUSUJtwEkq3UZTvKFMfgCCx5v8rqxC3Ou7c5ydouP
         Qyo8vTqIMCJtRuIli3TG1cM1KVnFI+4jLA+mPd1nJ2caJczckvIkcEQJ9LSxW/IYvrU7
         +Hc1BlJkPGWgZkp1hppmhh5h3d6AqXw5a+30N/kqiainq1IJrWyJ1gwHTSbsvL6RVzj0
         bSmnt+B0J4OaPfHAa8iIQE46AuUFDFs2hn32OzEAQa2JcD94gfnb97aKrJ5PTat3/WtL
         1asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wuK/UWvZRyhUPPhQvqrwrC50n2gCDaImaCNyZvQO+uA=;
        b=EV//0B+IaX7Y4mDJEObG4JNKZEXNZQWJ+CU5RXZ5HRCyFbAH+u7PHawtkEILJtM0XX
         vkhWtJSR9Gqp6RPBNgKt/4v/8RR7P6jB7AI4M+9zE064fY2mbhTGQ+mEWFQWV/AiqXHQ
         sj+viA8EqpfckzFv4rt9SjZzn0YUAuaDj2iFHkpixfIept+0Jj0Q08lhvPRQGod/eoqt
         XqdP1I03iVHC08/O1MLZ3nnh3x4AfJ7GBj03qm/mBp7NU4+cwHcvpKlzHfxaeKScGXqS
         Quxihl/XkNYoI7wxtOwgAzuKQP4hLzAg/pGQRbgQV18B38lzE+B7aWuNF+5h3nuVied/
         0VbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUUfIguvQXP68X/KFDbJTPRA2AqMLuFrNsPioeQjt4OH+xX7c4L
	RY8UDLs7p56VwicAZ4cQyzg=
X-Google-Smtp-Source: APXvYqwMtL5o8KMRY/gnZXHyylF+HSRLVV99+LkcY7TJlpLjzsKKl0jS4hBAbS8DZeIzYtGOpQCZzQ==
X-Received: by 2002:a19:6904:: with SMTP id e4mr12629778lfc.156.1566222430133;
        Mon, 19 Aug 2019 06:47:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:95c5:: with SMTP id y5ls1385310ljh.8.gmail; Mon, 19 Aug
 2019 06:47:09 -0700 (PDT)
X-Received: by 2002:a2e:8658:: with SMTP id i24mr9262841ljj.188.1566222429433;
        Mon, 19 Aug 2019 06:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566222429; cv=none;
        d=google.com; s=arc-20160816;
        b=dIxLEto3ubGDyuHfgUenpI4/HV7wsBzUv814ZjGbKF78L1NimxZLcCHtr4iAJYh9my
         CPSnAvu+D3+JZWB0CoE1JD68CwCyfqupgGe9gCHRMN90pv9P0fjFLbkVqiM5lrTTQ7Ql
         cosLe0zYgpEG1/xMagJyo9eb6F+vs/ZXNwNjXdrLfARXdqpNL+S8Eh0TGyu/bj1iO6nQ
         7RClsVUFyNlN+GfbhKvqa4cbZanzXAxm0Rd7xsbVG/MwrVxIt4hicN6TC2QxLiz1eoQZ
         7qcA+fChEQFxIiqKtoXbF7ZV32nfTDvAgL3k/qhiHD0GgUduEoRJX63pvxA3QUswaVC1
         E+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=xD127v8AOhuogSInFz1IXxMh37wh0Wsz9Kkgtbuvxqc=;
        b=TPF4wBBi1x7saXbrwHTRmrG2Mit45re4PEjOcIuO85W8EEKM2TQwMqE5LFZRrI6J94
         lAJMhXF43O3LTao2QmZ6m9wZAuZ7iEWcJmrGdOVH7G8B66eT6gAzsW+nN0gFGEqa0H/u
         qKgmDjyCqhi+yH8asihBBg4YdAkec/frxctWlycAYbqc7uuwCZBecRawI5PiaArg8X8X
         YSSkB/UFcBY+4ptZNUrXUbDQyCG42jRMnHFHxnfDQNiPHiT3gl4HCfFIUsrWevOf+Lbd
         R90tmiuNZLaP77O80BjIOJ37ClHUdN24wU8ovnz3gGVYYss/7EHyJJQEvCmCIzm2g2c7
         0rUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h11si86244lja.2.2019.08.19.06.47.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 06:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7JDl8IC010227
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2019 15:47:08 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7JDl70l011142;
	Mon, 19 Aug 2019 15:47:08 +0200
Subject: Re: Simulating Ethernet between cells
To: sebastiansaueressig@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <18334f63-04e4-4d66-8097-8f12cac6f4f0@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6ea86aa4-ec52-3c62-c8e9-8989df6c91e4@siemens.com>
Date: Mon, 19 Aug 2019 15:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <18334f63-04e4-4d66-8097-8f12cac6f4f0@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 19.08.19 14:32, sebastiansaueressig@gmail.com wrote:
> Hello,
>=20
> I wanted to ask if it is possible to establish an Ethernet connection bet=
ween 2=20
> cells.
> On my board there are no Ethernet ports I could use, so I have to simulat=
e this=20
> connection somehow.
>=20
> Here I came across the topic "shared memory region".
> I was able to build the region and /lscpi -v/ (inmate cell) gives me :
>=20
> /03:00.0 Unassigned class [ff01]: Red Hat, Inc Inter-VM shared memory
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: Red Hat, Inc Inter=
-VM shared memory
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: fast devsel
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at 100000000 (64-bit, =
non-prefetchable) [size=3D128K]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at 10000000 (32-bit, n=
on-prefetchable) [size=3D16K]
> /
> /
> /
> /
> /
>=20
> I used : =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .shmem_=
protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
>=20
>=20
> Now unfortunately I lack the idea what I should do now.
>=20
> On the topic Userspace I/0 I have looked at the examples of Henning Schil=
d.
> Am I right here ?
>=20

There is the shared memory device between (currently) 2 cells that is deriv=
ed=20
from ivshmem. This device can be defined to serve custom purposes, and then=
 you=20
may want to use that UIO driver. Or it can be defined to serve as peer-to-p=
eer=20
virtual network link. Then the ivshmem-net driver from the Jailhouse kernel=
 tree=20
will bind itself to these interfaces, and you only need to apply normal net=
work=20
configuration in order to get a link.

You can play with working setups when using jailhouse-images, including the=
=20
virtual QEMU targets.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6ea86aa4-ec52-3c62-c8e9-8989df6c91e4%40siemens.com.
