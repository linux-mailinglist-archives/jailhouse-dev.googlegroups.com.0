Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOPQ5XUAKGQEY4LSGYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B65D2D9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 17:28:57 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id u13sf1369033lfg.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 08:28:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562081337; cv=pass;
        d=google.com; s=arc-20160816;
        b=NvYjDHhid0jbRN+YiO8c48Pa1tITJdXfL8uOqDn1l2La9gSDbNnOTJZyfVQaU/4nou
         INP0SdpDOf2hOqi1ni+kuqtdMuhUBs8eoAuVlysHyEt0PA4/41wErbFl5JH89Gased7a
         rAhtoj2eEVT6JDcwIl62SJ7mDZViLWd7XnODq9xwA1x72O0+toiWrh4RFsAQp5ukbEXj
         orhAdqhtsG2Q/kgZcG1XnVO/pCgYyGscQqltQnjJ9CW5g6sjayT3MEpXq6kF3d97t011
         +T/I9vKtZHaQs8KSB6tv77IXWJISIAQ5On+TWHttW1bVvzHtfhNBsUJ1dMN6zd3u/FbJ
         vxhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Fv8WPA0sgdhLooQIjjguuddEMEZa+fto1t1/3WNk6+k=;
        b=mljNt4wvMLLGEEa4L4vtrjyKYPqoYLjq2TluYeFvRXTvgYTwydENBE0E9S7wsubnSG
         MYti8GqlXGnqTzbSH0Ylb5pVwyIeuNK+r/JyYjvcQLDn7DMNcPaJIyer7Lp511gCv1rb
         I2gPIt9c/PyrlhXvT0p4Dp/8IPnfo5o8CjvfVPq7+i/dfgSVCJBodxJPZsAoQlAQR+Ib
         68P3iDQmYZVhTZT7lDsGlBEwXI8KKLIajkgCgfSfox/c3OTnX62YTasPZBFil+DGHmkz
         jHjBegU/PGH1CAyaDS9pD/kRT+vAnYMNMJpeDDCM9K4CktMzTz8j93aduwKDn/A6L5wf
         sJWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Fv8WPA0sgdhLooQIjjguuddEMEZa+fto1t1/3WNk6+k=;
        b=FaKabY+40zT0U1DHPFMDzRBh+6SOXbfAcOk3dkdh2Blf9LxTkEiVfHcS7+CrPCW9AT
         vQ2WNvd/RiUwSDjJSpclSDuKaT2juA4tdLayA76RWHE7fysO/ybNl+OqwNUUqQeGH0rA
         v0vqTn/k6NDePtCir0SrUKZ96CI/odztbNGBOAeQ4VhEsszPUUZLQLTc0hnwSeA3cOvm
         NZdMQKk4Iz5wjHYl1I0301lUwq2iON+8FMvIKZCtcQmW4eL1sVrox2L8Nut3vzm+yBFa
         f6yyeARv5wE2/CNunviMN/Irs/Dg14NJfgMjlrrR+9yEzsSRnjycqTw/pEbYIWcru9qc
         rNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Fv8WPA0sgdhLooQIjjguuddEMEZa+fto1t1/3WNk6+k=;
        b=EggaxTyX9g9LYP42ejHWqrtMIrBk90kQZaJxs3aUmPJjVKcU4qZnHhz1fX4OL7KAyp
         pelhV6qndoaR1108lXu1Ln9+Ym6pwCBR996QoKR3Lc/PBdlUIPUR5Ybnh4jo3kEhpi7Q
         uwUfLlinkHSSyWY9rypaHCTGbqlylB81pNATPpCH/+uXDdXUqzcLtWIueViW8Opctv72
         0J/wayrhRkenI21VFXH1PqWXyO86sT6BtBRJooDCCZZknM+IQjOxKoT+t7b35fXWAlXO
         QHFLn1SDYf4zc9QdExiomwOtg4sim+3y25boYmtqj305vuHVPpODt2AR3wRG7WHEbs/j
         Ebjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU1kR6RF+UGeEVZ0oG0zgY2GE6CYLOesHqmWxfWxG3459gccq2n
	jQpnMPfxbfkyWCMT88swWfM=
X-Google-Smtp-Source: APXvYqwqlDH34DZhSvbyfE8hc1K3Q6n36zh5Ad0f82sRCsREjwRfmecqmlPhvtdaujQnKyF9auHUXQ==
X-Received: by 2002:a2e:9754:: with SMTP id f20mr17614035ljj.151.1562081337498;
        Tue, 02 Jul 2019 08:28:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ee0a:: with SMTP id g10ls1104946lfb.13.gmail; Tue, 02
 Jul 2019 08:28:56 -0700 (PDT)
X-Received: by 2002:a19:ae0d:: with SMTP id f13mr14576232lfc.123.1562081336787;
        Tue, 02 Jul 2019 08:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562081336; cv=none;
        d=google.com; s=arc-20160816;
        b=n/EujPcYQkULjZUp+7kmevkxQfxXZR+2RdXbZNC/BQtBlbLgoWxQUnffg85c/8C7Xw
         +6gT8PUs8MszlG0b/mSbOPUnGfxClw7lLWsk04DnVKuneFUczP/CYBuBHToTpAhSjnLn
         VCXEDA9bRoT6MYJKrdKwYB18emkJiykcz8bOKp1eV1DvGsd/IpFa9jQCGreYgYtZOK1Q
         DNpPWovd9fSioCWqjRMt2cvsQMjYEAsPnRU0S0dBKqx5JQjBeX54RLAPlW0UZVLsvQni
         Gz+LfUeeZ6+JBKkA8XQRKSO0RNCGcxbtptgf9gBqft6lOsVyLPjDM2S+eY0eEcY1L2Tn
         IxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ePy1PeXXwMx0FLLolV1NaYhB+VL/F7Fz3pEmsTIiRbE=;
        b=kdK9U1riNZuhGzCR7rTd39yhBei8DeL4DpssYeCehL3iVE8/m329rvNib1fDCLAnqF
         umuuHHfERCXGJy0p1jiI+HPbGtRJRl9jtBkLAV3PuzMrZe8fPbe8l1VMN3ZEhItoQ8Vk
         n9L8gfhcYApQMEn8Dn114NsFa/bdmBknMtbmw4FgiYAXV5J9wM1azFdws3fKLi3yD5K2
         hk5bvYB6MFC3QX+iP0Z2gWzA645mLB2d5Yk3oqe0PFQ7cR8pVjeI2S/A6o1BmXq1ZJtQ
         uZ3cy0g0LmuvHZt0Wf9Ol7/cGPIoQZsZRqtQ7ti9oaXSc1D+zmMhoDOcm3xWoz/Z0Rhl
         UOnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v29si855565lfq.2.2019.07.02.08.28.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 08:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x62FStfZ024189
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 17:28:56 +0200
Received: from [139.23.114.160] ([139.23.114.160])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62FStDp017716;
	Tue, 2 Jul 2019 17:28:55 +0200
Subject: Re: [PATCH 6/6] arm64: iommu: smmu-v3: Add support for stage 1 and 2
 translations
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-7-p-yadav1@ti.com>
 <47206b1b-aeec-d71c-6f4c-9b4680282ef7@siemens.com>
 <7e76f0f4-f9b8-12db-1dd7-dc63ee7a2004@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <17e77e2c-5f37-4532-858d-04fab20d9ece@siemens.com>
Date: Tue, 2 Jul 2019 17:28:55 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <7e76f0f4-f9b8-12db-1dd7-dc63ee7a2004@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 02.07.19 16:57, Pratyush Yadav wrote:
>=20
>=20
> On 02/07/19 8:12 PM, Jan Kiszka wrote:
>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>> A System Memory Management Unit(SMMU) performs a task analogous to a
>>> CPU's MMU, translating addresses for device requests from system I/O
>>> devices before the requests are passed into the system interconnect.
>>>
>>> Implement a driver for SMMU v3 that maps and unmaps memory for specifie=
d
>>> stream ids.
>>>
>>> An emulated SMMU is presented to inmates by trapping access to the MMIO
>>> registers to enable stage 1 translations.=C2=A0 Accesses to the SMMU me=
mory
>>> mapped registers are trapped and then routed to the emulated SMMU. This
>>> is not emulation in the sense that we fully emulate the device top to
>>> bottom. The emulation is used to provide an interface to the SMMU that
>>> the hypervisor can control to make sure the inmates are not doing
>>> anything they should not. The actual translations are done by hardware.
>>>
>>> Emulation is needed because both stage 1 and stage 2 parameters are
>>> configured in a single data structure, the stream table entry. For this
>>> reason, the inmates can't be allowed to directly control the stream
>>> table entries, and by extension, the stream table.
>>>
>>> The guest cells are assigned stream IDs in their configs and only those
>>> assigned stream IDs can be used by the cells. There is no checking in
>>> place to make sure two cells do not use the same stream IDs. This must
>>> be taken care of when creating the cell configs.
>>>
>>> This driver is implemented based on the following assumptions:
>>> - Running on a Little endian 64 bit core compatible with ARM v8
>>>  =C2=A0=C2=A0 architecture.
>>> - SMMU supporting only AARCH64 mode.
>>> - SMMU AARCH 64 stage 2 translation configurations are compatible with
>>>  =C2=A0=C2=A0 ARMv8 VMSA. So re-using the translation tables of CPU for=
 SMMU.
>>>
>>> Work left to do:
>>> - Route event notifications to the correct cell and identify which even=
t
>>>  =C2=A0=C2=A0 needs to go to which cell.
>>> - Add support for IRQ and MSI routing.
>>> - Add support for PRI queues and ATS.
>>> - Identify which cell caused a command queue error and notify it.
>>> - Support sub-streams.
>>>
>>> A lot of the work left is optional features that the SMMU provides like
>>> substreams, ATS, PRI. There is little reason to add them unless there i=
s
>>> a use case for them.
>>
>> One quick question again, I already had it for the RFC round: Would it b=
e tricky to split up this patch into single-stage only + 2-stage support? T=
hat would allow me to asses the additional complexity we import by adding 2=
-stage support. Or is 2-stage support inherently coupled with the SMMU desi=
gn so that such a split-up would neither make sense nor buy us anything?
>=20
> I considered splitting, but as far as I see, stage 1 and 2 are rather tig=
htly coupled. If you want, I can split it into two parts where part 1 is th=
e defines, data structure declarations, and initialization. Part 2 will hav=
e stage 1 emulation and stage 2.

If part 1 will get away without emulating/intercepting bits of the SMMU, I =
bet=20
it will be a win.

>=20
> Let me know if you'd prefer that, and I'll send the series tomorrow. It's=
 getting late and I'm about to leave for today.

Sure, no hurry!

>=20
>> Background is that the majority of use case I see will not need more tha=
n one stage. I particular, you have no need for 2-stage support in simple b=
are-metal or RTOS cells, leaving this only potentially relevant for the roo=
t cell (or secondary Linux cells). If the feature is complex and can be dis=
abled, we could skip it, reducing the code size.
>=20
> Hm, as far as I understand, stage 2 should be always needed because you n=
eed to translate from IPA to PA every time. Stage 1 could be optional if th=
e guest OS handles the scattering or gathering of the buffers. But don't yo=
u always need to translate from IPA to PA (even though in case of Jailhouse=
 those translations are almost 1:1, and IPA =3D=3D PA)? When would you not =
need stage 2?
>=20
> Anyway, most of the code is setting up the SMMU and the data structures, =
and stage 1 emulation. Stage 2 only part is very small. Removing it won't s=
ave you more than 10-15 lines.

As noted above: If eliminating guest visibility of the SMMU helps getting r=
id of=20
related emulation and interception logic, I'm sure it will be more than 10=
=20
lines. If we need 2 stages configuration-wise in order to use the SMMU at a=
ll,=20
those 2 stages need to stay, of course.

But I'm not into the details yet, just deriving from the history on IOMMU o=
n x86=20
where you started with 1 stage (what we only support there so far), and onl=
y=20
later on a second one was added in order to allow guests to map hardware=20
directly while isolating it under own control (e.g. protect against=20
userspace-mapped devices). The latter is a bonus feature with use cases, th=
ough=20
not yet in Jailhouse context.

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
jailhouse-dev/17e77e2c-5f37-4532-858d-04fab20d9ece%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
