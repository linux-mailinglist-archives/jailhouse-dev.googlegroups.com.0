Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBHMZ7H3AKGQE4Z5VIEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x437.google.com (mail-pf1-x437.google.com [IPv6:2607:f8b0:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id D28DE1F1B18
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 16:35:11 +0200 (CEST)
Received: by mail-pf1-x437.google.com with SMTP id y16sf13659653pfe.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 07:35:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591626910; cv=pass;
        d=google.com; s=arc-20160816;
        b=AmkV4FU/MfIvoYrWFRVk2VHAor6Bc/n8acx6TBtsKUEiPPcDWSMVRboquw1+DMvPJV
         5d3JWxlkppCzxGhz137FPv4Z6+inwqXdbN93PHP6jJtbpvBDImESfDj03/Uki12Dc8k6
         dGVuMrvRBWZew5HTD3qoWWVeNrX9IUZMdub3/YEjel/kKX70FGQTQguw3U91MhFAELJl
         24dQBPjnCNP32ZdUt2oEbpMG33ac/LnixM6YmGXqEhd8PkiM2n8f0ui+ly2Ks5Al/j5g
         nFG+SDXkk9uupQkBBHRJu9OgOqc63CVbRawwZnQJ2voUmMpGz5jHUIZUlFlcCP3a+PBA
         b0Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=8cDIVL1AUIbgFH9zLdO5adeUZrYfq5IngIShpAtA7IY=;
        b=n4GzfpT83oi+TTv6m2fS+Lvfu9YR/z710qSzzvjBWq8shg1pIfVV5KbAeBDbvyLTNs
         svirNURefTw84Vf7lvfk2OGvIBP/VYeImJE6ztH+epuAkHCQNiWSjpAjGaHmUVQfMHRK
         YXT05ihpHbKovqJ7LGiGew+t972MgpPAg9FklKUYAukePvE2+80vFdHjV/90YaU4NEoe
         5Ot0JHUx5SI7SIK+Y9uVs1M65GITpc/F2lOUmENUcfMPrv/dMmXw9NEw2ILv22Z8g4x4
         RWhdpMLX/hi1MmTybUl6SEfRoLHrQR4eNq72iK4DnOm0QQelRJmjLw+Q+aifS8Dn8L5a
         Zg6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UTNo3kgY;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=8cDIVL1AUIbgFH9zLdO5adeUZrYfq5IngIShpAtA7IY=;
        b=TtRN1RaMXAoa9vDDK5sC97L3LD6qAYKB/z9OncmK1NnuKztg0jWlTRTtpjXkJuDgwa
         sWCh5uGNBvhSdFNHxrCG3SUQDA4gxcuQZVqGj3DvBNLmfLhFmdkyqOerRzXNtkqb7sGy
         WEu30Yeo33DEAL2s7naWx2C28ZA2iJqbKHDiYuSQgX1RCFctE8os5IqWQmG8EHBU+B9+
         xX/mFapR0MQjUp11Wb037OMqrP0JxUpcM0uHDEKf65QMn5WW2fy2HlpFlGSVuNFqsKFF
         iJBkJzsLTCzkr1khLe0nBmmGICohrbz+MGRp1+wcIM25s7EVwZQA6loGw1JMhJ0jChFg
         0A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8cDIVL1AUIbgFH9zLdO5adeUZrYfq5IngIShpAtA7IY=;
        b=TG/2iG7k+C2Vyxmh5380GXQaVEyEaQFVpe5Vb3jHaECt9hgQDMUMl94Dsf3CleXnLG
         TppzJnWzRwcuibQNBGt29T3LntLl0LY0fK829t15Dg71ohREPREUZj80mnir9rAJ7rBD
         3uy5oLCIEAeai9XTX3EiGPsw49GBBbiJta8U7P4SMq5uv94eLteKcQ3ON+ATvivbEzth
         dv4pv1ypVdITGBOOMSuN+WqThFuxRisVZl73UanCgRFMEEIv941w8+Ba/hnNJvT7e3EG
         jSY25KWs7GKnHugBsdEJSS6MtkgYkNbAVesQmHHobo4mSVDGrEpTJdYuNsTAopJsppHD
         J8AQ==
X-Gm-Message-State: AOAM532Zz+X+twlL58PZl6Y6JsGIZcoU9pm2cGCg5pwii0XbJPPwBpIW
	JLxqSugCp4MX3mJjnGKyO5k=
X-Google-Smtp-Source: ABdhPJw83Gi7cIpt5z+t7MkHxjm/Gq405llFGlwBZHlAzA/yXX9w7ce1g21AZ2rfh6CNz48NuliZUA==
X-Received: by 2002:a17:90a:dc83:: with SMTP id j3mr16878163pjv.59.1591626910272;
        Mon, 08 Jun 2020 07:35:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:6845:: with SMTP id f5ls6146387pln.8.gmail; Mon, 08
 Jun 2020 07:35:09 -0700 (PDT)
X-Received: by 2002:a17:90b:14d5:: with SMTP id jz21mr18697431pjb.70.1591626909627;
        Mon, 08 Jun 2020 07:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591626909; cv=none;
        d=google.com; s=arc-20160816;
        b=Xg0NM/ahgNQcBp7H6NGqFH4+GMrBrwf200ao7IMpNBHxiX4yAcJb6XYTA9PtxOjYcx
         LnJoI8gTgJRvM6I0XpLu8Npkjpbal27b5A1Hwq81/0iu80mgKLfiz7IIwkGwTdBHv4Bg
         cAbeZhk2lNRYdGj7fn09vvnEsjQqfKp4sIJjGhYqYWNyOe+2vtEJ829hU1kjk2mIiYa5
         /ESuZEIz7nASBXY9dzpZpSgcHVoDd7NQYfAFQCz/SXMZ4RTyNJ3cymkzZGsMnUXd3vcf
         UUvHCUrS/ljAQvhV9z2VqNLJA7ZxrKsvUZtNivSyR6Mc/tuPa8L6oNWhbC1TJ7421YwT
         jQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=QgI6PrBjfstnBl0wrEMvV/WxKNls+vbZr84BWZIdqjs=;
        b=ppkbI4LcmfkzP2bQN8aJOw8BPXja+RL8Tlq5x0mPY8kU4DhCTmFhVulzTF6yHTxR3w
         o9MD0hQ4YgSh9nKLwjoHpU+ylc6ilkLcxK89yNzYaSSIjQhIHsP81jQsTE8hzmLEzHfx
         vO6Fjtk/EWEQ0lmaGAtTOXjPbLyrW8jH5dQFtbZ5J6zqV73Oh4oopwWzC++p+yuFUESn
         JjuzvAC71FLxSUyApDb+fAO2NKKV/qehVwhJfA6cyuYtxM6ZeO6rYgUH6Z/sTBW4fxj5
         SShToMeqQpq8+q0wQuY/MlJ17UHrv74j7unTlCF5WxvgbdrDwVN9N/jcw1wG8uL+WUx0
         wl+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UTNo3kgY;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id q19si341750plr.1.2020.06.08.07.35.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 07:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058EZ8ab052707;
	Mon, 8 Jun 2020 09:35:08 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058EZ8Ud090763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 09:35:08 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 09:35:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 09:35:08 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058EZ5Nf028801;
	Mon, 8 Jun 2020 09:35:07 -0500
Subject: Re: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-5-nikhil.nd@ti.com>
 <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
 <7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com>
 <54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b@ti.com>
 <1a4a35d9-8530-d4cd-da64-578d41f95eba@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <98cd82d2-61e5-a7d7-e83a-b734321f93f2@ti.com>
Date: Mon, 8 Jun 2020 20:05:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1a4a35d9-8530-d4cd-da64-578d41f95eba@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------C01CBD4AFCA7D3AACBDBAF5C"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=UTNo3kgY;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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

--------------C01CBD4AFCA7D3AACBDBAF5C
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 08/06/20 7:54 pm, Jan Kiszka wrote:
> On 08.06.20 13:43, Nikhil Devshatwar wrote:
>>
>> On 08/06/20 4:51 pm, Jan Kiszka wrote:
>>> On 08.06.20 13:16, Jan Kiszka wrote:
>>>> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>
>>>>> Add a new IVSHMEM PCIe virtual device for a 2 peer
>>>>> IVSHMEM demo communication.
>>>>>   (0 = root cell, 1 = baremetal / linux-demo)
>>>>> Also add the corresponding memory regions for state and output
>>>>> aligned at 64k boundary.
>>>>>
>>>>> Update the bdf numbers for consistency across all platforms.
>>>>> Assign domain = 4 since the platform already has 4 physical
>>>>> controllers.
>>>>>
>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>> ---
>>>>>   configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
>>>>>   configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
>>>>>   2 files changed, 89 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>> index cda1614a..05517751 100644
>>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>> @@ -24,9 +24,9 @@
>>>>>   struct {
>>>>>   	struct jailhouse_cell_desc cell;
>>>>>   	__u64 cpus[1];
>>>>> -	struct jailhouse_memory mem_regions[18];
>>>>> +	struct jailhouse_memory mem_regions[22];
>>>>>   	struct jailhouse_irqchip irqchips[4];
>>>>> -	struct jailhouse_pci_device pci_devices[1];
>>>>> +	struct jailhouse_pci_device pci_devices[2];
>>>>>   	__u32 stream_ids[2];
>>>>>   } __attribute__((packed)) config = {
>>>>>   	.cell = {
>>>>> @@ -56,8 +56,35 @@ struct {
>>>>>   	},
>>>>>   
>>>>>   	.mem_regions = {
>>>>> -		/* IVSHMEM shared memory region for 00:01.0 */
>>>>> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
>>>>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>>>>> +		{
>>>>> +			.phys_start = 0x89fe00000,
>>>>> +			.virt_start = 0x89fe00000,
>>>>> +			.size = 0x10000,
>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>> +		},
>>>>> +		{
>>>>> +			.phys_start = 0x89fe10000,
>>>>> +			.virt_start = 0x89fe10000,
>>>>> +			.size = 0x10000,
>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>>> +		},
>>>>> +		{
>>>>> +			.phys_start = 0x89fe20000,
>>>>> +			.virt_start = 0x89fe20000,
>>>>> +			.size = 0x10000,
>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>> +		},
>>>>> +		{
>>>>> +			.phys_start = 0x89fe30000,
>>>>> +			.virt_start = 0x89fe30000,
>>>>> +			.size = 0x10000,
>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>>> +		},
>>>> You are missing the state table. Was this tested?
>>> Ah, it's there, just 64K large due to the different page size.
>>>
>>>> Please derive from existing examples, using the same patterns and sizes.
>>>> Reference is qemu-arm64.
>>> Still, please follow the default pattern (with adjusted page size),
>>> which means triangle by default, 3 peers. That may eventually become
>>> part of an automated test, and then all boards should better have the
>>> same pattern ready.
>> j721e has only two A72 cores. So max two cells can be created.
>> linux-demo and inmate-demo are mutually exclusive.
> Oh, sorry, missed that completely. I was expecting a quad-core at least.
>
>> That's why I have given the same id to both because I can never launch
>> it in parallel.
>>
>> Do you recommend to still give a separate id for these cells?
> Nope, that's fine then.
>
> But now I wonder why we need to patch any of the demo code. If both do
> respect the max-peers value and send to (my-id + 1) % max-peers, they
> should "just work", no?
Same reason as before.
To be able to choose whom exactly you want to send interrupt.
Triangle is only for demo, but this way, you can send interrupts to any 
device.

Nikhil D
> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/98cd82d2-61e5-a7d7-e83a-b734321f93f2%40ti.com.

--------------C01CBD4AFCA7D3AACBDBAF5C
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
    <div class=3D"moz-cite-prefix">On 08/06/20 7:54 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:1a4a35d9-8530-d4cd-da64-578d41f95eba@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 13:43, Nikhil Devs=
hatwar wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">

On 08/06/20 4:51 pm, Jan Kiszka wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 13:16, Jan Kis=
zka wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 12:42, <a cl=
ass=3D"moz-txt-link-abbreviated" href=3D"mailto:nikhil.nd@ti.com">nikhil.nd=
@ti.com</a> wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwa=
r <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;n=
ikhil.nd@ti.com&gt;</a>

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
            <pre class=3D"moz-quote-pre" wrap=3D"">You are missing the stat=
e table. Was this tested?
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Ah, it's there, just 64K l=
arge due to the different page size.

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Please derive from exist=
ing examples, using the same patterns and sizes.
Reference is qemu-arm64.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Still, please follow the d=
efault pattern (with adjusted page size),
which means triangle by default, 3 peers. That may eventually become
part of an automated test, and then all boards should better have the
same pattern ready.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">j721e has only two A72 cores=
. So max two cells can be created.
linux-demo and inmate-demo are mutually exclusive.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Oh, sorry, missed that completely. I was expecting a quad-core at least.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">That's why I have given the =
same id to both because I can never launch
it in parallel.

Do you recommend to still give a separate id for these cells?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Nope, that's fine then.

But now I wonder why we need to patch any of the demo code. If both do
respect the max-peers value and send to (my-id + 1) % max-peers, they
should "just work", no?
</pre>
    </blockquote>
    Same reason as before.<br>
    To be able to choose whom exactly you want to send interrupt.<br>
    Triangle is only for demo, but this way, you can send interrupts to
    any device.<br>
    <br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:1a4a35d9-8530-d4cd-da64-578d41f95eba@siemens.com">
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
om/d/msgid/jailhouse-dev/98cd82d2-61e5-a7d7-e83a-b734321f93f2%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/98cd82d2-61e5-a7d7-e83a-b734321f93f2%40ti.com</a>.<br />

--------------C01CBD4AFCA7D3AACBDBAF5C--
