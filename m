Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBRVZT7VQKGQEBHG7XEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B06A1C70
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 16:10:15 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id l15sf2249626edw.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 07:10:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567087814; cv=pass;
        d=google.com; s=arc-20160816;
        b=ffrcY6X+pdoIMREQyXsSsWYTj3Swr1NKf+wwyl1IyKNXGTqhSjrnIWekZUfJCDlEuY
         Bl/Ijd2sseP+UHeHRsMpnelUs7crNc1syE6G7a2RDh1R51GozJeEByDWs/t1yWTN7HuR
         8Y/ieXzZw//MNdaP+DxAoXlHSMKImS4AZKycQfHVncEUrUeZxSxQX9lnMG3qhqpHq3TR
         bP71NbtXh4PzNTUu8eD7q+t7C+1UhcKTWQZFdAjucgtCevhzgkd/8y/08InCQJnIcJKk
         e+L6ZZffMPOiFFHIBOz2hVb3lxlLVMgSLjrLoGvUm2EmFm8UGjCDblHdKiuDnmyUe6Wh
         UP/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=K3F6LP7aaDqkzFsS1SKzhAWSu/ljR68/oUv004RzBq0=;
        b=YRzH/RwIq0mZCFU8QXb2SQ5diIYVFYBfS+mdhE59ciMBD4l78OVeGNATaWKe3OTs1G
         i2mRhEDSHmRtVWmrVjUN2Wj1Z6C7FglfGKyiHokEanyKwjBtzFc7bDV3mxxTlHggxU6M
         Q0OE280BpBHyo2m29oze7+JB6PmOuNCpm27V8k0g2QoPmtbQwmyHy7A2KYSgBrn7GYGD
         em/7eRhOLFaMVdK/uVg++epHR6GpNB7GfzUPw8NvY7Db7X5R1GF1Pqx3Zd3emx6fsWxd
         cGiQByLfoO0HzDWD7QTxjwcMF3KJeBainsw1zo1y66rhNUMr3wBoQXNE1ADWqskR3SCN
         HfvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=RhkiSJ+z;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K3F6LP7aaDqkzFsS1SKzhAWSu/ljR68/oUv004RzBq0=;
        b=WRKBcpzdSnJqgi/zAm30D3IDFG0mo5vhlOMpgMatJrUetE+tUa983RLijAuICXdK0Y
         CwQ1uaLLcRhrq9EvmKRs0EwtdOss6obAu1AYWY3pzs/iZtGgh2OGDMPqBvKIfydrCj/g
         i6AINn0Wp5wZpQbd9YF3Sv/bEEINgEdBPy1sOGkXnZP3hA5G3bbRtG0C7Fp9KLrBoVqg
         CYBNhn8RKZ6YzPwReT5ckh9y1BXF+LOYX75RrHgPVqjUpZiltAXMwCwa6jbaDGHp/GlO
         xeF/ILIJf2Zawb+vioH4TDxCo9e69pNIfo01p6feAV/KDYT13tNG90zwKN6Y+a471z6H
         zneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=K3F6LP7aaDqkzFsS1SKzhAWSu/ljR68/oUv004RzBq0=;
        b=BfkzOW1Sjp665xOuBLFOfz6CO4YX0Sc40yJTKAFWSAnS4hNoG8B8eoG542roRETPnZ
         ZIJYHdk0/BPl8EYIWmG1CChAT1u1uReBZasTHQmNdNLVifqdR9CQ0rsJcP9cs5ok8Sxx
         PXQ+Wlg0gseT+cA1eGJVS4z9XIrq+VasiPVxzZ7nT8boHCxv+6NyOH+VEN6ub7m8xftn
         4IQALlCro+U6tS5XEDWD4jqiGHgRuham4AZB9RRReP0IIgzHSHYyKjruofH+bXANzCen
         XC4Samevu8czkqohwqkkzt1E1Aq0dKeP8EEuTZVskHTdCQC6wmiRQENbPCqBVPa5IbM3
         dNQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/FTSQ5v1Qe6qb9ZzFpJU9NSD6/aTPvg7pejs4CXXOF3fUI8Eo
	8D6CSLnemL1F6c9zaJBLdkQ=
X-Google-Smtp-Source: APXvYqxtgaH+fJRzA7LMNMRxMi5omypeaiIgZc9XqADRMqHLJGl3x1OuUPwTvm3GnLqbm/P12/l3Rw==
X-Received: by 2002:a50:884b:: with SMTP id c11mr10026106edc.138.1567087814743;
        Thu, 29 Aug 2019 07:10:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c75b:: with SMTP id fk27ls21599ejb.4.gmail; Thu, 29
 Aug 2019 07:10:13 -0700 (PDT)
X-Received: by 2002:a17:906:191b:: with SMTP id a27mr8486929eje.84.1567087813868;
        Thu, 29 Aug 2019 07:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567087813; cv=none;
        d=google.com; s=arc-20160816;
        b=h7ZFvHGIQSE9eicD1k/256FKiICiLAVEvN1Jr4jU67BoUUaIAfSyJ17PTdLa40OHam
         XIqyjAGYWtgAI1vl2HBNJELLtErUUSquCiiN+pQGXpmDsUm1YjnwR91rP+aN4/YOqnSa
         ctzRj41Nw8gVWmskGrNa3967PsrEs49F0JdkhxS9aNTe7ijf+cIMT0EidcZr62viYfZl
         s+rqd5GkGN41JZWe4PEcxHnZJYFaskn+oguQXoAQZaqi3UM3CjKFiLj4s11ANA16Sjbl
         j8gEuoH1pHrapcGajzOWX3wAl+kSN2++HGZ8axqgzrJumb6zOUtyrtPvxx4J2wsQixhz
         3+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=0Vw6i++9XCNPSBpmpSE1FZZkKjc2INqRWeDHn2vXhT4=;
        b=L6KRdwgo4BwI99f9Ccr2/uK90VKdFmQ9hVR3oZxYjB+3V69bjP2r4Rq+Ljx193aFN0
         jsqoML2VFnSJduLWQPYC9Jw/MYZQZwEd1PFLvygGp925MValbk+DO3OUu68HojZ+U967
         /Ud8wB+Yv+2n22jFAwr13pUM/vIs+v8yj6k0P2Fl+laJn7rmeG2QNpSSfMm5PRmZtZXI
         XarUM6kBv5wSrDAcBon7et+V0U6dVzbcXhW7btmdDtKS2khaMU+ZOyfXzoWsYIboVPV6
         UX0kXLsiV4zT6TRcuI2hRpIsCoxeAg7xQsgDSb31sH93BmL25JD61Uon+bDIqVNaql9w
         QO3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=RhkiSJ+z;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.15])
        by gmr-mx.google.com with ESMTPS id m29si170737edb.3.2019.08.29.07.10.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 07:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) client-ip=212.227.15.15;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M8m7Q-1hvf691Gay-00CCSh; Thu, 29
 Aug 2019 16:10:13 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: IO access in jailhouse root cell
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <8d357767-95eb-eb14-7c0b-785f532e0023@siemens.com>
Date: Thu, 29 Aug 2019 16:10:12 +0200
Cc: jailhouse-dev@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <99CD5EE5-DE59-4EE4-BC0D-73CEAA506DFE@gmx.de>
References: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
 <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
 <7297AC93-068F-4C6F-8486-222D62F7D1EB@gmx.de>
 <a77abfcc-9856-0797-caed-0c9dcc62b07a@siemens.com>
 <EEE90634-7719-40E0-8AD6-056999F8EEF2@gmx.de>
 <8d357767-95eb-eb14-7c0b-785f532e0023@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:+Co1aNYnQu/a3f+2IRzDlMolyliYrKDXcHdHvNhvVvfBZ2RlqJ9
 RUVCh36izIm3eGy4OELSwx8M2vck0jQVyqtZ2JUZ10BVT1JEyJRr6PMiZl+IcbSXxsBfJ0V
 7cRJ/T9uqWdRv6gJnKcjX1MLAP7RVNR1pBHrNUGFGj+iVzAZBHOAxR7OlnBDbDt1h2enw0x
 flDcNXV2ri4URT3mPVNeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kt1t8kuLN+Q=:8pl7F4h/35if2/7aJycNkL
 lZCs8VieSRc3PmieqDRMrLKObhzwkWNbx2lC8Y60aGZWsI9kHI02+2MCKLvuAvjhEu7BkpOPk
 Af9/qyIFClmHwbvPyrcJSih/kjGbA9my3KDWB/Jkf98fvBYndd4wjCFGbjrU4kD5bVME5K6rD
 MQ4g5RL4nOojUwuq6MFT4ZTakLmx0dYtWLdbTAHoFYn8fAgzCJ7gUnxdL/m0mR7EdwOsL26C0
 qDynTWKlP1VfqSP4bGoP9/3xEN3RIlumy6+hcOe52q0cab1o7Ct1wC5fHYAeOlt1Dbjq9nMN3
 trcBcir5bwG7MAbquyM0P9xMxh46EEXDmrhbEk24bsfOxToiWIZEqnQmZZU/HlvuX4HNuK2a6
 OhcAUWoDd8p6RPXbB37MCax2pyot3slJEeL4GXNI7VPWghH64W8lczVqg/tz3Dqm1Gck22XB5
 t/lvzYBl9U8ENj/Qzzk/z4bDWnyFHBM7yAx+sDpdKYxVXSu8UK14pEqgpiq6mVMGyj55CiMs2
 0S3cU2mE642TFXh4QXZe+8JOzBiZbAoDKZ7a+nuvcliFmZbjCn6do+Jnd6tgIop/zxYJUJEvR
 kaWjYremSYHbRehH76xcHbKmt7SpENIMZ+HyCd6MMkA940HbF0WCoLf+g8hN2gYw/r6AbEaGs
 fM7y4iJtDKMlF519ybI6PaHRdRhQgVQBlo3La1ElgoKvsTcW8XmKpDy4zZmTGq+JGObR1SP9Q
 Fv9s8x07LpIiEY2ZM4tl9NQHFpuoYRavwPHefvMFTCVp9iLuwakxw7gEa0o+7OWa5mCKU+RmN
 0/GhZZDsr0MajdMs01X4ReXxl7OugA7f1CyUKmjPAiauAweNrEoPqjqX+X+CVtBSJV1ZmXxYk
 XDYyMboX3oPO3WgaqSgP+0bskVUHW0Y8jAwSdR6lR63/m+ZaVT2Kctxacjx6npiiXmnD6uQqw
 3H75IUq+fPcZS02mWvhCuRyiGUtKpAuNTY4ilckjkYfDJ+diI3Tzecq+xQFumEHGoPrUkO2Yg
 7d2kvnzYZuf11Bg0U8Ljh1p2hvNIRmiN1iYRYaQ4VL99aY128qYAIC4H/zGNiw1u9kZPps53A
 YG2XwqPQSl/fzGn7n5xx2BbJA5sJZYPx8ftLrnMK+y+tU72VM5bah0FNuUAI4tha2JYq9YhjY
 j5iiAuA1YC2Ji8L0spx38qwBvqoTrPXOtUYI6cGHp9VR+Ldg==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=RhkiSJ+z;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as
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



> On 29 Aug 2019, at 15:14, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 29.08.19 15:06, Oliver Schwartz wrote:
>>> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>=20
>>> On 29.08.19 08:41, Oliver Schwartz wrote:
>>>> I=E2=80=99ve now tracked down the error to power management, in partic=
ular to clock gating when autosuspend is used in IO drivers.
>>>> The drivers in question, spi-cadence.c (https://github.com/Xilinx/linu=
x-xlnx/blob/xilinx-v2018.2/drivers/spi/spi-cadence.c) and i2c-cadence.c (ht=
tps://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/i2c/busses/i=
2c-cadence.c), use autosuspend and turn off their clock when suspended. Thi=
s is done using the PMU (Power Management Unit) firmware interface (https:/=
/github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/firmware/xilinx/z=
ynqmp/firmware.c). The firmware interface can be configured to take a hyper=
visor into account, but my guess is that this is not yet handled in jailhou=
se.
>>>> I haven=E2=80=99t yet figured out if driver autosuspend can be disable=
d by some kernel configuration setting. However, I can work around the issu=
e by patching the kernel drivers to disable autosuspend.
>>>> This also effects any other driver that relies on PMU functions. The C=
AN driver (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers=
/net/can/xilinx_can.c) spits out a message "pm_runtime_get failed(-22)=E2=
=80=9D occasionally while jailhouse is loaded.
>>>=20
>>> Interesting. This driver also exist in upstream, but not yet in 4.19 th=
at we use on the ultra96. Which of the communication methods does it use wh=
en talking to the firmware? SMC or HVC? Should also be encoded in the devic=
e tree.
>> SMC is configured in the device tree (obviously, as there is no hypervis=
or directly after boot).
>>> Anyway, I would try if things still work when disabling this driver (CO=
NFIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest requests would be =
a task for later then.
>> CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_ZYNQMP=
 is selected (see https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/=
arch/arm64/Kconfig.platforms). My feeling is that disabling ZYNQMP_FIRMWARE=
 would be counterproductive anyway, as starting and stopping CPU cores is a=
lso done by the PMU firmware.
>=20
> 4.19 upstream seems to be fine without this driver, including CPU hotplug=
 (which is power-wise a nop anyway once Jailhouse is running).

Interesting.

> But I agree that patching for that purpose is not convenient. Consider it=
 more like a first experiment.
>=20
> For handling SMC SIP calls (which is what the PM calls are) properly, we =
would then need to hook into ARM_SMCCC_OWNER_SIP in handle_smc() (hyperviso=
r/arch/arm-common/smccc.c) and start interpreting the requests, rather than=
 just rejecting them. No idea yet how tricky that may be.

I=E2=80=99ve taken a quick look at the Xen code - no idea how well that tra=
nslates to Jailhouse, but the core functionality doesn=E2=80=99t seem to be=
 overly complicated:

https://github.com/Xilinx/xen/commit/d5608349ba4f4a03b749af525c7bca91732971=
e1
https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xilinx-zyn=
qmp-eemi.c

A proper configuration interface may be more work, though.

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/99CD5EE5-DE59-4EE4-BC0D-73CEAA506DFE%40gmx.de.
