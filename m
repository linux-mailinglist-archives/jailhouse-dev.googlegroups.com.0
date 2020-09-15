Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIUFQL5QKGQEGSQIZOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id B960B26A16D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 11:00:19 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id q19sf791900ljp.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 02:00:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600160419; cv=pass;
        d=google.com; s=arc-20160816;
        b=z7UJ8UWYhbYOgsey6ko2cGqvp8g5f5RSko7DTRj2c7V15Bv01yPRET2UnNzG/ZBY+V
         RC/nzbDFYcGY218oTC+jiOEvA+RoXAfCkaX+nwieBqK8j8Ok7t1fH1dH+BcHQKoBy7e7
         PQl0xbfJ/ck06Yn31stZmaCSfwQHIk86zgoo1bb4Bz+s/xefhkQuuagDJvwPwpTotulx
         PA//HOBGpvwq/52NuG8hISQcrbwpXKNwHKgyOxzfAY+Fnk+0/F2eJT9vsY/3BxtZCivF
         cwoE0ORI/mu7KmtuEYKMpnHm44Om0jiNV8YRh33DK02ul3ImLJWcgLgMLHLX6YrD8XPW
         EEBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=lccN+mAydvzDywBz+5pZ1mu5CVNbmrA1vS/kbzMnY+0=;
        b=Vjmx2oKcfOhPZ5lCYQxT63ljPM6xKNItPyGXgzFSKlgHbJygHmwUj0PGTWgaSm1439
         Dn2aUlAnP00duDeFblPp2eTOdVHPuZyZS+ELoKANRNY0oBQMEmypz5y17X5oOMHWPgJj
         KGwWqGA0Zsxnmq0SQY8IMhgXIoWU25vh2BYPZJvobyg1dYI40dfRYweszWczUbLUzjr2
         5nSFvVm89UL3muFISDbd/jDCdXHNb+rzFgxFfjOnJS0LnmCMf9I3ZVofGwZ8YIGoTAoa
         n+25fO9ngMysKDS62UIDYe2E9sSX4S3IV0wIBYyk8cnppGJv58I1dEJTydyD3kHrm7pt
         13RA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lccN+mAydvzDywBz+5pZ1mu5CVNbmrA1vS/kbzMnY+0=;
        b=DN07eUpJMzaHyBobabNyL8kxMYrZ1EE2vbZZ8HnwCjNtOlHKNBfglTw/FrRx9LENGW
         6XTNuz4Tc/9zSGX7V0gz4nGOpx/C9HI12hhpfqaZVeFJtpywPgPpVWHl9WcYk8ELDh5D
         Mva3DmuF7gmfoZhG1YRl6sYMMbU6uAVna9kD+6C/QFYnRMmSnVpF3IQg2nB7T5qQSIPo
         ZnKCfV+kBWDsFJIFULiDtahxcMK8z1Rs3g98lu0z6o2gmg+Nj61wGZjpeGS0lphp/CoZ
         zFsZq7iV8SdFpWTYZONrgYv4TA7V+dswnHdW90R3Vb9mRBj3JH9+XN1pKrsFSiuEzmZV
         4iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lccN+mAydvzDywBz+5pZ1mu5CVNbmrA1vS/kbzMnY+0=;
        b=J/hRJg818dvP3ym58LxDPc7IOFobP8v932kVgiOjYzWqYZEG4KhRLQUm8jVmaRjakU
         bxp1UG+qV9UAEbPaqHTG2OGCoH6N4Puyi04LQm2Wjao1HJ0CW6T6HImVx+gzsE/0TfM+
         jQulmFa+xelu4RcmocFX/8utzJo+SV2iejcm3pXSo8J36Xj1OobfBH5OWv3fgteMuZ0z
         loXIVwEfAijmp7oQef/E9aOz0U9dOfzgVk/Csy0miiP69oIpykIGF/gIB35d9oWrf1U4
         MQ+xIfje3C+zigiapHRSUQv2SJqAAZQ+gL6iutnkhxoozLvYmLZXB/HZnbOOAiTq7+6U
         CskQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530bmWxBRDYl+7IWEBUiKutn2LuLq7ja8tScfLi7cAgsnV1rY4MJ
	f/ER2fQDSehXmVGVo6fp5cQ=
X-Google-Smtp-Source: ABdhPJyM05Yayk18Wy+M4YxJVKOZczH6CgOM81uL0uM0ERL9SvqhvfYoRrTZxfYQNEHNfkyAwRRH9A==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr7063771ljg.164.1600160419302;
        Tue, 15 Sep 2020 02:00:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls758324lfn.2.gmail; Tue, 15 Sep
 2020 02:00:18 -0700 (PDT)
X-Received: by 2002:a19:e20b:: with SMTP id z11mr5634942lfg.440.1600160417935;
        Tue, 15 Sep 2020 02:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600160417; cv=none;
        d=google.com; s=arc-20160816;
        b=GUSLwd2sBoLOwX4haKl2f2iXK1OT9glCBiR4vXXXtFyfIvDUIKGskeYnjs+tpFeO5B
         7NRyyC3W91o9536uEW78G9l6mtIXMEJ0Vki3Ru4mzqyGIfM9PXI6fbsfzy0i3nUkypFh
         cYEx748hA0SrXjIrLp2nLoU5iNKbXhTTdb3t8ZhTzsrHUAajBLva9P8+PnY5aXc0f2Ku
         CyP7WZONymLN2MK1PsO8g2VLQSWZHvl/iAk0KU+xS5pHNU58IAcFzuVyh2lLb7MUrric
         tF6bFavAEbeBgPkcwHcpsILgW9epct43Umbhi0QnyC8P7vkIz9O1e1UJ70Pok9wLqZ8n
         1qwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=SvVFYghO6LiVWiazPO5nnpCV8VN3V1UXU2fXHa+jsQk=;
        b=Mi1zzio5Le+jtwefU1RBoirO9vlpMCxwpqnVVe7cY9aRHgqEUmkIX4GYH+Z8b9wLwd
         uamT84IJaIlma+8rqm4xhBMiVKC0x7Pqv2IIN0+qBqOHohYOJ7RUH4WdpKG6Dkb+UDfX
         yUIN9JfKbA1ElrVUYccfdFk7vMMhuD/RtL1rnGKdVDw/ig5PM32nh99XUHiorK8Z0Eqx
         YiH0+J5iTq90m8yND+Wlr7A2Yeul07dPlesbllEfqEkH16qu1CArOlE3JKcyPxjtqP9p
         ajd8ePB3LBhP9Qnj7E48bsZ8MrVfgRkunJr84e/2lj4TUA+4ZZvbTwuTv2X8gmfAxoC1
         Qi/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c20si77162lfb.7.2020.09.15.02.00.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 02:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 08F90F9B026894
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Sep 2020 11:00:15 +0200
Received: from [139.22.115.152] ([139.22.115.152])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08F90FiU024173;
	Tue, 15 Sep 2020 11:00:15 +0200
Subject: Re: arm64-zero-exits trouble
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
Date: Tue, 15 Sep 2020 11:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
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

On 15.09.20 09:07, Oliver Schwartz wrote:
> I=E2=80=99m currently trying out the arm64-zero-exits branch and got stuc=
k.
>=20
> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=80=99=
ve brought ATF up to date and patched it with Jans patch to enable SDEI. If=
 I don=E2=80=99t enable SDEI in ATF everything works as expected (with VM e=
xits for interrupts, of course). Jailhouse source is the tip of branch arm6=
4-zero-exits.
>=20
> If I enable SDEI in ATF, jailhouse works most of the time, except for whe=
n it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 results=
 in:
>=20
>> Initializing processors:
>>   CPU 1... OK
>>   CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/arc=
h/arm64/setup.c:73: returning error -EIO

Weird - that the SDEI event enable call.

>> FAILED
>> JAILHOUSE_ENABLE: Input/output error
>=20
> I=E2=80=99ve seen this error only when I enable jailhouse through some in=
it script during the boot process, when the system is also busy otherwise. =
When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>=20

Possibly a regression of my recent refactoring which I didn't manage to=20
test yet. Could you try if

https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b08aa=
65a456255f

was any better?

> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99:
>=20
>> Initializing processors:
>>   CPU 1... OK
>>   CPU 0... OK
>>   CPU 2... OK
>>   CPU 3... OK
>> Initializing unit: irqchip
>> Using SDEI-based management interrupt
>> Initializing unit: ARM SMMU v3
>> Initializing unit: PVU IOMMU
>> Initializing unit: PCI
>> Adding virtual PCI device 00:00.0 to cell "root"
>> Page pool usage after late setup: mem 67/992, remap 5/131072
>> Activating hypervisor
>> [    5.847540] The Jailhouse is opening.
>=20
> Using a JTAG debugger I see that one or more cores are stuck in hyperviso=
r/arch/arm-common/psci.c, line 105.
>=20
> It may also succeed in stopping one or more CPUs and then hang (again wit=
h one or more cores stuck in psci.c, line 105):
>=20
>> [    5.810220] The Jailhouse is opening.
>> [    5.860054] CPU1: shutdown
>> [    5.862677] psci: CPU1 killed.
>=20
> Has anyone else observed this? Any ideas on what may cause this? My gut f=
eeling is that there=E2=80=99s a race condition somewhere, but it feels lik=
e looking for a needle in a haistack.
>=20
> Finally, if =E2=80=98jailhouse enable=E2=80=99 succeeds, a subsequent =E2=
=80=98jailhouse disable=E2=80=99 followed by another =E2=80=98jailhouse ena=
ble=E2=80=99 always hangs the system (cores stuck in psci.c).
>=20
> Otherwise, once =E2=80=98jailhouse enable=E2=80=99 succeeds the system is=
 working fine and I can start, stop load and unload my guest inmate at will=
.
>=20
> To make matters a bit more complicated: My system is based on Xilinx Peta=
linux 2018.2. For various reasons I=E2=80=99m stuck with the ATF version th=
at comes with Petalinux (https://github.com/Xilinx/arm-trusted-firmware/tre=
e/xilinx-v2018.2), which is a bit dated. To get SDEI to work I had to backp=
ort a number of patches from later releases. I am quite confident that SDEI=
 and EHF handling are now up-to-date with the master branch from Arms ATF r=
epository, but there remains a chance that I missed something and the issue=
s above result from something in ATF.

OK, obviously that different ATF is another critical point, also in the=20
light of SDEI_EVENT_ENABLE failing. Can't you get your board running=20
with the upstream ATF version, just for the Jailhouse test? Then we=20
would know better where to dig.

Jan

PS: I'm planning to upstream the SDEI patch for the zynqmp "soon". I'm=20
currently enabling an Ultra96-v2, and that shall receive the feature as=20
well - via upstream eventually.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e0d4c689-8cc3-afb0-5a75-b57229feba1f%40siemens.com.
