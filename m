Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBF7W7WVAMGQE32LYF3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735F7F63BF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Nov 2023 17:17:29 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id 38308e7fff4ca-2c6f3cd892csf10669961fa.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Nov 2023 08:17:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700756249; cv=pass;
        d=google.com; s=arc-20160816;
        b=PDs74yKVI5RR6DFmUtG2cBwIolBhFWAWBh08t3HgWZypV+00I6ymFdxiLS/zFIdYCb
         tKe1eHefC+CknCTHHb4W1PE1GS3USHRaIT11nZnRHUW+83OHG14bY5W7Nn7TJUsiL3HW
         W3d5G1hhYwSksJrwJ2P6Q/EJYbySt+wQDqA6iWVR8cc8sqMaRrpF5xuOxIO7jvxrEWIm
         gOnTcqRAQBGuFTexX9sCgpOeExIDajKJRitScQEkJXq/r2Q/6JV2rMw9nYijZ7XO050g
         3m9emllhfPQJREhlj9OVkyyzsDIB6pCAXHCzSYgaq1XRG8TAgbqCpBH/35x+eY08JtAN
         hsSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=gDYb/V8lIlp0g0XqzqwYkRtuxW2FooCza/H/b3pHbqs=;
        fh=t0Nw2nhOOnWFAR86PFfZva7qIMx1vMlLM9e++XkoW8A=;
        b=hLThRhHu+YTAZOtJFVRpKnKTLklIr3MtsXmJiZbw18LD4mucrSS9Zt4meZUVHP4W+g
         9XZmDat6RzjQkqGMB7mO8ilUtBfokAxhJpezR/DsGcu/e1qnSEnhL3IMKdibELxI0j1l
         RQY0aFDPmQSWWy6W/eW3wssgkoaGBcaO+48sgh1g6Jl63329mUlhMfNS63yprxVMsD5t
         NHiLJBsqyEJ9N+Uf6kZJzEQJx3cjoEv3CfGptw/G/biGUxAXg0BxkGBgPFwKYjOedhkV
         bb1ByIj/7Luzds1CxqjRF3qpxI0pD3SC+5lJtcUr+nCVntcyP83NWvawSGBywygvqvdF
         qnFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=lthQVtZj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700756249; x=1701361049; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gDYb/V8lIlp0g0XqzqwYkRtuxW2FooCza/H/b3pHbqs=;
        b=vMMTcfnUoXEasXxpNfhSNd8v5qr2BaBBrTLe0kobMRhtFdRtqt0NfPilqTruB7ihsB
         IvPSnXmNKx+8wQcXruz2DC+YvDIroBI7UBx6B869FAdn87WcRI8tg0ltBdAu5WNrvimv
         /rzEMhOniAzYP4/MtqZtFUE0hRdhHYlB6ns4tEVKMqjlbdUcG2YgUXQ5VgJGCoVrXQf4
         iDzTHVYOGcFBIDmpFasWdIqmsCcnQjomBLM5bLz5QbF36yTU93TcUCeJzMmYs2vmhky3
         YrTu14bx0ip+HvmA8IYHtsv7jJv41xMNeEhMQLJWdcUvTJAPAWMWT/dFdnxfc/NClbOJ
         fh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756249; x=1701361049;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDYb/V8lIlp0g0XqzqwYkRtuxW2FooCza/H/b3pHbqs=;
        b=vSAhfigL4A+WZqKBay6lLj8YuoqwBPvEHdALzD1kPwpgwmPOxSPihyJgK48I7mYbLY
         cGMhiIzoak1sdSheisXz0mFFBvyK754S1bWpSgPeu4DCx7HGdAnCNi+l+kXtUUE25cLb
         B6u4E7CMF/Ln5U3ZtXGs+UiWp2zUv2PMHBg1pCRn6yiaAMKPSbGBNwPMDIUIQhjKfJuh
         1+kgjNoFKXndvBLpDMGDQRih3TszTmj+hLFzIebxSUmk54M/jG2l5Fx/VREVphTmChV3
         fGqa28bMJbEmNC9nv5G5qjtmUQ2HKppQ+k6wh460WF+2b38VxNdL0GrvHqC35wlOOsEG
         UkDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwYJO57CBLekaal0uTs35CFfgoutQBnlkXBEb6mLBljeIqEPSaP
	zgR8UTThxChx5OczIMrKryI=
X-Google-Smtp-Source: AGHT+IGoHMierQjFHammo0rC0yCDC/jgCpl8ykSTCkdJGqR6GiK98DcwdP3CvyVgdPn7jDfvH8MByg==
X-Received: by 2002:a2e:9250:0:b0:2c8:6f42:e2f8 with SMTP id v16-20020a2e9250000000b002c86f42e2f8mr4418554ljg.16.1700756247744;
        Thu, 23 Nov 2023 08:17:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:223:b0:2b9:b171:d776 with SMTP id
 z3-20020a05651c022300b002b9b171d776ls565898ljn.2.-pod-prod-04-eu; Thu, 23 Nov
 2023 08:17:25 -0800 (PST)
X-Received: by 2002:a05:6512:2349:b0:502:ff3b:766f with SMTP id p9-20020a056512234900b00502ff3b766fmr5655628lfu.6.1700756244886;
        Thu, 23 Nov 2023 08:17:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700756244; cv=none;
        d=google.com; s=arc-20160816;
        b=bau7aXER4Nwv2J+sTf8WgptstRyuVHpPCbZ1RdYE2qO4Aep1y8vdHMVouI9TeTJOfv
         i/h6yjBMva9QGyLYKKhjBNVu72lBf7LQ9DPSQVdZVhpXuPwCxZ2nCmCfGsL6l+Ah3KVh
         XiaWTsx/LtLBFwsODpBNaxWunKIxUHWIKpp8QMaxd6qx033hjzLQ2MoIGBuwl9p76C7+
         pKO6PAR0kH7Ew788Jq2eh+FqWbdG4sgeXeW+6+Ch+Cs4wsoUy1ViXA14iLe0lx0FcyHc
         nprzA6CyKaxvR2pN5nXGQBpxPh0qLr3vFbUDo2JoID0Ryv2rTIqxqBPQrFFAWDnC0Lcl
         thYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NDyHDMi1CLY/R7K6LMYBfRhttYc9eFm848oEvAiUcjE=;
        fh=t0Nw2nhOOnWFAR86PFfZva7qIMx1vMlLM9e++XkoW8A=;
        b=jHd4DoLHBw1c4c+GB32xnXz4GRwqUjvue73/Z5Jo4HUYDaxn+7dzEB2jnGxVkl/4dG
         nvr3gdWA3Hj/kQq61LJpxP19boX2MsMpXn8KEgPgYGQose4mQDdrF8tGAjXnPyIEfNvl
         nXaLHoIjg6WRBQz9c9WcOH1PpFGwMGF658BEQ0WPuyzkFZXiLo2Cv9/y2/Q/WFziNHQ+
         cy25uzaqe5qUH7A2BP1RNesaWEPsrM7GrG7EohXCR57Wfcxrya2FMSbC9DB6hQjHWYc9
         jGBqrynwfyr05uQ1SsOPUOpZZP52j1vIPv5A4m7a4xE48q1c9ylcaIoDVEsjJr5jI1G1
         FFYg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=lthQVtZj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id k11-20020ac24f0b000000b0050aa9bd7f72si88964lfr.1.2023.11.23.08.17.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:17:24 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [IPv6:2001:638:a01:1096::13])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 73B7D3E00D7;
	Thu, 23 Nov 2023 17:17:23 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4Sbjtq0nKSzxr8;
	Thu, 23 Nov 2023 17:17:23 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 Nov
 2023 17:17:22 +0100
Message-ID: <d55b7419-79f5-4c37-aaa4-d78fef2c26fa@oth-regensburg.de>
Date: Thu, 23 Nov 2023 17:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: jailhouse enable linux
Content-Language: en-US
To: xin zhang <zhangxin6483@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <a3ea29e3-da4c-4352-a328-9a04c86b8b1en@googlegroups.com>
 <1024f0c9-f851-46e2-abcb-3f3b40f5c47c@oth-regensburg.de>
 <dfb71410-9ebc-4c01-87a2-4cd8e9f22308n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <dfb71410-9ebc-4c01-87a2-4cd8e9f22308n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=lthQVtZj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 23/11/2023 05:25, xin zhang wrote:
> In none root cell, start command is :
> jailhouse cell linux -i /home/file/rootfs.cpio -d=20
> configs/arm64/dts/AMA0.dtb configs/arm64/linux.cell /home/file/Image -c=
=20
> "console=3DttyAMA0,115200 root=3D/dev/ram0 =C2=A0ramdisk_size=3D0x1000000=
=20
> earlycon=3Dpl011,0x28000000"

Okay. Are you absolutely sure, that the device tree matches with the=20
cell configuration? I wonder why the kernel tries to access virtual (!)=20
address 0x1388, which apparently has no mapping. In case everything is=20
configured correctly, then we have here some issue with the kernel, and=20
you should debug in this direction.

   Ralf

>=20
> =E5=9C=A82023=E5=B9=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 U=
TC+8 21:15:15<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
>=20
>     On 22/11/2023 07:25, xin zhang wrote:
>      > when I run linux image on jailhouse, guset serial port print follo=
w
>      > errors: where I can get ways to sovle it=EF=BC=9F
>=20
>     Please provide more context. Does this happen in the root or
>     non-root cell?
>=20
>     Ralf
>=20
>      >
>      >
>      > [ =C2=A0 =C2=A00.069576][ 0] [ =C2=A0 =C2=A0T0] Mount-cache hash t=
able entries: 1024
>     (order:
>      > 1, 8192 bytes, linear)
>      > [ =C2=A0 =C2=A00.078110][ 0] [ =C2=A0 =C2=A0T0] Mountpoint-cache h=
ash table entries:
>     1024
>      > (order: 1, 8192 bytes, linear)
>      > [ =C2=A0 =C2=A00.087451][ 0] [ =C2=A0 =C2=A0T2] Unable to handle k=
ernel paging
>     request at
>      > virtual address 0000000000001388
>      > [ =C2=A0 =C2=A00.096606][ 0] [ =C2=A0 =C2=A0T2] Mem abort info:
>      > [ =C2=A0 =C2=A00.100564][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 ESR =3D 0x9=
6000005
>      > [ =C2=A0 =C2=A00.104789][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 EC =3D 0x25=
: DABT (current EL), IL =3D
>     32 bits
>      > [ =C2=A0 =C2=A00.111299][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 SET =3D 0, =
FnV =3D 0
>      > [ =C2=A0 =C2=A00.115522][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 EA =3D 0, S=
1PTW =3D 0
>      > [ =C2=A0 =C2=A00.119834][ 0] [ =C2=A0 =C2=A0T2] Data abort info:
>      > [ =C2=A0 =C2=A00.123883][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 ISV =3D 0, =
ISS =3D 0x00000005
>      > [ =C2=A0 =C2=A00.128898][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 CM =3D 0, W=
nR =3D 0
>      > [ =C2=A0 =C2=A00.133034][ 0] [ =C2=A0 =C2=A0T2] [0000000000001388]=
 user address but
>      > active_mm is swapper
>      > [ =C2=A0 =C2=A00.140600][ 0] [ =C2=A0 =C2=A0T2] Internal error: Oo=
ps: 96000005 [#1] SMP
>      > [ =C2=A0 =C2=A00.146667][ 0] [ =C2=A0 =C2=A0T2] Modules linked in:
>      > [ =C2=A0 =C2=A00.150892][ 0] [ =C2=A0 =C2=A0T2] CPU: 0 PID: 2 Comm=
: kthreadd Not tainted
>      > 5.4.18-101+ #2
>      > [ =C2=A0 =C2=A00.158367][ 0] [ =C2=A0 =C2=A0T2] Source Version:
>      > e7f24793ad667e777f2cf6dab620d082517f6075
>      > [ =C2=A0 =C2=A00.165929][ 0] [ =C2=A0 =C2=A0T2] Hardware name: FT-=
2000/4-D4-DSK
>     Development
>      > Board (DT)
>      > [ =C2=A0 =C2=A00.173317][ 0] [ =C2=A0 =C2=A0T2] pstate: 80000005 (=
Nzcv daif -PAN -UAO)
>      > [ =C2=A0 =C2=A00.179302][ 0] [ =C2=A0 =C2=A0T2] pc : __alloc_pages=
_nodemask+0xf8/0x308
>      > [ =C2=A0 =C2=A00.185283][ 0] [ =C2=A0 =C2=A0T2] lr : __alloc_pages=
_nodemask+0xe0/0x308
>      > [ =C2=A0 =C2=A00.191263][ 0] [ =C2=A0 =C2=A0T2] sp : ffffff8031867=
c30
>      > [ =C2=A0 =C2=A00.195749][ 0] [ =C2=A0 =C2=A0T2] x29: ffffff8031867=
c30 x28:
>     0000000000800700
>      > [ =C2=A0 =C2=A00.202258][ 0] [ =C2=A0 =C2=A0T2] x27: ffffff8031823=
a80 x26:
>     00000000ffffffff
>      > [ =C2=A0 =C2=A00.208766][ 0] [ =C2=A0 =C2=A0T2] x25: 0000000000400=
dc0 x24:
>     0000000000000001
>      > [ =C2=A0 =C2=A00.215273][ 0] [ =C2=A0 =C2=A0T2] x23: 0000000000000=
000 x22:
>     ffffffc0113fa000
>      > [ =C2=A0 =C2=A00.221781][ 0] [ =C2=A0 =C2=A0T2] x21: 0000000000000=
002 x20:
>     ffffffc0113f9000
>      > [ =C2=A0 =C2=A00.228289][ 0] [ =C2=A0 =C2=A0T2] x19: 0000000000400=
dc0 x18:
>     0000000000000014
>      > [ =C2=A0 =C2=A00.234797][ 0] [ =C2=A0 =C2=A0T2] x17: 000000009242c=
113 x16:
>     00000000b8b3e41b
>      > [ =C2=A0 =C2=A00.241305][ 0] [ =C2=A0 =C2=A0T2] x15: 00000000b31b3=
9bd x14:
>     0000000000000000
>      > [ =C2=A0 =C2=A00.247817][ 0] [ =C2=A0 =C2=A0T2] x13: 0000000000000=
001 x12:
>     0000000000000001
>      > [ =C2=A0 =C2=A00.254325][ 0] [ =C2=A0 =C2=A0T2] x11: 0000000002e03=
c00 x10:
>     0000000005c05800
>      > [ =C2=A0 =C2=A00.260833][ 0] [ =C2=A0 =C2=A0T2] x9 : 0000000000000=
191 x8 :
>     0000000000000004
>      > [ =C2=A0 =C2=A00.267340][ 0] [ =C2=A0 =C2=A0T2] x7 : ffffff8032fe0=
378 x6 :
>     0000000000000000
>      > [ =C2=A0 =C2=A00.273848][ 0] [ =C2=A0 =C2=A0T2] x5 : 0000000000000=
003 x4 :
>     0000000000000000
>      > [ =C2=A0 =C2=A00.280355][ 0] [ =C2=A0 =C2=A0T2] x3 : 0000000000001=
380 x2 :
>     0000000000000000
>      > [ =C2=A0 =C2=A00.286863][ 0] [ =C2=A0 =C2=A0T2] x1 : 0000000000000=
001 x0 :
>     0000000000000000
>      > [ =C2=A0 =C2=A00.293370][ 0] [ =C2=A0 =C2=A0T2] Call trace:
>      > [ =C2=A0 =C2=A00.296978][ 0] [ =C2=A0 =C2=A0T2] =C2=A0__alloc_page=
s_nodemask+0xf8/0x308
>      > [ =C2=A0 =C2=A00.302609][ 0] [ =C2=A0 =C2=A0T2] =C2=A0copy_process=
+0x1a4/0x1340
>      > [ =C2=A0 =C2=A00.307536][ 0] [ =C2=A0 =C2=A0T2] =C2=A0_do_fork+0x8=
0/0x370
>      > [ =C2=A0 =C2=A00.311934][ 0] [ =C2=A0 =C2=A0T2] =C2=A0kernel_threa=
d+0x6c/0x90
>      > [ =C2=A0 =C2=A00.316686][ 0] [ =C2=A0 =C2=A0T2] =C2=A0kthreadd+0x1=
e0/0x270
>      > [ =C2=A0 =C2=A00.321173][ 0] [ =C2=A0 =C2=A0T2] =C2=A0ret_from_for=
k+0x10/0x18
>      > [ =C2=A0 =C2=A00.325924][ 0] [ =C2=A0 =C2=A0T2] Code: 3901c3a0 a94=
50ba3 b9406fa1
>     b5000b62
>      > (b9400860)
>      > [ =C2=A0 =C2=A00.333224][ 0] [ =C2=A0 =C2=A0T2] ---[ end trace 7e9=
dcf3f049b9227 ]---
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a3=
28-9a04c86b8b1en%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8=
b1en%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/dfb71410-9ebc-4c01-87a2-4=
cd8e9f22308n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/dfb71410-9ebc-4c01-87a2-4cd8e9f22308n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d55b7419-79f5-4c37-aaa4-d78fef2c26fa%40oth-regensburg.de.
