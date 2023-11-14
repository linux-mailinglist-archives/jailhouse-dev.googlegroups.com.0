Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBEH7ZSVAMGQEQ7D2KTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B87C7EAD23
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Nov 2023 10:36:18 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id 2adb3069b0e04-5079a8c68c6sf4974129e87.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Nov 2023 01:36:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1699954578; cv=pass;
        d=google.com; s=arc-20160816;
        b=JGV7anJqDtnfwFarYJoap/LiqxrBVngxGjgR8av9vrq63lwL3wjfNyr7n4sme8j+wj
         jz5PyAgC4u3r/DgpywwVcU+jDdklYjxfHHDbhevH5LKgmPQrUs2syFsH+qX8s3TcP6U0
         VsygiWROp0DvsKF80CALnmVpeHZvNIc77fB4PfNCMz3lqvMLrHI1CcryRT7k/NnQ2O+g
         3516IEftxEu8qws06kVpmSdn5ry1MrYu9LKdqoUxQae1b3YSVspwtZ5rCAcpYNfFc/jN
         inwSvrYgR3/h4/IetFwS0CKWvzk1KbLOepmz4Pld+MOpY9PMpn3B4Dj/u2kjQAKIDtIm
         Vtkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=uc1DxdVmmLshDs2Ggeu+j3B22c9GMefatipoctbZsjQ=;
        fh=t0Nw2nhOOnWFAR86PFfZva7qIMx1vMlLM9e++XkoW8A=;
        b=hJmYs2VKdbAeaHAdfGqByjVElDUd7h7IvHFoUKpTKYqwV6PKfUk0qKatX6JtZTJm+4
         5uMye+z/XCFDlhNvEfpRESuacgDhojKl8m6ucFqf4ZXdjlX6KfBAdPNKKrXlXdA3dirR
         bgKhk/+wCNdRYSRbvtYDKzxvKCS1TfPlQ3o+kXn8M5rTbA9Ts+VEDLy0+k301rzaZR5m
         2nlUafmDtVSzZ9eogFCeXPPv+puBs9OYPo02WUkD1Qq8dB/Zqr8JSsiAtyH8+Rqd9t7b
         d015cRNVpAztuJAoxWdsIsIAUEqIL9qFohgn1cjzKJtp78p1yTfpXQ44oXSiZG9J9l+u
         ruoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=rP7++yv+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699954578; x=1700559378; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uc1DxdVmmLshDs2Ggeu+j3B22c9GMefatipoctbZsjQ=;
        b=MoDHYNhhtt21ie4tGr7QWpIFg6w/4rfo+bCtJQb777N6Lcp0OgcLwYi5quJ3MSvEQn
         kOQ2fgsmSlwdjQ2/0TasE5/DPGL1jOYs2amrJBjlr1V3ozO/tCy9B4I6NNWZTdPOB4KD
         mWw2H2nsaiiswgVHlrFwwb7Qg75iQuWNuouOHHMVlVsQuPV8LArMGfjIyRmYBWbuNojl
         gpY80GcmTJopVGNeCsjy/qBl5jSXbWB0KwJlcC2CALvJUIcguqqiMO4oUaTcRctWXs/B
         Ek4au4MOBUjIcIrBNuclzAVCWwJSpV8rGKB/M2TjxPd0AUOEJCXfFVSg7q/MeBi7dJfP
         CTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699954578; x=1700559378;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc1DxdVmmLshDs2Ggeu+j3B22c9GMefatipoctbZsjQ=;
        b=rVsh1Q7j1H4RlIVcaEOKwj8a5X2s5M0sG++TLa2Ajd6/VT+V9TO6SIAzRRBHPctr26
         IDXpH2k7Cxsv+J2gnu8q0ak8XsC46wsMnPQ0BGmDSNvObdqifA0hEXAMo2VadJHo2ROx
         qcO84mpggaVFfVWfqXQU/3sX6Kh/SgeS/Polv1L5RxlCCXoj39222VpOSRBkhseBE8xJ
         CHABEBYpzlgHPzYNXKJ4B7donr3Gc6hZ404JFLmfTTkuMdx/3xYNehQ4Ns9BSva6pC5l
         o6A34uu4EuygBrjuO6W5Cm0RJlAvdjvaN3dUrGRLKL54Kq9EjYrdSYiTUPkpveGinZHo
         eVcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyGBb8EqxmC95EewOAmUoQ9JgadGbEnGDrMK4XUCYOzYvjLjSdi
	ZAoiRlRgKGgCVnij5Qkf8Js=
X-Google-Smtp-Source: AGHT+IFGOgAFKwAYERrbtAqGz7AGzuGwrM7kkevcoSePwgzO8c0DC/lTq3NtkNfkXI/AT3anJSMO5w==
X-Received: by 2002:a19:6401:0:b0:503:1722:bf3a with SMTP id y1-20020a196401000000b005031722bf3amr6406085lfb.1.1699954576885;
        Tue, 14 Nov 2023 01:36:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3c9f:b0:500:7f17:b77d with SMTP id
 h31-20020a0565123c9f00b005007f17b77dls504316lfv.2.-pod-prod-01-eu; Tue, 14
 Nov 2023 01:36:14 -0800 (PST)
X-Received: by 2002:a19:f709:0:b0:509:4b78:69b5 with SMTP id z9-20020a19f709000000b005094b7869b5mr5333058lfe.36.1699954574205;
        Tue, 14 Nov 2023 01:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699954574; cv=none;
        d=google.com; s=arc-20160816;
        b=DGQfkxTCeXKuNXouKpFF2/hkDx3nh99p0Gg3NDnRB9y7m0PwZZrA6dHJEWnwljoNjx
         fXiLMoGNGwoNOdtJ0zLSvTbMb+YBy8/IyjeEsHXBCdV7Uy9+baWscNoZF4BqUfxyTGbW
         rh9eL6O+1GpMJjq89lWUJyjKpg5Gxau3O8O4lbrGvcCmbQJ/6OUGUh4gCUsnPY5BxRis
         xzFdR0teiOEgRapbZfeSEnaGsSaWK4/OKKPZvcqb6s60NumLdiS4pfyVBn3JAHe+apmo
         LEW5y8VNcyStaLbzMi6MqNOk6jRmeNslaMUQZEyz9N8XnZMthtydMLtvmXT+Hsdr8Bir
         DGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Zv9qTRkPztD3idzmcmxXi9DdoToSeHlENnsG75Phnyw=;
        fh=t0Nw2nhOOnWFAR86PFfZva7qIMx1vMlLM9e++XkoW8A=;
        b=R5kTLrT8eTNHGJvcuCOFLi77MJR1NWWdEYimTZUjLMKjJTJTGk3Rp7N+tkOgu/bt5E
         lJF+l9mVbuNspz4eUOR/Sj5zFkcCCN3eqcs7XrzAzWmJrgVS+FWgx1SLvLGwSXyCBmw4
         H5LcpImUrhuq2R90Q/FscSTJwLUETt2Vt/OGB/xuA92ZMCzFRLAZE+xCrZTj5cFp/wSY
         4c6WzSDFz9ex3ReYyAcZk0/HYZMted8gj/yGwjDvTfgDX+3vF7pIRedC3d3GK79fgLW9
         fYC9o/uW0NUJTcHCs802yGCTsTCA+h4uZlXpUWyeEihCuL0UeTKPNYkCs7p5THUceFG/
         JWCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=rP7++yv+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id ay2-20020a05600c1e0200b003fe2591111dsi755500wmb.1.2023.11.14.01.36.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 01:36:13 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [194.95.104.13])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id E71B12E00EC;
	Tue, 14 Nov 2023 10:36:11 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4SV1Q34LfGzxtF;
	Tue, 14 Nov 2023 10:36:11 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 14 Nov
 2023 10:36:11 +0100
Message-ID: <adc02e82-933c-463f-9372-56f43945a2de@oth-regensburg.de>
Date: Tue, 14 Nov 2023 10:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: jailhouse enable linux kernel error
To: xin zhang <zhangxin6483@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <8b7c90c6-73bb-4e57-b705-ec1f1b692ee4n@googlegroups.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <8b7c90c6-73bb-4e57-b705-ec1f1b692ee4n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=rP7++yv+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
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



On 14/11/2023 07:31, xin zhang wrote:
>=20
> What is the reason for the following error printed when using Jailhouse=
=20
> to start Linux in Linux? Replacing the image is also not feasible
>  =C2=A0the error log as follows=EF=BC=9A
>=20
> [ =C2=A0 =C2=A00.092570][ =C2=A00] Unable to handle kernel paging request=
 at virtual=20
> address 0000400000000008

Two things: Did you reserve the memory area for jailhouse via=20
device-tree/cmdline? Second, did you apply jailhouse patches to the=20
kernel? Please apply those patches:
https://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/ja=
ilhouse-5.14

Thanks,
   Ralf

> [ =C2=A0 =C2=A00.101012][ =C2=A00] Mem abort info:
> [ =C2=A0 =C2=A00.104266][ =C2=A00] =C2=A0 ESR =3D 0x96000005
> [ =C2=A0 =C2=A00.107785][ =C2=A00] =C2=A0 Exception class =3D DABT (curre=
nt EL), IL =3D 32 bits
> [ =C2=A0 =C2=A00.114204][ =C2=A00] =C2=A0 SET =3D 0, FnV =3D 0
> [ =C2=A0 =C2=A00.117723][ =C2=A00] =C2=A0 EA =3D 0, S1PTW =3D 0
> [ =C2=A0 =C2=A00.121328][ =C2=A00] Data abort info:
> [ =C2=A0 =C2=A00.124671][ =C2=A00] =C2=A0 ISV =3D 0, ISS =3D 0x00000005
> [ =C2=A0 =C2=A00.128980][ =C2=A00] =C2=A0 CM =3D 0, WnR =3D 0
> [ =C2=A0 =C2=A00.132410][ =C2=A00] [0000400000000008] user address but ac=
tive_mm is swapper
> [ =C2=A0 =C2=A00.139270][ =C2=A00] Internal error: Oops: 96000005 [#1] SM=
P
> [ =C2=A0 =C2=A00.144636][ =C2=A00] Modules linked in:
> [ =C2=A0 =C2=A00.148156][ =C2=A00] Process kthreadd (pid: 2, stack limit =
=3D=20
> 0x(____ptrval____))
> [ =C2=A0 =C2=A00.155281][ =C2=A00] CPU: 0 PID: 2 Comm: kthreadd Not taint=
ed 4.19.90-69+ #3
> [ =C2=A0 =C2=A00.162052][ =C2=A00] Source Version: a22085976f26303c72a6bc=
7cc0d4ee20ff890cf9
> [ =C2=A0 =C2=A00.168912][ =C2=A00] Hardware name: FT-2000/4-D4-DSK Develo=
pment Board (DT)
> [ =C2=A0 =C2=A00.175596][ =C2=A00] pstate: 60000085 (nZCv daIf -PAN -UAO)
> [ =C2=A0 =C2=A00.180876][ =C2=A00] pc : get_partial_node.isra.24+0x38/0x2=
98
> [ =C2=A0 =C2=A00.186330][ =C2=A00] lr : ___slab_alloc+0x3b8/0x528
> [ =C2=A0 =C2=A00.190903][ =C2=A00] sp : ffff80000a143b10
> [ =C2=A0 =C2=A00.194685][ =C2=A00] x29: ffff80000a143b10 x28: 00004000000=
00000
> [ =C2=A0 =C2=A00.200490][ =C2=A00] x27: ffff80000a0fbc00 x26: ffff800023e=
55de0
> [ =C2=A0 =C2=A00.206294][ =C2=A00] x25: 0000000000000000 x24: 00000000000=
00035
> [ =C2=A0 =C2=A00.212099][ =C2=A00] x23: ffff0000080edc34 x22: ffff0000095=
39b08
> [ =C2=A0 =C2=A00.217903][ =C2=A00] x21: 0000000000000000 x20: 00000000000=
00001
> [ =C2=A0 =C2=A00.223707][ =C2=A00] x19: 00000000007080c0 x18: 00000000000=
00001
> [ =C2=A0 =C2=A00.229511][ =C2=A00] x17: 0000000000000000 x16: 00000000000=
00000
> [ =C2=A0 =C2=A00.235315][ =C2=A00] x15: ffff000089b4cbb7 x14: 00000000000=
00003
> [ =C2=A0 =C2=A00.241120][ =C2=A00] x13: ffff000009b4cbca x12: 00000000000=
00000
> [ =C2=A0 =C2=A00.246924][ =C2=A00] x11: ffff00000990e2a8 x10: ffff7fe0000=
28520
> [ =C2=A0 =C2=A00.252728][ =C2=A00] x9 : ffff80000a143d90 x8 : ffff80000a1=
26e20
> [ =C2=A0 =C2=A00.258532][ =C2=A00] x7 : 0000000000000000 x6 : 00000000800=
80008
> [ =C2=A0 =C2=A00.264337][ =C2=A00] x5 : 0000000000000000 x4 : ffff7fe0000=
28520
> [ =C2=A0 =C2=A00.270141][ =C2=A00] x3 : 00000000007080c0 x2 : ffff800023e=
55df0
> [ =C2=A0 =C2=A00.275945][ =C2=A00] x1 : 0000400000000000 x0 : ffff0000083=
15028
> [ =C2=A0 =C2=A00.281749][ =C2=A00] Call trace:
> [ =C2=A0 =C2=A00.284654][ =C2=A00] =C2=A0get_partial_node.isra.24+0x38/0x=
298
> [ =C2=A0 =C2=A00.289755][ =C2=A00] =C2=A0___slab_alloc+0x3b8/0x528
> [ =C2=A0 =C2=A00.293978][ =C2=A00] =C2=A0__slab_alloc+0x5c/0x78
> [ =C2=A0 =C2=A00.297937][ =C2=A00] =C2=A0kmem_cache_alloc_node+0xd8/0x220
> [ =C2=A0 =C2=A00.302774][ =C2=A00] =C2=A0copy_process.isra.8+0x1dc/0x1308
> [ =C2=A0 =C2=A00.307611][ =C2=A00] =C2=A0_do_fork+0x78/0x370
> [ =C2=A0 =C2=A00.311306][ =C2=A00] =C2=A0kernel_thread+0x48/0x58
> [ =C2=A0 =C2=A00.315352][ =C2=A00] =C2=A0kthreadd+0x1c8/0x268
> [ =C2=A0 =C2=A00.319135][ =C2=A00] =C2=A0ret_from_fork+0x10/0x18
> [ =C2=A0 =C2=A00.323182][ =C2=A00] Code: b90067a3 f90037a2 d503201f b4001=
17c (f9400780)
> [ =C2=A0 =C2=A00.329784][ =C2=A00] ---[ end trace df01b2bd811dec5e ]---
> [ =C2=A0 =C2=A00.334885][ =C2=A00] Kernel panic - not syncing: Fatal exce=
ption
> [ =C2=A0 =C2=A00.340604][ =C2=A00] Rebooting in 30 seconds..
> [ =C2=A0 30.346222][ =C2=A00] Reboot failed -- System halted
>=20
>=20
>=20
> thanks.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/8b7c90c6-73bb-4e57-b705-e=
c1f1b692ee4n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/8b7c90c6-73bb-4e57-b705-ec1f1b692ee4n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/adc02e82-933c-463f-9372-56f43945a2de%40oth-regensburg.de.
