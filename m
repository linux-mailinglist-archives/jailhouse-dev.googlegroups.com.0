Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBA6N7D3AKGQE4WSG5UY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 433921F1833
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:52:37 +0200 (CEST)
Received: by mail-pf1-x438.google.com with SMTP id m11sf9620836pfh.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:52:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591617156; cv=pass;
        d=google.com; s=arc-20160816;
        b=MF/LdKVAQ93Im/GpnAZj95jLXvR4TMdrkUP7D7MDoodYIBmTyiBkEA8E1tUlOkFA/C
         8Zrtapd49JGbWhOLTB9TX/RZowaKCdcuqvzuLDBE7Yq9Prh1qwUAtjqkocjTOOvW6/Lc
         3FkOTeL7ijUHm/h/wFIElYOobSczwYQ1Roo9kmar8zGOwV2HUrtI4dvr95+mAd2mkVu0
         0PIns4o13w5mN7VrfQKQ0KWG4BjalEUy4M+DUzHdSTZLJCNBikyyGaHs0ZzfaioufsmP
         nvkQcWB+nLqY92Bme5zEE3eqnhu/1/GojBA0KWl+jYNQGrGNN3NF253nY9KnIS9stWtA
         zShg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=nIdD6vFQrWsEmNtCXbvdmwzD3eyOd9UWwq1LyidV40A=;
        b=BZRMm0EqC4nf0N9DEmhfPFBqljVLTm2dtI4bSbcaifNh5GlHdorlyQkDSBMbt01WnD
         M8zYdIW+4LzC5pCz0IWSxEzK0YVV+qUUeoZjN0ejL5utMnRAwfO2mz9ICnbLx32ABIwn
         zB+i/XdX9Og59gukI+GN1OtrOFtLx0DZeKldsccbxGZPH5R0QBjL9IvGAeXNkBUnV7uw
         /Bkdn/xdrJT5VhxQkPiiwz165UWrEzE2j8X8VtNki4AZ9OfCTwN6/X4wq7ZNcyhqdAYu
         lTWYeX+aH88N/SSXchbtWpD06q2Zuw1VBbj92P4+uPZRPvARPxaPVZgdLh1TIzGMHK7e
         uzVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=V82QEmjL;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=nIdD6vFQrWsEmNtCXbvdmwzD3eyOd9UWwq1LyidV40A=;
        b=TonBmTSLE37a9k7TcPXaNX9aj7GyxXd/hH1eq5NHBehpOOMMHnGNFmdgwl7q2nnund
         LyzVu8RzWKWg1y2zLabF5ktwquW+r6KlTVrcsu4u/LQgHXO8E9UWBz+rmRwzGXjBmwgH
         cJIQ5jbX7TZ56WpxCAaQCSOqskWHMaHq2dnF5V4L0znfHP6ZsSCW2Uk/g1lccu1398AZ
         w2Jc3PdoNJBuDJfBkr2fquTVGZK3ZuP5tK4iyDqEt+UHOafCxT6rvqGTn5U1TWtwQMPy
         I6vX+fhoztihvwMS7h1q/c5QIBHshDaGxe0K8evlytDJ2Iz5dvQ5owy2bDFFb5fG6Hiz
         AYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nIdD6vFQrWsEmNtCXbvdmwzD3eyOd9UWwq1LyidV40A=;
        b=HwyiZxfd2VJ3L2l5jNIQ3VLtUaY7RfKAMCotoliB/iitDwzMO2QxG1iYglelJdi/sa
         y1nZa57H+G/ZnZbg29lExnrH9gJJY9AJ1xQR/9VbKPdKOho46pHNDaTsQSYRlSrBTU8u
         ep1YUFaIzfWvnVvHjeaAt5d7Tv8NJYdk9yoISmgzXcyglDrW2OTuIl3Fe9MDCq5UmKMR
         Kmi19suqX2C2sMag0iy8s3I50vQ8I/dFkt9ltx7HNVli+vicNAlvxu9AMkLnbrDKzNCw
         pApmHiu9PQ6OZFhGCSNyLcRC56JNO0lrkWaq8pEDVH2KhBdOR6Ly6fJWjznGftNlS/+p
         nZOA==
X-Gm-Message-State: AOAM533ma7+nT7wS6bPuEgPyl0tzupAu8my8djIRvhsSvZ7gWTBCBWGO
	gOMhWCzXHNgt++7GrmZSJg8=
X-Google-Smtp-Source: ABdhPJyYqdjS/8/dBqVzXz1zZhy/OxqdqufBmLajzaVEgy3ziAJHVRUqs/g4Z5lcooCwXDiFMiJ6hg==
X-Received: by 2002:a17:90a:dc0f:: with SMTP id i15mr16042740pjv.221.1591617155992;
        Mon, 08 Jun 2020 04:52:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:28c7:: with SMTP id o190ls4483580pgo.3.gmail; Mon, 08
 Jun 2020 04:52:35 -0700 (PDT)
X-Received: by 2002:a65:51c7:: with SMTP id i7mr20174266pgq.382.1591617155415;
        Mon, 08 Jun 2020 04:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591617155; cv=none;
        d=google.com; s=arc-20160816;
        b=pIChbaSewWCAs85mewwA9yRDSAr28eVP9qN+Ti3QgUa2UWxH5GbQ9Pbj6oKQqdo4Hk
         H8OCWTiNuAEh+XL8wck5gi2wql/jfwi++LI3+nR++p9/hBKC2hR3eGPDt5IYFeuCh7+V
         PvihhX3bQL1E5OYPYcNoCv3ddnhlpFzr9jqnaFjIEiGVw6MsMWwPVwbxOhWhhfzaUdbd
         yeDxetgqOMp0Jj/UiUHZjHv6aJsLArrBl9I/3akolRCazxQAzpG80jZkGzIYlwES/eJK
         u/vm18Ht0hJp6keeKwDPFrh3AuhoTA8p4sQQYzddezsTmTyDWFCqapIo8Pr4u7FLWRn8
         T0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=3bLYa3e9J8sf//3qQrx4U7LMQgrNuY8pvM5xtUgNCT0=;
        b=kYBeYZ0IAJppw64aQnBoBqk4JTFrwG+D4zf2eTZCVBGKVpN5L5laonYzHhKWmeQaU3
         sDYHO9K7971wV3piqE6gPwBI/QB+9By7YaZCmeHflWXHvVwdjE6gYvOZ+u4bgwR+M6xO
         fbxpcR0FYFkuukYLHIr2GeCl6+PXDzelKy0kLWLO67SIxRVFaJ5hdS4WhnG/As5oY6lW
         Nhqh/RTlqvOmvI9Zzno0So876KSrBOhexUDqsi4pHd1CyeSMzNE9gjJ2zT/88eE44efz
         jpDj+xTT0GKVuyFoOQ7U7dNekSxXz/SIWs8Nh7XhtjVzxF7XNj+lHoXOk93poA4DO2fh
         ZcTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=V82QEmjL;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id kb2si798014pjb.1.2020.06.08.04.52.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058BqYUC059405;
	Mon, 8 Jun 2020 06:52:34 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058BqYn5086386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 06:52:34 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 06:52:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 06:52:34 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058BqWYd006820;
	Mon, 8 Jun 2020 06:52:33 -0500
Subject: Re: [PATCH v2 9/9] configs: k3-j721e-evm: Fix memory overlaps
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-10-nikhil.nd@ti.com>
 <85d95c1b-2ef9-185e-bfb3-44f5a4d7dbe0@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <a5a1532e-3f18-c7b7-0356-153bc7f95ed5@ti.com>
Date: Mon, 8 Jun 2020 17:22:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <85d95c1b-2ef9-185e-bfb3-44f5a4d7dbe0@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------9D17A9D7ABE0B9EFBFD3E657"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=V82QEmjL;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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

--------------9D17A9D7ABE0B9EFBFD3E657
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 08/06/20 4:39 pm, Jan Kiszka wrote:
> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Fix errors reported by jailhouse-config-check
>> Fix overlap of baremetal demos with IVSHMEM.
>> Remove regions of memory which is already covered as part of
>> some other memory region.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   configs/arm64/k3-j721e-evm-inmate-demo.c |  4 +--
>>   configs/arm64/k3-j721e-evm-linux-demo.c  |  4 +--
>>   configs/arm64/k3-j721e-evm.c             | 31 ++++--------------------
>>   3 files changed, 9 insertions(+), 30 deletions(-)
>>
>> diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
>> index 39c6c414..b070e643 100644
>> --- a/configs/arm64/k3-j721e-evm-inmate-demo.c
>> +++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
>> @@ -86,9 +86,9 @@ struct {
>>   				JAILHOUSE_MEM_IO,
>>   		},
>>   		/* RAM */ {
>> -			.phys_start = 0x89ff00000,
>> +			.phys_start = 0x89ff40000,
>>   			.virt_start = 0,
>> -			.size = 0x00010000,
>> +			.size = 0x000c0000,
> Why making it larger?
Not required, I just matched with all the cells
I will go back to original size

>
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>   				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>   		},
>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>> index 05517751..02b0a248 100644
>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>> @@ -163,9 +163,9 @@ struct {
>>   				JAILHOUSE_MEM_IO,
>>   		},
>>   		/* linux-loader space */ {
>> -			.phys_start = 0x89ff00000,
>> +			.phys_start = 0x89ff40000,
>>   			.virt_start = 0x0,
>> -			.size = 0x10000,	/* 64KB */
>> +			.size = 0xc0000,	/* 64KB */
> Also here. Plus the comment is now wrong.
Will revert the change. This is actually to load the baremetal 
linux-loader app
>
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>   				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>   		},
>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>> index 41f4c456..971aac22 100644
>> --- a/configs/arm64/k3-j721e-evm.c
>> +++ b/configs/arm64/k3-j721e-evm.c
>> @@ -152,20 +152,6 @@ struct {
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>   				JAILHOUSE_MEM_IO,
>>   		},
>> -		/* usbss0 */ {
>> -			.phys_start = 0x06000000,
>> -			.virt_start = 0x06000000,
>> -			.size = 0x00400000,
>> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> -				JAILHOUSE_MEM_IO,
>> -		},
>> -		/* usbss1 */ {
>> -			.phys_start = 0x06400000,
>> -			.virt_start = 0x06400000,
>> -			.size = 0x00400000,
>> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> -				JAILHOUSE_MEM_IO,
>> -		},
>>   		/* Most peripherals */ {
>>   			.phys_start = 0x01000000,
>>   			.virt_start = 0x01000000,
>> @@ -222,13 +208,6 @@ struct {
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>   				JAILHOUSE_MEM_IO,
>>   		},
>> -		/* MSMC SRAM */ {
>> -			.phys_start = 0x4E20000000,
>> -			.virt_start = 0x4E20000000,
>> -			.size = 0x00080000,
>> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> -				JAILHOUSE_MEM_DMA,
>> -		},
>>   
>>   		/* MCU NAVSS */ {
>>   			.phys_start = 0x28380000,
>> @@ -275,7 +254,7 @@ struct {
>>   		/* MCU WKUP peripheral window */ {
>>   			.phys_start = 0x42040000,
>>   			.virt_start = 0x42040000,
>> -			.size = 0x03ac3000,
>> +			.size = 0x030c0000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>   				JAILHOUSE_MEM_IO,
>>   		},
>> @@ -338,10 +317,10 @@ struct {
>>   				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>   				JAILHOUSE_MEM_LOADABLE,
>>   		},
>> -		/* RAM - reserved for ivshmem and baremetal apps */ {
>> -			.phys_start = 0x89fe00000,
>> -			.virt_start = 0x89fe00000,
>> -			.size = 0x200000,
>> +		/* RAM - reserved for baremetal apps */ {
>> +			.phys_start = 0x89ff40000,
>> +			.virt_start = 0x89ff40000,
>> +			.size = 0xc0000,
I believe you want me to specify exactly what is being used instead of 
occupying the hole
Will do it

Nikhil D
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>   				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>   		},
>>
> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a5a1532e-3f18-c7b7-0356-153bc7f95ed5%40ti.com.

--------------9D17A9D7ABE0B9EFBFD3E657
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
    <div class=3D"moz-cite-prefix">On 08/06/20 4:39 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:85d95c1b-2ef9-185e-bfb3-44f5a4d7dbe0@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 12:42, <a class=3D=
"moz-txt-link-abbreviated" href=3D"mailto:nikhil.nd@ti.com">nikhil.nd@ti.co=
m</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.=
nd@ti.com&gt;</a>

Fix errors reported by jailhouse-config-check
Fix overlap of baremetal demos with IVSHMEM.
Remove regions of memory which is already covered as part of
some other memory region.

Signed-off-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 configs/arm64/k3-j721e-evm-inmate-demo.c |  4 +--
 configs/arm64/k3-j721e-evm-linux-demo.c  |  4 +--
 configs/arm64/k3-j721e-evm.c             | 31 ++++--------------------
 3 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j7=
21e-evm-inmate-demo.c
index 39c6c414..b070e643 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -86,9 +86,9 @@ struct {
 				JAILHOUSE_MEM_IO,
 		},
 		/* RAM */ {
-			.phys_start =3D 0x89ff00000,
+			.phys_start =3D 0x89ff40000,
 			.virt_start =3D 0,
-			.size =3D 0x00010000,
+			.size =3D 0x000c0000,
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Why making it larger?</pre>
    </blockquote>
    Not required, I just matched with all the cells<br>
    I will go back to original size<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:85d95c1b-2ef9-185e-bfb3-44f5a4d7dbe0@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D""> 			.flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j72=
1e-evm-linux-demo.c
index 05517751..02b0a248 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -163,9 +163,9 @@ struct {
 				JAILHOUSE_MEM_IO,
 		},
 		/* linux-loader space */ {
-			.phys_start =3D 0x89ff00000,
+			.phys_start =3D 0x89ff40000,
 			.virt_start =3D 0x0,
-			.size =3D 0x10000,	/* 64KB */
+			.size =3D 0xc0000,	/* 64KB */
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Also here. Plus the comment is now wrong.</pre>
    </blockquote>
    Will revert the change. This is actually to load the baremetal
    linux-loader app<br>
    <blockquote type=3D"cite"
      cite=3D"mid:85d95c1b-2ef9-185e-bfb3-44f5a4d7dbe0@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D""> 			.flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 41f4c456..971aac22 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -152,20 +152,6 @@ struct {
 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* usbss0 */ {
-			.phys_start =3D 0x06000000,
-			.virt_start =3D 0x06000000,
-			.size =3D 0x00400000,
-			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* usbss1 */ {
-			.phys_start =3D 0x06400000,
-			.virt_start =3D 0x06400000,
-			.size =3D 0x00400000,
-			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
 		/* Most peripherals */ {
 			.phys_start =3D 0x01000000,
 			.virt_start =3D 0x01000000,
@@ -222,13 +208,6 @@ struct {
 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* MSMC SRAM */ {
-			.phys_start =3D 0x4E20000000,
-			.virt_start =3D 0x4E20000000,
-			.size =3D 0x00080000,
-			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_DMA,
-		},
=20
 		/* MCU NAVSS */ {
 			.phys_start =3D 0x28380000,
@@ -275,7 +254,7 @@ struct {
 		/* MCU WKUP peripheral window */ {
 			.phys_start =3D 0x42040000,
 			.virt_start =3D 0x42040000,
-			.size =3D 0x03ac3000,
+			.size =3D 0x030c0000,
 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
@@ -338,10 +317,10 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* RAM - reserved for ivshmem and baremetal apps */ {
-			.phys_start =3D 0x89fe00000,
-			.virt_start =3D 0x89fe00000,
-			.size =3D 0x200000,
+		/* RAM - reserved for baremetal apps */ {
+			.phys_start =3D 0x89ff40000,
+			.virt_start =3D 0x89ff40000,
+			.size =3D 0xc0000,</pre>
      </blockquote>
    </blockquote>
    I believe you want me to specify exactly what is being used instead
    of occupying the hole<br>
    Will do it<br>
    <br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:85d95c1b-2ef9-185e-bfb3-44f5a4d7dbe0@siemens.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},

</pre>
      </blockquote>
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
om/d/msgid/jailhouse-dev/a5a1532e-3f18-c7b7-0356-153bc7f95ed5%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/a5a1532e-3f18-c7b7-0356-153bc7f95ed5%40ti.com</a>.<br />

--------------9D17A9D7ABE0B9EFBFD3E657--
