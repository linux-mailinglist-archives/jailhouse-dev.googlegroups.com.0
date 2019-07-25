Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRH34XUQKGQE7D6BXNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D8974AFE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 12:00:37 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id y130sf11323328wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 03:00:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564048837; cv=pass;
        d=google.com; s=arc-20160816;
        b=ogLKS/T/rJZgIVSpY4MNhLm1T60fgchFNghh3049lhs9YOSr3xXTne2twQbfpbCMUk
         d19DsJTbad472EexvVveqiN2VwMY5jXkkcWZ2l5mfXPeclxwOPAlmbeHWJWSruUc/HPI
         ttdyLXz0koH+WZPAc+G9+c3GsKFU8+M1W9OFTBt37nxTnm4PwHb1RsLAjMnPKwypUSOk
         qKMLqqYzGh7ABPWR82Tm2ZB+LoI3DpPzS+YQko69uLwIsT0+ksvWms6NAXmRL0wIIlNK
         qlqa603Y/xQ6WTT92fzxwhqsir7WcL3Asp9p5o+PgnjUuv2WujWBySCl+05BTmWb16CW
         cvEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YErh2OyqHY164LfRTCPAmYyv/WNwn3d9O23xEskGPcg=;
        b=Nkw7kJOd2KWEvFIeUJogLzM2gSL9Hk5nQNzXYlx0vpPfnWW5iAGYATrcjjjYZnUZVM
         iR6mf9H2Y6qy6SDScP75/GqTuArlUoIsdd4CG/Ov5ATN3kDjImqNkByWqEmkxMtZU12H
         D4zarUW9i1daLptVTmrQyBKUPhERr+cI17orEWyONB3q0uU0mX+K7jqRFH4DkmzoBEi/
         2GxnZSQaywBgfdLmqbp+w2tepXyWblq7sp/zc8jrNH4Z6cJq/uQks2xvNEQMqZHtuEMP
         b6At5jY9sNk90/c1lyENKjTevhPSbYRxeSZdvikBZh9T7F7aZlnNF0fiK18T3OKXDCYl
         6SLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YErh2OyqHY164LfRTCPAmYyv/WNwn3d9O23xEskGPcg=;
        b=h++V7oVLrHquj2n3SOcvCbRworaDcokbk2xVNf79Lapm6Gm1QMkPHJtffHKoYjEMi9
         IThm0qrjNwbGSIlg6vucxyC1mNiJJkUmYTPOuUcuNwjg/bcuEeTrxE5x6hEpJ1hbnG86
         NGUb+O7I8BXgaccrfmhvB1I/dRLPGu1nn1aCyxmky2H6YnCvXlkr+vse7ousXKQGeEPt
         YgifXwCpnHbgGyV+2OK2FLtQSXuixfV0aLiyzEFF22t2hnpcEzXGJSierB1WUZfcYvyw
         1S4FqDUaqWK47T6qgfpUhzTTrXMrnrlynDGmTTA1OaOFJBIBZgQWIherhxzV3HJ7Vl2s
         tO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YErh2OyqHY164LfRTCPAmYyv/WNwn3d9O23xEskGPcg=;
        b=rtO6pSkWjeNvXbJz+mUAHNXl726fQBUjF2jQCcltrpSTn41v1fHNhr3yrqb9h2lvd+
         7qd+FDssZkgDcj6RL3+DriH+1QeT7G0zw+TwZd3lDDFh00icONtBACB13OFT3GKtbvqE
         sPohKERPWOvjn+EGe7uwuvXmfNeScFvKq8UbbIwQS0De9k3hiMUmNSbLg1mygPk9BCO4
         6pHqvawptUtUtuMZDFomR05q/0++UH6lP8f6vjmpSzjT6Ss+P0dTzqu2uRA0My5VX2fN
         exflyL+ygSJAZ+ivvorBUkHSLFQipsx/hkZjBt7n5cukBeeVs85lof8Kf+CBj++NTTay
         7tNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXKuO0+ldnrdB3JX3Ay36xkk7zMEdQT1fcrgvTpfoZAw5BJvcE8
	MYAMAaqWtZdFannrhZFzHfI=
X-Google-Smtp-Source: APXvYqxvQDtaJD9BF5e9/nPcV5p1NubfTMgVYP3lt3ooELl7XACwfr/E7wMXrS/9i9/H/pGydCQmlw==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr76445927wmi.54.1564048836883;
        Thu, 25 Jul 2019 03:00:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9083:: with SMTP id i3ls14682640wri.14.gmail; Thu, 25
 Jul 2019 03:00:36 -0700 (PDT)
X-Received: by 2002:adf:e602:: with SMTP id p2mr56697897wrm.306.1564048836013;
        Thu, 25 Jul 2019 03:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564048836; cv=none;
        d=google.com; s=arc-20160816;
        b=Yz9J4UIkdtaxZxfNl/aEScjaRo45CTkeNcbVGMhru0VVDsJRatse+gwZvOzLg0QFAr
         Chy+c/QM4pz90ZmFfK+TZw9/fv+ILIAh2FET1baKxL2C6Oh9SU6vA0ldswHNqsuERgGb
         KuSOurbYGA5cwnG8VtIrlZnl8qmcfBHfsl9j5CPKPF2xQA6bovYa01tSHsopQHrJD3ME
         oPS85kHdN1cDYNpVaCcqRO8poWZ54s20QZ44KPXf8Zvk6+gf7JjAVF7b1lfqd81mYhAW
         hwiehBmWCQCc4eBSUoJkYhKXQAlp+G70413dcmJFksFfhuL+EAuJKHvmatRV2U2D6I7A
         5clg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OJA2mx9QEwPlJKCsRYrHl1FW2HwVhdjdSCc1gHen0Jc=;
        b=P4eE0OgzaeqSBf8vDwZzJU77nF9kKFP6Te9wXYH8IrnVtWmRz9DRNvM8qoE7OFYSZs
         ZnqNInXkB9J40iekw1eQy0wDau0pYG2+Sdb55D6YP6wjvhQc7W5YnKsxf4c8JQNhSqpi
         BTzbpHPayBfwWXFKpUHlUWZhn0TSmfZehcfPN9k/U3T1XKqJsQOWdbus+EQaYcMk0XX9
         sJvmGQLSaErnLg20QuJuLV1OHJXDLXmnlgpyaai7n3GwZUaEy3Rz8eV1wilsJQDiR0hH
         tDUI2Zb7T+ysNVno6Ai7PDgVVrSMNt4CKtGYC6/aqYFa/XInFLYduHgEE1Jl7xMZKRlp
         MS8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u18si2614832wri.5.2019.07.25.03.00.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 03:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6PA0YNV017812
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 12:00:34 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6PA0YIT012052;
	Thu, 25 Jul 2019 12:00:34 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
Date: Thu, 25 Jul 2019 12:00:33 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 25.07.19 11:32, Jo=C3=A3o Reis wrote:
> Hello,
>=20
> I'm trying to apply cache coloring to Linux and Erika. As root cell Linux=
 cannot
> be colored, i intend to use colored Linux in a non-root cell and colored =
Erika
> in another non-root cell (the system stays as: Linux in root cell, Linux =
and
> Erika in non-root cells).
>=20
> The problem that is occuring to me is when i issue the command: jailhouse=
 cell
> linux ultra96-linux-demo.cell Image -i rootfs.cpio -c "console=3DttyS0, 1=
15200"
>=20
> The error is the following:
>=20
> root@xilinx-ultra96-reva-2018_2:~# jailhouse cell linux ultra96-linux-dem=
o.cell
> Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio -c "console=3DttyS0, 1=
15200"
> [=C2=A0 127.150370] python invoked oom-killer:
> gfp_mask=3D0x16080c0(GFP_KERNEL|__GFP_ZERO|__GFP_NOTRACK), nodemask=3D(nu=
ll),=C2=A0
> order=3D0, oom_score_adj=3D0

Looks like your inmate configuration grants too little memory for the Linux
guest. Note that the in-tree configs may only be happily used with very sma=
ll
Linux images, just as the buildroot we generate via jailhouse-images.

Looking at your config...

	/* RAM */ {
		.phys_start =3D 0x74000000,
		.virt_start =3D 0x74000000,
		.size =3D 0x7ef0000,
		.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
			JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
			JAILHOUSE_MEM_LOADABLE,
	},

This one is fine and will be available to the guest.

	/* RAM */{
		.phys_start =3D 0x3fd00000,
		.virt_start =3D 0x3fd00000,
		.size =3D 0x202f0000, //must be page size aligned
		.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
			JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
			JAILHOUSE_MEM_ROOTSHARED, //se tirar JAILHOUSE_MEM_ROOTSHARED da excepti=
on
fault 0x20
	},

This one isn't because it shares RAM with the root cell that is probably no=
t
intended to be shared. But it will also not be presented as RAM to the non-=
root
cell (via the devices tree) because of the ROOTSHARED tag.

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
jailhouse-dev/7f3933fc-c609-9349-4e57-a680489e9928%40siemens.com.
