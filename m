Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBJNE7H3AKGQETMTZKQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x638.google.com (mail-pl1-x638.google.com [IPv6:2607:f8b0:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id D88871F1B86
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 16:58:46 +0200 (CEST)
Received: by mail-pl1-x638.google.com with SMTP id ba6sf12486340plb.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 07:58:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591628325; cv=pass;
        d=google.com; s=arc-20160816;
        b=xU71NsffefvOVqS4LkhL7gsLWLgL9blTqrFozVMGRyLkzZ5E81du3xfm4NVFvWrHkF
         GJXnP7nkpJU7P6+04ozLqeffzjAEr7UJYvVc9bdd7xoVvTxJxh/9ryjyFTkFISZJO4y8
         DClhV1vwqH9e5FieAaeyMDC2fLbiI7hIQwqAcQyOVa8wVmQMSkcAFrvtamrIbquAwOaw
         7TF8djNfqA2qfSP8ZFNZOE2j6LzkHovA5KQdLwu1NTpR5G44C18cPAsFHBo3xCHZAO9z
         R6VU2VsMXb/jgzudXLRF2rA0J6NDHxKQl5pbMtY2zK0vhacuCC3qTIZ3N2t1YK2PmkNd
         R27g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=B9+7hc8UGhxSKx0q9gXZt60nyUHUfpcOeywkwXwBXtk=;
        b=WJrv3cpbSMoBghvhT4BzNElcDVlN+oWQGUdnwcYIUlasOdLnS+FFyCidVjxtlYqNyc
         eI0Z4EnXNv9vrumb6hNbWuJyQTO0J9vz3uV45RzRN7ckXcGFkM7k8gKI4+9RZYIdO8jn
         5r/R6B/xKzkGee4yYagMi/i8DU7lzEmGOmYBiWyg+Xp/iN/EZAsGZiSdLppDxC++tvAI
         TrREmwQo6WsDlFKUuYUggTyW06b479T7vIKGQcysFOMF0QBC+s2srUSzumNPG5NgyyRO
         8uI09VDzrgtnKNRg2LNtW7eC7vRnz4GLHgmIUmJGOfzq5Nc8CmS0Lo8lyqMuhksrwsGD
         uM3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=anrmGEN2;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=B9+7hc8UGhxSKx0q9gXZt60nyUHUfpcOeywkwXwBXtk=;
        b=dDzwhw3IEhVdkjFrLf7iemOkz3HqoEy0LEARfvhbSjb379P2g/jpVoZ+aRYBzD6Zwm
         /wH5p6VhQUeQX6CzGPfqpCqrAQJ4WGtKmWYuNNknA0SY0YQRA8MkXWMQs8jDXjCbTz7q
         +NOL/q/zvX0aonNkS15/0P+LI1sRp8xquMuanupOmmutx1ctEHPfxwFXVzhPpaFO33dO
         nN4hQsN7YRQs8+IdQowPI8jBFARCk/1zrkWKanmyZNiu7C8UsvZlXB7op9mDKUabxvQ5
         v4gPpU5rnrEHvITDhR5nYQPX1zzJ9a9kkjHzDkKufHNp3d84B7W/rLHGZHXFYMrzEhTK
         qZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B9+7hc8UGhxSKx0q9gXZt60nyUHUfpcOeywkwXwBXtk=;
        b=SZf9YHZzvzmTNUBn/s5uY6dD2Y+rnRC3OphyDRuJHn+ssTa8CoQxu2mevVEr3y8p2l
         GZVZEk2aqFMvS6hBC2MjYll9TQAayY60zszIckbDyFWH8KyHlJoZeLbm7FD0f7WL3ZPb
         ytbI9zNifiXKZdLA9uuLQeBb6zSeZhzr+I51u7XK8/mIFbaZmQERqZfEsUi67RvfFsLG
         x8I9uXDmYH/D4YuUa+1OUid7U26tmqjPZfHosmdULXkFA2SEe5kS7V5rYpmNuH1NFrus
         X5/q4HDUBjaa2BE1O8A9dqa9JzyUAoprYlcep2wQDrJduXH7JrojMijSjEDdvfrfZeZZ
         VG9w==
X-Gm-Message-State: AOAM533hOgewBOBtdT6fDxc/NpBPDdz7FaccbdLxEfMYpl+CCaadnVEF
	75lLo7Eo9xzbhxx7I7bTifw=
X-Google-Smtp-Source: ABdhPJx4Zsp0ySUvSH2FaCbhFcwXhHvVANctQBM/GGf0pVUxeH2WNbRpOEquZaaJ4VQDcQ7z5LiNLg==
X-Received: by 2002:a17:90a:1946:: with SMTP id 6mr17561472pjh.208.1591628325533;
        Mon, 08 Jun 2020 07:58:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:b219:: with SMTP id x25ls4587674pge.8.gmail; Mon, 08 Jun
 2020 07:58:44 -0700 (PDT)
X-Received: by 2002:a63:534d:: with SMTP id t13mr21097794pgl.32.1591628324845;
        Mon, 08 Jun 2020 07:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591628324; cv=none;
        d=google.com; s=arc-20160816;
        b=k8Xo+34gAwfxBmHzYO0yOXvECIKY1BkMxurHIhVpMMej9onaUDliYzvk4xGlzH7y1e
         SaTLogO6jrIgAXwS02GByN3DoIZvujEGzh2U/QOmfL/5DepiRCu4vzHuhQlV/7ykaHF3
         cf+JjWAH+aivGmPR4AJsZJTowqzqs/06xPtzYz5KPBmWR8k+or+PP1L9QeQqBnm8R0OM
         FcSezrlLNds05XYZe8CbbdtsnX1Mk05JAGVXOtJLcFmdEAUBuBOG06ZZbOuPOb9L+GIJ
         gJ9Sxcwmq5XJ/EOajSDg32HlNfCsxxSHxXB66fP6RWBebuibtHMwTHYNHvJhSu8xEXHn
         kmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=FKR27la0/u4DnVnNGY8GZit8Kchk+27gXs+1XSq7AnE=;
        b=A0IPeWeQesd65CDxaBq/SJ5Kaln8PE0y5wUnTLJPbANwF1v0Q5qmvzevgVkWGIGrwS
         FjlX5sevxqhIPgo0Qeo0lAMyYcixDsZ9vgEGmIYe6ngt0LV7SYpWnQfFMoowJFH7aYjt
         0vlFagP1risUKCNQZZzghNomF5KD3LRgbXFZXtnDuxA8HnTf7MAxWmMkbMOUdvaZiRHB
         2O/MCh7rqOm+g2JKNC0g8D0Ijt2dPvlo8KFKZ5sqj4lpt+Xo9Yrw91pG0xZB1LzPQOBL
         n8X3m96yOt2D4GtWO4rwkZtevp8LOcHL/CAceFQIfkgqRxJB1Iv9qlm+FI8ObJ3kaNjM
         X4BQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=anrmGEN2;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id m204si499020pfd.1.2020.06.08.07.58.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 07:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058EwicF026607;
	Mon, 8 Jun 2020 09:58:44 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058Ewinb123448
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 09:58:44 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 09:58:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 09:58:43 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058EweuJ078941;
	Mon, 8 Jun 2020 09:58:42 -0500
Subject: Re: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-5-nikhil.nd@ti.com>
 <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
 <7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com>
 <54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b@ti.com>
 <1a4a35d9-8530-d4cd-da64-578d41f95eba@siemens.com>
 <98cd82d2-61e5-a7d7-e83a-b734321f93f2@ti.com>
 <efc83a49-18e2-14b9-e581-7eef91766d80@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <379ae683-4540-c868-cb99-b5017680d157@ti.com>
Date: Mon, 8 Jun 2020 20:28:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <efc83a49-18e2-14b9-e581-7eef91766d80@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------DBCFA90E296A42CB6D2FF014"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=anrmGEN2;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------DBCFA90E296A42CB6D2FF014
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 08/06/20 8:21 pm, Jan Kiszka wrote:
> On 08.06.20 16:35, Nikhil Devshatwar wrote:
>>
>> On 08/06/20 7:54 pm, Jan Kiszka wrote:
>>> On 08.06.20 13:43, Nikhil Devshatwar wrote:
>>>> On 08/06/20 4:51 pm, Jan Kiszka wrote:
>>>>> On 08.06.20 13:16, Jan Kiszka wrote:
>>>>>> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>>
>>>>>>> Add a new IVSHMEM PCIe virtual device for a 2 peer
>>>>>>> IVSHMEM demo communication.
>>>>>>>   (0 = root cell, 1 = baremetal / linux-demo)
>>>>>>> Also add the corresponding memory regions for state and output
>>>>>>> aligned at 64k boundary.
>>>>>>>
>>>>>>> Update the bdf numbers for consistency across all platforms.
>>>>>>> Assign domain = 4 since the platform already has 4 physical
>>>>>>> controllers.
>>>>>>>
>>>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>> ---
>>>>>>>   configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
>>>>>>>   configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
>>>>>>>   2 files changed, 89 insertions(+), 16 deletions(-)
>>>>>>>
>>>>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>> index cda1614a..05517751 100644
>>>>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>> @@ -24,9 +24,9 @@
>>>>>>>   struct {
>>>>>>>   	struct jailhouse_cell_desc cell;
>>>>>>>   	__u64 cpus[1];
>>>>>>> -	struct jailhouse_memory mem_regions[18];
>>>>>>> +	struct jailhouse_memory mem_regions[22];
>>>>>>>   	struct jailhouse_irqchip irqchips[4];
>>>>>>> -	struct jailhouse_pci_device pci_devices[1];
>>>>>>> +	struct jailhouse_pci_device pci_devices[2];
>>>>>>>   	__u32 stream_ids[2];
>>>>>>>   } __attribute__((packed)) config = {
>>>>>>>   	.cell = {
>>>>>>> @@ -56,8 +56,35 @@ struct {
>>>>>>>   	},
>>>>>>>   
>>>>>>>   	.mem_regions = {
>>>>>>> -		/* IVSHMEM shared memory region for 00:01.0 */
>>>>>>> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
>>>>>>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>>>>>>> +		{
>>>>>>> +			.phys_start = 0x89fe00000,
>>>>>>> +			.virt_start = 0x89fe00000,
>>>>>>> +			.size = 0x10000,
>>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>>>> +		},
>>>>>>> +		{
>>>>>>> +			.phys_start = 0x89fe10000,
>>>>>>> +			.virt_start = 0x89fe10000,
>>>>>>> +			.size = 0x10000,
>>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>>>>> +		},
>>>>>>> +		{
>>>>>>> +			.phys_start = 0x89fe20000,
>>>>>>> +			.virt_start = 0x89fe20000,
>>>>>>> +			.size = 0x10000,
>>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>>>> +		},
>>>>>>> +		{
>>>>>>> +			.phys_start = 0x89fe30000,
>>>>>>> +			.virt_start = 0x89fe30000,
>>>>>>> +			.size = 0x10000,
>>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>>>>> +		},
>>>>>> You are missing the state table. Was this tested?
>>>>> Ah, it's there, just 64K large due to the different page size.
>>>>>
>>>>>> Please derive from existing examples, using the same patterns and sizes.
>>>>>> Reference is qemu-arm64.
>>>>> Still, please follow the default pattern (with adjusted page size),
>>>>> which means triangle by default, 3 peers. That may eventually become
>>>>> part of an automated test, and then all boards should better have the
>>>>> same pattern ready.
>>>> j721e has only two A72 cores. So max two cells can be created.
>>>> linux-demo and inmate-demo are mutually exclusive.
>>> Oh, sorry, missed that completely. I was expecting a quad-core at least.
>>>
>>>> That's why I have given the same id to both because I can never launch
>>>> it in parallel.
>>>>
>>>> Do you recommend to still give a separate id for these cells?
>>> Nope, that's fine then.
>>>
>>> But now I wonder why we need to patch any of the demo code. If both do
>>> respect the max-peers value and send to (my-id + 1) % max-peers, they
>>> should "just work", no?
>> Same reason as before.
>> To be able to choose whom exactly you want to send interrupt.
>> Triangle is only for demo, but this way, you can send interrupts to any
>> device.
> If there can only be two cells at the same time, root cell always in,
> it's about root cell sending ID 1, and ID-1 cell sending root cell. Now
> both demos encode hard that max-peers is 3. That can be fixed (i.e. read
> the related ivshmem register), and then things will just work (TM).
Agreed.
> No command line switched needed. They would only be needed if you had a
> setup with less than max-peers, but that is not the issue here.
Yes, that's once case. Also the case of two Linux communicating with 
*each other*
If above is not planned to be supported, I can drop the changes for 
command line parameters.
Let me know if I should keep it or drop it.

Nikhil D
>
> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/379ae683-4540-c868-cb99-b5017680d157%40ti.com.

--------------DBCFA90E296A42CB6D2FF014
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 08/06/20 8:21 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:efc83a49-18e2-14b9-e581-7eef91766d80@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 16:35, Nikhil Devs=
hatwar wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">

On 08/06/20 7:54 pm, Jan Kiszka wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 13:43, Nikhil =
Devshatwar wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">On 08/06/20 4:51 pm, Jan=
 Kiszka wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 13:16, Jan=
 Kiszka wrote:
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 12:42, <=
a class=3D"moz-txt-link-abbreviated" href=3D"mailto:nikhil.nd@ti.com">nikhi=
l.nd@ti.com</a> wrote:
</pre>
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devsh=
atwar <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&=
lt;nikhil.nd@ti.com&gt;</a>

Add a new IVSHMEM PCIe virtual device for a 2 peer
IVSHMEM demo communication.
 (0 =3D root cell, 1 =3D baremetal / linux-demo)
Also add the corresponding memory regions for state and output
aligned at 64k boundary.

Update the bdf numbers for consistency across all platforms.
Assign domain =3D 4 since the platform already has 4 physical
controllers.

Signed-off-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
 configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
 2 files changed, 89 insertions(+), 16 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j72=
1e-evm-linux-demo.c
index cda1614a..05517751 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,9 +24,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[4];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 	__u32 stream_ids[2];
 } __attribute__((packed)) config =3D {
 	.cell =3D {
@@ -56,8 +56,35 @@ struct {
 	},
=20
 	.mem_regions =3D {
-		/* IVSHMEM shared memory region for 00:01.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start =3D 0x89fe00000,
+			.virt_start =3D 0x89fe00000,
+			.size =3D 0x10000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start =3D 0x89fe10000,
+			.virt_start =3D 0x89fe10000,
+			.size =3D 0x10000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start =3D 0x89fe20000,
+			.virt_start =3D 0x89fe20000,
+			.size =3D 0x10000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start =3D 0x89fe30000,
+			.virt_start =3D 0x89fe30000,
+			.size =3D 0x10000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE ,
+		},
</pre>
                </blockquote>
                <pre class=3D"moz-quote-pre" wrap=3D"">You are missing the =
state table. Was this tested?
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">Ah, it's there, just 6=
4K large due to the different page size.

</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">Please derive from e=
xisting examples, using the same patterns and sizes.
Reference is qemu-arm64.
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">Still, please follow t=
he default pattern (with adjusted page size),
which means triangle by default, 3 peers. That may eventually become
part of an automated test, and then all boards should better have the
same pattern ready.
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">j721e has only two A72 c=
ores. So max two cells can be created.
linux-demo and inmate-demo are mutually exclusive.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Oh, sorry, missed that com=
pletely. I was expecting a quad-core at least.

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">That's why I have given =
the same id to both because I can never launch
it in parallel.

Do you recommend to still give a separate id for these cells?
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Nope, that's fine then.

But now I wonder why we need to patch any of the demo code. If both do
respect the max-peers value and send to (my-id + 1) % max-peers, they
should "just work", no?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Same reason as before.
To be able to choose whom exactly you want to send interrupt.
Triangle is only for demo, but this way, you can send interrupts to any
device.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
If there can only be two cells at the same time, root cell always in,
it's about root cell sending ID 1, and ID-1 cell sending root cell. Now
both demos encode hard that max-peers is 3. That can be fixed (i.e. read
the related ivshmem register), and then things will just work (TM).</pre>
    </blockquote>
    Agreed.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:efc83a49-18e2-14b9-e581-7eef91766d80@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">No command line switched neede=
d. They would only be needed if you had a
setup with less than max-peers, but that is not the issue here.</pre>
    </blockquote>
    Yes, that's once case. Also the case of two Linux communicating with
    *each other*<br>
    If above is not planned to be supported, I can drop the changes for
    command line parameters.<br>
    Let me know if I should keep it or drop it.<br>
    <br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:efc83a49-18e2-14b9-e581-7eef91766d80@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Jan

</pre>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/379ae683-4540-c868-cb99-b5017680d157%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/379ae683-4540-c868-cb99-b5017680d157%40ti.com</a>.<br />

--------------DBCFA90E296A42CB6D2FF014--
