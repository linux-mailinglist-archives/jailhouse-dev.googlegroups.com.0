Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJMLZH2QKGQEOSNTW3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364D1C672D
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 07:05:42 +0200 (CEST)
Received: by mail-ej1-x640.google.com with SMTP id bx24sf554481ejc.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 May 2020 22:05:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588741542; cv=pass;
        d=google.com; s=arc-20160816;
        b=l87whME77tyRhlrBRpgL5XGNnzepHtWIdVugkPyRHVldvqgPIm+Hq2Q6pGKXuoroKA
         bBCaX4h4u0sIBf9LaCkqCfZir5xHGLF+ls3UpP8ZptLFw3iW6GuR6JxweEJmxZcrZMtC
         GJb5YeuKbQMBz8L7/AyxQ6rXyAEQqDfbOQFMqpWjsl5+66QfkR5bp22/diQ3TbY3i/Ef
         4dyvnaWVmLhSWJnt80vVEn28WlwMh9S5bFM7kmOPfH0MSiZgoUduostJk7d+DU4+uBpp
         O2V0qm7uFofVbdStPI5j4nibCzmgigXTjYzbR/DKy96BDCGCmhM3Kg40iJQO9sHHnttM
         qHWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+/Nz9rQo5jTCsP7HvYez6+pjqBAPbpUeGapgz5bvqYU=;
        b=DZPFtYplEU+mudJSRNYmIjZ8pmdyte7cgQS6jL5As8tQ3EQnOYFMrp4HK60Nw6/Ncc
         sK8S+dJNwPyQPt+osRQdhDaRLJeicXKlZXTi2afhOJkmceFZIBL+sy+MZWhZ5C8Xx+Gr
         oWqUNCwLj4KsOKKyy9jB5QPVwDJQkWKvOYbDkptlZvJhryJggfjmPfolzkuNTotG+Imb
         GYmBc9n9itDqyjxWzqXoOdZI7Dk4iitGEETk6wvyH9zgnuT9QK0/FY+5CTxOH1IrVdou
         TqrfYmCh1NYT/LMSsrA53RiV1UFkp6vYiNcekELi2ZYxjnqT2iP0out4rCI6mFyHXNVf
         DMNw==
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
        bh=+/Nz9rQo5jTCsP7HvYez6+pjqBAPbpUeGapgz5bvqYU=;
        b=EqDZUfLlpi10IdvXCEKG0EDpPKgQKEr+UIJHb1W6o6Nwc9md3MftVI/8TArBjEghwR
         ua5TAH1QkzPcMk9Yvq9Re66dFyk3Nva8LwLEhI4wBZbMof91paqiTPviN+XwTAgScy3l
         XHXo0N0h++e4MW7ewuWdZL5z1eChZIunugDACMheZ9JA2VME7OWxiIxBXEoqZsEGjiSX
         MlzBePbct1o2U1cW32MnywHEgUtYlJcgCmDlMYMC+YvD189txXilmVkzpeInQ/EhUnjJ
         8qIhHsgvzoc30hCOIjKrvubfcpyFKTxQ8e14LqBOE2mjRPPOXcLfWdnTTfN7wQBoqZ4q
         TURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+/Nz9rQo5jTCsP7HvYez6+pjqBAPbpUeGapgz5bvqYU=;
        b=GSXBwgIjHgybpFi4jmGkPUOlTSfnZk+2VNKvKRWiVaU0iYVfIXlZHn+D3p0/z07Rs8
         keOyTti3V1RoDfpFrIS2frM+0GYSLCPZW2pX0k4LcoREDnJ84fJHlcBlaIBiMlr2x3L2
         XsPhxFzQg8EFUvuptpjIzvOCW186uGGSWUXuQbLBXk7PpfAHjfkYi+ueZwD0LCAQlWrs
         8X91CRTbzLU5GQjZ7WfvnB5hRW9D6vuYdCkfe4VHbzDBrVciXu/101fCNLVPudHJo69T
         t7zW/pvGb5rltktk24VEUHv90gKV3mpOC9VC35wKHvrz9ZmAwV1lmxmQTMa3R7/fRzDC
         VEDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Puam6qlQqJbZDobpZwbrSz+VwJK0c92DMPYuUPHREqkIXVBrycsJ
	hV570ytq2pHS6XDZJnXRzG0=
X-Google-Smtp-Source: APiQypJlMqsi1fov3ROieVm+wlbb0CuqVstRLzZZGTv6OxzRPb7Nloy4c0eOPNYbr4vEpbNMJ2cV/A==
X-Received: by 2002:a05:6402:1a49:: with SMTP id bf9mr5663173edb.189.1588741541929;
        Tue, 05 May 2020 22:05:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6b89:: with SMTP id l9ls595137ejr.6.gmail; Tue, 05
 May 2020 22:05:41 -0700 (PDT)
X-Received: by 2002:a17:906:4a94:: with SMTP id x20mr5865269eju.306.1588741541051;
        Tue, 05 May 2020 22:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588741541; cv=none;
        d=google.com; s=arc-20160816;
        b=BBG8BG15FSUM3782+Hfov2utwVWZH+FBGW5XIJvACmFNSH+/amkiESdRhe8gVLW80O
         BNVvUBHnDojGnXEjTBG2Ofh/LxSmjw3Kub2DDSvwvRk1S8UphkMEXR7wNPgp17yZO7Gt
         6UV1Rut+fsBoIb2vlqZSks6JppCkp8yw/dCV3w8ITNreNc9ZJ8lt7yfJuyIxRMdYDUNw
         ZYPlyP6/FUKGjj3dxUuTuu8J4Xfl47c/YPWUMUj6raGvmWADl0Nsob2UDep9nZTmyHVl
         AUSsFbIW73QYgeNhiZIuM7lNNNgf3gAlAkMNHyI1wIBcW34Z++svM2Tq7WH+wKPZq+oX
         KsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GP4cWKTAsZzIbQ9Rg/HD6bxsYL2LGK/+Xvq2g+5Zwz4=;
        b=PnTJN8nu3EZ/33rgCfAoCsptIcAG6uEUGGsizo5FbL2aPbU5tOi9pF2au5s1Uu8pV3
         0m8W4kZrQMAKDDZPXBYZHDzCfxchibCWs2ERniWAc5Qne6u6YM4SOWbs5zrSlO2T0cTB
         V9WFKcjWjbW9Bg+R6ibYFzkZ106SZQGmPeeOmJyqParJmkuIclkJlB4Oe0fA23MLoRCm
         F98QtsvuKvFPUJBDCn3bMyMIb+z5UsjmFgE5jc19FTA4nRtAvuIiE+XF5w0m0phwEXYX
         3NqhEffKrcyo0eqNPvVitvaKdgzUeKlINQiy1UuHSSJrobBTPntQ3QU5f1dZuq5mnCj9
         2dSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id by3si68063ejc.0.2020.05.05.22.05.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2020 22:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 04655eTP002928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 May 2020 07:05:40 +0200
Received: from [167.87.74.79] ([167.87.74.79])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04655dle024103;
	Wed, 6 May 2020 07:05:40 +0200
Subject: Re: Macchiatobin enable help
To: =?UTF-8?Q?Fran=c3=a7ois_Ozog?= <francois.ozog@linaro.org>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CAHFG_=U==gEqKJWV0_Na5eap5zUpwp3beU0A-7-+wY1q-0LFJw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5de9a7f5-20c5-56eb-9052-999060d60990@siemens.com>
Date: Wed, 6 May 2020 07:05:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHFG_=U==gEqKJWV0_Na5eap5zUpwp3beU0A-7-+wY1q-0LFJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 05.05.20 19:42, Fran=C3=A7ois Ozog wrote:
> Hi
>=20
> Trying to revive memories to play with Jailhouse on a Macchiatobin.
>=20
> I've got my FDT reservation as described in configs/arm64/macchiatobin.c:
> 100000000-13fffffff : System RAM
>    139800000-13effffff : reserved
>    13f2e3000-13f342fff : reserved
>    13f343000-13f743fff : reserved
>    13f744000-13f7c3fff : reserved
>    13f7c6000-13f7c7fff : reserved
>    13f7c8000-13f7c8fff : reserved
>    13f7c9000-13f7cffff : reserved
>    13f7d0000-13f7d0fff : reserved
>    13f7d1000-13f7d1fff : reserved
>    13f7d2000-13fffffff : reserved
> 800000000-83fffffff : reserved
>=20
> When I launch:
> sudo tools/jailhouse enable configs/arm64/macchiatobin.cell
>=20
> The module says:
> jailhouse: request_mem_region failed for hypervisor memory.
> jailhouse: Did you reserve the memory with "memmap=3D" or "mem=3D"?
>=20
> hypervisor is at 0x13fc00000 as per the config which seems fine.
> The reserved memory as per the config does not exist as it is beyond
> physical RAM. I moved it at 2G (80000000-83ffffff) but still the same
> thing.
>=20
> That's certainly an obvious issue but.... if you could help me...
>=20

I don't have that board in reach to check how reservation looks like in=20
the good case, but you can get an image that is supposed to work from=20
jailhouse-images. Or pick up patterns from there, like the reservation=20
via "mem=3D3840M" [1]. Maybe start you system with that setting and=20
compare the reservations.

Jan

[1]=20
https://github.com/siemens/jailhouse-images/blob/master/wic/macchiatobin.wk=
s

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5de9a7f5-20c5-56eb-9052-999060d60990%40siemens.com.
