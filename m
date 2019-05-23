Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRBGEUTHTQKGQETPSG4OY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF9276D0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 09:22:01 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id d207sf1370957wmd.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 00:22:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558596120; cv=pass;
        d=google.com; s=arc-20160816;
        b=p7oLQSjKug46XXYKVynlScSaheNEM8f+uh9NDJO5wgBDp0/cadrAG3l3AudDTL53fj
         3Dzxtk2VMZQOzVHIspBZ+5BhWqYbfCkFUIImpeQBmsaqtrHCRDE9FNw49qffVTMHMq4k
         wsJXZYJGvqaqflCtu1P+N2O2s4VsXnnwYY1QEkfTS7YyzFJTidezYouFIp2xfmG4o24w
         NFuDoBBAkODHOXnM/DP49YiuMOZIJ/Q1prTK/W+4JYRlEHKi7VzsuHDFgcYY4NyoIzWW
         mXxZEJ0vFBp1/xuq5s7XKVO6MoEICFH+mu/1cC2oUNzFmu6xTl8tqh/r5clNczOpz4lb
         FnDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=vaEGDlrGh2CODNt61r4RCzetUMdkFTXzG0vs32R+sCk=;
        b=LpGqcvw0zqTxA8woT/WhKQV2sDxoZMPgX58pHTcxly2mG/ONTomgZF9TJLCeQ7Mq5/
         nWZ2OiBkGqHgs0ms0jWTHawmPFRynGdxAG5YS9VhuyFgcVHllJUUfX5XR0VI4qHw9tt7
         4BnN8OG1vT5Hb/W9SED2C+11HIcFXm/sm9a/NnjdGeRnxzMcZcyyNf1RcEvR6Rd50Qqw
         Y4hZP0YLLtxPFnI2RpmrmpP5iupVgPyZF51zRCJAngjhB2X4M8V9/xLjyR5WaD6YIxgQ
         DO94zZn6S/FSaYx/gxiHWKyOGbq57ALb1rKwxL8bZVUTgW0rcYHJPOySzrE4yE5YIJut
         nUsg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLnhBCr9;
       spf=pass (google.com: domain of jeanne.romefort@gmail.com designates 2a00:1450:4864:20::333 as permitted sender) smtp.mailfrom=jeanne.romefort@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vaEGDlrGh2CODNt61r4RCzetUMdkFTXzG0vs32R+sCk=;
        b=e2Rgf0KEr/UaYcFBy6KGCcdSo7D5hjEW5uLc2Hb1fWznlo2x+YQyQk20EKglUKVEuT
         F5hANxNLqM6jnO6awblbaQWflD9ypSxiLR68eIdj5V0ZFCQVdhqOthoz3fnOUlEBiZH+
         ipHslP2COU3dc+HGVC9Eug/fXLIbwbF2uJspkVO/BlveXpuzeHU8RU9GP5buw5pWGcO9
         6emyHqEoeMiTOUXXMrjCnQdYmhmxr4G8hcwLZUwi/PO7hjk+11SH5e93fRmh4Hg8YuKM
         L/WtEWNliSB6wRrAeG/bknpVJsb2Se4GAcLd2Xc/9m5yetvGyQjOUAXc1UmN8uB5inh2
         5/OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vaEGDlrGh2CODNt61r4RCzetUMdkFTXzG0vs32R+sCk=;
        b=k1+SZ5MnhtrCmKPdpPLPtaJW9nD/0cmMMkUWo3o7RLWVir1TGW1gB8cPp1hW/+V+TB
         lqBjXAZFtuetBubU3nQ8pdglIBhflKM61sloK1sjLG72JJmzelmMWjDt069Pfg5CE5aK
         peg2v9pMgPEf5vQeVko808WMzx+hmDhXFIOkb8nrsoYJwPGp+DF4ndfwyfAlJSst/aKR
         3k5kTkxAoGL8SmHeHtLz5VZiWLQwD+/60PtAvMoghVsGAuACJc0OuJJF3uhDldHlCpu1
         um3mxomwEdCLZsdZewip9CkhdJaV8Fbw6vXg/YqnD0CColeHN2zlg3wK8vRMJl5fTfy2
         bHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vaEGDlrGh2CODNt61r4RCzetUMdkFTXzG0vs32R+sCk=;
        b=tfPP4J2/udlBI4QhPj6yOI789IhDQkPyueESmadVh7AFccr76jc8L3P/ZjtHGLLMqy
         cgP6pj1XB4whAfone817xJpu/NF/sztnHi4GY/4hFQiFAit8YTsWhSoDgxSn86k/IJkL
         3U1eGMa0/Gu0tDSx2PBZvbmg0+gUIKanm9fc+kP/9kz2JVvgX8uc6AWY4MICp7U/D7tO
         7pd37d2kZNVMU7UCWC3expuSjIaTmR1xwg14B1WZcETKKeaBPO5k3aRvfuhrzLR7jn2K
         iqJyc2+HYLepHMIxzu0ltmhWt6zk4WXBMtDWtCgY7fV4bo5Mu3xOrVDMPSsYG47cprat
         GOUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVdSd1lq5j/+9/5RTJt9pcm5O6XWWwtyaM6SZYseZLaJNVetRsK
	84uKba4dgT8QAMxpM8eXzu8=
X-Google-Smtp-Source: APXvYqyTnAO4ShXrkPuZihYYAeDPtU7LJXxd+IphnBIqdoVjgZoTawCdab5RLjg1PHkEmXA/prOjxQ==
X-Received: by 2002:a5d:4f0b:: with SMTP id c11mr20596540wru.35.1558596120762;
        Thu, 23 May 2019 00:22:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4d1:: with SMTP id g17ls1418302wmk.5.gmail; Thu, 23 May
 2019 00:22:00 -0700 (PDT)
X-Received: by 2002:a7b:c301:: with SMTP id k1mr10333913wmj.43.1558596120011;
        Thu, 23 May 2019 00:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558596120; cv=none;
        d=google.com; s=arc-20160816;
        b=m6mo2i2mfEfKmDkvMNnT5sxIVCu47itvGMwuG56I5vNwuL5q1VvjhFi6aER8Kkbd5I
         PaY44pjPQ3jEHm7CwmZ6xZMuDqe0pSzjHdIuehBbDm5bwVRIB4lg4AqLimoD+BWkOXKy
         GlJL6D4M7lVxmKmEofEESuWE1tc12eOPlRIuUVDbYVtKsNOogtlbn4zSUa9ZvsIqPt04
         Sm7ttxrGZAbJNRYq2fjZFZNUqBh7E8BV9Vc8q2uOr6CHiLKwUXIxpVFf8wj4/b+5TgTy
         ZI9w8vBFUIx/WrtqXbOjaVXZIAHbAu/G2i9LaBqF5pv+Pynz/iYk6/iueUctOGLPEZL8
         Qn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=41HUCvQe0gGqRgEJ2hd+x4h/SyqFeYUinHebjAectUs=;
        b=XHCSIpZ6BLFDs8HYG324qbBsMU1byOONXtXSFtXDr+s++piH32oUKxj8eF/4t+lsVW
         03/x3kIOD56tagXqhVvU217udQxGWDoBEE/u4NNxy36S7Uotwnk6lifxRcqY3T3DrJRc
         vIY8KbDC2Ee3iZcsmbUkoorRrvv27qf/PSTZnWaf8i8xmy6b7Y5CQyZ6s3Uccw4JHV1b
         Ax6SF+/Qs1iYf6+5F7Fvb9w3YBxqgNmo5+B8bjmumayJrG4J8LMSYMOUFUr4axsaJKPH
         sFvIWByFJ9d6L6Hr3tjeBZFapEfZLEmSU+6+xFskDcIbcEauSSk8gKhY4AaK8UJEvmhb
         HwyQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLnhBCr9;
       spf=pass (google.com: domain of jeanne.romefort@gmail.com designates 2a00:1450:4864:20::333 as permitted sender) smtp.mailfrom=jeanne.romefort@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com. [2a00:1450:4864:20::333])
        by gmr-mx.google.com with ESMTPS id h5si2423416wrc.1.2019.05.23.00.22.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 00:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jeanne.romefort@gmail.com designates 2a00:1450:4864:20::333 as permitted sender) client-ip=2a00:1450:4864:20::333;
Received: by mail-wm1-x333.google.com with SMTP id z23so521632wma.4
        for <jailhouse-dev@googlegroups.com>; Thu, 23 May 2019 00:21:59 -0700 (PDT)
X-Received: by 2002:a1c:4909:: with SMTP id w9mr11128178wma.17.1558596119722;
        Thu, 23 May 2019 00:21:59 -0700 (PDT)
Received: from [10.77.119.56] (bla31-h01-176-145-73-118.dsl.sta.abo.bbox.fr. [176.145.73.118])
        by smtp.gmail.com with ESMTPSA id x64sm15428795wmg.17.2019.05.23.00.21.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 00:21:58 -0700 (PDT)
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (1.0)
Subject: Re: Unsupported DMAR Device Scope Structure
From: Jeanne ROMEFORT <jeanne.romefort@gmail.com>
X-Mailer: iPhone Mail (14E304)
In-Reply-To: <1300fb12-e2eb-1a10-e950-9f7c94e1071b@oth-regensburg.de>
Date: Thu, 23 May 2019 09:21:57 +0200
Cc: Jan Kiszka <jan.kiszka@web.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>,
 Mario Mintel <mario.mintel@st.oth-regensburg.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D48E8F23-20F7-4588-8B6D-4C15EA2B714C@gmail.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com> <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com> <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com> <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com> <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com> <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com> <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com> <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com> <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com> <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com> <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com> <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com> <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com> <8667152c-c459-997e-42d7-0f908418be0e@web.de> <1300fb12-e2eb-1a10-e950-9f7c94e1071b@oth-regensburg.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
X-Original-Sender: jeanne.romefort@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=hLnhBCr9;       spf=pass
 (google.com: domain of jeanne.romefort@gmail.com designates
 2a00:1450:4864:20::333 as permitted sender) smtp.mailfrom=jeanne.romefort@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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


Hello everyone,=20

Unfortunately I wasn't able to find a solution. As there was no obvious sol=
ution, I changed my card again ... But if you know how to solve my problem,=
 I'd be pleased to read it !=20

Best regards,=20

Jeanne=20


> Le 23 mai 2019 =C3=A0 07:59, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.=
de> a =C3=A9crit :
>=20
> Hi all,
>=20
>> On 5/12/19 9:51 AM, Jan Kiszka wrote:
>>> On 10.05.19 15:11, jeanne.romefort@gmail.com wrote:
>>> Hello everyone,
>>>=20
>>> I'm still trying to get my rootCell running. I have for the moment
>>> connected a serial port in order to have the logs in full (in ssh the
>>> communication was down before I could have the logs). After solving
>>> some minor errors (such as Invalid MMIO/RAM read or IO-port) I find
>>> myself with an error that I can't explain:
>>>=20
>>>=20
>>> VT-d fault event reported by IOMMU 1:
>>>   Source Identifier (bus:dev.func): 03:00.0
>>>   Fault Reason: 0x22 Fault Info: 38000000000 Type 0
>>> VT-d fault event reported by IOMMU 1:
>>>   Source Identifier (bus:dev.func): 03:00.0
>>>   Fault Reason: 0x22 Fault Info: 3c000000000 Type 0
>>> VT-d fault event reported by IOMMU 1:
>>>   Source Identifier (bus:dev.func): 03:00.0
>>>   Fault Reason: 0x22 Fault Info: 39000000000 Type 0
>>> VT-d fault event reported by IOMMU 1:
>>>   Source Identifier (bus:dev.func): 03:00.0
>>>   Fault Reason: 0x22 Fault Info: 3b000000000 Type 0
>=20
> hmm, sounds familiar.
>=20
> On a Dell T440, we have the *exact* same issue with a similar card: a
> BCM5720, pretty similar to your BCM5719. See my thread "VT-d: IOMMU
> exception with unknown fault reason"). And yes, there we have an active
> link on it.
>=20
>>>=20
>>>=20
>>> Is the new sysfs-parser.py the cause of my trouble or is there
>>> anything I missed in the configuration ?
>>=20
>> Could be. 0x22 means that the device is not present in the interrupt
>=20
> We have no modifications of the sysfs parser and face the same issue.
>=20
>> remapping
>> table of IOMMU that is responsible for that device. Try changing the .io=
mmu
>> number for that device from 0 to 1 or the other way around. Or is there
>> no entry
>> for 03:00.0 at all?
>=20
> Jeanne, were you already able to solve this issue?
>=20
> I manually parsed (my) DMAR, and there's a ATSR structure (type 0x2)
> which is ignored by the config parser. Could this be related to this
> issue or can it simply be ignored?
>=20
> In this system, we have four iommus. Mario, did you already test all
> possibilities for .iommu (0, 1, 2, 3)?
>=20
>  Ralf
>=20
>>=20
>> Jan
>>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/D48E8F23-20F7-4588-8B6D-4C15EA2B714C%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
