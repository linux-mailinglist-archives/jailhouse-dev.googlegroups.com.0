Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB4EVQXZQKGQE2A4NWYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53A17AE8C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 19:54:41 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id u1sf5051333edo.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 10:54:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583434481; cv=pass;
        d=google.com; s=arc-20160816;
        b=W46CC2nU6+2xyHDiJKYEjHuDBHe//1KaR1G++sDVE4BXzZplFP8xUOR5ar069/+y4R
         cxPLBpC0yHSFvUoeyxGrYEvQbxadu/2/z921jxVBVzjDQx8+FZdGs4tbP4uv/wXR4szG
         6JKfh7TUIaIYToDEbbgVGaKam3E2J5t9eIo8YTGytVnaYREEk7cQScAFhWwr6HmSLy1L
         nEpV0OCyS0C/SNRwiPc2aH8V7GSX6yzdH2DSe1hBFGeoOYs4BXNACIdZObKGd5FS+IrK
         h3ySczRvOtQym8Le7KP1uqDRSsZ2TOFYOnmWnBVF+S4ymgeybZwTIIVYRMiHDprMo1P9
         eqzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:from:references:to:sender
         :dkim-signature;
        bh=q7SJ3HrqUDfJlwAzL4HdWx1H5smXYRZFOwCVvDsC0Zo=;
        b=kj7z0CS3ZTgvA6DMYRgF8V+f4XauuIGWlUmsRyi49jml2sosT4sdQi/fyk6q1ck6Fe
         UN9LajgzU0WUyPok7NzS8da+iDw7F53fKQIR2gO0D0Lc5qTvSLdWl5GNbKOlWNB7lkNv
         PeaIBv0ep6M3UA+0xWnxsDArLu4KDuIZvbd0M355Vf9hikA+0ctv53rYJY6MDtfx6deX
         nfJIk2JgZs9jzRMhfybPrj2qy0LX8GycT6t7SF0DwOHJ0UVLD1ab6fCCqp5xYbqoZx7W
         Z6tvp+meXFJ5ViMgK3im5ctFsd8CpsEsVv+SSb1Oj1pF51z5jQSgrZf8Yt9Wz81ZLnzw
         A6LQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=sPoZMviD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q7SJ3HrqUDfJlwAzL4HdWx1H5smXYRZFOwCVvDsC0Zo=;
        b=olnepF1V+PDXfbFnQLjaa1nDGs2CgEPo/wNRh01P4WHQBtJ3fl9B8pZoJYYZGNGXkq
         0cFzO/AzOH9so35L+TLW0gFmBaNu4EdinCnHrTkz5gT4XI9iMBEcaXY7S0iClKuiMgPR
         XLkdpVTdiYMjA9nWERRy54zLv/HYwr9FWRpRFSc5KaU1tUvx9ApICYqFCi90ECjG1W7W
         yY1xVonJt7i5y+NlHyyD5y+SdOQKWnofjxMB2aOyAP2HjZn5f+E9x/0CKwfDyBySDKQU
         H+uTDNsT2DUg/i582z02L4IW/Cgs6OhIJux0LHb55vMDJgylReNmymOh4ps5VKXYEpBo
         sBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q7SJ3HrqUDfJlwAzL4HdWx1H5smXYRZFOwCVvDsC0Zo=;
        b=F9gJjK29FbOFULuJqG2IWIeq4KhQgsXhzJI9J+0Q3ASR2kyDPmeAXIjD23OP8Z6RdZ
         U8YmPOvlZ/XPtQX3438GROpQ02ObShZu8uvLk5AD535FrfprI+6TWt2+voKfVeZ/Urvg
         AXwHZu6v0zBUidrRUwXHUVo8Knx95EoNOsGUdXAnvVftEFRo9YygBDzkE6XjrSTC++Dt
         kfp9QPzlzeAxx3zHbHz1zRXNLFsYPHuhwNYdtEwBhM/OV61t9/PkIjBs2hxD+KWg2uTk
         gNfpiNwoRzX9V4jKrB8J2tEycjIGcqp23YTvHdCRO++HSVyS1Cq/DhcH/xTlU7K+EgM+
         09Pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3gwo2qVoldHPKtKg4WxlvMYddbn+buEafEUY50lrxbH/BL252O
	Oa1tOg+iwJGl1SrGiV166TY=
X-Google-Smtp-Source: ADFU+vsk5WFt/yQR+WJmkSKCaN09cruC9f08hbbtTwB7peAqaLorpn58GwfNJR5djsn1ZtDLjbT9Hg==
X-Received: by 2002:a50:8442:: with SMTP id 60mr148573edp.77.1583434481015;
        Thu, 05 Mar 2020 10:54:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d4d7:: with SMTP id t23ls621307edr.9.gmail; Thu, 05 Mar
 2020 10:54:40 -0800 (PST)
X-Received: by 2002:a50:f689:: with SMTP id d9mr191601edn.174.1583434480307;
        Thu, 05 Mar 2020 10:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583434480; cv=none;
        d=google.com; s=arc-20160816;
        b=pOyfY4lEJufWqSKensa+qLZziU/kCTXgFuYnx487EyVGyVEwIzkWuYE3uhWHTam9/m
         aEJBsdfcNOCJffLd/XzNNWNQIGu2KJUHJtqdAIIXJbDWezYmWeGmBIFfCw16oShdhDyM
         M4lhda4nFjO+wPoa0RU6JSdFnvaTQ78QfvyBFni7WtBqaNc+GIeff1wjcHv3iWeM+EP2
         EGpdaJ6QfO/qdRizOyNHoR5GsYxuCoycWiq525cFx9YsLFGn98vTOKIUfkxxrfk6Gd/Y
         uawTGMlFCUFRNwGnbV6JUJCBUo9a4qq7ocTN/n24knUI1BYhV3GrfnyKJdd47rTwZuvN
         lD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:to
         :dkim-signature;
        bh=LlfUJ6Mauvmk5E+3fazmDZLuu7JDpVd4OF6DBBJnz1w=;
        b=lyL3A89zfgzFNoHaxPJRXkRFbbCJnREruiDDFyqvAq6G26H2eVSulvAKMHfmFsqR9m
         mB+pHDaIv1py/aO1AUIG+V8QtZ2FdBMx+U9BfWO5U8plzPbzj4O/yHpsQSK3dJSL/xwM
         nbuCFMANbMwDEnYF024y63VZ9jjP39o+WaVN53312FOIY0ZPtTaJ9L8tlz2JuaLiIgjG
         sEO8fZj0vPbFiOBYlPUsy0stuY2BUrD5wFt17Fa484OqgXiQf/K3SyZ9C4o4KJ9pFQrN
         rTCBht2gBN0e5q/1uggQRFUDH9nKnONGZZKFKkue1nSN4tZotHIZZa/AOBUR9G+rANJm
         NgOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=sPoZMviD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id co2si409531edb.4.2020.03.05.10.54.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 10:54:40 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 48YKg35F2wzy96;
	Thu,  5 Mar 2020 19:54:39 +0100 (CET)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 5 Mar 2020
 19:54:38 +0100
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz <andrej.utz@st.othr.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, <raymanfx@gmail.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
 <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
 <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
 <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
 <c0402eef-a0c8-40a7-b021-ba0f9f8422df@googlegroups.com>
 <b434f550-5700-ba44-e88f-ea76c84a6d0d@oth-regensburg.de>
 <bef2d9ff-b6b4-8927-e36a-e9ec41d0ed1a@st.othr.de>
 <0ac7e54b-4dcc-73db-1d35-e10e42e17660@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: AMD: non-root linux inmates
Message-ID: <d9a9866a-23fe-82e8-bf5a-073ad41a00f1@oth-regensburg.de>
Date: Thu, 5 Mar 2020 19:54:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0ac7e54b-4dcc-73db-1d35-e10e42e17660@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=sPoZMviD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 3/5/20 7:14 PM, Jan Kiszka wrote:
> On 05.03.20 18:26, Andrej Utz wrote:
>> Hello everyone,
>>
>> On 27.02.20 15:46, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> On 27/02/2020 15:24, raymanfx@gmail.com wrote:
>>>> Hi all,
>>>>
>>>> I'd just like to add that I am experiencing the exact same issue as
>>>> described by Ralf on an AMD EPYC 7351P.
>>>
>>> aah, 'good' to hear!
>>>
>>>> The stacktrace is the same as well:
>>>>
>>>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700
>>>>
>>>> However, on my side I cannot get past this by just handing over the
>>>> xAPIC enabled; I get the same trace..
>>>> I added the printk's from Ralf's diff and get the same output:
>>>> ...
>>>> Before disabling: 10000
>>>> After disabling: 0
>>>> After reenabling: 0
>>>
>>> Great. So we definitely have a systematic hardware bug that doesn't onl=
y
>>> affect our CPU.
>>>
>>> ... Did I already post my local hacky workaround?
>>>
>>> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
>>> index de691329..7f51b062 100644
>>> --- a/hypervisor/arch/x86/apic.c
>>> +++ b/hypervisor/arch/x86/apic.c
>>> @@ -340,7 +340,7 @@ void apic_clear(void)
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Finally, reset the =
TPR again and disable the APIC */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_RE=
G_TPR, 0);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_REG_SVR, 0xff=
);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //apic_ops.write(APIC_REG_SVR, 0x=
ff);
>>> =C2=A0 }
>>>
>>> =C2=A0 static bool apic_valid_ipi_mode(u32 lo_val)
>>>
>>>
>>> Maybe we could try to reach out to AMD via some kernel mailing list?
>>>
>>>> ...
>>>>
>>>> I presume that by "hand over the xAPIC enabled" you mean disabling the
>>>> write to APIC_REG_SVR? That's what I did but it did not do the trick
>>>> unfortunately.
>>>
>>> Yep. Andrej, did we have to adjust anything else?
>>>
>>> It's been a while that we've been working on that issue, and I don't
>>> have the exact details in mind.
>>>
>>> However, Andrej wanted to pick up the topic again soon.
>>>
>>> Thanks,
>>>
>>> =C2=A0=C2=A0 Ralf
>>>
>>
>> =C2=A0From what I've gathered, Jailhouse works as expected. The inmates =
may
>> (or may not) require the APIC, so they also are responsible for
>> handling possible hardware bugs.
>>
>> For this specific case the Linux kernel (inmate) needs a workaround
>> during APIC initialization. However it already has a ancient (pre-git)
>> quirk[1] to delegate interrupts to 8259A in case LVTs are not masked
>> after reset. Nowadays this code seems strange, as the masked state is
>> required per APIC specification (for Intel and AMD).
>>
>> Jan, do you know more about this?
>=20
> Nope (despite my age).

:-D

>=20
> But keep in mind that the state Linux gets on the BSP is not a reset
> state. It is what the BIOS left over (provided masking survives
> soft-disabling).

Ack, I suspect that this is probably the case.

>=20
>>
>> Interestingly enough this quirk is also the actual trigger of the
>> aforementioned "invalid LVT delivery mode" error in Jailhouse.
>>
>> For now I've appended a patch with a simple workaround for the kernel.
>> Hope that helps.
>>
>> [1]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/ar=
ch/x86/kernel/apic/apic.c?h=3Dv5.4.24#n1716
>>
>=20
> Can define something that could be proposed to the kernel? Something
> that assumes LVTx are unmasked after enabling on CPU types we know of
> already. At least we could try to tell the story that way and, at this
> chance, pull in some AMD kernel folks to comment on it.

Had a discussion on that with Andrej earlier this day. The thing is that
upstream is probably not affected: Have a look at this comparison [1].

Apparently, the bug only occurs if smp_processor_id is 0 and the value
of LVT0 doesn't match. So actually this bug should also occur during a
regular boot of bare-metal Linux, but in fact it doesn't. I assume that
CPU 0 is either not affected (unlikely), or, as you already mentioned
BIOS/bootloader hands over with a matching value. But we didn't
investigate it further yet.

However, we'll look for a proper patch that can be used as a basis for a
discussion with upstream folks. apic.c is not known for frequent changes...

  Ralf

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/=
x86/kernel/apic/apic.c?h=3Dv5.4.24#n1727

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d9a9866a-23fe-82e8-bf5a-073ad41a00f1%40oth-regensburg.de.
