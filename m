Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBT6BZTYAKGQEFVTEYGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3a.google.com (mail-vk1-xa3a.google.com [IPv6:2607:f8b0:4864:20::a3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DCA1311AC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 12:58:09 +0100 (CET)
Received: by mail-vk1-xa3a.google.com with SMTP id s205sf20679398vka.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 03:58:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578311888; cv=pass;
        d=google.com; s=arc-20160816;
        b=TM+pcw7KYtEZLn46262SMZONSgiGBlXww4xHwaEVQfyHHPQtS4nr9UPh5r6hwQ4NSK
         B1XudCXeEVs8V+dybuGZCYeyMIdSFOyX2m/I+ZlCHLthI9RnO36cUhNkbc5BRn21rBC4
         QZLmQSE+BL0lDDeXxhUmY6bBtXSeXYlQtLzLFA60uSRGNqvpQbwgIdcIafxrd9gE9j0e
         Awo3OFfkSgvB1cDB74289SB4Fey/RY30q0262WD8iYanMUcKZpKb+3dBvtXGkJgVDklS
         RQyHD9ol3iQ/xI488WUUb79oclqEOnHtoZqu0nKQZRuZPlf/bbVKm5M3h0/Z+T8bAhO1
         EEyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=xAFQPLhA3bDcOcKmOdCla3YEZJu7I8Qs8CXZFkyiokk=;
        b=VPt+HWtvigScWTHQcnDiJR8H31z6cnm056mlrGAI6wG06nRhG6EsbzpZ23H3x3ls8U
         HyK/eiPcU4pEPuy6n2SNS0la4ZnPt0h1uad/WUOLgSfFmX7oOsIHiqPeJqCwsJyFXOFd
         jQsn//DK6E//W5DjDEK8WUlON5wdu4nycLzzwyaizpVeWt5A2B28Z6t8fhiM4mfnXVVY
         ka+B0IGDReK19rxgzH/V8IrYu9xklb5ozyacmHVpxk6VT+xt6gepz4CDF3Yq6ZWz4AoG
         TVlQcnoiWgNYHpafwCKL0q3MqJfb+kIkpNdshhDsEWSggnwStlbJNI5g9sphZvO+ViVI
         3DQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rCrv3JDz;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=xAFQPLhA3bDcOcKmOdCla3YEZJu7I8Qs8CXZFkyiokk=;
        b=jCQeHOFHD2WyQ7moc7bUNIC/6+SzXAUswUoHuCqrfNuqodO9NWsaUTy5dhgsVx4QGy
         N3h/gIbLePxIwJXkkD0m+WeFporM4So7NQS4lPOIC7d/TuChp3LOf5ESg1Qd/BN1ftfz
         fBbRt6W05qYqfGRDYRcxPp2b61Wf6Qk4wHHmCUczFm3XqKhRCSQaCTS8AfyLlJkW2j6e
         F1ijZukjbDGa9Rs3vaX/bmorTRreZaCjU1LZQk1lZjW2F5hkrcqGhsL4cTK5G6emHNAY
         MhlBP25oXWTlrbhzcLC5lVTbrAdLT1vPA1YKG5tA27Rvr+UJysvbKER+NdMbUfPwhI+0
         XZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xAFQPLhA3bDcOcKmOdCla3YEZJu7I8Qs8CXZFkyiokk=;
        b=pcgn2TEmClaQDeknv7MudDmFIIdBUq6RxpqCzQS2Q9RIhoqtPlwn6zHWMINS+5673z
         TVk9IWQtwxIi4okU9YLwG6vwsGWOOXSDULLoa2m+f6VrvLX8w66YHBfJ/gKwRkULSv6J
         WvIffeL+6WxUJMgm8XMykReMkK3M/FSxlaps7kshhGMKCdW5KBKUjyjzHLmyFeklt7bd
         c0QB6UbzO7q4pXj66gaDKw7plYmdU+zBq/FJQFEI8SQBdIywnGXsKkBzHp4prL8elFw/
         sQZgeqzhbwELR6nO5Yhd/uRCOrD7dEcUoSRmkKTtqks+AVzfOk2EqAMZACySKmqITqou
         7XdQ==
X-Gm-Message-State: APjAAAUDT3FIcEbMs8QDdGJ52E3q6qDbWdBHNP0VMeOuQhhBxiqwID8p
	7N+eKuz0JOSCwM4Xi5yZWso=
X-Google-Smtp-Source: APXvYqxWkLq6Cpao9D0+ztvWer1HnSazcgE1vygeaBmDG5mkmWmD20TdKej6wDNv+bAIN9qQPG+zJA==
X-Received: by 2002:a9f:226d:: with SMTP id 100mr29219202uad.107.1578311888019;
        Mon, 06 Jan 2020 03:58:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac5:cd2a:: with SMTP id a10ls1869967vkm.4.gmail; Mon, 06 Jan
 2020 03:58:07 -0800 (PST)
X-Received: by 2002:a1f:1b07:: with SMTP id b7mr58961193vkb.79.1578311887338;
        Mon, 06 Jan 2020 03:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578311887; cv=none;
        d=google.com; s=arc-20160816;
        b=pDDlC56n2dsPSLlQy2cjc5vV+QDU4s1p0C1E9pSdZ4aXuCKfBzBufl7jpya5sHkYFn
         Dvh+/AQ7mexajMYlTBuC4sbCZhe2HOnJj7nmRUBl4DkefJLjN+tpS481FEAlNHrM8GND
         KKiDvzrb4kSEKBaY2sm+6d5pKb/Bi/k4QnnQBgeX8MWm7wS3kUC2mgfcdFt9mLXUU6PF
         KGMbleI9VoqsKrHiGvn7zGlKZKV48c+Jv9yTB/JwfmKXlKSD86k3fVq3D/3HJW8KtNkR
         bPl+SljyAFc9SUE8xNn1CbltXtda/4DR7wn0mO3m1YvIROSMBPWJI/OXVX4In5QktZcT
         b9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=2giNaYNDG52eTSVD6GX1JYredZZ+18bt+mgifuW4TFQ=;
        b=zmJa6JR3IVwVwqGZeBAvy4LJv3wzrYbuelrbve9k4Smldj/rdniFCZKedBx7+JrCYj
         zDxkce2aqwSzvgk3hQxj6ojtj5PuN9nKgpjNqIHvKMMs7hxwYZ4BzX6IucDnE0VYbSBp
         AaSO7tI0bw7adwQTRfjhkYTX/zkna/F3y1N5JtdK1xMm8vWucYOfm2oJ2nK4WC9BGTmR
         0p4xzzsAfN3kGQVACrf2Rp6jWYiZDYr9DLU2zxgHgHCrF68pfStDhM14CAM2J9CqB0Kp
         5x1EKzUiXSF1n5dFUt0KB36dDo2iBXbrze608quAgLBwHcHD570VFMuypLHVP/bzMSv9
         UQ6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rCrv3JDz;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id t76si2576424vkb.1.2020.01.06.03.58.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 03:58:07 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006Bw6SQ012400;
	Mon, 6 Jan 2020 05:58:06 -0600
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006Bw6PG112901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2020 05:58:06 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:58:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:58:06 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006Bw4iT103062;
	Mon, 6 Jan 2020 05:58:04 -0600
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
 <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
 <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
 <7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de>
 <dbfd8b59-103e-2dfd-03dc-6a35559da69f@ti.com>
 <3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <f85ff658-0efc-0e15-1f7c-721cdfa3610a@ti.com>
Date: Mon, 6 Jan 2020 17:27:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de>
Content-Type: multipart/alternative;
	boundary="------------43B210861AE0C291711D47B9"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=rCrv3JDz;       spf=pass
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

--------------43B210861AE0C291711D47B9
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 06/01/20 4:14 pm, Jan Kiszka wrote:
> On 06.01.20 11:10, Nikhil Devshatwar wrote:
>>
>>
>> On 06/01/20 2:52 pm, Jan Kiszka wrote:
>>> On 06.01.20 09:12, Nikhil Devshatwar wrote:
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
>>>>>
>>>>> Huh!? But this breaks cell create/destroy cycles, without any user
>>>>> notice, no? And will root cell devices keep access to inmate memory
>>>>> that
>>>>> is carved out during cell creation?
>>>>>
>>>>> Is that a hardware limitation?
>>>>>
>>>>> Looks like a blocker...
>>>> Yes, this is a hardware limitation. I it designed for static
>>>> partitioning.
>>>
>>> IOW, we can also not change the configuration by destroying and
>>> recreating non-root cells with different memory layouts?
>>>
>>
>> For now, we have gic-demo, uart-demo and linux-demo
>> You can interchangeably create/destroy cells in any order.
>
> I was rather referring to
>
> 1. create linux-demo with, say, 256 MB DMA-capable RAM
> 2. destroy linux-demo
> 3. edit config to use 128 MB only
> 4. create linux-demo with reduced RAM
>

This should be fine I guess. cell_exit hook resets the PVU context for=20
that stream_id (pvu_iommu_flush_context()
subsequent cell_init programs everything as required.

The limitation is on reprogramming while the context is already enabled.
You can disable the context and reprogram a new memory map.

Sorry for causing confusion.

>>
>>>> Although, I made sure to not break memory isolatio with the following
>>>> workaround:
>>>>
>>>> When booting a root cell for Jailhouse, you would typically carveout
>>>> memory for the
>>>> inmate cell. I have defined the cell configs such that, in the root=20
>>>> cell
>>>> config, RAM region for inmate is
>>>> NOT marked with MEM_DMA, this way it never gets mapped in PVU.
>>>>
>>>> When creating cell, root cell maps the inmate RAM loadable region,=20
>>>> here
>>>> that memory is not
>>>> mapped in IO space.
>>>> ---> Limitation of this is that you cannot DMA copy the images in the
>>>> loadable sections,
>>>> =C2=A0=C2=A0=C2=A0 which we are not doing anyways
>>>>
>>>> When destroying the cell, Jailhouse should map the memory back to the
>>>> root cell.
>>>> Here, again, the inmate RAM region gets ignored in IO mapping=20
>>>> because of
>>>> lacking flag MEM_DMA
>>>>
>>>> cell_create=C2=A0 and cell_destroy work in regression, tested successf=
ully.
>>>>
>>>
>>> Please add at least a test to the unmap function that warns when a
>>> config is violating the hardware constraints. It's still not clear to
>>> me, though, how well that goes with changing inmate cell configs.
>>>
>> Let me explain via the code
>>
>> root cell config for j721e-evm:
>>
>> 1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_sta=
rt =3D 0x80000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_sta=
rt =3D 0x80000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D=
 0x80000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>> 2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ {
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_sta=
rt =3D 0x880000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_sta=
rt =3D 0x880000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D=
 0x1fa00000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>> 3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for ivshmem and=
 baremetal apps */ {
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_sta=
rt =3D 0x89fe00000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_sta=
rt =3D 0x89fe00000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D=
 0x200000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>> 4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for inmate */ {
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_sta=
rt =3D 0x8a0000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_sta=
rt =3D 0x8a0000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D=
 0x60000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>
>> Here, note that all of 1,2,34 gets mapped in CPU MMU, but only 1,2 gets
>> mapped in PVU
>>
>> inmate cell config for j721e-evm-linux-demo:
>>
>> 5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_sta=
rt =3D 0x8a0000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_sta=
rt =3D 0x8a0000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D=
 0x60000000,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>
>>
>> * When enabling jailhouse:
>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(same as 5) s=
hould be mapped in
>> CPU MMU and PVU
>> =C2=A0=C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is mapped. root=
 cell kernel
>> continues without any trouble
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inmate memory=
 is reserved, no driver attempts DMA to
>> that region, no faults seen
>>
>> * When creating inmate cell:
>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PVU should =
be removed from root
>> cell stream ID and to be added in the inmate cell stream ID
>> =C2=A0=C2=A0=C2=A0=C2=A0 With current config, unmap return 0 because not=
hing was ever mapped
>>
>> * When loading images (SET_LOADABLE):
>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, loadable regions should be mapp=
ed in the PVU map
>> for root cell streamID
>> =C2=A0=C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit skips th=
is chunk and never
>> maps to root cell
>> =C2=A0=C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root cell vie=
w of inmate loadable
>> memory, there will be faults
>> =C2=A0=C2=A0=C2=A0=C2=A0 We do not do this currently (I believe we CPU c=
opy the images)
>> Correct me if I am wrong here
>>
>> * When starting cell
>> =C2=A0=C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be removed fr=
om root cell and
>> added to inmate cell
>> =C2=A0=C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never mapped
>> =C2=A0=C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in inmate 2nd =
time does nothing if
>> the pvu_tlb_is_enabled returns true
>>
>> Nowhere, PVU unit reprograms the memory map to add or remove entires.
>> Because it doesn't have to do.
>
> I'm asking for a check in pvu_iommu_unmap_memory that the passed memory
> region does not have JAILHOUSE_MEM_DMA set. When that is the case,
> something went wrong because the request cannot be fulfilled on the PVU.
>
> However, I'm afraid that test will trigger on non-root cell destruction
> when that cell contained DMA-capable memory. That would mean any device
> that this cell owned and that is DMA-capable could continue to write the
> cell memory, possibly competing with the root cell loading new content
> into it. This gets rather nasty because now you need to prevent such
> writes be resetting all devices reliably. But Jailhouse can only do that
> for PCI devices (removing the master bit), not for random platform=20
> devices.
>
Sure, I will add the check, yes it will print while destroying inmate cells=
.
However, as I said, the PVU context can be reset for that stream_id and
It will cause faults for all DMA requests on that context. No corruption=20
to root cell or broken isolation.

Regards,
Nikhil D

> Jan
>
>>
>> Sure, there are some limitations of this appoach:
>> * DMA copy of boot images not supported
>> * Root cell memory map should be split to mark all inmate used RAM
>> regions without MEM_DMA flag.
>>
>> Regards,
>> Nikhil D

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f85ff658-0efc-0e15-1f7c-721cdfa3610a%40ti.com.

--------------43B210861AE0C291711D47B9
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
    <div class=3D"moz-cite-prefix">On 06/01/20 4:14 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de">On 06.01.20
      11:10, Nikhil Devshatwar wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        On 06/01/20 2:52 pm, Jan Kiszka wrote:
        <br>
        <blockquote type=3D"cite">On 06.01.20 09:12, Nikhil Devshatwar
          wrote:
          <br>
          <blockquote type=3D"cite">
            <blockquote type=3D"cite">
              <blockquote type=3D"cite">+{
                <br>
                +=C2=A0=C2=A0=C2=A0 /*
                <br>
                +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
                <br>
                +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic un=
map
                <br>
                +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partition=
ing
                <br>
              </blockquote>
              <br>
              Huh!? But this breaks cell create/destroy cycles, without
              any user
              <br>
              notice, no? And will root cell devices keep access to
              inmate memory
              <br>
              that
              <br>
              is carved out during cell creation?
              <br>
              <br>
              Is that a hardware limitation?
              <br>
              <br>
              Looks like a blocker...
              <br>
            </blockquote>
            Yes, this is a hardware limitation. I it designed for static
            <br>
            partitioning.
            <br>
          </blockquote>
          <br>
          IOW, we can also not change the configuration by destroying
          and
          <br>
          recreating non-root cells with different memory layouts?
          <br>
          <br>
        </blockquote>
        <br>
        For now, we have gic-demo, uart-demo and linux-demo
        <br>
        You can interchangeably create/destroy cells in any order.
        <br>
      </blockquote>
      <br>
      I was rather referring to
      <br>
      <br>
      1. create linux-demo with, say, 256 MB DMA-capable RAM
      <br>
      2. destroy linux-demo
      <br>
      3. edit config to use 128 MB only
      <br>
      4. create linux-demo with reduced RAM
      <br>
      <br>
    </blockquote>
    <br>
    This should be fine I guess. cell_exit hook resets the PVU context
    for that stream_id (pvu_iommu_flush_context()<br>
    subsequent cell_init programs everything as required.<br>
    <br>
    The limitation is on reprogramming while the context is already
    enabled.<br>
    You can disable the context and reprogram a new memory map.<br>
    <br>
    Sorry for causing confusion.<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de">
      <blockquote type=3D"cite">
        <br>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">Although, I made sure to not break
            memory isolatio with the following
            <br>
            workaround:
            <br>
            <br>
            When booting a root cell for Jailhouse, you would typically
            carveout
            <br>
            memory for the
            <br>
            inmate cell. I have defined the cell configs such that, in
            the root cell
            <br>
            config, RAM region for inmate is
            <br>
            NOT marked with MEM_DMA, this way it never gets mapped in
            PVU.
            <br>
            <br>
            When creating cell, root cell maps the inmate RAM loadable
            region, here
            <br>
            that memory is not
            <br>
            mapped in IO space.
            <br>
            ---&gt; Limitation of this is that you cannot DMA copy the
            images in the
            <br>
            loadable sections,
            <br>
            =C2=A0=C2=A0=C2=A0 which we are not doing anyways
            <br>
            <br>
            When destroying the cell, Jailhouse should map the memory
            back to the
            <br>
            root cell.
            <br>
            Here, again, the inmate RAM region gets ignored in IO
            mapping because of
            <br>
            lacking flag MEM_DMA
            <br>
            <br>
            cell_create=C2=A0 and cell_destroy work in regression, tested
            successfully.
            <br>
            <br>
          </blockquote>
          <br>
          Please add at least a test to the unmap function that warns
          when a
          <br>
          config is violating the hardware constraints. It's still not
          clear to
          <br>
          me, though, how well that goes with changing inmate cell
          configs.
          <br>
          <br>
        </blockquote>
        Let me explain via the code
        <br>
        <br>
        root cell config for j721e-evm:
        <br>
        <br>
        1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phy=
s_start =3D 0x80000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .vir=
t_start =3D 0x80000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .siz=
e =3D 0x80000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
        <br>
        2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phy=
s_start =3D 0x880000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .vir=
t_start =3D 0x880000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .siz=
e =3D 0x1fa00000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
        <br>
        3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for ivshme=
m and baremetal apps */ {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phy=
s_start =3D 0x89fe00000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .vir=
t_start =3D 0x89fe00000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .siz=
e =3D 0x200000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
        <br>
        4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for inmate=
 */ {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phy=
s_start =3D 0x8a0000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .vir=
t_start =3D 0x8a0000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .siz=
e =3D 0x60000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
        <br>
        <br>
        Here, note that all of 1,2,34 gets mapped in CPU MMU, but only
        1,2 gets
        <br>
        mapped in PVU
        <br>
        <br>
        inmate cell config for j721e-evm-linux-demo:
        <br>
        <br>
        5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phy=
s_start =3D 0x8a0000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .vir=
t_start =3D 0x8a0000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .siz=
e =3D 0x60000000,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
        <br>
        <br>
        <br>
        * When enabling jailhouse:
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(same as=
 5) should be
        mapped in
        <br>
        CPU MMU and PVU
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is mapped.=
 root cell kernel
        <br>
        continues without any trouble
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inmate m=
emory is reserved, no driver attempts
        DMA to
        <br>
        that region, no faults seen
        <br>
        <br>
        * When creating inmate cell:
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PVU sh=
ould be removed
        from root
        <br>
        cell stream ID and to be added in the inmate cell stream ID
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 With current config, unmap return 0 becaus=
e nothing was
        ever mapped
        <br>
        <br>
        * When loading images (SET_LOADABLE):
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, loadable regions should be=
 mapped in the
        PVU map
        <br>
        for root cell streamID
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit ski=
ps this chunk and
        never
        <br>
        maps to root cell
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root cel=
l view of inmate
        loadable
        <br>
        memory, there will be faults
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 We do not do this currently (I believe we =
CPU copy the
        images)
        <br>
        Correct me if I am wrong here
        <br>
        <br>
        * When starting cell
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be remov=
ed from root cell
        and
        <br>
        added to inmate cell
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never mapp=
ed
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in inmate=
 2nd time does
        nothing if
        <br>
        the pvu_tlb_is_enabled returns true
        <br>
        <br>
        Nowhere, PVU unit reprograms the memory map to add or remove
        entires.
        <br>
        Because it doesn't have to do.
        <br>
      </blockquote>
      <br>
      I'm asking for a check in pvu_iommu_unmap_memory that the passed
      memory
      <br>
      region does not have JAILHOUSE_MEM_DMA set. When that is the case,
      <br>
      something went wrong because the request cannot be fulfilled on
      the PVU.
      <br>
      <br>
      However, I'm afraid that test will trigger on non-root cell
      destruction
      <br>
      when that cell contained DMA-capable memory. That would mean any
      device
      <br>
      that this cell owned and that is DMA-capable could continue to
      write the
      <br>
      cell memory, possibly competing with the root cell loading new
      content
      <br>
      into it. This gets rather nasty because now you need to prevent
      such
      <br>
      writes be resetting all devices reliably. But Jailhouse can only
      do that
      <br>
      for PCI devices (removing the master bit), not for random platform
      devices.
      <br>
      <br>
    </blockquote>
    Sure, I will add the check, yes it will print while destroying
    inmate cells.<br>
    However, as I said, the PVU context can be reset for that stream_id
    and<br>
    It will cause faults for all DMA requests on that context. No
    corruption to root cell or broken isolation.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de">Jan
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        Sure, there are some limitations of this appoach:
        <br>
        * DMA copy of boot images not supported
        <br>
        * Root cell memory map should be split to mark all inmate used
        RAM
        <br>
        regions without MEM_DMA flag.
        <br>
        <br>
        Regards,
        <br>
        Nikhil D
        <br>
      </blockquote>
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
om/d/msgid/jailhouse-dev/f85ff658-0efc-0e15-1f7c-721cdfa3610a%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/f85ff658-0efc-0e15-1f7c-721cdfa3610a%40ti.com</a>.<br />

--------------43B210861AE0C291711D47B9--
