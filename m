Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2HTYPUAKGQEORTETFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB0518A0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 18:27:21 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id p16sf1735679wmi.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 09:27:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561393641; cv=pass;
        d=google.com; s=arc-20160816;
        b=J6KdL2mUsqzMfOkGCC65Xtel8uCyiOSllouZTEcdSEmPLIDpAf31TntDh/BT7n6eAT
         8YlITf3fLYcgHbt2yfuqDo5B25ZWZKNtyVed3myllJs/UGV8U9ZiSfQVitc8W8snLtPG
         sKvgZUOStoDKBnRB0Ky8EZl4BDk3VbPUBdwaod+/OO7ZkrIE4PaUHrcCWmxj0rWy6JO0
         goxh13IqtjucxHuhsFHJPclJNfUynQ8ZfvNL8s5Ykb8MsV4cOI7+Rs7rTpqGWPG1CSvO
         K2OwoHzGI1z25N+VEribs3Ip1U3aVbdGEUJaknqVwnPrFOgUuRyJGy9IDZrOvGvBfxCD
         2HeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=8GS5aCvSYOFUCgRNbx3dctE5qtJzvpjUrnO7gJP4MNA=;
        b=xVXIDe2py8Y7uktv4uOVovhktjnENek33P4CmF3YPD8DuIkDltFD4Ae/omwinB6uDi
         pc5ax5EdRaeh4nynmiIgsJLmELiKgchkw9DAOrDDbFauKGeSLG4O+7eo8VYafu0OnrRC
         R7mTdLIg7TZKkt5o4dO+zeqfz+PFxoPZcsF4IgKLeXmhv8isVMEG4HQSTkADIdocQiUu
         TV17QtZwIySYae6aGjOrE3mUoQIZApwRS+/0kQFTUs//+cs/ira8OdTZIb+j7GkD7Gdy
         LPgaTU5XpHfeeJQr/0PtOfbZjvEWw5nBtHcnewOm9AdY9VdYvH84KZwGTmfMlKDSXjfz
         qWkw==
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
        bh=8GS5aCvSYOFUCgRNbx3dctE5qtJzvpjUrnO7gJP4MNA=;
        b=dtV+WAgCS6wZg8rJECs8kCHY0wMEzpwTvtQKWHLvZK9jZPZVyYIxL/4mhSIqqNmB0U
         U+CNNg67AligIPzp+u1l7V79eP1j5UNQfkJcOIJaRLP6wO3DAiXeL4eMHF0AcIKYCpOY
         xxb/3LBuf1mCZmpGmCDDN9oijPPDxmpvrQViPwdLFkxFx8TKMxMFOWqFHi9KXf5wjqMq
         Y6PeeQBRN87NVqLaKMaP1rQYUQuspgQJdUvFxaF1/acVa0FL0E6SUZfieMWn7CILb//x
         LrNSBgVOuwe7noYhT+hGEjGNZocXaluKaU37+Z58c6VdV08gdOnJyHJokwvgHbJ6l/jR
         +paA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8GS5aCvSYOFUCgRNbx3dctE5qtJzvpjUrnO7gJP4MNA=;
        b=VDzVG9g5kiHQyynk5qhHu2q3epf6Sd7xId0YikXEfXwiiX762+zX+cZQvfIzcv3C3z
         mfqIQolFXI0OeS94fNkzNKBRQSaY9svj5ErQ7w/NDDyROk1iY/qW1pHN5KMk5cEg6Tn7
         rOfKJWrbr/ClCJ1jOTV+uhQIG7p8jVk3djKRu+VCEOoclEC/kTf9p0HDOK3Gd7vXIA1H
         BRP4oqt/EvWFe5MLVCdBhk9UTy7MJauIMQ6GkZwLyWhif0iaYAjzlHbGKuYUZ28xXo51
         Mne0i/vezgodgygSKNzF+vanI9fPHFO4XnAUFQn3Ims/4D/vnHuOqKJTdcUrTd33Bte8
         ahDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVEGVYGiFVhmKuwplGwdRnw79bwAfgkx6eD0iAWn+fh6Ve7neIZ
	3k2SciXePvdn7MqRjz3lecc=
X-Google-Smtp-Source: APXvYqwD2tnb/Ssrqn+wW9L3mUIInNPwDalMaQXHkr5hkr7JN6pEr0gyXZHqcrUyYiWLE5aIb+p2Yw==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr16604737wmi.156.1561393641099;
        Mon, 24 Jun 2019 09:27:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ec02:: with SMTP id x2ls4038753wrn.6.gmail; Mon, 24 Jun
 2019 09:27:20 -0700 (PDT)
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr32409813wrr.202.1561393640002;
        Mon, 24 Jun 2019 09:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561393639; cv=none;
        d=google.com; s=arc-20160816;
        b=WuZ4+00mNYbEiAut84O3V+VKNmwQpOTN23YF2MPt/yIoL7zIpLRQJoz7ONJNDUi+p7
         NBxxyddYv7Pyg0oeBMcH9BleMdX5IT/sRu+FDSYgXF8eW2pcYlRZPOXLTHBZDFQj6km9
         LARDgmEJvJ6esrqRsLiWZUvB7ASOZWemtlAdObI35Q5UlM9EntmMUuDOJU6qC++WxRN2
         1kYlFVlg8lqZtrkddbFbHej6TJztM/ZbBOCTCygg5Ffp/tRQf13sOlzTmawJ9l6ZDMvI
         DTIdH7DWrOkezY1yYGXnfRUZyEK6PyTCRWiWyvRFpakODLeV2coGocWdfrPFDH+y88nO
         vvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=haOVgv5PDVltK+wSYb3myk1WeW2U9KsdL7oMjcV96XY=;
        b=iA/FFfy3hPUuv9/mCDzWLfwVKAIVAaoDxxo6yl7Uj7MbC52Yhk/qkpg82952Ffsetc
         HZfvXwKuQBM2oEOs6cfTkLm4culALhWEcV1i1lcrzh1+XtcAuAC7WYsCwrXyjQAnutOa
         E9urXxLHukYex4UpDJMaLf+coAVYwlrzfbJ1Jm00vMfPDH5fvR0PJSsQ3GdDTHB7KVY8
         hE4UBZvSBVK/J9wdUlXK3gFgkcPBfaDckgOCorwDRoC1IUwqrn8maP1Vd291nZvIwbM1
         FlGuGWfGvqESlIbY/zdMPio97DA4vSUgT13OH0HIMwzIm4O40L05MF8JyDHJ9fzEHXFw
         A3DA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g15si1661wmg.0.2019.06.24.09.27.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 09:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x5OGRJ1o031833
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2019 18:27:19 +0200
Received: from [139.22.39.148] ([139.22.39.148])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5OGRIF6005668;
	Mon, 24 Jun 2019 18:27:19 +0200
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
Date: Mon, 24 Jun 2019 18:27:17 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
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

On 24.06.19 15:29, Vitaly Andrianov wrote:
> On 06/24/2019 09:23 AM, Jan Kiszka wrote:
>> On 24.06.19 14:27, Vitaly Andrianov wrote:
>>> Hi Jan, Ralf,
>>>
>>> On 06/12/2019 03:27 PM, 'Vitaly Andrianov' via Jailhouse wrote:
>>>> Hi Ralf,
>>>> Thanks you for the quick response.
>>>>
>>>
>>> [skip]
>>>
>>>>>>
>>>>>> so, I have to implement the corresponding am57xx_init() and
>>>>>> am57xx_cell_exit().
>>>>>>
>>>>>> Here is the old mach_cell_exit function, but many of the functions i=
t
>>>>>> uses disappeared in the v0.10 version.
>>>>>>
>>>>>> void mach_cell_exit(struct cell *cell)
>>>>>> {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->c=
pu_set) {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm=
io_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu *=
 4);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> }
>>>>>>
>>>
>>> I have implemented the am57xx unit. At the am57xx_cell_exit() I set=20
>>> cpu_on_entry to omap5_secondary_hyp_startup() - physical address. That =
was in=20
>>> the working v0.8 mach_cell_exit().
>>> But I'm not sure what shall I do with the remaining 3 calls:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>
>>> When I execute "jailhouse cell destroy 1" the kernel cannot bring cpu1 =
online=20
>>> and it still in the hypervisor's WFI loop.
>>>
>>> Any advise?
>>
>> Can you share the code?
>>
>> But, again, we will likely need more redesign anyway because the previou=
s=20
>> approach was already hacky. E.g. it was rather fishy to pass through the=
=20
>> WakeupGen page and issuing smc calls.
>>
>> Can you describe the CPU boot flow from OS perspective, or refer to a=20
>> description? Back then, I implemented it via Linux reverse engineering.
>>
>> Jan
>>
>=20
> I just made suspend_cpu() not static and called from am57xx_exit_cell(). =
I got=20
> cpu_up() working after that. Now I have the both uart-demo and git-demo w=
orking=20
> now. Let me clean the code and I push it to the temporally branch to TI e=
xternal=20
> git repo. After that we can discuss what I need to do to implement the co=
rrect way.
>=20

OK, sounds good!

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
jailhouse-dev/cb3304a1-b322-7f87-a67f-3c6f11fe3d7c%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
