Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAFZQP5QKGQE63VVANY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B6726A8B5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 17:23:45 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id a17sf560052lfl.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 08:23:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600183424; cv=pass;
        d=google.com; s=arc-20160816;
        b=T1jH3kjblYOhddCKbLO8uxFjWET5beip05YQ/2PnTHvRg/uDtqR7A9dyFGCc9mGyV4
         VjF+PB8q9aw25YeYvjyJ7ooXbJL32P2PG/mU7p1m5PDw1xiCxbhkmXciPwYTXlIfj+6z
         9tObK5DF8OkF8FuhyexvbeMTcptG4oOeB1OnBpylkXaAPnSNA10gxHYYG2yoT5D/x9qb
         KbhzTQGvIJHQ2bxeW6asBOfwhNpYanxp316EfqlCzvR/RexUMDb3W+gksWvNGy0LrxyI
         WMHPfhlqkHnCmC7VdyAG6KQ9gq8bSw9OBez2s/jiItTYutCR0RO4yty7xy64iHn+g94o
         p9Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=5Kb5+IcO0jrf8gI0W9bpzyCNCHV/Bl51qe5smY1LjJQ=;
        b=ZvvDBxLUNYVQCycrSlAzy4mG3waseJIrMwRrErAvUZmjRkKHRXlXSHyZjz1zUCu3XA
         DxddvlXuXswUVyclDfrv+Y9tHFzlze0zLdcAdK1mzMBnjufu5oY0cJqmCdzh4de6XMdG
         amdTjBv4MPjzpB3h2uvp68LgVhjReS4ihbbSj9tJI820gOybzpa5YA4mHDkNMHAJNvA3
         AHzOEyvFamtJPttCU+ZBa8V1q3yRI0GPmG9XeTGk+jNbsN9iATQH9hKvwlJ+bEMk+KqP
         VzxMSr9G6MSAyrCIQUTkuPCRMS+r+hZ+mZ2p/nEPFHBbdDwB6nGCxXKvzlLQO8C+bM2W
         Up8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5Kb5+IcO0jrf8gI0W9bpzyCNCHV/Bl51qe5smY1LjJQ=;
        b=U1jcZcWcDWRhgHE4ODE60INTn/Xx5t1G6BaR0oHqWw2OI0g6O+xzNEfZ647SUj5zC1
         9oEetoIih5Gm7X1Mft08OkaBpa8vycEtwUKy9EwBwrdythnzBKGoLKS2BN5aBzh/gPnL
         5W9l9pBAbKEA9pYZam8V6hD7iKRLNg/tITQbZA9u3Kw+smlZAa9nu/2cKArvdanEqhiM
         uglkEYJcEpwEpkHSqsZSZ32Zsvge2x0ZMUyiAQnoOUbXTfnTENWsTwABpTOXxyE8LqcM
         bkdiTLGH8/yYgypoi03k+8dtt88QWLRbfL+Q32TZQdMjLXEq9P8pMERsDXY5TfBc+WFl
         DmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5Kb5+IcO0jrf8gI0W9bpzyCNCHV/Bl51qe5smY1LjJQ=;
        b=O9LRCho0y7YPaoGegliC0suiFrx8RqgoKxfFMOHRC3PYMFaPEauD6qHqiYKf2csJk2
         ZwaTjeepvrhwk6+zKsnyqooHmNqOqZ+NWk92P4wUWKZakLZNEO12Cz4t6HIF/jgqO7xf
         c/yRZ+6EG1BczOi58+zEwFe7R6JL0kf44HosoiytZ8PyXeP9AjNt3QpzxloqMEiU1l1P
         xh1Oi06ytGlVLeFGaWUayGAEM5DRL9qw9T5AYFYHLZa42G+AN+Saxod8FevX9crSV2lb
         2G5gS6P+zOiOEsGMXkprz6rkzS360L6PRP/4w9kw07aDEfy+WGWwIrnxLHyLp9LfwMnW
         zPIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335tHQEppkYPKDeAX0O0s97k1bz72JV/ux7c4JJ2u28YsQfqmFp
	4I0ldz02VAYqdovZANQX4hk=
X-Google-Smtp-Source: ABdhPJyEEcZDxU/bwUnvHxO8IM6/BCJNfuuz0ZkDb7l2/9d4tmZ/ULjP1owabUlT77j6J4b23ns8ZA==
X-Received: by 2002:a2e:97d0:: with SMTP id m16mr7631279ljj.277.1600183424625;
        Tue, 15 Sep 2020 08:23:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1451632lff.0.gmail; Tue, 15
 Sep 2020 08:23:43 -0700 (PDT)
X-Received: by 2002:a19:c801:: with SMTP id y1mr5781648lff.217.1600183423105;
        Tue, 15 Sep 2020 08:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600183423; cv=none;
        d=google.com; s=arc-20160816;
        b=Gv0gFa1c2C4PaIQL9Z3qBB9YQ4VSmYt2lnIFakUxm2M4PdHv5oWi0PljImyISuFu4k
         Gb9de3dR4KQCiczvleThyl/xuel6jqj1SB7Or9kJqK+f2s4Qzbi4/haTwca5sr9BNDpz
         MFP9B1EPs9xgSlfu92I8iqfDyZDo5WLsKmvBXTxFsSnwUKAdP/zcPI9es/kkt5bvuV4m
         dcCt6za0OPv4tgw3cwRygvVGCLCRvL+alBksQp8tEqLQnQUUC+rbNfODzxfa3MOhWp7L
         grHcsccVgv/efrLmFYg+EBu2CEkyPh3TUiv6FmszoOjPqFY2dZG1i9vlcrNovdroGM7R
         gT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=TJ2EDEQ1MchQvx+dcctzwoMur+Yn4RNVojzuE7cLiLo=;
        b=tl1ntZ8zCokeXhB2ys1Z8+cy9BGYnmNcxMuYgOd6IZ///ZMk9/BVx+RPjdTvcZdfBl
         ir77rEaN3EJAPiLT3+dALP8RfzBMu0siNmWYYy01Hj60RIefEvGrB0CrwxrHKmemieiq
         Uec1QA/VEETLd4HcNmwmkYuVSwS2Fj5QY+QARE8yhblkG2ZyhDZOOVrmeX38H2EQ7Jq5
         K/7VYsQKtwLUEN+g+hT6mu5z6CJNs5jQ6548yiiAKKzXppS5JF+beIgoKT8xFG+plH7G
         in0IvwFHkmZfFoq4s2MoPjgMPlM6Lt7NaZOWXjCyS90U+AdXCUsG5iH3VXBtpm/0nPAK
         sHNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z6si417977lfe.8.2020.09.15.08.23.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 08:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 08FFNed9012122
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Sep 2020 17:23:40 +0200
Received: from [139.22.115.152] ([139.22.115.152])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08FFNdRk021361;
	Tue, 15 Sep 2020 17:23:39 +0200
Subject: Re: arm64-zero-exits trouble
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <9F8CA946-F83A-41A8-A12E-B6FF06FA9B37@gmx.de>
 <33c9ad9c-41fc-2ebf-7f4d-cad19bab8135@siemens.com>
 <2526A9F3-F82A-44C5-858A-C4E6A1911658@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ce5abf20-0ec9-8c39-40ef-60215b95c9fb@siemens.com>
Date: Tue, 15 Sep 2020 17:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2526A9F3-F82A-44C5-858A-C4E6A1911658@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 15.09.20 16:09, Oliver Schwartz wrote:
>=20
>=20
>> On 15 Sep 2020, at 14:02, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 15.09.20 13:49, Oliver Schwartz wrote:
>>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mailto:j=
an.kiszka@siemens.com>> wrote:
>>>>
>>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got =
stuck.
>>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=
=80=99ve brought ATF up to date and patched it with Jans patch to enable SD=
EI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (wit=
h VM exits for interrupts, of course). Jailhouse source is the tip of branc=
h arm64-zero-exits.
>>>>> If I enable SDEI in ATF, jailhouse works most of the time, except for=
 when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 res=
ults in:
>>>>>> Initializing processors:
>>>>>>   CPU 1... OK
>>>>>>   CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor=
/arch/arm64/setup.c:73: returning error -EIO
>>>>
>>>> Weird - that the SDEI event enable call.
>>> Yes, that=E2=80=99s a bit scary. The code involved in ATF is limited - =
I=E2=80=99m pretty sure that I=E2=80=99m up-to-date with upstream there.
>>>>>> FAILED
>>>>>> JAILHOUSE_ENABLE: Input/output error
>>>>> I=E2=80=99ve seen this error only when I enable jailhouse through som=
e init script during the boot process, when the system is also busy otherwi=
se. When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>>>>
>>>> Possibly a regression of my recent refactoring which I didn't manage t=
o test yet. Could you try if
>>>>
>>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11=
b08aa65a456255f
>>>>
>>>> was any better?
>>> No, I don=E2=80=99t see any difference with that version.
>>
>> Good and bad news at the same time, unfortunately ruling out a quick sol=
ution.
>>
>>>>
>>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99=
:
>>>>>> Initializing processors:
>>>>>>   CPU 1... OK
>>>>>>   CPU 0... OK
>>>>>>   CPU 2... OK
>>>>>>   CPU 3... OK
>>>>>> Initializing unit: irqchip
>>>>>> Using SDEI-based management interrupt
>>>>>> Initializing unit: ARM SMMU v3
>>>>>> Initializing unit: PVU IOMMU
>>>>>> Initializing unit: PCI
>>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>>> Activating hypervisor
>>>>>> [    5.847540] The Jailhouse is opening.
>>>>> Using a JTAG debugger I see that one or more cores are stuck in hyper=
visor/arch/arm-common/psci.c, line 105.
>>>>> It may also succeed in stopping one or more CPUs and then hang (again=
 with one or more cores stuck in psci.c, line 105):
>>>>>> [    5.810220] The Jailhouse is opening.
>>>>>> [    5.860054] CPU1: shutdown
>>>>>> [    5.862677] psci: CPU1 killed.
>>>>> Has anyone else observed this? Any ideas on what may cause this? My g=
ut feeling is that there=E2=80=99s a race condition somewhere, but it feels=
 like looking for a needle in a haistack.
>>>>> Finally, if =E2=80=98jailhouse enable=E2=80=99 succeeds, a subsequent=
 =E2=80=98jailhouse disable=E2=80=99 followed by another =E2=80=98jailhouse=
 enable=E2=80=99 always hangs the system (cores stuck in psci.c).
>>>>> Otherwise, once =E2=80=98jailhouse enable=E2=80=99 succeeds the syste=
m is working fine and I can start, stop load and unload my guest inmate at =
will.
>>>>> To make matters a bit more complicated: My system is based on Xilinx =
Petalinux 2018.2. For various reasons I=E2=80=99m stuck with the ATF versio=
n that comes with Petalinux (https://github.com/Xilinx/arm-trusted-firmware=
/tree/xilinx-v2018.2), which is a bit dated. To get SDEI to work I had to b=
ackport a number of patches from later releases. I am quite confident that =
SDEI and EHF handling are now up-to-date with the master branch from Arms A=
TF repository, but there remains a chance that I missed something and the i=
ssues above result from something in ATF.
>>>>
>>>> OK, obviously that different ATF is another critical point, also in th=
e light of SDEI_EVENT_ENABLE failing.
>>> Sure. If you or others haven=E2=80=99t ever seen the above behaviour th=
en the issue is most likely on this side and I have to do another compariso=
n of my ATF sources to upstream.
>>
>> Theoretically, it might also be a hidden issue in the ATF patch itself, =
just exposed by your different setup.
>>
>>>> Can't you get your board running with the upstream ATF version, just f=
or the Jailhouse test? Then we would know better where to dig.
>>> That was my first approach, but I didn=E2=80=99t get very far. With ups=
tream ATF from Arm my (Xilinx enhanced) kernel doesn=E2=80=99t boot. Exchan=
ging the kernel opens another can of worms, but I=E2=80=99ll see what I can=
 do.
>>> I managed to boot with ATF from master in the Xilinx repository. I also=
 had to update the PMU Firmware to make this work. The resulting system was=
 acting strange in a number of ways. Jailhouse showed the same occasional h=
angs during intial CPU shutdown, but given the overall unstable system I ab=
andoned any further investigations and resorted to patching the working ATF=
.
>>
>> OK, sounds frightening, indeed. The overall degree of adjustments you ha=
ve to apply to even get booting systems is, well, demotivating with that pl=
atform.
>>
>> Anyway, pick the most reproducible effect, probably that failing EVENT_E=
NABLE, and try to debug that in depth in the hope to find a single magic ro=
ot cause. Nasty things come with multi-cause problems, though, and I've see=
n too many already.
>=20
> True, unfortunately.
>=20
> Some update on the EVENT_ENABLE: I=E2=80=99ve enabled logging in the SDEI=
 part of ATF. A successful init looks like this:
>=20
>> Initializing Jailhouse hypervisor v0.12 (105-g5352a61b-dirty) on CPU 3
>> Code location: 0x0000ffffc0200800
>> Page pool usage after early setup: mem 39/992, remap 0/131072
>> Initializing processors:
>>   CPU 3... INFO:    SDEI: > VER
>> INFO:    SDEI: < VER:1000000000000
>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>> INFO:    SDEI: < REG:0
>> INFO:    SDEI: > ENABLE(n:0)
>> INFO:    SDEI:  event state 0x1 =3D> 0x3
>> INFO:    SDEI: < ENABLE:0
>> INFO:    SDEI: > UNMASK:80000003
>> INFO:    SDEI: < UNMASK:0
>> OK
>>   CPU 1... INFO:    SDEI: > VER
>> INFO:    SDEI: < VER:1000000000000
>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>> INFO:    SDEI: < REG:0
>> INFO:    SDEI: > ENABLE(n:0)
>> INFO:    SDEI:  event state 0x1 =3D> 0x3
>> INFO:    SDEI: < ENABLE:0
>> INFO:    SDEI: > UNMASK:80000001
>> INFO:    SDEI: < UNMASK:0
>> OK
>>   CPU 0... INFO:    SDEI: > VER
>> INFO:    SDEI: < VER:1000000000000
>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>> INFO:    SDEI: < REG:0
>> INFO:    SDEI: > ENABLE(n:0)
>> INFO:    SDEI:  event state 0x1 =3D> 0x3
>> INFO:    SDEI: < ENABLE:0
>> INFO:    SDEI: > UNMASK:80000000
>> INFO:    SDEI: < UNMASK:0
>> OK
>>   CPU 2... INFO:    SDEI: > VER
>> INFO:    SDEI: < VER:1000000000000
>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>> INFO:    SDEI: < REG:0
>> INFO:    SDEI: > ENABLE(n:0)
>> INFO:    SDEI:  event state 0x1 =3D> 0x3
>> INFO:    SDEI: < ENABLE:0
>> INFO:    SDEI: > UNMASK:80000002
>> INFO:    SDEI: < UNMASK:0
>> OK
>> Initializing unit: irqchip
>> Using SDEI-based management interrupt
>=20
> In case of an error in setup.c, I get this:
>=20
>> Initializing Jailhouse hypervisor v0.12 (105-g5352a61b-dirty) on CPU 0
>> Code location: 0x0000ffffc0200800
>> Page pool usage after early setup: mem 39/992, remap 0/131072
>> Initializing processors:
>>   CPU 0... INFO:    SDEI: > VER
>> INFO:    SDEI: < VER:1000000000000
>> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
>> INFO:    SDEI:  event state 0x0 =3D> 0x1
>> INFO:    SDEI: < REG:0
>> INFO:    SDEI: > ENABLE(n:536872211)
>> INFO:    SDEI: < ENABLE:-2
>> /home/oliver/hil_sw/petalinux/rtbox2/build/tmp/work/plnx_zynqmp-xilinx-l=
inux/jailhouse/0.12-gitAUTOINC+5352a61ba5-r0/git/hypervisor/arch/arm64/setu=
p.c:74: returning error err
>> FAILED
>> 10ININFNNFFFOOOO:: : :             SDS SDSDEEDIEE:I:I I>:   >:MA>   > SM=
MMKAAA:SSSK8KK:80:0:080008000000000000300
>> N00I02
>> O0FI
>> F NO
>>   S    :F SOI D NF:E  IS O:D: E   I< : S  D S<EM IAD: MSEA<IKSK ::M 0:A<=
0
>> K
>> SO:INM0NAFF
>> O KOI:::N 0  F
>> 0nG) I  NS SFDDO: E E IISD :E:    I>>:S  DUN EU>INR: E URG>E( NGnUR:(NEn=
RG0:E()
>> (:nNF
>>       :00OI): )
>>   =20
>> eE FIOSN:DFEO I: :     S< D  UESNDIER:E IG:< : U- N3evR
>>    nGt:- s3t
>> ate 0x1 =3D> 0x0
>> 3INNFFOO::        SSDDEEII::  <<  UUNNRREEGG::-0
>>  =20
>> JAILHOUSE_ENABLE: No such file or directory
>> JAILHOUSE_CELL_CREATE: Invalid argument
>=20
> The interesting part is this:
>=20
>> INFO:    SDEI: > ENABLE(n:536872211)
>=20
> The argument seen by ATF for the ENABLE call is 536872211, but in setup.c=
 it=E2=80=99s hardcoded to 0. The problem doesn=E2=80=99t seem to be with t=
he ATF version, but with the SMC calling per se, which is very scary.
>=20
> The garbled output also made me think if there maybe is a concurrency iss=
ue in ATF.

Something is interrupting this synchronous call, mangling registers and=20
then returning as if nothing happened - I would say...

I have no idea, though, what could interrupt here. Also a bit weird is=20
that this happens frequently in that enabling path... In Jailhouse, we=20
have interrupts off. Maybe something changes at the point we leave for=20
EL3? That would shift the interruption mostly to the entry path.

Wild guesses, still.

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
jailhouse-dev/ce5abf20-0ec9-8c39-40ef-60215b95c9fb%40siemens.com.
