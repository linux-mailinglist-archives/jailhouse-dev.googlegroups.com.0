Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBW6I7D3AKGQEBHZRMTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13b.google.com (mail-il1-x13b.google.com [IPv6:2607:f8b0:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3071F180C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:43:24 +0200 (CEST)
Received: by mail-il1-x13b.google.com with SMTP id c8sf11738944ilm.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:43:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591616603; cv=pass;
        d=google.com; s=arc-20160816;
        b=gHWIsxNrzpa+N3yfYlOfuH8RhDadtX1dRGnc72YFu1VTb5Vz3smQQu7Eh7wHfUWp2E
         NKBNbDkGPReg/2EV4aHOsEWCmCAWkGPrUAL8fEsTLh/CTvXozKvR0ju74Q9H/qfpl7WQ
         GReo6yxGS2MMEqGAFir9hDvx4Wk0MuNUBX7/CdB6yhsCZQQRErfQRXLyjl9tzLmowJZY
         JgRdadtxjrnJ9qthyPsJcEunCV0pngK2XERzeOnd/WSAD4plY2m+7vzLflEDBIqoVgyr
         COvfcx0YyYKf3mdQkoHbdMsfp8sJyUtaSKiO1d7j7Y11hbRiHqGboQM3l/ekyW3f6IFp
         hYXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=HIqoJFpW3dVpX0Nk9CTM441VRQ+gdfZDArHX5HXtsWo=;
        b=uxmUgqm4Vkb3/cm9FhXRGCqjbK6aQvzdXIsmnMdUBGnF3St5PhDgQ/TNZOgC46y7RP
         3qZTg8nt94N0vkNISz4rG/kBZce48lBrpL86kjsMD4xBm0sX+qy89SkGiGmoKZ0m5r4E
         Dl/JaHus7U9RAe7TKcPUtt5jG6D5Ih2KvOUTXJrfCjb663cPxzkzCdXifrKWSKKyg4Y2
         791cYPxuM44PlU8tuh0r3tK7K4braK4IKgsLQWmMkmvM7zbzHVMhK3n98+1WYz6N3134
         BnCPPLPbyrA/0OOQE+q319sUJWX5iMjrnejxvv7hNe4K5FsCH7Seqim4mfyn5RP52mqb
         nQ1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Mz+aZ3wm;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=HIqoJFpW3dVpX0Nk9CTM441VRQ+gdfZDArHX5HXtsWo=;
        b=WI3KrBDab216v0DaCQrfORp7WpPb6vj9PLvtmapV/sfDVQIDeC5hG1NaJGuAv1Hm9W
         dyQBv1Mx8Swgno1qVaE4DKa01ESdE0+MQ3j1skk7nO3QdrgzSQm1h204EfttM9QKTtv0
         /Amq7kMdy9eU3z9QaHo540nKy8ekiyZEaV+eBXWMRqifmri+59x8o8Ko5TAZi3kJKAGt
         L+1aN6HRmxKmvVk30Yu1hAtjbaMZrDa9IwrQQYVClwL+JxoEgsuC4MFR0xP1iI81W3ha
         DPmK0VcuB5G1SWaj1FBp7atQcR7O9xYHOcTzXjR2D61qVM6bpt+MSh1AZCmWexpwi8zw
         COOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HIqoJFpW3dVpX0Nk9CTM441VRQ+gdfZDArHX5HXtsWo=;
        b=mUHnbFnDkg8rbMKty6dU7LqeusSVCvKu/gIjbXv6llprYUwzAyjGAThphmjVmGUElp
         sgvMqh3tTlF4gKTJue2kJFRvk6aN5xK948tfbYeWJS/D/7oc46uxP5TCDwgIlAbqhJmY
         EOs3axW75VMQc9U+CD9FMJ8HkXETD6JA++19xXQovjLRB39EW3ts4uxhYKpYnGkrcDfL
         4/tYFLFOkWaaW5MHaeBpWAUWuPWEpdTmP+r9ll/XUXM/zC6ijVE5fTZTJpn4dUK+udZj
         BF1VuK+cykE+s8NxvTyN38BwMO2bsFIdRlZKjwsTZP0jgXd2soO4sacTb7DYvsGjg8Ab
         ayjQ==
X-Gm-Message-State: AOAM5319Uakv2PvsRt1uckQGvBZ+DGi76vYY8RRuN7XNFnmQW5PPRpNa
	c/etitTquvICycruLKc1po4=
X-Google-Smtp-Source: ABdhPJyIZadLbC1AiTZUzaaoOAP3ak9oYx3kDveBoT89E+06KTPjNVKeQNMae31+vadkZEVUfHwDNA==
X-Received: by 2002:a5d:8e19:: with SMTP id e25mr21865811iod.36.1591616603295;
        Mon, 08 Jun 2020 04:43:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:b9d6:: with SMTP id j205ls2842073iof.6.gmail; Mon, 08
 Jun 2020 04:43:22 -0700 (PDT)
X-Received: by 2002:a5e:a80f:: with SMTP id c15mr21275551ioa.71.1591616602706;
        Mon, 08 Jun 2020 04:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591616602; cv=none;
        d=google.com; s=arc-20160816;
        b=pD9f8Fn2UpQ+LeyaCFJ8RUpyzQ0SAZa4AR71y8ohF/kxiAlk5aQykL4h8RcrnI4zuE
         0SAlqZodttePg+c/lu6aM2p24LW1S+UPuFZ31BTrk1lulIbSQZZzIkyvhLCCMG3M82yh
         KnmImQZfzVu/rEAIHTsH4dbjTBs3f+fj+4qUCr9FQXLs1rztaPs90G/hR08LZnfqX6gJ
         QjRoettPdWDF1R1rzu0SC9FiFA/BFqCg7CalqCSpOQPhKSK0b/OnRGbhaRl2ccrXqQzb
         5rZMUSXIIXQAvd74B3xvxmAFYln80mOioKZQikTzgQpf6CG5RNj9T3SKAOvClsll6QgU
         fqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=iPujtoCQkfMERAx1Hq9An4CPBNnlK6h43EuUkxqMXGI=;
        b=iJeorGJpoQa1LH6nEfJ/LC4Sb5G8/Fr3Q5864X6RHmefhzb9s7DNhR7crktKXOQz3W
         wvZIlIUT6XE5hZho3GToJdpqhrkO0+VgUKFfgdPAu4oN/b9/M59r+z1kz2x1Z6ctaZIv
         G5kFgq1bw1uyg1B9kiUJz3ROPxgd1BQ8Yhi41v9WeLmRb8wAoEZNKH4YfHZbrrjZidhX
         vU2u5gr6HYcr17gFqZ7LGYtr3meH2mRdOyizwFX1rjFeig10R3jDNsO1LcIzT4RT6NxX
         3KAdYX/8FlY3zbRo+CysW2Fn7DEnWKqopgd1a/FrGjUaFCUcK8B+yxKayQGBg11mkRBU
         dd1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Mz+aZ3wm;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id z17si192389iod.1.2020.06.08.04.43.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058BhMp7100838;
	Mon, 8 Jun 2020 06:43:22 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058BhMse075321
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 06:43:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 06:43:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 06:43:21 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058BhJPh114797;
	Mon, 8 Jun 2020 06:43:20 -0500
Subject: Re: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-5-nikhil.nd@ti.com>
 <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
 <7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b@ti.com>
Date: Mon, 8 Jun 2020 17:13:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------BF1BB3959D59631979696D7D"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Mz+aZ3wm;       spf=pass
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

--------------BF1BB3959D59631979696D7D
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 08/06/20 4:51 pm, Jan Kiszka wrote:
> On 08.06.20 13:16, Jan Kiszka wrote:
>> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> Add a new IVSHMEM PCIe virtual device for a 2 peer
>>> IVSHMEM demo communication.
>>>   (0 = root cell, 1 = baremetal / linux-demo)
>>> Also add the corresponding memory regions for state and output
>>> aligned at 64k boundary.
>>>
>>> Update the bdf numbers for consistency across all platforms.
>>> Assign domain = 4 since the platform already has 4 physical
>>> controllers.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>>   configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
>>>   configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
>>>   2 files changed, 89 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>> index cda1614a..05517751 100644
>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>> @@ -24,9 +24,9 @@
>>>   struct {
>>>   	struct jailhouse_cell_desc cell;
>>>   	__u64 cpus[1];
>>> -	struct jailhouse_memory mem_regions[18];
>>> +	struct jailhouse_memory mem_regions[22];
>>>   	struct jailhouse_irqchip irqchips[4];
>>> -	struct jailhouse_pci_device pci_devices[1];
>>> +	struct jailhouse_pci_device pci_devices[2];
>>>   	__u32 stream_ids[2];
>>>   } __attribute__((packed)) config = {
>>>   	.cell = {
>>> @@ -56,8 +56,35 @@ struct {
>>>   	},
>>>   
>>>   	.mem_regions = {
>>> -		/* IVSHMEM shared memory region for 00:01.0 */
>>> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
>>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>>> +		{
>>> +			.phys_start = 0x89fe00000,
>>> +			.virt_start = 0x89fe00000,
>>> +			.size = 0x10000,
>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>> +		},
>>> +		{
>>> +			.phys_start = 0x89fe10000,
>>> +			.virt_start = 0x89fe10000,
>>> +			.size = 0x10000,
>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>> +				 JAILHOUSE_MEM_WRITE ,
>>> +		},
>>> +		{
>>> +			.phys_start = 0x89fe20000,
>>> +			.virt_start = 0x89fe20000,
>>> +			.size = 0x10000,
>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>> +		},
>>> +		{
>>> +			.phys_start = 0x89fe30000,
>>> +			.virt_start = 0x89fe30000,
>>> +			.size = 0x10000,
>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>> +				 JAILHOUSE_MEM_WRITE ,
>>> +		},
>> You are missing the state table. Was this tested?
> Ah, it's there, just 64K large due to the different page size.
>
>> Please derive from existing examples, using the same patterns and sizes.
>> Reference is qemu-arm64.
> Still, please follow the default pattern (with adjusted page size),
> which means triangle by default, 3 peers. That may eventually become
> part of an automated test, and then all boards should better have the
> same pattern ready.
j721e has only two A72 cores. So max two cells can be created.
linux-demo and inmate-demo are mutually exclusive.
That's why I have given the same id to both because I can never launch 
it in parallel.

Do you recommend to still give a separate id for these cells?

Nikhil D
>
> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b%40ti.com.

--------------BF1BB3959D59631979696D7D
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
    <div class=3D"moz-cite-prefix">On 08/06/20 4:51 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 13:16, Jan Kiszka =
wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 12:42, <a class=
=3D"moz-txt-link-abbreviated" href=3D"mailto:nikhil.nd@ti.com">nikhil.nd@ti=
.com</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhi=
l.nd@ti.com&gt;</a>

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
        <pre class=3D"moz-quote-pre" wrap=3D"">
You are missing the state table. Was this tested?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Ah, it's there, just 64K large due to the different page size.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Please derive from existing examples, using the same patterns and sizes.
Reference is qemu-arm64.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Still, please follow the default pattern (with adjusted page size),
which means triangle by default, 3 peers. That may eventually become
part of an automated test, and then all boards should better have the
same pattern ready.</pre>
    </blockquote>
    j721e has only two A72 cores. So max two cells can be created.<br>
    linux-demo and inmate-demo are mutually exclusive.<br>
    That's why I have given the same id to both because I can never
    launch it in parallel.<br>
    <br>
    Do you recommend to still give a separate id for these cells?<br>
    <br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Jan
</pre>
    </blockquote>
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
om/d/msgid/jailhouse-dev/54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b%40ti.com</a>.<br />

--------------BF1BB3959D59631979696D7D--
