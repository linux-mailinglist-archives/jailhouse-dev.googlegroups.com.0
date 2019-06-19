Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6HSVHUAKGQEFY2QK4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF44C07C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 20:05:45 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id n26sf51302lfl.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 11:05:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560967545; cv=pass;
        d=google.com; s=arc-20160816;
        b=iEZYwQ4Nyct2cflkS0Gfq31vJHBgEQfmb0nRzo4pxjECX9McfS09+2FqKQMoVNasoT
         WHm21VreIzSSQ9pn0QHnRS3N47aA0CWlK62xFNJ8CjecYxVm3yBR5wbCunef59pK9HhY
         QD/gb2raObyRVVg170K8+uP/hHdARQr+Cq6h9AhyAMqH3YggMG+n4dhEOI/sX/qgpf0/
         UUO63e8dn5c1EhZqhQQ+bJmAklO4DTzTbkiVzSsNopSQknu8v20D/rkpoUc7Qflpxw2M
         iXMPjJoZ8L+Oc6AHsdkI5BSYsIrFjbITS/qJ3DK35BC1oYTR6/8EgVcbEjnMhi2mRxlo
         eccA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Hu7/Y3g+q+01yyEzF0s1WkW0k9oARdlgiafN3a3P+v4=;
        b=E7WKt5pX8zW0NNoUOd8Sv0DnYmGMga+7+vEwmcTw8p/ZfRQqP95RE7E81PbouOBpek
         /xA+km07GtDv/yC9aty/+Irei2A/phE5DD3/5jjcPnKjCWF26C2YmZMMiFJCG65ZBFf7
         PBz7O5IsBW2T+PXYQsRtOupEf+7ilNo1C9ZRckHslsSOO1q5oRAygF6/VNK6gPoBhS/4
         hbWSCybLdIRCDUCqXSYqFShTu3tV2sGMToisMg9FeHksRlZ69vmLPG3iFj3pYda1S+25
         /JDzAzFa1EeE09QD8OyPk07j1WjI6AbJR43d8j4SjZIHVq59P2jKO6vn9lLK2MT8eCuM
         vK9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Hu7/Y3g+q+01yyEzF0s1WkW0k9oARdlgiafN3a3P+v4=;
        b=QX99yjAEK3G9R1PcuPVT96Gh3yLPmrXOEIR5qxMTooJX868E3tu6EvDFZYQfll/K73
         qU0FPCu0PulV6NqzmhP7QPAe3HbgcK47f3yxnDwCaWEtFEXNMrbM2Oaqik+Y8RLfIxK7
         MTcjYoP0NoPUrCn5FQSCf3en16jNNHj+q+SOQTgyyvVr+f5mhv9viG38Tcr9KZOw1nVi
         HmzdqwR5ohAsmwe9DJ8j7WmzC4h3fH8U/fhrwDRii1AbO4lLvqdpf9cHU9woQAu+7lo2
         vx22EC/OzUK3AnM36gLm2nASlcvsdoyZ9y65SS/UFkpH9L3Jz5cjFfyF8WxzXctXza9C
         HNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Hu7/Y3g+q+01yyEzF0s1WkW0k9oARdlgiafN3a3P+v4=;
        b=Rx29VexYaXneUhasZBZtOtA0B5JmJOTUjoHZ2O2xWy2P+1nGAdgsGZebVtGIcFN0ns
         C0qHMESpkdgFlWQlARX3OycK0Esph2uQsJ6wyGz8wPfxpK1+uyJLGi6awvxeDcg4nQw4
         X7caQOw1XUCIU0Zqw7UyK98JRot091WhKYA5BUAo/MwTvrIhF9lGft57xZgSmu89zVld
         9Idt+zkytYA1701TUmjIQwFS/RMVyqYUTQ77cFODMf9rCp5VZbeySrDyxaryaaSxQpNo
         YAfdyBJq1fTqSRFTJ/P9eAOhSyW4zLP2FN25uu5fCbB+Bap8PVpE/BKlBCgNk+SSqHeN
         YTmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX4B6/5zwG+xqdekRKzAGrXUtFnXK0gyj8NjdX00cWuu84jasL4
	78Y1UReXGKdFMzEhyayvRv0=
X-Google-Smtp-Source: APXvYqxKzmgRK9h2BRUr9o9E/6UxsQNukpoIRAwcR2v9JfyRE5lBMQgjLET+LdAY5/UB140yb6n1uQ==
X-Received: by 2002:a2e:9657:: with SMTP id z23mr6926507ljh.116.1560967545354;
        Wed, 19 Jun 2019 11:05:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8917:: with SMTP id d23ls373484lji.14.gmail; Wed, 19 Jun
 2019 11:05:44 -0700 (PDT)
X-Received: by 2002:a2e:8650:: with SMTP id i16mr18679715ljj.178.1560967544300;
        Wed, 19 Jun 2019 11:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560967544; cv=none;
        d=google.com; s=arc-20160816;
        b=TGcHb5yCexgHqnjwhDxwqUFQxI+d8hU7O2kR09oJsflWIqXU7hMV9lpcFHzrvzMtMH
         2K6Eo8xPz/Y4kmBFaPN+aDGnw+9b5xABKa6BUmrvAHOYb77uqu/btOwxL2Ljw5lsDQFB
         S1YqvZf1P0teey7vNY2yQ/7Qgfwu0Kazafebc1GjYTICPKONtddZ48w4rjyBCr7Ew6cL
         1fxm9e15XxURzop2HgFQuhu7lCdxtwo94VlI4rZ6FxLFmQBb+OLfHEiNcx7fjYE9/X2x
         PvDAqoRxnuOvoofFVHJgIHbAap2IdEjcb34OV/zoYagql+CtQZvLUija4VwAZpRsdW+L
         xIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=8mtR/N3AjefCv56a7UVBBwLCGXVECFGfkPQc1DFflig=;
        b=ZJ44v75X7fWcJOA2zYJ6mHTOkAlupsAYwzR0aZHAYHccVfps8zP9r9u69pmMXoKELO
         uJgO1aqSowEOwPsZaddZE8yzEkWncD37oZODjvM00xGzMMvJVo544O/ysZ+GUKRTc7qD
         Hos3hErr1QZD7C2jhSaC36zXiLXpUgKbrRiROjWNdxUQ9WyT06RO4IVy9bLyL6RCjfMQ
         0ZANMdisqOy8rxHUvAGCX4lrN5zfESjd8+tZ9DMVIkSPHxPiaC1EJBiRaBwqwoUCqocc
         ks9J5PCsV4ZhRThd/fSVFwCFX9h9eJ5JVU/3L4UlhGyVzmmSX+zIwoOeUGmchcBTnPFV
         xHow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q25si861095lfp.0.2019.06.19.11.05.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 11:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5JI5hRO022275
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jun 2019 20:05:43 +0200
Received: from [167.87.35.241] ([167.87.35.241])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5JI5gA9014602;
	Wed, 19 Jun 2019 20:05:42 +0200
Subject: Re: [PATCH] pci: Replace mmio_write64 with mmio_write64_split
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: jeanne.romefort@gmail.com,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>
References: <20190619165224.15322-1-ralf.ramsauer@oth-regensburg.de>
 <7ff27074-8628-cf0c-3812-2c5810f58307@siemens.com>
 <1cecd49c-d04d-de5d-110c-5396c233c6e1@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <92b7375e-1326-75e6-d819-72c95c225d3c@siemens.com>
Date: Wed, 19 Jun 2019 20:05:40 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1cecd49c-d04d-de5d-110c-5396c233c6e1@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 19.06.19 19:16, Ralf Ramsauer wrote:
> On 6/19/19 7:09 PM, Jan Kiszka wrote:
>> On 19.06.19 18:52, Ralf Ramsauer wrote:
>>> MSI-X vector tables hold 64-bit entries. So far, we used mmio_write64 t=
o
>>> set them.
>>>
>>> This conforms the PCI specification: "For all accesses to MSI-X Table
>>> and MSI-X
>>> PBA fields, software must use aligned full DWORD or aligned full QWORD
>>> transactions; otherwise the result is undefined" (PCI Local Bus
>>> Specification
>>> Rev 3.0, chapter 8.1.2).
>>
>> Chapter 6.8.2.
>>
>>>
>>> Nevertheless, some vendors don't support 64-bit writes, e.g., Broadcom
>>> ethernet
>>> cards (BCM5720). mmio_write64 stalls, and the transfer won't happen.
>>>
>>> Replace mmio_write64 with a wrapper mmio_write64_split that
>>> substitutes the
>>> 64-bit write with two 32-bit write operations. This accessor first
>>> writes the
>>> upper 32 bits and then the lower 32 bits.
>>>
>>> Credits go to Jan, the root cause of this bug was found in a private
>>> off-list
>>> discussion.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>
>>> Only tested on x86, untested on ARM. I lack PCI devices with MSI-X
>>> suppport.
>>
>> I will throw this on our Seattle eventually.
>>
>>>
>>>  =C2=A0 hypervisor/arch/arm-common/pci.c=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++=
--
>>>  =C2=A0 hypervisor/arch/x86/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++----
>>>  =C2=A0 hypervisor/include/jailhouse/mmio.h | 15 +++++++++++++++
>>>  =C2=A0 3 files changed, 21 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/arm-common/pci.c
>>> b/hypervisor/arch/arm-common/pci.c
>>> index 60ffabb8..4f35175f 100644
>>> --- a/hypervisor/arch/arm-common/pci.c
>>> +++ b/hypervisor/arch/arm-common/pci.c
>>> @@ -58,8 +58,8 @@ int arch_pci_update_msi(struct pci_device *device,
>>>  =C2=A0 int arch_pci_update_msix_vector(struct pci_device *device, unsi=
gned
>>> int index)
>>>  =C2=A0 {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* NOTE: See arch_pci_update_msi. */
>>> -=C2=A0=C2=A0=C2=A0 mmio_write64(&device->msix_table[index].address,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 device->msix_vectors[index].address);
>>> +=C2=A0=C2=A0=C2=A0 mmio_write64_split(&device->msix_table[index].addre=
ss,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 device->msix_vectors[index].address);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(&device->msix_table[index]=
.data,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 device->msix_vectors[index].data);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
>>> index 492e9859..560c5697 100644
>>> --- a/hypervisor/arch/x86/pci.c
>>> +++ b/hypervisor/arch/x86/pci.c
>>> @@ -393,8 +393,8 @@ int arch_pci_update_msix_vector(struct pci_device
>>> *device, unsigned int index)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_msg);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // HACK for QEMU
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (result =3D=3D -ENOSYS) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write64(&device->msix_=
table[index].address,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->msix_vectors[index].address);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write64_split(&device-=
>msix_table[index].address,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->msix_vectors[index].address=
);
>>
>> Unlikely that QEMU shares this problem, but let's be consistent. Hope we
>> can remove that path one day...
>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(&d=
evice->msix_table[index].data,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->msix_vectors[index].data);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> @@ -402,8 +402,8 @@ int arch_pci_update_msix_vector(struct pci_device
>>> *device, unsigned int index)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (result < 0)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return result;
>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 mmio_write64(&device->msix_table[index].add=
ress,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pci_get_x86_msi_remap_address(result));
>>> +=C2=A0=C2=A0=C2=A0 mmio_write64_split(&device->msix_table[index].addre=
ss,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pci_get_x86_msi_remap_address(result));
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(&device->msix_table[index]=
.data, 0);
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> diff --git a/hypervisor/include/jailhouse/mmio.h
>>> b/hypervisor/include/jailhouse/mmio.h
>>> index 61b4647e..567901d0 100644
>>> --- a/hypervisor/include/jailhouse/mmio.h
>>> +++ b/hypervisor/include/jailhouse/mmio.h
>>> @@ -73,6 +73,21 @@ DEFINE_MMIO_WRITE(32)
>>>  =C2=A0 DEFINE_MMIO_WRITE(64)
>>>  =C2=A0 /** @} */
>>>  =C2=A0 +/**
>>> + * Write a 64-bit value to a memory-mapper I/O register. Perform two
>>> 32-bit
>>> + * write operations instead of one 64-bit write operation.
>>> + *
>>> + * @param address=C2=A0=C2=A0=C2=A0 Virtual address of the register.
>>> + * @param value=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value to wri=
te.
>>> + * @{
>>> + */
>>> +static inline void mmio_write64_split(void *address, u64 value)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 mmio_write32(address + sizeof(u32), (u32)(value >> =
(sizeof(u32) *
>>> 8)));
>>
>> Why do we need to that dance around the hot pot? u32 says in its name
>> that it's 32 bits.
>=20
> mmio_write32(address + 4, (u32)(value >> 32));
>=20
> Fair enough. You can fix that up during merge, if there are no other
> open issues. Otherwise I'll submit a V2.
>=20

Fixed up while applying to next.

Thanks again,
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
jailhouse-dev/92b7375e-1326-75e6-d819-72c95c225d3c%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
