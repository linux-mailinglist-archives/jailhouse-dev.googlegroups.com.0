Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBE4ESTZAKGQELMQMCOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id B105415BA61
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 09:00:20 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id k6sf4235181edq.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 00:00:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581580820; cv=pass;
        d=google.com; s=arc-20160816;
        b=VUVKDY2qAOGfbGtksueehgsnNV3jaA0d/Z1ErCQDCRg9WnMBr/y6huhCcIz4z200Hd
         o+fxvm/NXlXJglsfG+b6apyR2cWEzDRfaOUNMHhTmEhnF9Y5+d9VinYVkEt39vkbYnZu
         uszW17IEUHrRT8p907W/yT4tQY8SJS/PdBmQiLHsSz1QYLcS3CaoWU++hSfTkD7rD45P
         r7GCG4qhsQkkj3HdroLfNtgKMwwuJyipp0eJ5d8mpcPjZXZrJsPIXMnEm9HrRxX45DXk
         ftgKvP5YnvXhghvu8lsxh66TB7j6PU2BP+wq6TxWizYqFa1wUzNU96+Yk4QXSJdZrq5u
         1T3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=w3gyEG/CAC+azlauBN9+RlyqJtOKm0B8lYbN4BkuFSg=;
        b=HCCtUXG8A76NgtjodDFx4b/92CoXLdiEyjzWvN23A05b/JiWLrnFSLgaaqCgOzt/9I
         qSMCQpcu72RndWsvI+8fsq7/TlU6Nor0FfWQ8CbT074/4WtF3KwUh/585PmLJ2fEruw1
         OEIRKAtcevVIKxJ7SJLtvzVBBNgxXliHPkHmIRZl8Wg4rPWo6nczoE0Ccz88cT5Pinqn
         AQY0YIfoMrPTJznaE+2IedVj/6B9XMVX5yoMZy2owLVhABDnhpJsEEfUw9cgAXT5Idut
         00bmDId8NvFNUVtSCSHY9mCnwMo0D3RmkkFXp4JYusjiof7d8KOD7G6PL6YVc0CPEIXc
         lnFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w3gyEG/CAC+azlauBN9+RlyqJtOKm0B8lYbN4BkuFSg=;
        b=U6rv2TeUcd7ovN0hBKsHSAOtTmwsuFBR8VPRlTIC8t0tdve0fDvTJueSW+3FqI5dhY
         zChTj7+WSSmcA7bmspVwmSZj4/d4vIXIZbkd2dgm7oqTUNG5GXQh/mC4SBIjE7W+PLz7
         oW9xSR91NgaheuPRg0XNco+Jhulf40XNiOJkqUlUWMc7Fzw9m5whtemZjGsQfA1gBTbL
         9sPVkpvmzccGSItMINBac7kKjExvLdiZgV2mfnHWjGUsa3c9ulVIZR8gcdPyuvazr6lQ
         8SAKKlbrFWL2J6k5KeV89u0ADG/a5w2sHEQBbw+465gt6jZUsc9zB+cKYwg4repusDpG
         ydYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w3gyEG/CAC+azlauBN9+RlyqJtOKm0B8lYbN4BkuFSg=;
        b=fWKfEP0xBYwQYh6i1JMp8EUjuHL3qEmmRysRFhr1v4NvcA2GCUI1kAPFzLw4h2W4Au
         75Ltt/y6DCeMK3jnCueIMAymbAoxYSvNMJ8s5pOkbJjI4ubJCagjfSYoFNiKSUkuwLAg
         1oxfwE6a8F+yP9akI1ukv6Y6b/U+TMX0FXIJd/dOGPwa1tWvC0/AhVEU9r/7dIVWoQqn
         Raxg/2gJm48aoiLwLwOB1+rdEZiBoW5MdTZr48mlv8cT9qRyKzen6SoAx7R5USF02MS2
         VUIXhQFbJSlDP/19cMzvHF0Jwf6nXfeX3XrxiIetVQvdimtJbQa2ySa98cR89EjsW86I
         t+/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLVjnsLesfBdexvpZ6Rlaw4YBiyyq1Oq29nHODvZAs1G7oAXl+
	np2sYjEOmO68zv2kk4q66fs=
X-Google-Smtp-Source: APXvYqziP38FOi9BC4DZtagFydc6do0Ir4saFD41JfNjkybVnrjd5Wy3dURLP18z9kRcQY8F994Kag==
X-Received: by 2002:a17:906:4d43:: with SMTP id b3mr14873663ejv.109.1581580820422;
        Thu, 13 Feb 2020 00:00:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:405c:: with SMTP id ns20ls11550491ejb.3.gmail; Thu,
 13 Feb 2020 00:00:19 -0800 (PST)
X-Received: by 2002:a17:906:b212:: with SMTP id p18mr15642076ejz.208.1581580819076;
        Thu, 13 Feb 2020 00:00:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581580819; cv=none;
        d=google.com; s=arc-20160816;
        b=l3lJk7M/HI81HPKdqMJiyxnSAlcffL6Qz8dJsoQLRHEFeV01wbf+Q53gbyEtKR/Irm
         G64VDy6cgjHb4vn81BEvpaEa+YCcVxB998OoDYt9AvC3/tpbm+vJwWntVrxqcSp4Pc98
         Lg6/kKysZHPywlX0Y84iLPkU0xyiyZ/TJZ6YrTMJ/QNdRj3RfPqxgldIvFCAdqVTfMKk
         SRUB/ztgk2t/H+uvBulsLEQWsmf+PQIgxkhZdxMsYIANwu5uGoOQFpE/4SxNbQrFrMKZ
         LMundbcrWx1mjhxQfcFtlV9XI0PR068DC2HkYUAvOEHDmiLwD3cIrVaWUspdiD3FnQYZ
         pnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9mjH97f4h1Zyeu1f8OHukRkRRvlrjlwb/B7clxWLzmU=;
        b=u+NXsZyjH+Y9/Qt+o1VJGRhpM6sMRP2/Oho54StjY8PjAqSIW7/Ab4G4a7mZeshEy3
         HOco4yh3E+jRV6O04AjS4skJYZwZUrLbzg7oE46MWwD/zDs92WpLaWFfJulsE8H+X8lr
         ihlLlrIkU7JFBoAW25ATNgOKlwfMCi/Bx2Ft1ooIK7oqUQYkSOKxTidBkr1yIhMMNQ0A
         GFujj/44lD1MLECgaDTpvIZVYSFAvXOMm3vj6vlykkq6l6xOUz52Ar+J4UTNNJkt0f9u
         ReVwxXWwnb6vu+JoMGLyxBlz9AZFE169/6SxGvP7U6ic/F1Dt4EuCs0wzclLX+9sqoTf
         Jjlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x18si66201eds.2.2020.02.13.00.00.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 00:00:19 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 01D80IsJ013039
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2020 09:00:18 +0100
Received: from [167.87.46.122] ([167.87.46.122])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 01D80HlS002529;
	Thu, 13 Feb 2020 09:00:17 +0100
Subject: Re: jailhouse compilation error (no include path)
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8@googlegroups.com>
 <c6de1284-fa93-cb9c-44b2-552f851a5470@web.de>
 <7cf1060e-2b4f-4d3f-a57e-a3079a4ef460@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e936b8a4-acd5-6cdc-a5d3-8664da7f2c2a@siemens.com>
Date: Thu, 13 Feb 2020 09:00:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7cf1060e-2b4f-4d3f-a57e-a3079a4ef460@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 11.02.20 21:56, Saroj Sapkota wrote:
> Thank you Jan, for the continuous support and encouragement
>=20
> I also tried in upstream kernel v4.9-tegra and=C2=A0 got the same error.
>=20
> Furthermore, I also try to cross compile on x86 host(different machine)=
=20
> one=C2=A0 with v4.4, and other with v5.0.1 all of them results in the sam=
e error.
>=20
> So whats the issue here I get really frustrated as same error pops up=20
> everywhere.
>=20

Maybe you are building against the wrong or an improperly installed=20
kernel source tree. You will have to do local research to find out why=20
the build error below is reported, ie. where=20
dt-bindings/interrupt-controller/arm-gic.h is lost in your kernel tree=20
We can't tell you this from here, we can only tell you that it=20
definitely works under normal conditions.

Jan

>=20
> On Saturday, February 8, 2020 at 3:10:12 AM UTC-6, Jan Kiszka wrote:
>=20
>     On 07.02.20 23:55, Saroj Sapkota wrote:
>      > While trying to built on jailhouse(master version) on jetson tx2
>     board I
>      > get the following=C2=A0 error:
>      > kernel version-4.9--tegra
>      > nvidia@jetson-0320218169735:~/jailhouse$ sudo make:
>      > =C2=A0=C2=A0CHK    =20
>     /home/nvidia/jailhouse/hypervisor/include/generated/config.mk
>     <http://config.mk>
>      > =C2=A0=C2=A0 UPD   =20
>     /home/nvidia/jailhouse/hypervisor/include/generated/config.mk
>     <http://config.mk>
>      > =C2=A0=C2=A0CC    =20
>     /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-demo.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/amd-seattle.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seat=
tle.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-demo.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/espressobin-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/espressobin-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/espressobin.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/espresso=
bin.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>      > /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.cel=
l
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>      > /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/foundation-v8.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundati=
on-v8.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/hikey-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/hikey-inmate-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/hikey-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/hikey-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/hikey.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey.ce=
ll
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/imx8mq-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/imx8mq.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq.c=
ell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/jetson-tx1.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-t=
x1.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/jetson-tx2.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-t=
x2.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/k3-am654-idk.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654=
-idk.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>      > /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/k3-j721e-evm.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e=
-evm.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>      > /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/macchiatobin.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiat=
obin.cell
>      > =C2=A0=C2=A0 CC
>      >
>     /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>      >
>     /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c=
ell
>=20
>      > =C2=A0=C2=A0 CC
>      > /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo=
.o
>      > =C2=A0=C2=A0 OBJCOPY
>      >
>     /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.ce=
ll
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/miriac-sbc-ls1046a.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-demo.cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/qemu-arm64.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm=
64.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/rpi4-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/rpi4-inmate-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/rpi4-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-lin=
ux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/rpi4.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4.cel=
l
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/ultra96-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>     /home/nvidia/jailhouse/configs/arm64/ultra96-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/ultra96.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96.=
cell
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>      > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.cel=
l
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.o
>      > =C2=A0=C2=A0 OBJCOPY
>      > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.ce=
ll
>      > =C2=A0=C2=A0 CC    =20
>     /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.o
>      > =C2=A0=C2=A0 OBJCOPY
>      > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.cell
>      > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/configs/arm64/zynqmp-zcu102.o
>      > =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-z=
cu102.cell
>      > =C2=A0=C2=A0 DTC   =20
>     /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb
>      >
>      >
>     /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54=
:
>      > error: no include path in which to search for
>      > dt-bindings/interrupt-controller/arm-gic.h
>      > scripts/Makefile.lib:291: recipe for target
>      > '/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb'
>     failed
>      > make[3]: ***
>      > [/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb]
>     Error 1
>      > scripts/Makefile.build:479: recipe for target
>      > '/home/nvidia/jailhouse/configs' failed
>      > make[2]: *** [/home/nvidia/jailhouse/configs] Error 2
>      > Makefile:1429: recipe for target '_module_/home/nvidia/jailhouse'
>     failed
>      > make[1]: *** [_module_/home/nvidia/jailhouse] Error 2
>      > Makefile:40: recipe for target 'modules' failed
>      > make: *** [modules] Error 2
>      > I also tried it cross compiling in host machine and I got the same
>      > error. (i also tried cross compiling in different x86 machine one
>     with
>      > kernel-4.4 (ubuntu 16.04) and another with kernel-5.01(ubuntu
>     18.04) but
>      > same error as above pops up)
>=20
>     Then it is likely an issue with that downstream NVIDIA kernel.
>     Jailhouse
>     builds fine against upstream v4.9.213 (although that is surely no
>     longer
>     a recommended version for it). Maybe NVIDIA fixed that in newer
>     versions
>     of their SDK.
>=20
>     Jan
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/7cf1060e-2b4f-4d3f-a57e-a=
3079a4ef460%40googlegroups.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/7cf1060e-2b4f-4d3f-a57e-=
a3079a4ef460%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e936b8a4-acd5-6cdc-a5d3-8664da7f2c2a%40siemens.com.
