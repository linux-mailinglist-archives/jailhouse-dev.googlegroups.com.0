Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBRULQ6WQMGQEAYDIAVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B5A82C7D4
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 00:05:49 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id ffacd0b85a97d-33688aa4316sf3948854f8f.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jan 2024 15:05:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705100743; cv=pass;
        d=google.com; s=arc-20160816;
        b=KvxIut+qFnt/36406GA8cWTQ9XfoYj7k/NMjtA79LLsRQAwjAHPC1E625Spk+fveIv
         pluaRaTndxhRBP+DG7JY1zGY+cBbaVolVvpkq4C4N5cMGej7D9hTdRw4jBF876DFLngG
         2dCp86CUhkJIkxfFgR9N+MM2lytF9Nh7EeSuhvnCbBwMZ2w3lVmdXL/oVd4qQdXQqXKY
         iMTVhy3armsUQH+yyGxcEPawHn22fciZbQxkWj/HeZmvVhj12DaD0/clY7kOigx76JwK
         MlhKlnz5WVPn1oUmNUINQYB3bGS6zzKikcTkJV5pIJ9TiP6j5pJm4ewD6cM7A7sCMjvE
         4aIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:cc:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=LCwyo8CdaFaHuucuybvG1NAeODCGfoZCPH3rkA3nNNE=;
        fh=i1rPVbNASveBIt+/8YQuCfJlKRxz9Ggyord7WAHufHA=;
        b=zVeejZQ7823vLfvty5Ck+kNNQ73I8GpUoDtmsC8amzp3nwwZB0RlWuGtL/Dq/2DmTt
         1OP7lnqbVJ+gEjsg8reAiQ2RuVFbdKVHD6FWeH9pmekK8m5Si8t3vYcJmQZIfAhP0LOp
         /az+PeAYje6CNgah891qCbFwVGiqVvczsmLZjNgIVf+9fOXdYe356ies9yd/5lGLt7Gm
         dPWhTetStbW7ug6Gh/tzF8o6rQPo8nG3PXj2ZFHVQu89HBCywIW/vkIDLOMcK1771sYf
         1chIW8LojQyw5wwh26R2jdbvQ1OJwh12SsMJgPr9hS8/V+MP0WgODXh/6bHavTMhiSte
         gUZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WETYOr1t;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705100743; x=1705705543; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:cc:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LCwyo8CdaFaHuucuybvG1NAeODCGfoZCPH3rkA3nNNE=;
        b=sz2xOqoYr8GycbVa9z9NsRQm662dIr7J1hmlR9Wkf2tlUmcPSHgkkFdX3EVz8CzDnG
         P7bU9fXK5R3Lfe+isYUqAeQqsxJ+6DBAzvpdj0GZ2EfiawQzXRfnLbQe89rNzTngy70c
         9ekFwrqfgf0uLdtDUv3tKYLB6UR7bqHDKaFNiusULNEIqQLFf6ieX8eGrxfZ+L1gJypZ
         TWJQufHDsSDyUd+CzKqmEbvWlM24mcy2BRtAqFXhLf8E0BbZIIIEVX0YXTN8ihkgJy9x
         PmZN3NIYAzPus3SMIZ0mFp0/J7tMSPdiN8m38BdqyWjSjMCUqmbVose0fdTiyNSpcuhH
         7qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705100743; x=1705705543;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCwyo8CdaFaHuucuybvG1NAeODCGfoZCPH3rkA3nNNE=;
        b=HiXR9Mcs8SOifBUnT3HsCZyg6pLlvqKhOHvrulNXLtUXa7YonV3I45mQQoZEYKatOt
         mMo8tet0uTszEJnOblGVeO2wX+zN0/l/raJWBD55e4s8JciiaoYL8IO3+9ETThlDQq5+
         Gjxea2m3O44YLJSrmHu4ZQJcvGszlruQg0NxIy5Klt5XAZbomsQZPzLw+TmPIa7MBM08
         rSZqaZ67bHkAhrt+6z0ANqu5Yhy4qHJenZwLpdodyQZynJw+ZZaIMMb9M/N6Ads4MSzC
         RA8qvHA8PadVjKmm5DHQsRb7tZNP+HpQdIQy0m0vIaG3C8jM5H/lkx/wDKDb3vNCWL3U
         85Ew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzmZYivZsEn2ku5QO/SEx6rsSXyPr1MuQE2zNrHNug+UgOLAWO/
	yEFumCkjTefd42HbYWV0WME=
X-Google-Smtp-Source: AGHT+IHptg1Gl/XAkmzrKd/4q99yzFJ3NyCKr4h2qDq4xflN4CSQ4S6Rcf6utEKBIlIhXVpUAW27kw==
X-Received: by 2002:a5d:640b:0:b0:336:eecf:9c3 with SMTP id z11-20020a5d640b000000b00336eecf09c3mr1057591wru.63.1705100743192;
        Fri, 12 Jan 2024 15:05:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cf0c:0:b0:333:4b5e:3230 with SMTP id o12-20020adfcf0c000000b003334b5e3230ls518660wrj.0.-pod-prod-09-eu;
 Fri, 12 Jan 2024 15:05:40 -0800 (PST)
X-Received: by 2002:a05:600c:c17:b0:40e:5332:1939 with SMTP id fm23-20020a05600c0c1700b0040e53321939mr1343081wmb.50.1705100740577;
        Fri, 12 Jan 2024 15:05:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705100740; cv=none;
        d=google.com; s=arc-20160816;
        b=Nz0cJCvfyJXCJ4RjhPcleNABGJT2udP3eBMYRm0/D3cetP0aFT/+PXjbbLPD4sm0Sx
         HSPnHq3idrV3rqcj6fbI3R1vcbfGSvFM6KtrfSczwN4e1uS3hwpgtPZQpkUGGeCLFYNj
         7IV7dGPfjAl48tP5LgShyWpkmFmn3WyWQI/1W7cxoTWAN1QiYuyqLiOFLLBwYco20M0x
         GCxIhLGUU8amTSwkgei6lwFpMrzAuJVRrzRoRBhbC8xxwMS9NCZsW7foucYHP61Qu+EV
         VRsdkCW1p7Fted+2k6UZD4YzxY4hb801hFbvdph3e5WLv166SGoUzFtF/70uZPzkiv8S
         YDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C4C3njctJ0sJAEnTTrGhmwcW2lsO3L0bJciMdC+AE4c=;
        fh=i1rPVbNASveBIt+/8YQuCfJlKRxz9Ggyord7WAHufHA=;
        b=g8Wl36VWezXYYxSELo08/3sOMw3sEs606c3BnBLT5Qxs9kCs+b23yNj/p+Q9owI2pv
         fX7e4VgufnQjH814pDeKrVvnUGPweNzxCsIK5+Roeiinws1ukzKdg8T0IvvKogsgsrKM
         iNAYxlTTDMxD1vJyY2mPo1B7jvUsIfUamlenUFtyskxY5gnHjPv8iX9xouUmd7Ug6AEy
         T3yuFax+rhz7yhBX79YDgJle0PALD8jW/+Rl+JmG9l4bRqDuaOMgooDwn1rzABlkiwLh
         /SncVfY98QTlswR2aVhz8dNFYU6LbdfKSRM9SpMvZk6ExSXqOFIT6JIAQ4YLM/jb0B1V
         U+NA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WETYOr1t;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id l22-20020a7bc456000000b0040e44e7af10si247377wmi.2.2024.01.12.15.05.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 15:05:40 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 953A02A00FF;
	Sat, 13 Jan 2024 00:05:39 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4TBcZq1Mv0zxqv;
	Sat, 13 Jan 2024 00:05:39 +0100 (CET)
Received: from [172.23.3.108] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 13 Jan
 2024 00:05:38 +0100
Message-ID: <0aa4c10d-a635-4a37-bf51-2b9863beb2a0@oth-regensburg.de>
Date: Sat, 13 Jan 2024 00:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
Content-Language: en-US
To: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
 <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
 <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
 <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
 <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
In-Reply-To: <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WETYOr1t;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Michele,

On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
> jailhouse cell load linux-2 linux-loader.bin -a 0x0=20
> ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters -a 0x10=
00
> jailhouse cell start linux-2
>=20
> I take it the kernel is loaded at 0xffbe00 which is right at the edge of=
=20
> the low ram region. In fact after issuing the cell load command and=20
> adjusting the path for the loader I get JAILHOUSE_CELL_LOAD: Invalid=20
> argument.

Just tested cell-linux in a qemu machine, there it works, with pretty=20
similar addresses, which got me confused.

After double-checking it: 0xffb.e00 is *not* at the edge of low mem:

Low mem is     0x000.000 -- 0x0ff.fff
Comm region is 0x100.000 -- 0x100.fff

0xffb.e00 is (obviously) way above.

Please try to set your high mem's .virt_start to 0x200000. Then,=20
0xffbe00 is offsetted ~16MB inside your highmem, and it should work!

IOW:

/* high RAM */
{
         .phys_start =3D 0x42300000,
         .virt_start =3D 0x200000,
         .size =3D 0x11000000,
         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                  JAILHOUSE_MEM_EXECUTE |
                  JAILHOUSE_MEM_LOADABLE,
},

Thanks
   Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0aa4c10d-a635-4a37-bf51-2b9863beb2a0%40oth-regensburg.de.
