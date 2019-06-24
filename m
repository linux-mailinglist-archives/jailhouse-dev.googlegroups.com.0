Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBHVCYPUAKGQEERX2YMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A950C0D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 15:33:20 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id d13sf7384271oth.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 06:33:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561383199; cv=pass;
        d=google.com; s=arc-20160816;
        b=HAxjimJe4tgoJ1MbZFjmDJhfv+mg9EVxyUgAAvlKXcnbbpUiivbaTE0SFI/XDfL41O
         Ve73RpFXuQpAyA3ibzAHf6TC3271fpm0H3BEKFLqzfciNvORyJJZEO5c458rmWYuBRFW
         OZwIlB+Kau6d7XVXJLJC2BQ2q5MFQxBwvCOdkmiYm0r9O2AcVzQa/YQZr4C8cC3f6MzB
         eMmoq5mZYdF/85na0m1wnQHiTz4DvofVAbOwBPdEYDLsrKaqJK94qZcZLK9zvEZsZ5Dm
         A4UH2OnqnT35uHJZU/RMsY4px8b+n0FIlKkr0+qKHoU0g1c0bqtdctzpMa9E6dFiWqUA
         5Ubw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VloUAmReENeLYPsQROHcn4LUGK9YL25z+upFqzS3rbU=;
        b=cD3iFVrroQ+RtjCKxWp8bCmTO6ikniunWqIUFp422DHlSbykCbPYGcr067+NRBmT4t
         OfPIGgc7mX4bErAlMkzG0t919a5DykcD4RpBFfYrHUDa1ZStD7gfUlPCU81VxAGa/nB/
         EI6010G2RVuazCNdYHVUxpQxvaevaAfs6tqpvDfpSQONvKC8CQhNtNqoB7pr6s/YweYL
         ilG5Zo2yUEB6IOtDoAYXMBJbcyLhnchf37AyEI0SyWtP7DjVYDCM87QFzEKiwgDtlDuP
         h8AKKKMeXdPrlDjIvrczG0PIXQv9+eY/ivXhxNq+9VC+Zv9LcMudLGcArt2DHd3qA/ZU
         +ODw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QRWuh7m5;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VloUAmReENeLYPsQROHcn4LUGK9YL25z+upFqzS3rbU=;
        b=JHZIaXn3n1dDWmTP1GWqc0F1jHjZ8ctL535IDqJieJ3B/9VLxfr10H6rtVdAgdw+UG
         mGsB4KFBcW3IW+G4XQcXo7pshbYuS5cQy8xBWBOSV8IKampnKXZlGh1N0jQUghy7XRRs
         XITxVbES4APv82kB/FYIIF4vxbAub2HapF/xUJVGmLAyf9YurPaFU01rVOY7ZRyo5S05
         1PxHWiEOlwPdtKHmOoA+tUEovl8mlfsBBMal6E1t4GH/sLrmN+gIt+nE+ZMHPv4GENLJ
         l1uvabTZf3ZgfrJ+RRZiC9FlAxQCzt9iRqJNJSF2bCqMzCAttjLW7KxXb5xFmTh9wr/Z
         AOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VloUAmReENeLYPsQROHcn4LUGK9YL25z+upFqzS3rbU=;
        b=IyiErjl5TIEdbAIpOgBDej5wyZC6TCpg29MZFj2gsxdP8QLtviERpO+c9mALwOwYWs
         +k8jCy0ktTAw8xBECJPLp9vL55BHKfCqjuyisYb3MJnN0EhW2yjn2CbuY6jIf7y8QH+P
         9fNU5AIoZRPmEO7EFfqPbSiz3wdwwXO/pnYpPgBxqvNvid6IL256Ex6lTglIZPGvDrTe
         PfoOvjG12DtpYqIGdnR0z4/dk8eTv4oX/hGIMBW8v9oQFJwu1/IkpgQKbp1OGkngibuW
         9jo1wwNn4H+ARbHwGFXOU5DO02QDArzi27kD2/gNYEDt4aeMqQd7h9V+Z8fEHcHWbQ3W
         CJnA==
X-Gm-Message-State: APjAAAWa+k98ZNSkBE9YKwBWYOMBqlBtgLI6r05dUXyGX9+dxrOzs2un
	GMrMlr2YTHFo2PVE1+DQmQ8=
X-Google-Smtp-Source: APXvYqz0+3p36SaBmPwPvaYcRYkABGadEYSmOE7EaojOeTme0WDwOfu6JvhDqPFeLbagzaxP9drVqw==
X-Received: by 2002:aca:c508:: with SMTP id v8mr10915177oif.104.1561383199240;
        Mon, 24 Jun 2019 06:33:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:b803:: with SMTP id i3ls2277137oif.4.gmail; Mon, 24 Jun
 2019 06:33:18 -0700 (PDT)
X-Received: by 2002:aca:a884:: with SMTP id r126mr11306181oie.11.1561383198523;
        Mon, 24 Jun 2019 06:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561383198; cv=none;
        d=google.com; s=arc-20160816;
        b=rwdKM8RYatLE3aSQaHjtwFjXFXF7FY0kJV3lrfeKJ8TSDmeAtkjfQVvtbRSTERyAJY
         bxW8MQCOM7yLbmGE+RvDxBkO6D4K4GaQdDxRQypkvIKjU8zHdY4VEX8KTpXajzRUGZYw
         f/oWzydmaVEzXCsx9hL42NCZ2I7PTP9wgdo+1Gh/+yXXVg0Jux+o+1vxSoZow+LfDPlu
         igX3TrNXCyu2befxBf5xu0mjqllGH0LfakbUIgQemuoE9/67LhZ5Wig+5DvTu4EFUiiY
         YVh4DejKJa4Ngx/DckislBx4vKCnzXoOBawy4T/W6/IbhnexLeLedT1ogwAIBtqf9vh6
         GAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=znRgV5jqjYpM8y0m2kT/Z6NO/KX1E6rt7vq86z6LFT0=;
        b=FkVdIHZC3i5wXPSw2beOIqx25w49PB1O9Qe2dc1yklNrEZyWoP+ZkFRaPRWnuKA/qG
         va3GbgnxzyqRit5dKPaNvszrRNxPunAu+TIplzec3ZAyAhPqskgZNbI3bW6oXNpeG5EE
         MRXJf9iXtutvMQFk6y6J7syVEW8cEN7LE6IFDTXeS8z7Bg0a4olMQlMVArtlIOXYN6mm
         pDDdRkoCUtzCB9CoZujRrzo3VrnRdZxefUxZYK8hMFOxK0y3u5nF7BGKDfBhGh4VqO7x
         5VX8gGeR2ObbNWuPtjJEzF0VgznD9o6fOtKRxaHHk1dVkz86ZZGk4yUXOv/DPfwQXiDI
         s9yw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QRWuh7m5;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id y133si686290oiy.3.2019.06.24.06.33.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 06:33:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ODXI8L103680;
	Mon, 24 Jun 2019 08:33:18 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ODXI01097121
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2019 08:33:18 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 08:33:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 08:33:17 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ODXHCD009745;
	Mon, 24 Jun 2019 08:33:17 -0500
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
Date: Mon, 24 Jun 2019 09:29:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=QRWuh7m5;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

On 06/24/2019 09:23 AM, Jan Kiszka wrote:
> On 24.06.19 14:27, Vitaly Andrianov wrote:
>> Hi Jan, Ralf,
>>
>> On 06/12/2019 03:27 PM, 'Vitaly Andrianov' via Jailhouse wrote:
>>> Hi Ralf,
>>> Thanks you for the quick response.
>>>
>>
>> [skip]
>>
>>>>>
>>>>> so, I have to implement the corresponding am57xx_init() and
>>>>> am57xx_cell_exit().
>>>>>
>>>>> Here is the old mach_cell_exit function, but many of the functions it
>>>>> uses disappeared in the v0.10 version.
>>>>>
>>>>> void mach_cell_exit(struct cell *cell)
>>>>> {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cp=
u_set) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_=
read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4)=
;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> }
>>>>>
>>
>> I have implemented the am57xx unit. At the am57xx_cell_exit() I set cpu_=
on_entry to=20
>> omap5_secondary_hyp_startup() - physical address. That was in the workin=
g v0.8 mach_cell_exit().
>> But I'm not sure what shall I do with the remaining 3 calls:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>
>> When I execute "jailhouse cell destroy 1" the kernel cannot bring cpu1 o=
nline and it still in the=20
>> hypervisor's WFI loop.
>>
>> Any advise?
>=20
> Can you share the code?
>=20
> But, again, we will likely need more redesign anyway because the previous=
 approach was already=20
> hacky. E.g. it was rather fishy to pass through the WakeupGen page and is=
suing smc calls.
>=20
> Can you describe the CPU boot flow from OS perspective, or refer to a des=
cription? Back then, I=20
> implemented it via Linux reverse engineering.
>=20
> Jan
>=20

I just made suspend_cpu() not static and called from am57xx_exit_cell(). I =
got cpu_up() working=20
after that. Now I have the both uart-demo and git-demo working now. Let me =
clean the code and I push=20
it to the temporally branch to TI external git repo. After that we can disc=
uss what I need to do to=20
implement the correct way.

Thanks,
-Vitaly


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c724fb1e-4c24-8562-cc3b-bd35d45d098e%40ti.com.
For more options, visit https://groups.google.com/d/optout.
