Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBXONS3WQKGQEXIMKDUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61AD741A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 13:00:46 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id o188sf8483674wmo.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 04:00:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571137246; cv=pass;
        d=google.com; s=arc-20160816;
        b=j4ORUEAS3nlwtYFVdfneNaO2tGnpupXYHoBsTBI6LQA3wXeOlPtXm02iHVRK4QFfEz
         R0bNkALMubA0TSqtioHi9TpXWI0mN9Rdw1Wen5LzfF8M0rf7SJMjsiAJ4jlBPfuem4MM
         aIjfvpXQJ2w5uMGALogrFYGW6DPHLXwgJEd4mc2OgUwk2SXCEDHGp7rvA2NxIqR81tPA
         4oAEP7s9S5j3vhEgtpjSWjLOoJYhT6v89UHSS3nmfPmo51CQSysm2cMxeWPSj6QdshcA
         bFrOdtWcaps0XHKTm+yA5lKI3/b+MSGx0Ghdy7CjXBYcoW61q6SlReEb2UQTOl3YTsSl
         Uh7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=ShPTzSveCAmZae8YnIirY0tjUesBxCR/0UpJw+HNCJU=;
        b=K0oj12N1WnIA4k0JXTD+qg6zkwWEItZD5swL7lS3dAwrLWND/9TWcYL0vz/ynWT9fW
         j71WjonUv0wg0fXLvAuhOaXtgWToBaxry/JcxtmW5WoUTrjtagoMIEE5O3uJqfFhCmKH
         xJ5hDbFJUCfhk2ZOkAIRMCUMrsTts0/aenzYrJu1OKa1OWp8/QAb8C4KpJN8eHl+wsHe
         7hiNqlUIScIU4zOP5MG81OmQVETsMVXDehXJfUUJj6FfLvQdO4TADF8ugbNwTHuU/vaq
         G/HCOAZ6D7cJkRJHshytMAQMkG12ldlQ8pQliRfdYk4dcP90htAC4K2z5f/xyZCsOE2+
         0dQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=JBLZIDyf;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ShPTzSveCAmZae8YnIirY0tjUesBxCR/0UpJw+HNCJU=;
        b=TIAullNFEUztNQkgpbntNtYcPsOQt7lT9RztQNHDbkTe6htZWgO6i1+Fsel0zmR2b/
         lZp5XDrzCoa0/2B4CfRhuWwoFO1tn2XgYmZSgNohAikFO8rssPnvlH5lp7atZ5HQ0ya6
         gonrOmb8kZzvmEfeFB56z/CmVj1qwBaRQ4uiG3+c7sWuhaCHVg0YHO/KDVFULfdrGNa5
         MTZY4JL+BC3rbKnZ0bFJx0pJtDakfWLuzrXGBPnsAACJSnLrARlH58W5SqOmxfDCKCg/
         FTUa7KqVbIieUui+i3vwtRxmChFUlVl26beWxw+sQmMSOOWc23fNrwaB1JDi2K0w4yWA
         O7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ShPTzSveCAmZae8YnIirY0tjUesBxCR/0UpJw+HNCJU=;
        b=QWAiu+Qoevhwepi1VPLA+SMTRdkCWGtjUlIEnVeHo5eQuTFCtyQRSsufQkP6TEZKxY
         qNL24RvEAhyA/PZxwruaya5Z0fDVJJ3XZx5/u2W53Dy8KrrkoLuavua2ErvQsuPu5KkP
         i0zWsiLxAnaOVMWtokTJolC4igsD9+5P7/iP8gp2fT89mfOhbEfy6yA930XBgYTbLu5u
         FiN+OJuaN7nLWlHywpF12wnSZ9wqKm3xQzqKK/5PHNETBCbqN6OCWcHJnSWeOgCXRb2w
         8u7VdcZxAC4TMI+rrldvsrWz+tBxxj6BdvalnEjbaGNRBOR/HdXbrFb8naosSx+9JfsA
         M5ng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX701ONEjRi9cwam1YL3EjBIincJU7YxzpOzfz4yGbWXP3zGtK2
	fkS4EF4wU4Z3Q9vNh3ukYcU=
X-Google-Smtp-Source: APXvYqxu9VF9M4nPa0tNXA9VjNPj2IP5Y9+7hJsjAuues89kzb/me5sofP/1tuoqrTJE2Cy4kXR6Yg==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr19065680wmb.140.1571137245883;
        Tue, 15 Oct 2019 04:00:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c8d9:: with SMTP id f25ls7642287wml.5.gmail; Tue, 15 Oct
 2019 04:00:45 -0700 (PDT)
X-Received: by 2002:a1c:dc83:: with SMTP id t125mr839017wmg.50.1571137245198;
        Tue, 15 Oct 2019 04:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571137245; cv=none;
        d=google.com; s=arc-20160816;
        b=FN3ghbJZHLE4rXgLuwll6k4VaDjjAFM1wBRcmaDjuqfuPOhG32E7OGlHwaKs2nx6Nc
         PVbpfsbsMRCRHsZ5ZNIJqPlOAa18vhMp0Os+TcUJ2d10lSDaIhUZnE/bUCUFUIQFd6pF
         41X4GfN9lCrsmGde9b4l8JaGKtU4TCvbQp+29qw5OE0VZx2M5D7auU/qw/lc9P3i8GGE
         5D+Y2ImYiGnCYnv6evcYbov6UUFC4NSFnuC/VcJKCLU95z7UtJsqznmF14A0CoVF+LdF
         8IloSvaJ2n1S+gkAcs4yKx+l5zSGbcFkEEYH7azJoLNEoBXMlwOYH10PeU9nnQYLMPp6
         wpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=JOp7JxENFpVhGgEy8tS5eAyb897JKxpIlza5CIfHDTc=;
        b=p2d89hbPTeVaC6D9CdR5YPVmt9sUhidL8DrZLX8I2qIvbUniWL4BBJefATscM9Z152
         eNoKz/SJ/AIyF5UxcdOm4Y3qjV6ru10Ct1Wh912jpJxjSdPMoibWjzXh7pTM/LciKXBw
         7CbdtMG3tCgfyG91Tq26T9EIl22wG242F1BJAfVzI9Ocaluh60uKVGDJR9zi7fKXSWY6
         pxSee7tUtEXTedliRi6B8uE8iHytC9Ee/xaxZJAanJW+WAFFk9iZ+Aa/yuBUX6yBUlvL
         Cr2QCKsFSa+nLQCEXP3DVQITnk2CnwxiBhHIPAqc+NG1x5BZwVxF+UNRNWL4XjR1seE8
         CwAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=JBLZIDyf;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.19])
        by gmr-mx.google.com with ESMTPS id q137si172437wme.3.2019.10.15.04.00.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 04:00:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) client-ip=212.227.15.19;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5rO-1igPmu3NGi-00M0n4; Tue, 15
 Oct 2019 13:00:44 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH 2/3] configs: Add SMC SiP IDs needed for Petalinux.
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <f47b63d3-5ccd-d993-3670-b41bd9b722cb@siemens.com>
Date: Tue, 15 Oct 2019 13:00:44 +0200
Cc: jailhouse-dev@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABFD6D83-9D51-4C56-9EAF-979D6CA0823E@gmx.de>
References: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
 <9e1fd041-8152-9c4d-c8e4-2914a1adab1c@siemens.com>
 <A5DDA02F-7F4C-48F3-B28C-C31009AE8297@gmx.de>
 <8a18a3e7-7cde-020a-d40b-ddf0f5d07449@web.de>
 <1D8490BB-5C2F-49C5-82FD-9623433A2DEC@gmx.de>
 <f47b63d3-5ccd-d993-3670-b41bd9b722cb@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:J2ZhNpr6mPMUoF5RfoeNU0KB1fcaJz3jONMTYB8p0GrMXqpFZlf
 SMDP8FklocXOuqVP1ByaAzxX10e0iVn52VHLY8LV3iQd9F/InSP3xRAlo4uhAVUU3txRx1J
 1GoIb2qOSe6/swypxyDjfDRNDhtFuhDYWG5zpfsrVW/5+wdExz6XhtJT9KXx0qGyNL1SLUW
 ASgImor5Q9jJrugN0pZtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HYyyLKawfIs=:yG4TLaWYwTr0UhJynXyTDN
 J83Sl5icJZea+qNkiRrqRvhqN2e7fvrPgMyPd/+3QRV6TB0PtQVXjSvpm9MP6PEzDkINcBOfS
 B1o+b0JP1rbkcL5xcbpZ2Tn3xpaTOEXqrfs31RVgBP7r4FjNpGgSoLToF0+yxGt29vpgK470m
 bdb5keolTC6NG9NDXHhvbIi1saOrRan/7FvDtPTgA7sTbkXJ99Foh2Gd9DD1oMeu19A3sbL85
 ybkcFJiBoWxqFt81OSBVvSoUYObprt6oHtSyS4TV0cj4+cZMcKc9kBfIbKCQ5rgHQTqzoxQAB
 wMu3cmBow9bVpxOKb+APA6L3ESscLVsTSQxe+XOuVIQPDcJ5NCD+N/8Ecu8o6sGjFOQUozxpV
 DC2kaHQrh1Bdib+ndIgmc2ETNur7ZeDBvCo4NQAh9psbEMieFF2e4dpiy7zJSDhACDvgXY6Vf
 Gg8TExJJRuMToq9Ml34NFubV+4LYmWaGPL0xTnPNyVyi1xZtemPu0YCOUpn6kwQqqwBFfaCc8
 e5g4LoPA0GLCCaOBadNtmsQtnFpx8E06D27xaIbXbCLCDJM+grNRVUoUdudnLwFTO/VAldBSh
 pO03tf1ebPeG5obnK7XdAREbHgUHKDz0moIv/bClgspEVP6qYNPej807X83k48krjyWk5ujZv
 5JSsb1UKOK5Gs/dIyg5/LcgRclsIhRP3vhEU9S6zHi0YkJLU9tsaJ97nMPkr7iWJAN+6ChIOU
 HC1vckzJungapnOZrn+ezeuf2dKYmsFRWjQIoLKPqCDSdDOjwcKBVfQkjEs3vnOp/7PdXHMGL
 4XA9vAycwbv6AdG6y6CKpREMNlprIieuUFuPwzgiCWGPAHpUpLLgGffzNm4FkzM36GZdgtKQg
 kwpPNH4ccMCCQfWd4YQs3Ll+Bct9ibjS1ClWFwXL8/aBGW2nDbQBNlZCL0HOYEwu/OSdLa7cX
 M8DNX8C35AywMdIgZcHJ1/g46kkwlWAr1Xgr+biGich6AnkJDu/6F4b9Ku/fmY6CYNSTaulAs
 us5mKuLfbNuIUnkDtyfNTyuZL9uQpAS09lJ2aUylJ6f6d98mv25JDjohqKJ+XInNYxh28EiiA
 iaE7BhsfKSpUXpTMfMMAQ8ze45kMYh0mdrtzJjTVB6zXRom69+GOyHEePMBXl4RwlKJkvQTPh
 V46GBB868hd4jjSuHaWdrLtBGhUF+VsvT6LbluqOoy27/ma0YlUcI5JG15vt0ooOrnsKDV3pc
 GW60bUOXYtSj6F+jGAXwC5fvqf9xRj9HTWjvzOwquGES/zCwRZyhcDp266s4=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=JBLZIDyf;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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



> On 15 Oct 2019, at 12:35, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 15.10.19 11:46, Oliver Schwartz wrote:
>>=20
>>=20
>>> On 12 Oct 2019, at 11:41, Jan Kiszka <jan.kiszka@web.de> wrote:
>>>=20
>>> On 11.10.19 20:23, Oliver Schwartz wrote:
>>>>=20
>>>>=20
>>>>> Am 11.10.2019 um 16:31 schrieb Jan Kiszka <jan.kiszka@siemens.com>:
>>>>>=20
>>>>> On 11.10.19 15:30, Oliver Schwartz wrote:
>>>>>> This patch adds the SMC SiP IDs that are used by Petalinux to the ro=
ot cell
>>>>>> of zynqmp-zcu102.c. The SiP calls are:
>>>>>> 0x0f: PM_SET_REQUIREMENT
>>>>>> 0x24: PM_CLOCK_ENABLE
>>>>>> 0x25: PM_CLOCK_DISABLE
>>>>>=20
>>>>> I suspect that this punches pretty large holes into the isolation. Do=
n't we rather need filtering on /which/ clocks a guest is allowed to contro=
l? Rather than allowing to power /all/ clocks or none?
>>>>=20
>>>> Maybe. I haven=E2=80=99t bothered yet, because in my case it=E2=80=99s=
 only the root cell that is allowed to issue SMC calls. I agree that securi=
ty-wise it=E2=80=99s more desirable to also filter by clock IDs. On the oth=
er hand it makes the configuration considerably more difficult, because you=
 need to synchronize devices in DTS and jailhouse configuration.
>>>>=20
>>>> So you=E2=80=99d make both the call ID and the clock ID a configuratio=
n parameter?
>>>=20
>>> We possibly need two things here:
>>>=20
>>> 1. ZynqMP-specific filtering of PM_CLOCK_* firmware calls on clock-leve=
l
>>> 2. ZynqMP-specific forwarding or emulation of PM_SET_REQUIREMENT
>>>  firmware call
>>=20
>> I=E2=80=99m not sure what part of PM_SET_REQUIREMENT can / should be emu=
lated. Do you have something specific in mind?
>=20
> I have no idea yet what that thing does.

I=E2=80=99m probably as clueless as you are=E2=80=A6 I just know that this =
method is being called by Petalinux.

> Do you have a reference to some
> API documentation?

See below.

>>=20
>>> There is no point in generic per-ID SMC call filtering. We will likely
>>> only be able to moderate few of those calls with a binary filter. As in
>>> case of the clock calls, we will have to take their parameters into
>>> account, i.e. interpret them. You pointed out the Xen approach for this
>>> SoC, and that is pointing out what is needed. If not more.
>>=20
>> For what it=E2=80=99s worth, the current Xen implementation doesn=E2=80=
=99t do any parameter inspection - it may intend to do so in the future, bu=
t currently all filtering is reduced to checking for the hardware domain (w=
hich is Dom0, the root cell in Xen speak). As a result, Dom0 is allowed to =
do most SMC calls for any device, whereas all other virtual machines can=E2=
=80=99t do SMC calls - see the implementation of domain_has_node_access() a=
nd domain_has_reset_access() in [1].
>=20
> Ugh, missed that in all those switch-cases.
>=20
> Well, same question then: Where is this interface documented?

These are the best references I=E2=80=99ve found (from Xen xilinx-zynqmp-ee=
mi.c):

EEMI firmware API:
https://www.xilinx.com/support/documentation/user_guides/ug1200-eemi-api.pd=
f

IPI firmware API:
https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/xilin=
x/zynqmp/ipi_mailbox_service/ipi_mailbox_svc.h

It doesn=E2=80=99t shed much light on the set_requirement call, though, as =
the parameters are =E2=80=9Cslave specific=E2=80=9D.

In Petalinux, it=E2=80=99s called whenever a device is powered on or off:
https://github.com/Xilinx/linux-xlnx/blob/master/drivers/soc/xilinx/zynqmp_=
pm_domains.c=20

Oliver


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ABFD6D83-9D51-4C56-9EAF-979D6CA0823E%40gmx.de.
