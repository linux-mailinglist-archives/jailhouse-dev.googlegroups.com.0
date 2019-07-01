Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBWPN5DUAKGQEF24YEXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EF5C136
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 18:37:45 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id q2sf5832233wrr.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 09:37:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561999065; cv=pass;
        d=google.com; s=arc-20160816;
        b=joMTQR4UlUcrc6gloBbF1BLlVgKnzp8LCl47xq9nBTZdJP9CHo/ncZubCXRnOdZPzl
         VNmTMC9QW9E9PSxdlc+Cr0zRMjB80Fb3VjxVXRjWykMBr7M8GMR9FI0HV1LQ2/+gsmiW
         rwAo7kwprxU7aYSkB/qlU4AXqsLdL0IN/qP/+lTzy42NAIWUULZlHrXA5zFbxSlhVJ4W
         0AJFkluChZJuUvdf0u4iIjUdKLAI15YWgP/7B6KqFVIL79ufXZ/saztdTBaARjEivzdt
         /r2OwHmmV2bgZm9sYwD1y39y0LSQ4Gossy8CVUGdDdlTYKH3+6Xkr5a+uyLu94c8KqNX
         XsWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:to:sender:dkim-signature;
        bh=S9+85MuRlPQcBJfgmZyupTAgEFGPBWGe0Ua04qr/3t0=;
        b=B3oWXnPHq6rrayNsPxo++07r7YGjQdzxirH8+qlTE+GVVBd86ouoOXzlcOiplisg+B
         WTRz5aaE2ocWeMwKGe3lDlIg8s39PaN2ovWS0YAJuGJunhk8M7zCkYUy9i1FTIvCx3K4
         Wgkk1u8JOWhIPJXoCn2/N3Jjc04zfeCSq+3Ri50ZTKdh9xzeKk3j+KMDx5SvB+veB1q8
         LEx7Mq+A9159TC7Btul3FLyMAhd/UD5dlXbAAhaQyHWlzx8tjUq0B+iPtlJ4zTWvt8sm
         ue+t59JN2iSalb8x6YCWfcr1zrQfkaJ2KeQC3zP+5tTvfqy0ypcY+yATfWQA7nonPCjr
         KnPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vsLgsoAB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S9+85MuRlPQcBJfgmZyupTAgEFGPBWGe0Ua04qr/3t0=;
        b=Ov2poSmV7IuolXMnSJCoR01zcDyS/XjWxmygo5/ijuGFM/FWwbzNDKWLXS7nQEmzOj
         ekj7/ImgJ6rCrTGBpP/oFlhpSTKrR7Bt2AvsQl/SuSSzuyi9VOA48VxseGndJdP2NYSZ
         TT98nAim2U+g95bRdkMWTGZCiLsvcRQ6i2S+MoP7EITPaU0O7PZ2pRkTax1SaChV5jOD
         c1+teVdW1fkVOZmevqKmiB9/dTwd6R/7hx0hZH4QwpPVeE6RP1dKG9Kj7ykN3jKFQ7ZX
         1GaLpeXtGI76IiJFy9Twfh6Ex5KVkyzYHMvU/oYCRD7AbiZgtN0gU3YlZaL2H0D23aHx
         vOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S9+85MuRlPQcBJfgmZyupTAgEFGPBWGe0Ua04qr/3t0=;
        b=Lex1kw7ndimyfWvJjuol9vjqIY7nmP2l8bgfxGbDNedVF2sp1DlDeXnJxujwv1HBRT
         6lHb52yYZe9NZk0I1N62I2Tbk0a0VPQeUC39xWCbjY6uFWL5dowE6wzvbpgRuG+rOj53
         wCMRwCdJ3te1i0pn1v9fe2MwmSo4mG6qe1l2xyAFyD/cvP+UgwbJ8FaKN0ktySkKUI0m
         ADhSZQWqNwRPUx/5u6FQ+7C641Ti677l7lABWytrL7wloDZRVZ4X8uGP73JlUw2ZtAsg
         bqEFEbmQil8u7EBZwNWbKbojphTvzYvEtJ8L5PSDP1fvimq+OkerMSj25JAAeYg2t4xc
         JRaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWTehoHOavMoC6r7rJBlQKYgZrWZemapQL2ccpVtDxpZpN4IiAH
	JeEMtyD9ynxPhbd16L/Y9Sw=
X-Google-Smtp-Source: APXvYqxh5ZbStiB2wME/CEp1M2dbiYO7oGkb06ikw2RcjO1DPdELmpZzUNHCELitMoeHtJxyHZoEYg==
X-Received: by 2002:a5d:6743:: with SMTP id l3mr8590655wrw.241.1561999065288;
        Mon, 01 Jul 2019 09:37:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b484:: with SMTP id d126ls22187wmf.2.canary-gmail; Mon,
 01 Jul 2019 09:37:44 -0700 (PDT)
X-Received: by 2002:a1c:e715:: with SMTP id e21mr148684wmh.16.1561999064792;
        Mon, 01 Jul 2019 09:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561999064; cv=none;
        d=google.com; s=arc-20160816;
        b=lQhVc8AUNm55XNnlqMpF/HkjZsRXhL9nrmJKSDSKDe7XIyIxvyGUUOWIgADtimNRuG
         bOn0qQP/I/VYYIl70RQW3d5xYhbuQC52EVQUPzUpCduJsgwsEoJnLA3X6c5Jd/rvhoqK
         ICMufqM6IeGayvwHi4uSXZKKA0ZY15KJvuNu8EQKpcK+ucQAOMYPmkFiqZFaveK8smyj
         tno1zwjrRZm7bbdtWt2Xj1mC/HJqZsQe0usTjKOlOkKl6W+ogMKnOO+vmNZyJe7658oH
         AjccU4bIu/BPudMDlo1eAQDUme6RqyUAFJ7PIaVKowZwPNjobFE0AaG1pcSNc2UTJ7kj
         eCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=//JJLau9uOTDcw9vCYwMAFvIhWGKaZcqfSxeTSdljoc=;
        b=oQjDnGnOck79btykpY1M2PLPJ+h5yfUL+FQNNyR93AcTIpuEVJdzt7mq1JFyp2yRuR
         TZ3Eb9jmusZ1bC+xlnqCGwFHpJ9FFBER4id8YYkbuV0fmd3v5d6BIde8YIGTGv3EHqzR
         0FjjovH2C9vMrj1fHJj/x6LbACnIcULg34hQsXwGlSnAtwPqIGN5WddjI7ndMaBPNsN1
         6m6aS906fwRmIYVCos8rT0l0vN62B+CSSTAcbKBijLmynAlP30NsEih/H1s+x5665EfD
         g6D9p50b+2mP+H7UEpLyJKfZ7PwHeMRJgjEeEtdAVZwh6wtbmBeZPrDC4A9up8Buq3p6
         Z9rg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vsLgsoAB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id v3si874136wrg.3.2019.07.01.09.37.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 09:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45ctMX2rZNzxvw;
	Mon,  1 Jul 2019 18:37:44 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Jul 2019
 18:37:44 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
 <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
 <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
 <6ecf8f54-53f3-1c72-b9a6-ce9007982975@oth-regensburg.de>
 <9a4b887f-a641-cacf-763b-53dbd1c229a2@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: Having trouble setting up a shared PCI device in root cell
Message-ID: <dd55c1a5-8863-5f94-b339-bebc221dfc6f@oth-regensburg.de>
Date: Mon, 1 Jul 2019 18:37:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9a4b887f-a641-cacf-763b-53dbd1c229a2@siemens.com>
Content-Type: multipart/mixed;
	boundary="------------1030AE17DF6A19C06729394B"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vsLgsoAB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

--------------1030AE17DF6A19C06729394B
Content-Type: text/plain; charset="UTF-8"



On 7/1/19 5:44 PM, Jan Kiszka wrote:
> On 01.07.19 17:11, Ralf Ramsauer wrote:
>> On 7/1/19 4:04 PM, Jan Kiszka wrote:
>>> On 01.07.19 15:52, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 7/1/19 3:09 PM, Jan Kiszka wrote:
>>>>> On 01.07.19 14:59, Ralf Ramsauer wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 6/27/19 9:06 AM, Jan Kiszka wrote:
>>>>>>> On 25.06.19 19:25, Ralf Ramsauer wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> for the completeness sake: it's about ivshmem-net. The PCI device
>>>>>>>> shows
>>>>>>>> up in the root cell and can be discovered via lspci, but the driver
>>>>>>>> fails while probing with
>>>>>>>>
>>>>>>>> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 ->
>>>>>>>> 0002)
>>>>>>>> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
>>>>>>>
>>>>>>> The register read-out failed. Maybe a mismatch between driver and
>>>>>>> Jailhouse version: Which revisions are you using on both sides?
>>>>>>
>>>>>> siemens/4.19-rt vs. jailhouse/next. Should match.
>>>>>>
>>>>>> The bar_mask was copied over from the qemu demo. Other than that, the
>>>>>> only thing that changed is the bdf. We simply chose a free one on our
>>>>>> system.
>>>>>>
>>>>>> The memory region behin ivshmem is high memory above 32-bit. I
>>>>>> instrumented and checked the code, but that shouldn't be a problem.
>>>>>
>>>>> This is rather related to the MMIO register access. Check if reading
>>>>> that ID/IVPos register actually triggers a VM exit. I suspect it
>>>>> doesn't.
>>>>
>>>> Hmm. Correct. I guess we should end up in ivshmem_register_mmio()
>>>> but we
>>>> don't.
>>>>
>>>> For bar0, jailhouse registers MMIO 0x380000000000. This is in sync with
>>>> the kernel:
>>>> [ 1416.878650] pci 0000:00:01.0: BAR 0: assigned [mem
>>>> 0x380000000000-0x3800000000ff 64bit]
>>>>
>>>> That's odd. Actually we should trap. Instrumentation of ivshmem-net
>>>> below gives me:
>>>>
>>>> [ 2044.832898] regs location: 4080053db000
>>>>
>>>> Huh? Shouldn't that be 0x380000000000?
>>>
>>> What's "regs location"? What does "lspci -vv -s 0000:00:01.0" report?
>>
>> pr_err("regs location: %llx\n", virt_to_phys(regs));
> 
> Calling virt_to_phys on ioremapped memory may not work. virt_to_phys is
> primarily (if not only) thought for calculating the address for a kernel
> piece of RAM.
> 
>>
>> Please find the output of lspci attached.
>>
> 
> That looks consistent.
> 
> Did you check that there is no accidental mapping of that virtual
> address so something else? If not, check earlier in the interception
> path if there is a VM-exit, but we just do not end up in ivshmem for it.

Got it running. The issue was that the config generator fully mapped all
PCI Bus regions:

/* MemRegion: 380000000000-380fffffffff : PCI Bus 0000:00 */
{
        .phys_start = 0x380000000000,
        .virt_start = 0x380000000000,
        .size = 0x1000000000,
        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
[...]

So access wasn't intercepted at all as those pages were fully mapped.
After commenting out all of those regions everything works as expected
(well, not tested against another endpoint, but at least ivshmem-net
successfully probes).

The config generator created those regions. Happens on master, next and
older versions. I guess this happens as those regions don't have any
siblings -- they should probably be filtered out. Find the iomem attached.

BTW: This behavior can be reconstructed by running the config generator
on the qemu virtual target for x86.

Thanks
  Ralf

> 
>>>
>>> Hmm 64-bit... FWIW, I'm going to remove that "feature" from future
>>> ivshmem again, moving things back to 32-bit address space.
>>
>> But we do have:
>>
>> 380000000000-380fffffffff : PCI Bus 0000:00
>> 381000000000-381fffffffff : PCI Bus 0000:16
>> 382000000000-382fffffffff : PCI Bus 0000:64
>> 383000000000-383fffffffff : PCI Bus 0000:b2
>>
>>>
>>> That said, this constellation may have triggered an issue in ivshmem or
>>> even the MMIO dispatcher that wasn't visible so far.
>>
>> But will moving the memory region to 32-bit address space solve the
>> issue in this case?
> 
> Can't tell as we do not know the root cause yet. But you can already try
> to remove PCI_BAR_64BIT from bar[0] initialization in
> hypervisor/ivshmem.c and check what changes.
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dd55c1a5-8863-5f94-b339-bebc221dfc6f%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.

--------------1030AE17DF6A19C06729394B
Content-Type: text/plain; charset="UTF-8"; name="iomem.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="iomem.txt"

MDAwMDAwMDAtMDAwMDBmZmYgOiBSZXNlcnZlZAowMDAwMTAwMC0wMDA5ZmZmZiA6IFN5c3Rl
bSBSQU0KMDAwYTAwMDAtMDAwZmZmZmYgOiBSZXNlcnZlZAogIDAwMGEwMDAwLTAwMGJmZmZm
IDogUENJIEJ1cyAwMDAwOjAwCiAgMDAwYzQwMDAtMDAwY2JmZmYgOiBQQ0kgQnVzIDAwMDA6
MDAKICAwMDBmMDAwMC0wMDBmZmZmZiA6IFN5c3RlbSBST00KMDAxMDAwMDAtNTQxMTAwMWYg
OiBTeXN0ZW0gUkFNCiAgMDEwMDAwMDAtMDFlMDcxZDAgOiBLZXJuZWwgY29kZQogIDAxZTA3
MWQxLTAyNTZjZDNmIDogS2VybmVsIGRhdGEKICAwMmFmNDAwMC0wMmJmZmZmZiA6IEtlcm5l
bCBic3MKNTQxMTAwMjAtNTQxMjg2NWYgOiBTeXN0ZW0gUkFNCjU0MTI4NjYwLTU0MTI5MDFm
IDogU3lzdGVtIFJBTQo1NDEyOTAyMC01NDE1YTQ1ZiA6IFN5c3RlbSBSQU0KNTQxNWE0NjAt
NTQxZjAwMWYgOiBTeXN0ZW0gUkFNCjU0MWYwMDIwLTU0MjIxNDVmIDogU3lzdGVtIFJBTQo1
NDIyMTQ2MC01NDJjNzAxZiA6IFN5c3RlbSBSQU0KNTQyYzcwMjAtNTQyY2YwNWYgOiBTeXN0
ZW0gUkFNCjU0MmNmMDYwLTU2MTAxZmZmIDogU3lzdGVtIFJBTQo1NjEwMjAwMC01ZTEwOWZm
ZiA6IFJlc2VydmVkCjVlMTBhMDAwLTVmNTMxZmZmIDogU3lzdGVtIFJBTQo1ZjUzMjAwMC01
ZjYwZmZmZiA6IFJlc2VydmVkCjVmNjEwMDAwLTYxMWJkZmZmIDogU3lzdGVtIFJBTQo2MTFi
ZTAwMC02NTFiZGZmZiA6IFJlc2VydmVkCjY1MWJlMDAwLTZjMmNlZmZmIDogU3lzdGVtIFJB
TQo2YzJjZjAwMC02ZTdjZWZmZiA6IFJlc2VydmVkCjZlN2NmMDAwLTZmNWZlZmZmIDogQUNQ
SSBOb24tdm9sYXRpbGUgU3RvcmFnZQo2ZjVmZjAwMC02ZjdmZWZmZiA6IEFDUEkgVGFibGVz
CjZmN2ZmMDAwLTZmN2ZmZmZmIDogU3lzdGVtIFJBTQo2ZjgwMDAwMC04ZmZmZmZmZiA6IFJl
c2VydmVkCiAgODAwMDAwMDAtOGZmZmZmZmYgOiBQQ0kgTU1DT05GSUcgMDAwMCBbYnVzIDAw
LWZmXQo5MDAwMDAwMC1hYWZmZmZmZiA6IFBDSSBCdXMgMDAwMDowMAogIDkwMDAwMDAwLTkw
MGZmZmZmIDogUENJIEJ1cyAwMDAwOjAxCiAgICA5MDAwMDAwMC05MDAwN2ZmZiA6IDAwMDA6
MDE6MDAuMAogIDkwMTAwMDAwLTkwMWZmZmZmIDogUENJIEJ1cyAwMDAwOjA0CiAgICA5MDEw
MDAwMC05MDEzZmZmZiA6IDAwMDA6MDQ6MDAuMAogICAgOTAxNDAwMDAtOTAxN2ZmZmYgOiAw
MDAwOjA0OjAwLjEKICA5MTAwMDAwMC05MWZmZmZmZiA6IFBDSSBCdXMgMDAwMDowMgogICAg
OTEwMDAwMDAtOTFmZmZmZmYgOiBQQ0kgQnVzIDAwMDA6MDMKICAgICAgOTEwMDAwMDAtOTFm
ZmZmZmYgOiAwMDAwOjAzOjAwLjAKICAgICAgICA5MTAwMDAwMC05MTJmZmZmZiA6IGVmaWZi
CiAgOTIwMDAwMDAtOTI4ZmZmZmYgOiBQQ0kgQnVzIDAwMDA6MDIKICAgIDkyMDAwMDAwLTky
OGZmZmZmIDogUENJIEJ1cyAwMDAwOjAzCiAgICAgIDkyMDAwMDAwLTkyN2ZmZmZmIDogMDAw
MDowMzowMC4wCiAgICAgIDkyODA4MDAwLTkyODBiZmZmIDogMDAwMDowMzowMC4wCiAgOTI5
MDAwMDAtOTI5ZmZmZmYgOiBQQ0kgQnVzIDAwMDA6MDEKICAgIDkyOTAwMDAwLTkyOTA3ZmZm
IDogMDAwMDowMTowMC4wCiAgOTJhMDAwMDAtOTJhZmZmZmYgOiBQQ0kgQnVzIDAwMDA6MDQK
ICAgIDkyYTAwMDAwLTkyYTBmZmZmIDogMDAwMDowNDowMC4xCiAgICAgIDkyYTAwMDAwLTky
YTBmZmZmIDogdGczCiAgICA5MmExMDAwMC05MmExZmZmZiA6IDAwMDA6MDQ6MDAuMQogICAg
ICA5MmExMDAwMC05MmExZmZmZiA6IHRnMwogICAgOTJhMjAwMDAtOTJhMmZmZmYgOiAwMDAw
OjA0OjAwLjEKICAgICAgOTJhMjAwMDAtOTJhMmZmZmYgOiB0ZzMKICAgIDkyYTMwMDAwLTky
YTNmZmZmIDogMDAwMDowNDowMC4wCiAgICAgIDkyYTMwMDAwLTkyYTNmZmZmIDogdGczCiAg
ICA5MmE0MDAwMC05MmE0ZmZmZiA6IDAwMDA6MDQ6MDAuMAogICAgICA5MmE0MDAwMC05MmE0
ZmZmZiA6IHRnMwogICAgOTJhNTAwMDAtOTJhNWZmZmYgOiAwMDAwOjA0OjAwLjAKICAgICAg
OTJhNTAwMDAtOTJhNWZmZmYgOiB0ZzMKICA5MmIwMDAwMC05MmI3ZmZmZiA6IDAwMDA6MDA6
MTcuMAogICAgOTJiMDAwMDAtOTJiN2ZmZmYgOiBhaGNpCiAgOTJiODAwMDAtOTJiZmZmZmYg
OiAwMDAwOjAwOjExLjUKICAgIDkyYjgwMDAwLTkyYmZmZmZmIDogYWhjaQogIDkyYzAwMDAw
LTkyYzBmZmZmIDogMDAwMDowMDoxNC4wCiAgOTJjMTAwMDAtOTJjMTNmZmYgOiAwMDAwOjAw
OjFmLjIKICA5MmMxNDAwMC05MmMxNWZmZiA6IDAwMDA6MDA6MTcuMAogICAgOTJjMTQwMDAt
OTJjMTVmZmYgOiBhaGNpCiAgOTJjMTYwMDAtOTJjMTdmZmYgOiAwMDAwOjAwOjExLjUKICAg
IDkyYzE2MDAwLTkyYzE3ZmZmIDogYWhjaQogIDkyYzE4MDAwLTkyYzE4MGZmIDogMDAwMDow
MDoxZi40CiAgOTJjMTkwMDAtOTJjMTlmZmYgOiAwMDAwOjAwOjE2LjQKICA5MmMxYTAwMC05
MmMxYWZmZiA6IDAwMDA6MDA6MTYuMQogIDkyYzFiMDAwLTkyYzFiZmZmIDogMDAwMDowMDox
Ni4wCiAgOTJjMWMwMDAtOTJjMWNmZmYgOiAwMDAwOjAwOjE0LjIKICA5MmMxZTAwMC05MmMx
ZTBmZiA6IDAwMDA6MDA6MTcuMAogICAgOTJjMWUwMDAtOTJjMWUwZmYgOiBhaGNpCiAgOTJj
MWYwMDAtOTJjMWYwZmYgOiAwMDAwOjAwOjExLjUKICAgIDkyYzFmMDAwLTkyYzFmMGZmIDog
YWhjaQogIDkyYzIwMDAwLTkyYzIwZmZmIDogMDAwMDowMDowNS40CiAgYWFmZmMwMDAtYWFm
ZmNmZmYgOiBkbWFyMwphYjAwMDAwMC1jNWZmZmZmZiA6IFBDSSBCdXMgMDAwMDoxNgogIGFi
MDAwMDAwLWFiMGZmZmZmIDogUENJIEJ1cyAwMDAwOjE3CiAgICBhYjAwMDAwMC1hYjAwN2Zm
ZiA6IDAwMDA6MTc6MDAuMAogIGFiMTAwMDAwLWFiMTAwZmZmIDogMDAwMDoxNjowNS40CiAg
YWIyMDAwMDAtYWIyZmZmZmYgOiBQQ0kgQnVzIDAwMDA6MTcKICAgIGFiMjAwMDAwLWFiMjA3
ZmZmIDogMDAwMDoxNzowMC4wCiAgYzVmZmMwMDAtYzVmZmNmZmYgOiBkbWFyMApjNjAwMDAw
MC1lMGZmZmZmZiA6IFBDSSBCdXMgMDAwMDo2NAogIGM2MDAwMDAwLWM2MDAwZmZmIDogMDAw
MDo2NDowNS40CiAgZTBmZmMwMDAtZTBmZmNmZmYgOiBkbWFyMQplMTAwMDAwMC1mYmZmZmZm
ZiA6IFBDSSBCdXMgMDAwMDpiMgogIGUxMDAwMDAwLWUxMWZmZmZmIDogUENJIEJ1cyAwMDAw
OmIzCiAgICBlMTAwMDAwMC1lMTBmZmZmZiA6IDAwMDA6YjM6MDAuMAogICAgZTExMDAwMDAt
ZTExMGZmZmYgOiAwMDAwOmIzOjAwLjAKICAgICAgZTExMDAwMDAtZTExMGZmZmYgOiBtZWdh
c2FzOiBMU0kKICBlMTIwMDAwMC1lMTIwMGZmZiA6IDAwMDA6YjI6MDUuNAogIGZiZmZjMDAw
LWZiZmZjZmZmIDogZG1hcjIKZmQwMDAwMDAtZmRhYmZmZmYgOiBwbnAgMDA6MDQKZmRhZDAw
MDAtZmRhZGZmZmYgOiBwbnAgMDA6MDQKZmRiMDAwMDAtZmRmZmZmZmYgOiBwbnAgMDA6MDQK
ICBmZGM2MDAwYy1mZGM2MDAwZiA6IGlUQ09fd2R0CmZlMDAwMDAwLWZlMDEwZmZmIDogUmVz
ZXJ2ZWQKICBmZTAwMDAwMC1mZTAwZmZmZiA6IHBucCAwMDowNAogIGZlMDEwMDAwLWZlMDEw
ZmZmIDogUENJIEJ1cyAwMDAwOjAwCiAgICBmZTAxMDAwMC1mZTAxMGZmZiA6IDAwMDA6MDA6
MWYuNQpmZTAxMTAwMC1mZTAxZmZmZiA6IHBucCAwMDowNApmZTAzNjAwMC1mZTAzYmZmZiA6
IHBucCAwMDowNApmZTAzZDAwMC1mZTNmZmZmZiA6IHBucCAwMDowNApmZTQxMDAwMC1mZTdm
ZmZmZiA6IHBucCAwMDowNApmZWMwMDAwMC1mZWNmZmZmZiA6IFBOUDAwMDM6MDAKICBmZWMw
MDAwMC1mZWMwMDNmZiA6IElPQVBJQyAwCiAgZmVjMDEwMDAtZmVjMDEzZmYgOiBJT0FQSUMg
MQogIGZlYzA4MDAwLWZlYzA4M2ZmIDogSU9BUElDIDIKICBmZWMxMDAwMC1mZWMxMDNmZiA6
IElPQVBJQyAzCiAgZmVjMTgwMDAtZmVjMTgzZmYgOiBJT0FQSUMgNApmZWQwMDAwMC1mZWQw
MDNmZiA6IEhQRVQgMAogIGZlZDAwMDAwLWZlZDAwM2ZmIDogUE5QMDEwMzowMApmZWQxMjAw
MC1mZWQxMjAwZiA6IHBucCAwMDowMQpmZWQxMjAxMC1mZWQxMjAxZiA6IHBucCAwMDowMQpm
ZWQxYjAwMC1mZWQxYmZmZiA6IHBucCAwMDowMQpmZWQxYzAwMC1mZWQzZmZmZiA6IHBucCAw
MDowMQpmZWQ0NTAwMC1mZWQ4YmZmZiA6IHBucCAwMDowMQpmZWUwMDAwMC1mZWVmZmZmZiA6
IHBucCAwMDowMQpmZjAwMDAwMC1mZmZmZmZmZiA6IHBucCAwMDowMQoxMDAwMDAwMDAtMmZm
ZmZmZmZmIDogUmVzZXJ2ZWQKMzAwMDAwMDAwLTg3ZmZmZmZmZiA6IFN5c3RlbSBSQU0KMzgw
MDAwMDAwMDAwLTM4MGZmZmZmZmZmZiA6IFBDSSBCdXMgMDAwMDowMAozODEwMDAwMDAwMDAt
MzgxZmZmZmZmZmZmIDogUENJIEJ1cyAwMDAwOjE2CjM4MjAwMDAwMDAwMC0zODJmZmZmZmZm
ZmYgOiBQQ0kgQnVzIDAwMDA6NjQKMzgzMDAwMDAwMDAwLTM4M2ZmZmZmZmZmZiA6IFBDSSBC
dXMgMDAwMDpiMgo=
--------------1030AE17DF6A19C06729394B--
