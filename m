Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2OF4TYQKGQEVT2THNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCD81516A3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 08:53:13 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id w6sf9757283wrm.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Feb 2020 23:53:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580802793; cv=pass;
        d=google.com; s=arc-20160816;
        b=jkXafGiPf4YfppPBSFf44QG9bibYuDPei2Vt84xFa+f3KNbkC33aVjdv3/B4kk0Sfi
         VNXu+hZ9hGe9PADpmiyjzaya23mTwKvGcq3aW1rDOOUIK93BOETdlKer74M7kGqtjYBP
         3HH1oo94hFbpgAdohGtXZnvKqSOnkANju97DBpQPwyiMy1xpBDKswdEYetLTFtaJqPC0
         DIzQVb/rP/KDROV5wcdpr4ONN7B02u7uFrV3KMRpSMBSWn3D8+eLPgLs72roEyS5zhRS
         Ims/vK8EEn0WMAuMOqTl6JUH2Bj4LAaNj3Ip/ZUFV6OCnCZ3M4GIdWAGiosbRDeZowPI
         rreQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=6VSN2J6M74nOiHgLDhuB2b8HEGAgQdx3FnA/LNiVtV0=;
        b=EVcyeY/fvEtq1oYDH9jJZeERXsjzLk4ghr/UR6gPG4bA8vH6rreb4vk/6dWIeZhBq2
         i6C4YM+KPKRiJ3/jrGHxK4YagnGsbaMT0IMWd8NvO0OdT638wtr3hLfYLFECYlmWbLk6
         mgWXzxCDHw0jldc5N9JcGYsPJumiQe22hBbunEVY/qbuFXpDwnupzzRf0iwmtbuBX2mw
         uViKUAOsP44I/HFLQxTkK5KMFZsrS61dZkwb37JBYl6sBmegJvC3BEWv2bvKoyP6tgGQ
         B4KDwLI+vLulxbjMZSsM4V0V/LyAYz8bia7SRH45t5PP8qztFjfZjZL7L9jqFNUm3F1k
         A2qQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6VSN2J6M74nOiHgLDhuB2b8HEGAgQdx3FnA/LNiVtV0=;
        b=SEjJA798DJYX8qrOB+UpYXHUM4pMvmzntRHILAxhauXfmonHR+TaOQ4/FLF2eOfT23
         Ngg7Uu+afUGq5r5rQ6pxBvtXgn9xtFU+TKI+TL1+b8V1myWMgPzGhObLL9zXb+c3ejYY
         I+Dy9YaD1kCKO9QP1Mn4w79xsKVE5+h8tMg5oAgnRzU2IOXquvde1rjapbuwBwjCH8hC
         tCzxtGI6uon8dZF3xFHfdSE311TWyPWwuA5GT+kC1MK+3Gag21VJA4j1uAnXWF6mUInT
         COj9OF+Cy5Q7UPUuuW6JTGnV8guaXLqIR8jIVwPgU6+PAujcfz9TICN17NNFDCvMcjf/
         jEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6VSN2J6M74nOiHgLDhuB2b8HEGAgQdx3FnA/LNiVtV0=;
        b=Ti8KhiwXtMQ5xmN+fU0t25ioR9eEZt7LeN6kvH4DQ8xwjdepBt3ZFfdIF9vjNgnTJu
         ECD0pDh271XBw6BPWSbqoF2bgMYG1aVGdmZdtMeAHVcMF7e7K+frcDw/+4Y7q7VMG2M3
         FtdSZVbMApj2RILVC1nfSrhXLmDimz67LKIMIz/A/uFBLLMCx1ZZf+N4NgTt0mFEv+OZ
         avxOpcwK8NDVpi2D+S3azByn9dvdyttMjojnGYJ7tskdwoqdpVgBzfzKKalPiUAgyWOt
         lleLFLPsXQxdcziROFVUNJkXn+LNZ6ITkA4t72c8T2jZhc+qh6HAqGcB8TPMXOAJpBXv
         sQMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVufTA/ULWNc1SkCfQwzggPek+T6GzQB1tBc6C2vi5oZ12fGlgL
	g0u2yjcw3Y5N6tws9wIrjOw=
X-Google-Smtp-Source: APXvYqzihkDxspLzftlmU9AweHu3IAirCJimIkzGhskevVk7OAH6Q5dThyepNk+ur+09ZO1NrAWk5g==
X-Received: by 2002:a1c:545d:: with SMTP id p29mr4436442wmi.91.1580802793485;
        Mon, 03 Feb 2020 23:53:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c0d9:: with SMTP id s25ls2080042wmh.0.gmail; Mon, 03 Feb
 2020 23:53:12 -0800 (PST)
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr4382857wmg.13.1580802792696;
        Mon, 03 Feb 2020 23:53:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580802792; cv=none;
        d=google.com; s=arc-20160816;
        b=mxm/v4smPpg04aCqnGAd3/E+7N/Vp07QME1RU2flOhSpPR8VFlSRLlX6vg1p+lrEOU
         +50CHBEvvXce61Rz4smi4MpXtZu0NR/CeCl9jDMSREPBHF71cmfnGfVDzi6rv352Tcp5
         t1//wGE2LCdex6UXF7tOJxCfHXNrWvcKrom0l9Oa+GC35kS0sA65zdiLUbyCcAwfZ8Dt
         14rX1JXOt25Xmmj2ZyyVR5lW3nDEh/ksoTZC5vkuy1BoaDGcX+9BT2CrYmeuoqeVDrnm
         spsW2dH+H4YKRMt7pp33WSe/eSxCmi/e7WXrI3Jqbn7cnlG+2oHDHSPdXvad4/7fIXoL
         PGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qcd8dhjfHt7DRtV3tnE98NPHRkqN27Ct+A+xyS9D/tw=;
        b=iYiNsFWYgWTtUHT3OdjW6aQ10KRMEY/+qkDGjYhrytMzN9dpgWna79IQkQfq6dmlDn
         eQefo7cylGwAXWAa0AE8RP+w0VeYG2HjZudS6XcuxtY+J19DYuPErWkriAoKmpP0IzI6
         uPO5GYpR+sGY+Hl5yRN3IKnx6IHlxaPk78xlmqsoBYC9eH28vmQe+4inMs8dDk4TX1Ha
         U4KMySZlNhqYbbq7z5BGcjgMlgBRT3nvytU6t42HqZdaJHGyyGGU2lXCw/UaK0WFVlNy
         2+09TMPQxdlqOZ04boi7q7ZF4e89jV96C0ivqDHNMkszJznxyJxnbebhwWNR+T42Y2/R
         2+2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u9si829089wri.3.2020.02.03.23.53.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 23:53:12 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0147rB8i005112
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2020 08:53:12 +0100
Received: from [167.87.48.192] ([167.87.48.192])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0147rBPV011798;
	Tue, 4 Feb 2020 08:53:11 +0100
Subject: Re: ivshmem demo exception on pine64
To: vijai kumar <vijaikumar.kanagarajan@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <abd4da70-a975-42b2-b9aa-b2d3d0c7bf01@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5e92d0a9-2d33-6f58-7078-0cef053a31d4@siemens.com>
Date: Tue, 4 Feb 2020 08:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <abd4da70-a975-42b2-b9aa-b2d3d0c7bf01@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 04.02.20 08:29, vijai kumar wrote:
> Hi All,
>=20
> I was working on integrating the necessary changes for ivshmem demo for=
=20
> Pine64 board that I have. But when I load and start ivshmem-demo.bin I=20
> am hit
> with the following exception. Any pointers on what it could be?
>=20
> Parking CPU 1 (Cell: "inmate-demo")
> Unhandled data read at 0x2100000(2)
>=20
> FATAL: unhandled trap (exception class 0x24)
> Cell state before exception:
>  =C2=A0pc: 00000000000053e0=C2=A0=C2=A0 lr: 0000000000004824 spsr: 600000=
05=C2=A0=C2=A0=C2=A0=C2=A0 EL1
>  =C2=A0sp: 0000000000007f90=C2=A0 esr: 24 1 1400006
>  =C2=A0x0: 0000000002000000=C2=A0=C2=A0 x1: 0000000000100000=C2=A0=C2=A0 =
x2: 0000000000000002
>  =C2=A0x3: 0000000000000069=C2=A0=C2=A0 x4: 0000000000000000=C2=A0=C2=A0 =
x5: 0000000000000000
>  =C2=A0x6: 0000000000001000=C2=A0=C2=A0 x7: 0000000000000000=C2=A0=C2=A0 =
x8: 0000000000000000
>  =C2=A0x9: 0000000000000000=C2=A0 x10: 0000000000000000=C2=A0 x11: 000000=
0000000000
> x12: 0000000000000000=C2=A0 x13: 0000000000000000=C2=A0 x14: 000000000000=
0000
> x15: 0000000000000000=C2=A0 x16: 0000000000000000=C2=A0 x17: 000000000000=
0000
> x18: 0000000000000000=C2=A0 x19: 0000000000000100=C2=A0 x20: 000000000000=
ffff
> x21: 000000000000110a=C2=A0 x22: 0000000000004106=C2=A0 x23: 000000000000=
0100
> x24: 0000000000000000=C2=A0 x25: 0000000000000000=C2=A0 x26: 000000000000=
0000
> x27: 0000000000000000=C2=A0 x28: 0000000000000000=C2=A0 x29: 000000000000=
0000
>=20
> My pci_mmconfig_base is 0x02000000

The virtual PCI bus only uses 0x100000. Usually, Linux puts the=20
resources of devices on that bus, i.e. ivshmem here, right after that.=20
For whatever reason, that access is denied.

Compare you config to qemu-arm64* to see the patterns. Or share more=20
information.

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
jailhouse-dev/5e92d0a9-2d33-6f58-7078-0cef053a31d4%40siemens.com.
