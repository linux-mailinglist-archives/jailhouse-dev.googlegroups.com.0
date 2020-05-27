Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK67XH3AKGQE5BI2GOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A96311E444F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:48:27 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id i1sf2783768lfe.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:48:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590587307; cv=pass;
        d=google.com; s=arc-20160816;
        b=il3msdGvuRrSChtjdskGTUl5H3lKTFL4IiL9Z8/iq2VBhibxb4kL5v881SUICybvXl
         Dm26iAbgolqT3MmPYikalq86fko7USNKPd/HmZLgc9KjDpQKFOKFd+DW/eFIeYv8/ZLU
         TcmobjJfL7bBkGd8dQsmUUiS57/jZWLG12icVbl8KUEOHxT9Sa/QbgmJpkNWmwj6fChz
         vwXgJpy09qjiPEbrpcQLKcRJwEkG2LLlh2Or2P62VrCOU0zeQtcmZ/HGEM+v+aZQBVnj
         VyoG+AagXI7Otajad8pPLlMcVUQz80B0eHiD8hfIfH+aJDtLMQFbNeiUO7nyVfKM3PxD
         SGmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=L1UARLiVtfn06aC5/k6KBU3nVstJ0ht4PV1DV6vDc64=;
        b=OKQHKSSCTawqu8KbDkRlFNctgik0wpDF/sGm58KKKDuU59kFpxyQamkzV2G+xszLrd
         rbF8SDSLyPatMcR41TwAlW/X0d0TZNn4HB+oI9GZQhFH77iX7itzXlSXkybjRSOyVtdS
         254I09xNz6ORhN0eMy7xbxZMEYtKcwxaxCq9Jj6fDeaMHy7jWP4ZGovjEiuNadVZXEa1
         5Q/I05qHMoELvOyEloUKWUwMFotApAnPR9c4Ffw95CQQ2/BgZUbpDuiiZGpT/vxmtV3w
         EmRUpdeadozeCz1ahwWAgXccILv7TIjpOvPv5XZ1M6+D0sRRU7X0Ov8VCNbb0rDLbZ4H
         S4Gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L1UARLiVtfn06aC5/k6KBU3nVstJ0ht4PV1DV6vDc64=;
        b=hEOkRkaKaSkcmOhK9Cv45FpnmoLjtGfdqxInmU9dAQ9feIRuUTAtkzKw3sDOBC9ACW
         WJ4CYJlPqFiXMax5VHfFCZHtwVaXoJxmVQEw6/v3PVHvSB9CusFJrvllz1TQMztd9bKI
         Vwp/7q5kse53U8bmsVwPCZ+o2+oxAlE4qAga1xde10bU0QW9KXw3MhsFrD35koRPa+MH
         KDcUQjXRoP/8578wLbnkxCwT2ik68ncPwphMpIIslY4PJA5E37GEABBGSm8dcPqNN85n
         PaK1MHC0fmDyO/wIoCvDd/gcncpvjr2tD3bRv4buh9utO0h/QGkKmf7Pnfzxr3cLGE2C
         I65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L1UARLiVtfn06aC5/k6KBU3nVstJ0ht4PV1DV6vDc64=;
        b=AGPHiykJLSw4/dkRveKzqwVWePzLmYSiLPhS1Ljdxg67wQvNjkW0F8ang2nPNYWdgV
         wmYyy295VYx0D4Tl8Yr+2gT/xhJNQpETkUjS7Lm+7J+Ag0JYSQOSLa3u6Me8GxdzdEH9
         lh3cLfbQ1+SWB5HDVzPhbnPLUy6u3GutWAihOt8KkysPjKns+szesfU5xRjRojJsc81j
         Zm0ZezYsMG9TCOy9vv4ALnWgu94y6uoCevI3/8HWIZZIUFVaE8zgUyGdctP7QRzyWTM5
         tAs3nRWyhuU9Uc5iXy3ZNKZDC5od19+RYVkIfEGSogYvMHXI4GmxakitBY8i1NdLQ3vs
         39Nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531jd2E2iRCDyzDxggGzPafLDdHSb2AGXy+JgPYpGsM0i3VmIm3j
	RqByJ94A1XfVEfE+oYkLoLI=
X-Google-Smtp-Source: ABdhPJwfLmS5TPd0wNCoy63+0YH5pvlv0nwRGb0xssi06pCIlZfbvoRsuxYALwugGYcZ5pBH+fP1ug==
X-Received: by 2002:a19:cb92:: with SMTP id b140mr3249598lfg.63.1590587307207;
        Wed, 27 May 2020 06:48:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b5d5:: with SMTP id g21ls2912373ljn.1.gmail; Wed, 27 May
 2020 06:48:26 -0700 (PDT)
X-Received: by 2002:a05:651c:200c:: with SMTP id s12mr3233406ljo.458.1590587306343;
        Wed, 27 May 2020 06:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590587306; cv=none;
        d=google.com; s=arc-20160816;
        b=S4wgK3lOc+24q3uf5OkWR7zVF41ZdUjmbOkbF2XzGnlQLw1AJrdM2bJ6sybxpr1Ioe
         vBpiguKpnm0Crz+utxELFjxHN/g7IRC7/hhyTADLYvQxq81Cv0KMa1G34fsTPVqUkK+7
         bh6dN3GHwqwbxxl9B13r8yh49w/reP8AumbN7ayRv9MSftlBBTNssdhkwZrC8q2N39r0
         061CTI410DaHfDu0NBWTvEbA2MxRcm/k3weCaBqrOy4W/ts1E1K2Ubc5OIASu6qE9A3X
         KbEQsS6y59zPJ8d7t+w1KUJMOQ4znZyUFuauURk1omVnitr1a+wNDDaj3nk3hEm9q3RU
         3h3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=iL41DmkLKBOzgfu1OffEB4KSm7C11uZZz+2h7W1FmnE=;
        b=ZaXU4RgxDS346plit+MJxcC0JlBm9DNOQXfovuWxA6bQ79e3sTSoEQHVxg+ud+eX/6
         RSQbV0NdEqTdBZaSdm1CyIyDAbhfgLj0aVFsN4f89heUS7GHzY5OoK7hmjn3oEDbKnRf
         TP+RPmkaxgAThdltZV+wOXWAObMdqn1NNAEdD8eyCrNsJrlOXPSXPINoyDINyYrzrNmV
         Zedc1Mahvd7qvr0JiVCe/4HaI7LmaLDO+9aOQi4AH/AcKus7PEnhW/+smdBUthzk1ES5
         Fkzga6y9XZXaw3BmtmvUkZvmLs7R/2JCjg8BTxGq3kJ2MhOG0M27h+kculYECbF3QUpT
         SN1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 14si155916lfy.1.2020.05.27.06.48.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:48:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RDmP2r022434
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 15:48:25 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RDmPph001015;
	Wed, 27 May 2020 15:48:25 +0200
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
 <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
 <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1d841e18-8a4e-0c00-4a57-1a74bb461fe6@siemens.com>
Date: Wed, 27 May 2020 15:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On 27.05.20 15:28, Nikhil Devshatwar wrote:
>=20
>=20
> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> Number of peers available on a platform is different.
>>> Do not hard code the target peer_id used for interrupt.
>>> Parse this from the command line argument.
>>>
>>> This de-couples the dependency between number of peers.
>>> ivshmem-demo can be run to communicate with desired target
>>
>> No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
>> target. All that is accessible via the register interface. But then all
>=20
>=20
> I believe, as of now, only root cell can communicate with peer1, peer2,
> etc. Non root cells cannot communicate with each other.
> Please correct me if I am wrong.
>=20

Not all targets have been enabled for the "triangle" setup, but if you
look at qemu-arm64, e.g., you can see that pattern.

> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work for a 3p=
eer scenario where
> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
> e.g. qemu-arm64 has these ids.
>=20

Then we need to adjust that. It doesn't matter who sends whom, just
everyone should send something and everyone should receive something in
the end.

>=20
>=20
>> demos should be updated, ie. also the bare-metal version.
>=20
> Sure, can I hard code the baremetal to always communicate with root cell
> (ivshmem id =3D 0)
>=20

No, all demos should then use the same pattern from above, consistently.
Luckily, only two implementations exits (bare metal + linux app), and
that for all archs.

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
jailhouse-dev/1d841e18-8a4e-0c00-4a57-1a74bb461fe6%40siemens.com.
