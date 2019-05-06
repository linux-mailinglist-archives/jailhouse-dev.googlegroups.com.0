Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB45VYDTAKGQECR6IS4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE7148F1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 13:31:00 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id y67sf701791wmy.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 04:31:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557142259; cv=pass;
        d=google.com; s=arc-20160816;
        b=AW6TjQHmWxmWerBZtjgbtLhRhMD5lAd1l5uEYt2CACM8KanLaEv4TAgh9KkDCh9Alq
         xqNNRw/JLOGxrrqEX456KJN3+yBziwcK7uSFUpMyL/p9Z5Lmshk6hb6d4a9KGp9X+vqP
         SmLUKTaeSLO69BcopmO8da5TxbibwNfAgsUHOt9EpP0hr7lRi2a49+3lKCONQ2tvLQ7o
         P2TQC5or06/CcRat9ls/lFP66YleH7nBvc7tEXXk0bLmDjgkMmtcCKc05Stht41E4kOZ
         sG64XcIGReXi3A34aeRhfxiRTZRc3qoAtmFt9HT3u5wtcOXWi+i5wpqkoQjfMqGPy7pU
         Fj0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=RIj/ApTyyfcU32PWX0e9xLo8uWTBiZ7iXnfzOEDWLw0=;
        b=MSyrbSmx2qRuQjV/mOatlSo/RsBKczdLWf23rNbUMPCARLBZhj4cmOdLfFx7o63Apj
         cHl6OcXovgnYzO6cMAmaPs65V3PLy37Z9/5sbludbx0p9eYHsGz1jXaO+R+8wXsYDpi+
         r5CIJXrTjv8Q9l8OZF8McTwafO1y2qV9Als9Es4Yg5o3MpWG1fv80lov9JX/ERaaPiur
         6tlVgCOJI2TgIBkIMzpnIGJCts1orik9TlV5khGRyaYgQI+cWFUI0GBPqrVkXbQQkOzL
         0vi52I9JXnXVAMP8CihbXejklZ+9wuDiKITHHGzNQlhHl8E94Px5p9idtPKJm+n0kEwg
         QkkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=g3vGPTdx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RIj/ApTyyfcU32PWX0e9xLo8uWTBiZ7iXnfzOEDWLw0=;
        b=qHXBE8R0lbkD3RFHO5+rPIZ+tWIQNYqheZAljakEhajbgwk3oHeXUEusUX8Yn3QNN+
         cGgrqqaEpywbkL4SCOcLXin7k6RpMRSvJyHD3uwM8v7ZNok3i0FakLIdm+X/g39FTaxU
         fs9B5/xABuJTaXG0Dx6WXQWEJ7vD373N/K13CarvHy4SAn3uGv2fqP5Lyfa1iCl88P0c
         dSUsc7PHcDrlXWhB7OmVYcznSNLe79bUq6MYQvABl9xJrBhWzKzm96uzniAxIZ3O6CaA
         E8/Vxny3fCkVhBMxZDzSTw6evwqr2w3wCulEeCvXM4jUmIVZfjf6IvPwHdydQdzhqYcR
         G1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RIj/ApTyyfcU32PWX0e9xLo8uWTBiZ7iXnfzOEDWLw0=;
        b=nQl+W1V7dPuTTu6C4QwAuaVsx6vJT1AAoL1t7304t6eejahZKxjzi3JIYSWDca3NPq
         YmKNxyx2SNs0lJU/7MVZVrGMu95AZP0BVfNTv+Xi5af9yBxPoz3lJQaMc5T7YHZGAhVn
         PS8zXaq83/1F2NGVwzcEByXvQmbTT9nSpgvE9oA7KArjjbkoOAVxJNtV07XaJnFpGxmu
         ANYxK1HSwBFK9LBCRq35gOzRRuL6p1nEnT/0swdCfVTqi1e7Ro7j5nH/TAGqjnDLmAfx
         PG+lh0h2u2zmoM2PKBMMvWnw5Xv6Umnbw1TW8T4cq68oXMYe8Tof81GTQYIYwnZ0uQTq
         47+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXXz++L+PJqCo/1W8iN90/lBKi+42r1qPSd//sMka2hNuIu+c1v
	A32zPiUVJVpmc69oll/i7iY=
X-Google-Smtp-Source: APXvYqwZT2MLhCm7c9cTzI4CS/caERdrRuG+vmctGVtOTvBmh3SxPYT5PNvJgRXkfve/T8ct0RLIWA==
X-Received: by 2002:a1c:c917:: with SMTP id f23mr16259439wmb.11.1557142259418;
        Mon, 06 May 2019 04:30:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f507:: with SMTP id t7ls3681237wmh.4.gmail; Mon, 06 May
 2019 04:30:58 -0700 (PDT)
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr16946128wmk.9.1557142258659;
        Mon, 06 May 2019 04:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557142258; cv=none;
        d=google.com; s=arc-20160816;
        b=kxGn+FO1fkhg9snn+6l1C5Fe2z1D5oeBKaGBFHhQbK1t3tfQfte7ICrbt+3yFB7lBn
         nU2dDQOvLFy4i8okOWARLZdBBwnQrTr+panK/QHvkFTmxY3bq8Ed/c11rGEZlFaeJYvs
         +EakhOJNQCUv0KCIUMu7Zke7QBAFR/TMLdNlCrinAE0j3RjruGqlFMLWbZjDaGbMy//p
         dzC95CFw19NG+VjDwxvXYLfNb2UWFLemnBGakaT2zlNFd7Cl98BZyaBnD438MW4HZ4Lf
         LBp+b8BUUuYJasoyba1Jh7YNb0gVuKP21SXX5wxGsD9GfrLkWglYoWEXGGPW1JzIDVZi
         CeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=C34cYrDW/AYSWfNd0PLNcvAI1WGbooLpAj7cPPRHCM8=;
        b=iMLVeVlyIG4hwIyvh2bD30dYkTXBPTJ0YPZqaE3tBzeWKaGhxIywsoQVw+Q2VQMWFv
         2NqPjIemA1ge0NPpRJgy25sCM5+2SVIP/l0tcjo+azCmA9h2sLi2nuvIwfhDF8T1tNtZ
         PIPkQ42S8RwbVMWv3Gya0ryTtCeYVwrF5d76aSa26g50yVf7iNABqOUGVkgtkBRw8mp5
         NstWf2SvPzTZ22jYJt1naXgPQa+0ejPcoz1PS9HCef8OrfLJaJXJyI1o0RoKtp/KBQys
         qM8uD24mPZw/DdS1gURRzHMeNiZtKuW//Qxq0UeBrWgK/0sICHJUgld0i7MOB/CyZj5E
         ygKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=g3vGPTdx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id f1si388225wme.1.2019.05.06.04.30.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 04:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 44yLCQ1gPJzyBc;
	Mon,  6 May 2019 13:30:58 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 6 May 2019
 13:30:58 +0200
Subject: Re: [PATCH 16/16] x86: Remove misleading brackets from mmio
 instruction dump
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <cover.1524500320.git.jan.kiszka@siemens.com>
 <8288aefc87cb03b3f3bb8ab832c41fd0370a080a.1524500320.git.jan.kiszka@siemens.com>
 <924c6d0b-bed6-ee2c-95bc-c615bd053efa@oth-regensburg.de>
 <5214460f-f841-cc0a-2f1a-7608ffc365b3@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <697a4574-4d0c-a64f-ad00-eac261b3c6b4@oth-regensburg.de>
Date: Mon, 6 May 2019 13:30:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5214460f-f841-cc0a-2f1a-7608ffc365b3@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=g3vGPTdx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

On 5/5/19 10:25 AM, Jan Kiszka wrote:
> On 03.05.19 16:29, Ralf Ramsauer wrote:
>> Hi,
>>
>> On 4/23/18 6:18 PM, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> The parser my bail out on opcode byte 0-2.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>> =C2=A0 hypervisor/arch/x86/mmio.c | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>> index c1b9f10e8..775ec4b7b 100644
>>> --- a/hypervisor/arch/x86/mmio.c
>>> +++ b/hypervisor/arch/x86/mmio.c
>>> @@ -219,7 +219,7 @@ error_noinst:
>>>
>>> =C2=A0 error_unsupported:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("FATAL: unsupported instruc=
tion "
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "(0x%02x [0x%02x] 0x%02x 0x%02x)\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "(0x%02x 0x%02x 0x%02x 0x%02x)\n",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 op[0].raw, op[1].raw, op[2].raw, op[3].raw);
>>
>> sorry for digging out this old patch, but I think we have a logical bug
>> here:
>>
>> There are cases, where we jump to error_unsupported before all opcodes
>> are set. In this case, the Hypervisor reports the wrong instruction,
>> which really confused us for a while (Andrej found this).
>>
>=20
> Yes, this is a known limitation, and the patch here just tried to reduce
> the
> level of confusion a bit. Before that patch, the output suggested that
> we are
> always at opcode byte 2. But we can fail at any byte.
>=20
> This is an expert debug tool. You are expected to parse the opcode bytes
> yourself from left to right. And as soon as you hit an opcode that is no
> longer
> supported by us, you know that the succeeding zeros are invalid. If you
> want to
> full instruction, use RIP and disassemble the guest. Adding that logic
> to the
> hypervisor is not planned.
>=20
>> We have such a case, if decoding of op[0] fails. Jailhouse will then
>> report sth. like:
>>
>> FATAL: unsupported instruction (0x83 0x00 0x00 0x00)
>>
>> Which is wrong, the code behind is:
>> ffffffff819705d6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83 78 08 03=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmpl=C2=
=A0=C2=A0 $0x3,0x8(%rax)
>>
>> Which brought us to the next issue: CMPL might be intercepted, when
>> accessing, e.g., PCI MMConfig space. In Linux' pcibios_add_device, we
>> have the upper code fragment that accesses MMConfig with CMPL.
>>
>=20
> Hmpf. Would be complicated to emulate as we would then also have to
> handle the
> actual comparison with its impact on flags.

Doesn't sound like fun, but...

>=20
> But looking at the function is 5.1-rc7, I don't see MMConfig accesses
> yet. Are
> you sure about the access address? I would rather guess we are touching
> reserved
> and, thus, not permitted BIOS or bootloader RAM here (struct setup_data).

I have to correct myself, it is some memory that is accessed. We have
some non page-aligned memory regions:

3f200000-d2bff017 : System RAM
d2bff018-d2c1d657 : System RAM
d2c1d658-d2c1e017 : System RAM
d2c1e018-d2c2c057 : System RAM
d2c2c058-dbf5efff : System RAM
dbf5f000-dc086fff : Reserved

The config generator will create one region per entry. This leads to
subpaging, and Jailhouse will intercept access. (Like it did thousand
times before on MMConfig, this is why I suspected MMconfig).

Luckily, those pages can be consolidated, which is the best solution for me=
.

Thanks
  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
