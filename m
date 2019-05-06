Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJGWYDTAKGQEYOEYCAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52D149F1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 14:40:05 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id x9sf10402793wrw.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 05:40:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557146405; cv=pass;
        d=google.com; s=arc-20160816;
        b=MF2LQP85i1qTq34RNr0VmuRmoUgTMDpNRUN0khGbXc9yaPl5xXgfZOmJfrGOQsTOmA
         UqcHu6OdpCBc6ek1x56jX7gXXaZdW1tlG5b4gdGLE9EJiN57SO1F+9tG7/cDtjNE4lx3
         FQOd3TpKs6jHd/l+hQhy3EO02egjP7F/At4gn0w+IlC+ismq/q0jmMO55wJLflKVVXnM
         CuZPSfEutek7Wvh5rqXKVL/peIqwhdXJq6DfR5Cv4EVfp0wSnbOzJfimtoWekTeI2dZ1
         h3SLB4UbgPr2lSJnkctOHMXWVnOSMREHjCJ9Z5EvEIT0in/lwLohhJXdEU6jvdAQ2pbt
         ra9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=MKKiBv2+cV/h5/deR9K3H3Z6s1JFEHJZCpR0vKHt8E0=;
        b=v7+ENdT52ghBcg2n04GE58ReQubpcVYKsbrcWSqqyABNYMYq4bUK2lP0N/JAAtP/yB
         0FSBsgWnRZoDPHQOFS05KHN5226zYxLqgOvHTbTv3iOrIS2RZ3N6nHsCuUAmvawcVtQ9
         /sNcSxJx5onrEGDXRgALutrLEPw2UIJbcFiSWuBNWwo7jQELF7qKR8li3OD5iCiBPS8Q
         pr7WEQWuT5CTPIKPk2uW78flFR9uW0PgbtEBK5yFrxl11p4WNBACO4WP4oENw+ooTFez
         S7vF5+GDSxfglXzUDqXsPl2vjIsoDzdg1g95Ja1H8h+o5pMznQ0jHkcPpx2INmfgeEz4
         DO/g==
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
        bh=MKKiBv2+cV/h5/deR9K3H3Z6s1JFEHJZCpR0vKHt8E0=;
        b=TxOKZs8PVoc9CI1s2Zd8LqF7yMFT4sscpqbws9JTeRYE3tz6UXbcwlUkm2eFkzNjbb
         OPnLQJwiuIrcOqaBG6j4XQGDDxlyRZ4yw+CN/UUiahzxGepHlrw9zxktzdaBSrA6F+pZ
         ShFeNlGmahG4ldV+bMAYYl+/E/DZ/cGljmfBODuNEej1ku2d1hxRFgxDBAFkGOheZ7Rq
         ZkEWIGnBgQU8Pj11kG059tq9jYvhQoKZ7POa7YiVVfg4vNEmmjM209FVxl7g6v59LL61
         WUz3HqYyskKYva8PecTu5hk9g3O4SAfYU1lVLb9/+LoRVhDBzZ1VT1vo346HlGqLWHox
         nbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MKKiBv2+cV/h5/deR9K3H3Z6s1JFEHJZCpR0vKHt8E0=;
        b=RSb8bHgp31t0vx197KYV7YCzMRbHnAvQ1Zhc4coUGE1EdrIw7syHaa9H8ZxpH+hzGg
         byYdsZ/Wpp0r+8990i6N98xtyf6ZVaTFyUcXLJVbZBUJOJFcwhJXadms72Vbczrxh00I
         b+Sug+ZGgL9bN0V5OUuPOU6zDRlJL6WjAP2rGHLWFvDvvYjJCT0culZmKcL+pmxGp1Ch
         XZkS6E09moc8pXmz7Jltx+IxpGy9ku6h1yoODoKi2fPgiE2juqjB4ElUciRacmcSxxnV
         iGpBlGmjw/O5DzUdDCk/haXfPKHaXPdv7d6iPfQcpaJ6NhSeqUyXFgTsCWvc80UDmaWY
         OsRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWukzRpB+9/jI72BszzZ85J6X57Mz8YH7YOmCURsnGtmtyIYT09
	bdcqf/CzgZjm7eng5qITi5Y=
X-Google-Smtp-Source: APXvYqyDaPwD5MI745DJBpSfRmoqAJS6eUHzvNBuP9XJXvWEvXCe7B1ilPuoU8PBmVXwkzahBjci2w==
X-Received: by 2002:a1c:ca0c:: with SMTP id a12mr9697718wmg.17.1557146405164;
        Mon, 06 May 2019 05:40:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b406:: with SMTP id d6ls3754769wmf.2.canary-gmail; Mon,
 06 May 2019 05:40:04 -0700 (PDT)
X-Received: by 2002:a1c:be11:: with SMTP id o17mr9367854wmf.45.1557146404311;
        Mon, 06 May 2019 05:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557146404; cv=none;
        d=google.com; s=arc-20160816;
        b=i6LMTQhyUeNsltJa/70w/+8UgIhApOQwJlMMKbijBg8bzt+9K5PYZN1Ogkt7pYNW7U
         FTvf7pIEiZW2O7R9WDw6BiKJ41715cFi8Q/Kpi6hxQwBkA3hmf3vn9R316ntpX0e9kF8
         ouUnp0CHsQiEtKnIRpJio3RDu3gil04YF9FiDQL/IGvdUxTHnfh+0F2OOAXGd0H2E5Ob
         FMMQMxavwCHdzWdeyhg6Uq8UMaJaEZPWNousLHJGQFupwDWqcQQaPMJB8cIMRLq/t94J
         +Rn23T3E7PjqjPlWh2MCQSm+kF1xmvGhKmm707IxkKzZe/bNgQj5daQSKIaluAEjgE7k
         RF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=gf7PihhYIe/npHL9xn3v4JBece3RPxEih0vPbz4C6BQ=;
        b=JmQurjjMnqCzxsofhOOOvQ2N4wZiJ4RLJq5D7JhR5SI5zHhFsLjbV78m0UI20DyDDn
         HWi3V0CmwiIzUnc3iUp5QCCSCfb080duTgdqN+nOJ9YLcwPX49O3m73J9tFE/9FW5sUy
         gibPSsrY2yBna8BXrhiEOVGykRfsQuNXGti8lwuxPfXTJPtyoKSHKF68l2aaOF03kDGA
         7jcSdWl7VYVs1Hc7693hssBWNw3JiJ5GLNT3i8z0JEJmtQMHucHxniU0l9sVBjR2lbxg
         QCQ1TiLlt2g8rpk947B0B9O/WZaf5w0PnIrlMEvfrK1oWDfon+1mbRwHHM5pOA2lwOJL
         6guQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x18si409735wmh.2.2019.05.06.05.40.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 05:40:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x46Ce38R019915
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2019 14:40:03 +0200
Received: from [139.23.115.55] ([139.23.115.55])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x46Ce34O020977;
	Mon, 6 May 2019 14:40:03 +0200
Subject: Re: [PATCH 16/16] x86: Remove misleading brackets from mmio
 instruction dump
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <cover.1524500320.git.jan.kiszka@siemens.com>
 <8288aefc87cb03b3f3bb8ab832c41fd0370a080a.1524500320.git.jan.kiszka@siemens.com>
 <924c6d0b-bed6-ee2c-95bc-c615bd053efa@oth-regensburg.de>
 <5214460f-f841-cc0a-2f1a-7608ffc365b3@web.de>
 <697a4574-4d0c-a64f-ad00-eac261b3c6b4@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8a16675a-0e7b-e4ce-e732-82878ebc2f68@siemens.com>
Date: Mon, 6 May 2019 14:40:01 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <697a4574-4d0c-a64f-ad00-eac261b3c6b4@oth-regensburg.de>
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

On 06.05.19 13:30, Ralf Ramsauer wrote:
> Hi,
>=20
> On 5/5/19 10:25 AM, Jan Kiszka wrote:
>> On 03.05.19 16:29, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> On 4/23/18 6:18 PM, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> The parser my bail out on opcode byte 0-2.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>>  =C2=A0 hypervisor/arch/x86/mmio.c | 2 +-
>>>>  =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>>> index c1b9f10e8..775ec4b7b 100644
>>>> --- a/hypervisor/arch/x86/mmio.c
>>>> +++ b/hypervisor/arch/x86/mmio.c
>>>> @@ -219,7 +219,7 @@ error_noinst:
>>>>
>>>>  =C2=A0 error_unsupported:
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("FATAL: unsupported instr=
uction "
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "(0x%02x [0x%02x] 0x%02x 0x%02x)\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "(0x%02x 0x%02x 0x%02x 0x%02x)\n",
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 op[0].raw, op[1].raw, op[2].raw, op[3].raw);
>>>
>>> sorry for digging out this old patch, but I think we have a logical bug
>>> here:
>>>
>>> There are cases, where we jump to error_unsupported before all opcodes
>>> are set. In this case, the Hypervisor reports the wrong instruction,
>>> which really confused us for a while (Andrej found this).
>>>
>>
>> Yes, this is a known limitation, and the patch here just tried to reduce
>> the
>> level of confusion a bit. Before that patch, the output suggested that
>> we are
>> always at opcode byte 2. But we can fail at any byte.
>>
>> This is an expert debug tool. You are expected to parse the opcode bytes
>> yourself from left to right. And as soon as you hit an opcode that is no
>> longer
>> supported by us, you know that the succeeding zeros are invalid. If you
>> want to
>> full instruction, use RIP and disassemble the guest. Adding that logic
>> to the
>> hypervisor is not planned.
>>
>>> We have such a case, if decoding of op[0] fails. Jailhouse will then
>>> report sth. like:
>>>
>>> FATAL: unsupported instruction (0x83 0x00 0x00 0x00)
>>>
>>> Which is wrong, the code behind is:
>>> ffffffff819705d6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83 78 08 03=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmpl=C2=
=A0=C2=A0 $0x3,0x8(%rax)
>>>
>>> Which brought us to the next issue: CMPL might be intercepted, when
>>> accessing, e.g., PCI MMConfig space. In Linux' pcibios_add_device, we
>>> have the upper code fragment that accesses MMConfig with CMPL.
>>>
>>
>> Hmpf. Would be complicated to emulate as we would then also have to
>> handle the
>> actual comparison with its impact on flags.
>=20
> Doesn't sound like fun, but...
>=20
>>
>> But looking at the function is 5.1-rc7, I don't see MMConfig accesses
>> yet. Are
>> you sure about the access address? I would rather guess we are touching
>> reserved
>> and, thus, not permitted BIOS or bootloader RAM here (struct setup_data)=
.
>=20
> I have to correct myself, it is some memory that is accessed. We have
> some non page-aligned memory regions:
>=20
> 3f200000-d2bff017 : System RAM
> d2bff018-d2c1d657 : System RAM
> d2c1d658-d2c1e017 : System RAM
> d2c1e018-d2c2c057 : System RAM
> d2c2c058-dbf5efff : System RAM
> dbf5f000-dc086fff : Reserved
>=20
> The config generator will create one region per entry. This leads to
> subpaging, and Jailhouse will intercept access. (Like it did thousand
> times before on MMConfig, this is why I suspected MMconfig).
>=20
> Luckily, those pages can be consolidated, which is the best solution for =
me.

Yeah, another reason to consider automating this consolidation in the gener=
ator,=20
at least for RAM.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
