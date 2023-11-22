Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBY7566VAMGQE5O6EDLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF6A7F477A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 14:15:17 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id 2adb3069b0e04-50aa6b26836sf4612643e87.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 05:15:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700658916; cv=pass;
        d=google.com; s=arc-20160816;
        b=z4YKOFz15Sge0yrFdnAXtBegD9ppT4QxkSjn76FER7kKrWW4UcU04Sjq60PhjXyOPN
         BVoIXWtzCbvuV5JN0+OUOppceMePfp9LLtWyuHjsHpgE2/5L3zAEm27nPrNAIzfXnxQg
         9VhJz3qjCQxW7poy2qh1/RlpHhL9WK5Km9JYhH64h0Q7g+NHz8aGNqcOmlN/cQz7BL0S
         pRgekq6Z637Tn9s9aQrG7OV+JInI7ke9TBFvc8fwl33roSTyD7Zr3f9pfZtdQvuXS5Gu
         2GmgmFvP8VIskgDvaa70fcftVEBx2sN23jeycngKSuMaqpnWvCT8cHmBerTzC/vhtSEH
         Clrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=rXXLHLCodNvzv4CT30Q3mcxcyaDFj0EfHmw9VeUIck0=;
        fh=t0Nw2nhOOnWFAR86PFfZva7qIMx1vMlLM9e++XkoW8A=;
        b=VTvqE5Ri6XgM+iN57NOlmHALBrz2a9KdHfHzks+iWCkG2LQmnMwvWXffIiW04Xkvb8
         zK8Uu0jApfJEg/EQWHZSBdWndNA3nfL445UDAIvklSr8XNILrmj9xTZURl+BaX12Hv+N
         z6hFyb757ZLc8jhihCoKXif17vLD8V93Y/3+NLylOimdNMzdEMUAtpYdbbFSa33rCP8s
         UXyodiA3qrqH058/tLdXnKPqM+6h46zanG+Tbq2ZXj4XdUrWcdUFuOjyWnGJEbcRFqIn
         HtoGf1nUAOmXZFUjW/eskU12c7jFtzYtg22p0wCAJt8yHJ4RrQ7N4/M7RxEK8CpeSjCw
         DHdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=vKiee3TL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700658916; x=1701263716; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rXXLHLCodNvzv4CT30Q3mcxcyaDFj0EfHmw9VeUIck0=;
        b=olmShI3aJluQLOSKytWp7x+tJ4/f3J7VQZHw0YZDDY5UM+K88oi5kOvFOJeJeVOyeS
         ywDiquDgJTIcXV0hBFoSVpjzL+JxrOLnFdtPcy29byNhLioQiRpA3SjRqj6bz/GzxEQP
         AQw2xn/IyZ8lnTHjyV68EztjjiLiSoqI773tXRVpKsDZzcrc1G+ywraqVIPn2eZQDCeA
         vCmu0uKry6+5wyTY6LM6MaXBXYnBMyYwH3QDAefTkN3lzgu8iCc6NG1SRBti5ArAj3UA
         XKVE3wprAcp2BzIRURSAtc4CAR4vtmYaacGsVr3SS+zZ+AaamYUb+yJx1FFcpOlWIuYN
         RPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700658916; x=1701263716;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXXLHLCodNvzv4CT30Q3mcxcyaDFj0EfHmw9VeUIck0=;
        b=f8z3eLT3PkBBgvBnBo5cuOA+0Vi3AGQTijhGzB+c0Jd+EBZjd1MfDCxBRHyv3OUI6I
         4Yoxoz0Yl80wAsvXCDQWE37LTe3T5vipyWcJR5rDu6NK4CiMc8zMU0D6w+YjNLtFOKoI
         LaXvgj3G5Y1lPrtoZfa3gfIlNe0i7BKnJWDBYG894MQu+/BLsQAu6RWaEupajiuKp9zQ
         DiiE5mxXGsjrVlrHA3D+qGv6HLYiiohRITHqthbT+mZ8lvbttpvi8NQstlD3hZjHNZgR
         ko315J48uK1Q1DNNZ8bkSPHn5sdUknud6QtYiX3KxgMXiwmZMe4Fcsr6u9j0YjDNJ084
         vWMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzsISXFeuXl9EdKpDVDdf2JTRPDiq27pNKiAPJ6PzsXLz8j8lUc
	Ux/sqTYODK12PzeJXvHsu50=
X-Google-Smtp-Source: AGHT+IHE4zKsq81tUrlxYACX6cCidXvKAbdLCbnX5UxK2Y+6BBpXsIlY6i8bl8NoFtu0YiBHXj/4Uw==
X-Received: by 2002:ac2:4469:0:b0:4fe:1681:9377 with SMTP id y9-20020ac24469000000b004fe16819377mr262793lfl.44.1700658915798;
        Wed, 22 Nov 2023 05:15:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3e22:b0:50a:a6be:1dc0 with SMTP id
 i34-20020a0565123e2200b0050aa6be1dc0ls107538lfv.1.-pod-prod-09-eu; Wed, 22
 Nov 2023 05:15:13 -0800 (PST)
X-Received: by 2002:a05:6512:1387:b0:509:4655:d8d5 with SMTP id fc7-20020a056512138700b005094655d8d5mr307502lfb.11.1700658912985;
        Wed, 22 Nov 2023 05:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700658912; cv=none;
        d=google.com; s=arc-20160816;
        b=nawtz0K0Cjd083e8l9jXsLPfbNWTBueYTyY7syTlm4M9SgZ20gm5NXTLpLGIhrJJp6
         0rkO/sfaKtdblqf4057A0rGka+aIq1BVPoBb+HupOe0bxjy1S1HkJA91Ez0Dw0HsBDM+
         iJCSpbQVVoVgu3pAfJ9MzdDOTSUphKLGj8uElRxGe2FoK6e4E5lgl1Ul6itWzRCJ8aoq
         S8KyuBiiXBSpoxra5+I68oLEhWikxCpHN1mxyR9pi5g4uGlm/vcrKh+wZSVpzUkxEJEE
         8Z3b795fmE4cWKegc1nNBqlTV9MvdDf3sQwyNpY9i1EieF+tYVFHIFxhkYvJcL5jiNI6
         JsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aqqVC7Aoz2xuLllVG0djc5mBFozDvt5xC+DYR0iW3ik=;
        fh=t0Nw2nhOOnWFAR86PFfZva7qIMx1vMlLM9e++XkoW8A=;
        b=0jm0Tdb7HTNbsSTZtV5wsJyUWXNLJaqi1HBFM2f4/qPaLLJVJIc5daammJy+Ikwf6f
         gc2Xdqr2UI7bbnqlwDN8NAxEbv2XVXTSNl+w9u2EUINH4qzGApXQ/qxffxRhlgnE4Gme
         fHQGFU/tiWdQDnTuPc5a96ZNsYqxHzaRjrzve+y8qbYMsesiHbsuVL3AF9PDtasIUtpL
         63F/UNUJYfwtpsW8fdgELLa63R6cX/iSZ4THG4YmFbBOvFRgkcN35F8GrxaKvAKY0ZOx
         IBYp4ibAcALCSXtvowpS4YB8aCQ1rQAG4jtnwXgKlGE8WaGWwaO6+JLObWaVolZJelrT
         L+fQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=vKiee3TL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [2001:638:d:c303:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id fi27-20020a056402551b00b0053e26876354si627723edb.5.2023.11.22.05.15.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:15:12 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c303:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id EBEB82A00FF;
	Wed, 22 Nov 2023 14:15:11 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Sb1v34d6Fzxr6;
	Wed, 22 Nov 2023 14:15:11 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 Nov
 2023 14:15:11 +0100
Message-ID: <1024f0c9-f851-46e2-abcb-3f3b40f5c47c@oth-regensburg.de>
Date: Wed, 22 Nov 2023 14:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: jailhouse enable linux
Content-Language: en-US
To: xin zhang <zhangxin6483@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <a3ea29e3-da4c-4352-a328-9a04c86b8b1en@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <a3ea29e3-da4c-4352-a328-9a04c86b8b1en@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=vKiee3TL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender)
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



On 22/11/2023 07:25, xin zhang wrote:
> when I run linux image on jailhouse, guset serial port print follow=20
> errors: where I can get ways to sovle it=EF=BC=9F

Please provide more context. Does this happen in the root or non-root cell?

   Ralf

>=20
>=20
> [ =C2=A0 =C2=A00.069576][ 0] [ =C2=A0 =C2=A0T0] Mount-cache hash table en=
tries: 1024 (order:=20
> 1, 8192 bytes, linear)
> [ =C2=A0 =C2=A00.078110][ 0] [ =C2=A0 =C2=A0T0] Mountpoint-cache hash tab=
le entries: 1024=20
> (order: 1, 8192 bytes, linear)
> [ =C2=A0 =C2=A00.087451][ 0] [ =C2=A0 =C2=A0T2] Unable to handle kernel p=
aging request at=20
> virtual address 0000000000001388
> [ =C2=A0 =C2=A00.096606][ 0] [ =C2=A0 =C2=A0T2] Mem abort info:
> [ =C2=A0 =C2=A00.100564][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 ESR =3D 0x96000005
> [ =C2=A0 =C2=A00.104789][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 EC =3D 0x25: DABT =
(current EL), IL =3D 32 bits
> [ =C2=A0 =C2=A00.111299][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 SET =3D 0, FnV =3D=
 0
> [ =C2=A0 =C2=A00.115522][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 EA =3D 0, S1PTW =
=3D 0
> [ =C2=A0 =C2=A00.119834][ 0] [ =C2=A0 =C2=A0T2] Data abort info:
> [ =C2=A0 =C2=A00.123883][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 ISV =3D 0, ISS =3D=
 0x00000005
> [ =C2=A0 =C2=A00.128898][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 CM =3D 0, WnR =3D =
0
> [ =C2=A0 =C2=A00.133034][ 0] [ =C2=A0 =C2=A0T2] [0000000000001388] user a=
ddress but=20
> active_mm is swapper
> [ =C2=A0 =C2=A00.140600][ 0] [ =C2=A0 =C2=A0T2] Internal error: Oops: 960=
00005 [#1] SMP
> [ =C2=A0 =C2=A00.146667][ 0] [ =C2=A0 =C2=A0T2] Modules linked in:
> [ =C2=A0 =C2=A00.150892][ 0] [ =C2=A0 =C2=A0T2] CPU: 0 PID: 2 Comm: kthre=
add Not tainted=20
> 5.4.18-101+ #2
> [ =C2=A0 =C2=A00.158367][ 0] [ =C2=A0 =C2=A0T2] Source Version:=20
> e7f24793ad667e777f2cf6dab620d082517f6075
> [ =C2=A0 =C2=A00.165929][ 0] [ =C2=A0 =C2=A0T2] Hardware name: FT-2000/4-=
D4-DSK Development=20
> Board (DT)
> [ =C2=A0 =C2=A00.173317][ 0] [ =C2=A0 =C2=A0T2] pstate: 80000005 (Nzcv da=
if -PAN -UAO)
> [ =C2=A0 =C2=A00.179302][ 0] [ =C2=A0 =C2=A0T2] pc : __alloc_pages_nodema=
sk+0xf8/0x308
> [ =C2=A0 =C2=A00.185283][ 0] [ =C2=A0 =C2=A0T2] lr : __alloc_pages_nodema=
sk+0xe0/0x308
> [ =C2=A0 =C2=A00.191263][ 0] [ =C2=A0 =C2=A0T2] sp : ffffff8031867c30
> [ =C2=A0 =C2=A00.195749][ 0] [ =C2=A0 =C2=A0T2] x29: ffffff8031867c30 x28=
: 0000000000800700
> [ =C2=A0 =C2=A00.202258][ 0] [ =C2=A0 =C2=A0T2] x27: ffffff8031823a80 x26=
: 00000000ffffffff
> [ =C2=A0 =C2=A00.208766][ 0] [ =C2=A0 =C2=A0T2] x25: 0000000000400dc0 x24=
: 0000000000000001
> [ =C2=A0 =C2=A00.215273][ 0] [ =C2=A0 =C2=A0T2] x23: 0000000000000000 x22=
: ffffffc0113fa000
> [ =C2=A0 =C2=A00.221781][ 0] [ =C2=A0 =C2=A0T2] x21: 0000000000000002 x20=
: ffffffc0113f9000
> [ =C2=A0 =C2=A00.228289][ 0] [ =C2=A0 =C2=A0T2] x19: 0000000000400dc0 x18=
: 0000000000000014
> [ =C2=A0 =C2=A00.234797][ 0] [ =C2=A0 =C2=A0T2] x17: 000000009242c113 x16=
: 00000000b8b3e41b
> [ =C2=A0 =C2=A00.241305][ 0] [ =C2=A0 =C2=A0T2] x15: 00000000b31b39bd x14=
: 0000000000000000
> [ =C2=A0 =C2=A00.247817][ 0] [ =C2=A0 =C2=A0T2] x13: 0000000000000001 x12=
: 0000000000000001
> [ =C2=A0 =C2=A00.254325][ 0] [ =C2=A0 =C2=A0T2] x11: 0000000002e03c00 x10=
: 0000000005c05800
> [ =C2=A0 =C2=A00.260833][ 0] [ =C2=A0 =C2=A0T2] x9 : 0000000000000191 x8 =
: 0000000000000004
> [ =C2=A0 =C2=A00.267340][ 0] [ =C2=A0 =C2=A0T2] x7 : ffffff8032fe0378 x6 =
: 0000000000000000
> [ =C2=A0 =C2=A00.273848][ 0] [ =C2=A0 =C2=A0T2] x5 : 0000000000000003 x4 =
: 0000000000000000
> [ =C2=A0 =C2=A00.280355][ 0] [ =C2=A0 =C2=A0T2] x3 : 0000000000001380 x2 =
: 0000000000000000
> [ =C2=A0 =C2=A00.286863][ 0] [ =C2=A0 =C2=A0T2] x1 : 0000000000000001 x0 =
: 0000000000000000
> [ =C2=A0 =C2=A00.293370][ 0] [ =C2=A0 =C2=A0T2] Call trace:
> [ =C2=A0 =C2=A00.296978][ 0] [ =C2=A0 =C2=A0T2] =C2=A0__alloc_pages_nodem=
ask+0xf8/0x308
> [ =C2=A0 =C2=A00.302609][ 0] [ =C2=A0 =C2=A0T2] =C2=A0copy_process+0x1a4/=
0x1340
> [ =C2=A0 =C2=A00.307536][ 0] [ =C2=A0 =C2=A0T2] =C2=A0_do_fork+0x80/0x370
> [ =C2=A0 =C2=A00.311934][ 0] [ =C2=A0 =C2=A0T2] =C2=A0kernel_thread+0x6c/=
0x90
> [ =C2=A0 =C2=A00.316686][ 0] [ =C2=A0 =C2=A0T2] =C2=A0kthreadd+0x1e0/0x27=
0
> [ =C2=A0 =C2=A00.321173][ 0] [ =C2=A0 =C2=A0T2] =C2=A0ret_from_fork+0x10/=
0x18
> [ =C2=A0 =C2=A00.325924][ 0] [ =C2=A0 =C2=A0T2] Code: 3901c3a0 a9450ba3 b=
9406fa1 b5000b62=20
> (b9400860)
> [ =C2=A0 =C2=A00.333224][ 0] [ =C2=A0 =C2=A0T2] ---[ end trace 7e9dcf3f04=
9b9227 ]---
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9=
a04c86b8b1en%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1024f0c9-f851-46e2-abcb-3f3b40f5c47c%40oth-regensburg.de.
