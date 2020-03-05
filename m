Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUDQXZQKGQEZZA7YNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4C517ADED
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 19:14:35 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id n12sf2601874wrp.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 10:14:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583432074; cv=pass;
        d=google.com; s=arc-20160816;
        b=fpHD0sKOnIxluvJ+v6piFJF3bmU8Fq7JHcHDhyzj1w6gxM5eGjJ/QpajYCOYOF1DVs
         s7Iuni9/jHnS5KuczoVTFzboWMaGHvvNO25G55Y1fDaitovoQm0H2s9wkBCFDGsz0hmw
         cib644evrErYm99IdnXhtbKj78fE4owWGHCsCjlNEde0F3kheRNnFDnQcbi4F/gr9hXU
         QvAU4o7pyPL8TC8npsES79X8/xu11J8hCCJYqFTdWofY/ua21888q7nOnl5QjaxUYZES
         Ur1RVueRr9rL4AKP2Ezn0YDN9+zkv9/nXJM9eBM4DQb3kvionl4enSVRXcDIMJge6TG+
         OPsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=yJEyVbVHcE8CvewpZNK1KZ33qDH4p0QEePWRq+AcO2g=;
        b=sUfd77DdAJqpvS8JyamkuMOtmQ1/uSg8/MM4U+FmYj4sDvkPLDs1QehgB2gsHyNr7S
         5YjqJJtYzTmrKWo7q6OAyvV3iIMYeqg3ZBGqnKylUKKUmS2bnk2v7rEyzO77BSnj/KsV
         dvLq3RCQp1Eg5c4JCJD47371OkvZ+Ehl4AgkgMsqHr8DIam1oePt4H76yhiEh1ixUR8l
         WJlxJIQGfIz3PC4h0sRzWv/y59bKQXY/j5PmY8W+Dul0aVb82spK6iPdAe41MvJBLc7F
         1Y9ZX17iOv6yD29tzZApRybNMYJUd0N6aLae+jpSfxOevtbQWKF2uF7Z4Sju+oR9qufB
         2hng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yJEyVbVHcE8CvewpZNK1KZ33qDH4p0QEePWRq+AcO2g=;
        b=JAilxYF2E/JpK3Ualv3cl8pW4spZu8kdRgZTdRRE13AGE1CV/73YrL4+FUKKMCsmT2
         zfB3fBOd1ok27FvfJywHS1g6HWSCSR1cNhzN7mMYVIwbRW6vZZ1ivPNzBVMgDC4CwgKi
         atYY+chR4pHT7D/uvMQuNX6YfSQBAM3ENuZEE/NL2sU+KUa8rmkhPIv3pwjgmZDn2UQd
         dUWtBrjdtp78p9GYIz1qvpDdHcNqVs/nwFN7Mw1YRpoikdBC32XO97ZmdsaGlL+u+1cF
         PKT+DJ3ImS/r9CthwBm650S+7QOwyoiZslpH5QuAhS1kxrZolbWQdhPhMUiyGk6Uwpip
         m5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yJEyVbVHcE8CvewpZNK1KZ33qDH4p0QEePWRq+AcO2g=;
        b=q+tWUtoh5zvaeub2Ixwdaw7nNL7GfiJroDNNGHMkMu29keLhtXO2zOVSdCio1TBcur
         lWV6AEbXq01OPfxYhlobboX1QuK2nYA5x4TvddHYstodODHWc78A3+bMVkb9YERGv/Rv
         /B5Vm8eK8zPgCE7afkTTRKxMsgNmHrEDsZVvL4oyw6yF/jMF1qWQr9/c01VOIUwrRXR4
         c8gFO7EX/kfG+3HyY4jDepcGNVKVm/MCf5bhLh6FLOPth/3YY84YjVEfqTE43MepHvC9
         PQSMQeaLyF0Wxws2LAssymePhHaA41u4veTmBr0X+rO8mOT9FiI+Hq6HEySmPxGcFNOg
         U+sg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2B3V1F8gGH/tgbdbrylnj85UKN4D4vqRZNE5Ru+Esm8nv1gv7X
	S3pkp4hpYqU2w6+tr6eArhI=
X-Google-Smtp-Source: ADFU+vvPr59lYmC2jex8H8B1eQew2ViID4OouBx05MxdWVzqD2GP7p42no0fCTrh70OMj4/Mnv8aLA==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr216732wrq.90.1583432074704;
        Thu, 05 Mar 2020 10:14:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:208f:: with SMTP id g137ls2118457wmg.1.gmail; Thu, 05
 Mar 2020 10:14:33 -0800 (PST)
X-Received: by 2002:a1c:a345:: with SMTP id m66mr74167wme.114.1583432073837;
        Thu, 05 Mar 2020 10:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583432073; cv=none;
        d=google.com; s=arc-20160816;
        b=Ts3lcBhoGbShT7opXFFOgpAYgsiCPqpP+LYxXgS2NPPYeeiixImM87XGSJxDxMAqfY
         0kgxZaowNX0Bve0Su5aHHgfyyuAFOEqRjgac9v9qNDTJsSNJdb227iYZ02KkYquZy2uj
         E6Grn39loj1QDueiNusIdD/wS3Z5a/wjyHCXH7s0k9x9djJNC8nsiYvd1vc89flTYc7g
         pUful1iryJdb9Cb7TYT52yi7hGKJg5w6Z3fgssRo+sVWdhlMxViXzprsEl4anw0ARxMq
         jVrp5Nk8McDHlzlEJE+GN8CSt84oGoAkBCIzxZXER5iy4IiAtnc2WUAIoSfpx/bR0fAT
         de8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=fQoELvZw3kNkQUKkodiiWfrGFwHW1MTVQuNa53Ii9vA=;
        b=SvRSom7HdjXK0s9ANTVZsEfsrQQrw/QG474bi4ClHoyvIphguDCkS+4fOgv5Xa5h+7
         DWJEM1XxxCesFmQfjoM/yx9W5Hd1mM6helXtPOe9nT4CjjfUQWVQuCP9IIhd87MNcefi
         p8GMTNIXRTZGaCQKEAflFPk/47cIsN1McY2+hSYY4qTv21TTVhfXeIPetHrZ1L9T0d9V
         P1/k0JdlbWfC3wu/NTDG671c0tGdEp2T4n1yy+0zzO991e5qb4p76nLZrYJi5KqhY/K2
         LX/l79xuNlxwNfnishJACipZL+LZ+45zSJ+uP4e1vlqi0k16Ily/xMcqT7+cV8IqvG7M
         JzlQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w20si513634wmk.0.2020.03.05.10.14.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 10:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 025IEWpf012449
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2020 19:14:32 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 025IEW0Q023362;
	Thu, 5 Mar 2020 19:14:32 +0100
Subject: Re: AMD: non-root linux inmates
To: Andrej Utz <andrej.utz@st.othr.de>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, raymanfx@gmail.com,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0ac7e54b-4dcc-73db-1d35-e10e42e17660@siemens.com>
Date: Thu, 5 Mar 2020 19:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bef2d9ff-b6b4-8927-e36a-e9ec41d0ed1a@st.othr.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 05.03.20 18:26, Andrej Utz wrote:
> Hello everyone,
>=20
> On 27.02.20 15:46, Ralf Ramsauer wrote:
>> Hi,
>>
>> On 27/02/2020 15:24, raymanfx@gmail.com wrote:
>>> Hi all,
>>>
>>> I'd just like to add that I am experiencing the exact same issue as
>>> described by Ralf on an AMD EPYC 7351P.
>>
>> aah, 'good' to hear!
>>
>>> The stacktrace is the same as well:
>>>
>>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700
>>>
>>> However, on my side I cannot get past this by just handing over the
>>> xAPIC enabled; I get the same trace..
>>> I added the printk's from Ralf's diff and get the same output:
>>> ...
>>> Before disabling: 10000
>>> After disabling: 0
>>> After reenabling: 0
>>
>> Great. So we definitely have a systematic hardware bug that doesn't only
>> affect our CPU.
>>
>> ... Did I already post my local hacky workaround?
>>
>> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
>> index de691329..7f51b062 100644
>> --- a/hypervisor/arch/x86/apic.c
>> +++ b/hypervisor/arch/x86/apic.c
>> @@ -340,7 +340,7 @@ void apic_clear(void)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Finally, reset the T=
PR again and disable the APIC */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_REG=
_TPR, 0);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_REG_SVR, 0xff)=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //apic_ops.write(APIC_REG_SVR, 0xf=
f);
>> =C2=A0 }
>>
>> =C2=A0 static bool apic_valid_ipi_mode(u32 lo_val)
>>
>>
>> Maybe we could try to reach out to AMD via some kernel mailing list?
>>
>>> ...
>>>
>>> I presume that by "hand over the xAPIC enabled" you mean disabling the
>>> write to APIC_REG_SVR? That's what I did but it did not do the trick
>>> unfortunately.
>>
>> Yep. Andrej, did we have to adjust anything else?
>>
>> It's been a while that we've been working on that issue, and I don't
>> have the exact details in mind.
>>
>> However, Andrej wanted to pick up the topic again soon.
>>
>> Thanks,
>>
>> =C2=A0=C2=A0 Ralf
>>
>=20
>  From what I've gathered, Jailhouse works as expected. The inmates may=20
> (or may not) require the APIC, so they also are responsible for handling=
=20
> possible hardware bugs.
>=20
> For this specific case the Linux kernel (inmate) needs a workaround=20
> during APIC initialization. However it already has a ancient (pre-git)=20
> quirk[1] to delegate interrupts to 8259A in case LVTs are not masked=20
> after reset. Nowadays this code seems strange, as the masked state is=20
> required per APIC specification (for Intel and AMD).
>=20
> Jan, do you know more about this?

Nope (despite my age).

But keep in mind that the state Linux gets on the BSP is not a reset=20
state. It is what the BIOS left over (provided masking survives=20
soft-disabling).

>=20
> Interestingly enough this quirk is also the actual trigger of the=20
> aforementioned "invalid LVT delivery mode" error in Jailhouse.
>=20
> For now I've appended a patch with a simple workaround for the kernel.
> Hope that helps.
>=20
> [1]:=20
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arc=
h/x86/kernel/apic/apic.c?h=3Dv5.4.24#n1716=20
>=20

Can define something that could be proposed to the kernel? Something=20
that assumes LVTx are unmasked after enabling on CPU types we know of=20
already. At least we could try to tell the story that way and, at this=20
chance, pull in some AMD kernel folks to comment on it.

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
jailhouse-dev/0ac7e54b-4dcc-73db-1d35-e10e42e17660%40siemens.com.
