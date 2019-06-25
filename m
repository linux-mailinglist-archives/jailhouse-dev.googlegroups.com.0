Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPMFZHUAKGQEWFCNTBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C93553BB
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 17:50:22 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id g2sf8150758wrq.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 08:50:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561477822; cv=pass;
        d=google.com; s=arc-20160816;
        b=1Ksv8rkNHkUz24YVAdSb1GYDMrf/+Q93xqGftbVs+AvUmgIzkPNoRxecbUtPlZCPbD
         REB3jxR4NZyyU8E4tyUSuoKwN2PEGtRwCadpK8H6X9fUPPGiXRXB6fh2R4zftMQMowx2
         MqtWVOEMk1WiF1Ylnu8onbZbk7ICB4V4krFLDbcvxhXWifwqTPKwz/KpvTCT53aYoyP3
         YVjbtBp9tfV8jG0s/FQ7VfKn1wg9IGoLFE9854f4BefHKt2A4Ho8dEegAswzvEfJI7/S
         NlC4UvIGwMjzlRv2QaPJLIB9cNARHOnxNSbXr0yABqOMR8UDVlTYvhRiy7uuTKHrNiPN
         8mkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ZoUznVn83EtfSkJ+U4QcmHyVgQ6VsW7XhKnrgBtQq9s=;
        b=M7T36m1/XbcWuiEs2cK8UPu1l2Pg9layA/bebzJJbonH34r9IufWl1xzovE8LM4ero
         cX9lTnXbMnlPhOrlxPgGRESkVZzVuaIwNCwqXCHQ/V8g12t39FvQpBUyGius8IDw8g6L
         Z5/3L7Hn5GcjiS4QMJJP3NFrL9il1xPu8E1oYZGA0go+GiZsPgSKbvXcJL2UqGpjecpw
         e/Y2JArPKx3OOV32g2DhQFMOHan6Mf+doCEcDchBJobY2+87+Q5V6W1N6EtsNoATqBdK
         +3l3SQVZMaEv8TPK+czXgdvQ2k+0MC5npF4L9IIBmX+/SFPDwboEtUiwcdpLIptKoBAc
         JOpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZoUznVn83EtfSkJ+U4QcmHyVgQ6VsW7XhKnrgBtQq9s=;
        b=WDpNakW5if+/ri7u4YFCQzS/oz/AwswNSHuoyfVXFR+mHb3h9gEfhnQms466tYg3Rm
         FDmYWGLExYrI4zI4E7qrmHdMbgKiYndRrqPn/4a8omfTnMLR+6yzxURYm4MWnn+ulOB2
         PgIQWddLA7DAJIdIEVrCkMFvVBQArWIoq/3Uxl2Z9UKs6COkj1+k1wFarBgUje7lsBdL
         kxB9shFTc5JzHKkEVPG7NidVo0qwgegjE4cNfnjU7F80Vo6/wPNmeNMVxfuD7ezKk6o9
         kTvmO524MtFVA1wuFHHbAK1bI1oJZxkQMLNOnxd/qg95QldRJBAXlZmKgpMjfoHqp2gC
         omYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZoUznVn83EtfSkJ+U4QcmHyVgQ6VsW7XhKnrgBtQq9s=;
        b=pR69So2hJNM/Jm79k/sw6Eh70mEDPsV1SI/xAjq7a9iMWdzMJHfrhcztgM4q3uhbrh
         snC7yIdVd1dIEuvWLgz2L5OwA+WB+XHWQa8VCwpMxAfX9ZA/nmO84QgQuDcPAuOo/Cxb
         8cCmkTIYGF/hWNvfKmgAdJKgOS2OCuosnNYmjWQhuh5sL281pMedr8z1NV/KrahaNZ5l
         zERGByj7owQqDS6R4BCl6LWWkOu9t/57IPhSmNZbKlNAplfhU2VexnKQ7Ov21HNL+ujv
         GKjT7d8Pzkv0k6yB1fqs/iU6tjzp1B3jP71QTJmnS427Reap0QQNz8aFwPLN09p/F4nG
         AKIA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVHTW+lIQ3146kWT218gS1cFSonEca0QiVluofjR6049cLtFZBr
	4B5G78MjUjFtggcUooHi08I=
X-Google-Smtp-Source: APXvYqzsxXxGgFww+Qu83R0wAP8R/logesTTfRWwUpVJ4fu7TBV90KrrmZQKUI/tYRRXL8J7mFbv4g==
X-Received: by 2002:a05:600c:2182:: with SMTP id e2mr20120678wme.104.1561477822148;
        Tue, 25 Jun 2019 08:50:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:94e2:: with SMTP id 89ls4867153wrr.15.gmail; Tue, 25 Jun
 2019 08:50:21 -0700 (PDT)
X-Received: by 2002:adf:fec9:: with SMTP id q9mr39140142wrs.241.1561477821439;
        Tue, 25 Jun 2019 08:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561477821; cv=none;
        d=google.com; s=arc-20160816;
        b=FuBlOacOwGlhnz0KCyQIEX2iw/oryyWFutSjXNNJToN98jj9AWVTQYGTjJOyHBv645
         39Few6+YIYkRGHNT4hte3lGf3hldsFVuwwkN98cs4czyRsTfg7BOdFW5+g6kSWW2qbra
         ROgsUz+jXtSFwR48RxffxIzP+i3C9l7h7uvUeL8HtKUUdZXtV4AVuaMXs19uj1l4fru9
         faXGIj7Wb1lefg7ck/ng1ozrmXQ/VABF80Q/shPWFfKmtn7esA0agifK/UNDqljNef+D
         HCGcgar/iU9NlppyTA+mx68czX9bfnK/FDkRlSMJ6rrYB3rg7jzCuYv76LmB2Jq10JhZ
         aWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=UpnRF1hEg7T+yNqg568625OHZPtivE3OujaVvPGJdS0=;
        b=okbjEYGy5WIWWcfoyJ2K3D/LySMt9/rq75F/pvQskbOa7Lf6PUDY6llgQXfSeoKfs4
         wcTKizkwpBQf3T/I1kT8e/Gr93SUl9iYa36LrsBhdB3KthE+khB8P3Y97j0i84ZjssWt
         /GaqC327QjxUq0EeyTiRn2xXJ8F1rLVKly52vOwkdghGaqr+U0hLenAdz64YywEvWJPi
         nXzd9/P1jN+8N8Ak1seYurH/XY2EUxVfL053qdROvBkH1cW/qxE/C7Q8AiXcGYsMHQ8+
         JX3mOaNqSm457FX0kMifziQz93G7xXl+JZumLvIYG9DytUT+hDU1DNCKaA1e+oZSrR5X
         GVGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id v21si164882wmc.2.2019.06.25.08.50.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 08:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5PFoKT1003612
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2019 17:50:21 +0200
Received: from [167.87.32.113] ([167.87.32.113])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5PFoKuS010436;
	Tue, 25 Jun 2019 17:50:20 +0200
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
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
 <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
Date: Tue, 25 Jun 2019 17:50:19 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 24.06.19 23:44, 'Vitaly Andrianov' via Jailhouse wrote:
> On 06/24/2019 12:27 PM, Jan Kiszka wrote:
>> On 24.06.19 15:29, Vitaly Andrianov wrote:
>>> On 06/24/2019 09:23 AM, Jan Kiszka wrote:
>>>> On 24.06.19 14:27, Vitaly Andrianov wrote:
>>>>> Hi Jan, Ralf,
>>>>>
>>>>> On 06/12/2019 03:27 PM, 'Vitaly Andrianov' via Jailhouse wrote:
>>>>>> Hi Ralf,
>>>>>> Thanks you for the quick response.
>>>>>>
>>>>>
>>>>> [skip]
>>>>>
>>>>>>>>
>>>>>>>> so, I have to implement the corresponding am57xx_init() and
>>>>>>>> am57xx_cell_exit().
>>>>>>>>
>>>>>>>> Here is the old mach_cell_exit function, but many of the functions=
 it
>>>>>>>> uses disappeared in the v0.10 version.
>>>>>>>>
>>>>>>>> void mach_cell_exit(struct cell *cell)
>>>>>>>> {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell-=
>cpu_set) {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm=
io_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu *=
 4);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> }
>>>>>>>>
>>>>>
>>>>> I have implemented the am57xx unit. At the am57xx_cell_exit() I set=
=20
>>>>> cpu_on_entry to omap5_secondary_hyp_startup() - physical address. Tha=
t was=20
>>>>> in the working v0.8 mach_cell_exit().
>>>>> But I'm not sure what shall I do with the remaining 3 calls:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>
>>>>> When I execute "jailhouse cell destroy 1" the kernel cannot bring cpu=
1=20
>>>>> online and it still in the hypervisor's WFI loop.
>>>>>
>>>>> Any advise?
>>>>
>>>> Can you share the code?
>>>>
>>>> But, again, we will likely need more redesign anyway because the previ=
ous=20
>>>> approach was already hacky. E.g. it was rather fishy to pass through t=
he=20
>>>> WakeupGen page and issuing smc calls.
>>>>
>>>> Can you describe the CPU boot flow from OS perspective, or refer to a=
=20
>>>> description? Back then, I implemented it via Linux reverse engineering=
.
>>>>
>>>> Jan
>>>>
>>>
>>> I just made suspend_cpu() not static and called from am57xx_exit_cell()=
. I=20
>>> got cpu_up() working after that. Now I have the both uart-demo and git-=
demo=20
>>> working now. Let me clean the code and I push it to the temporally bran=
ch to=20
>>> TI external git repo. After that we can discuss what I need to do to=20
>>> implement the correct way.
>>>
>>
>> OK, sounds good!
>>
>> Jan
>>
> Jan,
>=20
> I pushed the sources to my private branch=20
> https://git.ti.com/processor-sdk/jailhouse/commits/am57xx-next-va. I have=
=20
> uart-demo and gic-demo working, but non of my other inmates works. All ac=
cesses=20
> to peripheral addresses causes data aborts. I guess that is because I hav=
e not=20

Check - when in doubt via instrumenting the calls - if the regions at the=
=20
faulting addresses are actually mapped -> arch_map_memory_region.

> implemented am57xx_mmio_count_regions(), but I don't understand how I hav=
e to=20
> implement this function.
> Please can you explain what the function shall do?

This function returns the number of emulated MMIO regions a unit provides=
=20
(number of mmio_region_register calls). Yours does not have any so far, thu=
s=20
using the stub is fine.

>=20
> Regarding the CPU boot. As I understand when the cpu_down() is called, CP=
U1 is=20
> not shutdown, but go to omap_do_wfi(), where it is waiting for SMC. When =
we=20
> destroy a cell, CPU0 calls cpu_up(1) =3D> omap4_boot_secondary() =3D>=20
> arch_send_wakeup_ipi_mask() and CPU1 got awaken from wfi. As I understand=
 the=20
> am57xx_cell_exit() shall assign cpu_on_entry address of the omap_do_wfi()=
. Is=20
> that correct?

I do not recall the details of the OMAP2 wakeup sequence yet. I'm starting =
to=20
remember that the way how the guest puts an offline core into shutdown stat=
e=20
made it trickier to wake it up again.

We definitely need to understand two things before being able to emulate th=
e=20
secondary core setup:

  - Is it fine to permit direct access to the WakeupGen page, or should
    we rather emulated that? Even if the only accessed register is fine,
    we need to validate all addresses we expose.
  - Is it safe to issue that smc on call 0x109, and what is that call?

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
jailhouse-dev/dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
