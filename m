Return-Path: <jailhouse-dev+bncBAABB4E6SDVAKGQE2JEUIKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334B7F4F6
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 12:24:49 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id o184sf8199342lfa.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 03:24:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564741489; cv=pass;
        d=google.com; s=arc-20160816;
        b=JLlec0bXKp1qyX61niDCprOtyvvi+aKnid/GZg3hXOSDSGrgHQaLUaV7ligG4z1J3S
         YEeUiYjBVAxKNRUTKlTjtxKSLB8Fs3NcghAXo6ppcA3JQGrqtj5vSgrPnxnfGgqlq6LO
         Y/akUrEv9JXlFFal/3QyhSVrGBeLUgYq9ObOyt6e+EGP5RnEwV1dgUkStmbZApXPcAw+
         3xYGBtDNupakPQ65dDzUJWdzuOGpqRwvefbHFZ4n+IWj1MTFqbwtOSb/EmucyYfSJhPF
         EHfsV//nWcwriFpdvS3H1xL9YqCR/l0fJLuKig0UdOSuS0dATLHQbgdthkJcDQNJeByv
         G5Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:acceptlanguage
         :content-language:accept-language:in-reply-to:references:message-id
         :thread-index:thread-topic:subject:date:cc:to:from:sender
         :dkim-signature;
        bh=tKLWd3h6hZY0lHJgXZGt+egEiT1SbL30/DngN8Ooao0=;
        b=LWJ+OShqksryj1gn+rb0C2Qjm3Xwzac9nUKtOJHdgNNREYxB3nHYJI0uxtXbT5G9Ng
         1U6MCQW6y1+i3oZLZ7TrFZaGN3P3QIgbVNgXHNtKA1Xut/9gxR+3TQ5Q/nvoxSYhiYuZ
         hcpjDAaEX679D1MPVaK5STaWxSbTZDPVKa9ivFS5balXi717j6ewZlB5NCPFbRT+aiT2
         WXn7vvZb+wEhwJKaenP06wXnet6xnXyfrkjXiGQVfxKN4PB0fCcYC/WcShLu9vty7s0B
         uw4kRp8Ku+zwUHlf44ZDTqXs5Yc3SosLaTdmeaaHRfvnej9w0A3a/zCUN/sHHxw8We7B
         u9Ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:date:subject:thread-topic:thread-index:message-id
         :references:in-reply-to:accept-language:content-language
         :acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tKLWd3h6hZY0lHJgXZGt+egEiT1SbL30/DngN8Ooao0=;
        b=evkzf2ixHXGwipbhxLAhgm8CiQyOuhTSdDGKAfmUAPowXKT8UBkc4l4jvVGPc32Cxw
         PJe8bXLIJfi08/PJsC+nC/o0dThaukO4j7I7mb73Pl7K/+YniccLl+5kL/diz9qy7Cgf
         8sCG+N+iXn130R3BxNnstGIa2cbr8ANYlWkzxuMPV3oMe6WzCbQq96x9bY/kDdZocw6v
         Cst3cZJL0uX2xPi7I3vqmefUuRogvgAOPfV86N5YpQg49hQi/hwc3yzrjtgO7zFMT7eD
         o2A6b1r44kaLYC8ORwZIALMMkXtUYgP4ZtHC5eFWdqDCy97Nf4StFOEDz4MK7MDVE4r1
         aQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:date:subject:thread-topic
         :thread-index:message-id:references:in-reply-to:accept-language
         :content-language:acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tKLWd3h6hZY0lHJgXZGt+egEiT1SbL30/DngN8Ooao0=;
        b=fEeZ6WYSteaeAtq18bBiyth5A5lyBPUd706jnr0hLKBiveiX0Hgbc8u4eIxvrxkAS7
         /+w4p7jGHamDMMg+/AVDvPQhCPJR6Fe8pGp6wTY+bcmNQ1UJQ2fHL/8wxvp4Pte6mbVz
         UC2bUMaVvYW9ZfxZGyazBoKFEsGZwCpo2eiVkgPfmu1dsDMQfiIxx1r6R8mHujym8Y1l
         EbtP+1+edvzcD/3W0ef/9N/Va3zrGJGmbSPBYbRp9CdiBLhFFA6dB3tXwtYF7shMPF88
         i331kqHU/VTp+U0Q+7L8nSAkRpbQRdNuGT1DVbzzG0431cL33cbj7fijl1W+qgsGO157
         IcEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX4GYcJ+LFBwa7KYRA+GnSyA3FNXP08oV0Ba/nsdQYmvTj8YszT
	o9BPvWrlxoHdsYJHYXZ0gJI=
X-Google-Smtp-Source: APXvYqwU18Bgx2PFX0+qRdEVljxLRzDktzPCFbEyW4FUvEPn0w2hBneZUvUb6o4riT1eL2qLc1EByg==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr62555498lfm.77.1564741488910;
        Fri, 02 Aug 2019 03:24:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d0c:: with SMTP id t12ls8683151lji.12.gmail; Fri, 02
 Aug 2019 03:24:48 -0700 (PDT)
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr45970875ljj.146.1564741488332;
        Fri, 02 Aug 2019 03:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564741488; cv=none;
        d=google.com; s=arc-20160816;
        b=SOS1M0ZgPBmLX6VLOskP48uPWInCxdxclLYKuT1xZoqXj1zDj0FVfi/vdoamFf8ywL
         5ZE8LFMue/j624emNrzRdz0DqazkolFTtHYXYNOk8ncSBrwW1FPH9Jq24iHuQMUTTxn7
         92Y2972QUGiGJbZJPz1wBpKbIQCYHrH4qhXEr9qcKk05hJRw5w1/GuI0ok48ukbEjdJa
         xL6JlwXJRx+lTAcmtf/I14BZYlWNC2KgwjJqNNRtZU8hoWHhwsS3i/4+UD0eDkbYVWEy
         dZ9mCnbCAL0AD3Al4RjPWalYrsC6yooc4Y1qVweDiCerp1XCzxuN0g3Eo8HvxZB8iM6g
         z+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:acceptlanguage:content-language:accept-language
         :in-reply-to:references:message-id:thread-index:thread-topic:subject
         :date:cc:to:from;
        bh=zlfxUCL7Koo8YI6MDKlBRypS7zsEYkWhDPSVZHluo88=;
        b=0eQ0xqm+w2jNAlVwi6L8HzdjNdiBgvyzAY7faCxupf2sVswkgCJto2dXaad0lWKKsd
         N667x33lLKsu8bpll4lBsgsxYvZZajsbl5OqxQ5SOmXErduYFT51yvJ6t7plVIlaiwm5
         Q0kCE5DpSe4Ihgzl8ZTAYfIMYbCyVF+Hh5GIbF/9m7MyAgvvCWbDNXeLQUZ5rZ4884n+
         j8gTfC8Mkb0Tjk6p6/1ohAFc/vmStuZOVCQx53HfuHWtFiFPi83GdbuE8LCPvQFvg06r
         1zFCl3gw14Q5aGf3iESCaPiaxPlVCqbGZoAoy8QcOnFp8LC7hRAALbwRV4j8Ju9wFt9+
         W8ZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
Received: from mail3.emtrion.de (mail3.emtrion.de. [80.150.99.69])
        by gmr-mx.google.com with ESMTPS id f26si3792668lfp.5.2019.08.02.03.24.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 02 Aug 2019 03:24:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) client-ip=80.150.99.69;
Received: from BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0]) by
 BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0%10]) with mapi; Fri, 2 Aug
 2019 12:24:53 +0200
Content-Type: multipart/mixed;
	boundary="_000_95F51F4B902CAC40AF459205F6322F01C4EE0E41E3BMK019S01emtr_"
From: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, "Antonios Motakis (Tony)"
	<antonios.motakis@huawei.com>, Mark Rutland <mark.rutland@arm.com>
CC: JailhouseMailingListe <jailhouse-dev@googlegroups.com>
Date: Fri, 2 Aug 2019 12:24:08 +0200
Subject: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Topic: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Index: AdVBQD4R1sVykNk/RpKcGrhqiiHCFgH2vOgg
Message-ID: <95F51F4B902CAC40AF459205F6322F01C4EE0E41E3@BMK019S01.emtrion.local>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
 <20190722094752.GB28400@lakrids.cambridge.arm.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
 <5518ab89-15c7-c1c2-c56e-f840cc296cec@huawei.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3DBD@BMK019S01.emtrion.local>
 <674c6cb2-62ac-456c-2a5e-ac08e94e0262@siemens.com>
In-Reply-To: <674c6cb2-62ac-456c-2a5e-ac08e94e0262@siemens.com>
Accept-Language: de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <95F51F4B902CAC40AF459205F6322F01C4EE0E41E3@BMK019S01.emtrion.local>
acceptlanguage: de-DE
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-24816.003
x-tm-as-result: No--13.272400-8.000000-31
x-tm-as-matchedid: 700225-703140-701090-703503-700224-702770-700759-704231-7
	01058-705220-705161-700786-704053-704472-780038-703982-704064-703655-853813
	-853550-853702-702887-850298-705249-139010-705153-704074-704498-700278-7043
	28-705155-702156-188019-702975-702852-701432-701443-703949-705022-702600-78
	0022-704718-702147-702500-704714-702146-704599-105700-701667-702877-105250-
	701803-701075-703300-702301-700492-702409-702798-701901-701111-704673-70076
	2-701576-702754-63-148004-148133-20043-42000-42003-63
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-Original-Sender: jan.vonwiarda@emtrion.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as
 permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
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

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E41E3BMK019S01emtr_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Had another debugging session with a Lauterbach debugger. CPU0 still lives,=
 but does not respond to interrupts, as the cell does not respond to pings,=
 nor does the serial console work. When I change the inmate WFI to NOP in a=
 live session on the target, the root cell immediately starts to process in=
terrupts again. When WFI is hit, interrupts apparently either don't reach C=
PU0 or are not processed. Which apparently means, that the inmate's WFI som=
ehow blocks the hypervisor, respectively the root cell. Could this be a GIC=
 routing problem?

-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka [mailto:jan.kiszka@siemens.com]=20
Gesendet: Dienstag, 23. Juli 2019 12:20
An: von Wiarda, Jan; Antonios Motakis (Tony); Mark Rutland
Cc: JailhouseMailingListe
Betreff: Re: 64 bit Hypervisor crash at 32 bit WFI instruction

On 23.07.19 12:14, von Wiarda, Jan wrote:
> Hi!
>=20
> With
>=20
> asm volatile("nop" : : : "memory");
>=20
> instead of
>=20
> asm volatile("wfi" : : : "memory");
>=20
> it runs just fine.
>=20
>> Is the root cell cpu (CPU 0) specifically crashing with an unexpected sy=
nchronous exit to Jailhouse? What is the output?
>=20
> No, CPU 0 does not crash with any kind of console output, which makes deb=
ugging even more difficult. What I observe is, that after hitting WFI, it c=
ontinues to run for a 1-2 seconds and then it stops. Last thing I see from =
the instrumented code is a printk() from arch_skip_instruction(), which mea=
ns it was handling a SYS64 exit.

Maybe interrupts get stalled for the root cell - for whatever reason. Do yo=
u
have a hardware debugger to analyze the state of the CPUs? Or use QEMU...

Jan

>=20
>> This is a far shot, but maybe the code generated around the WFI is the c=
ulprit?
>=20
> You might be right, when I place WFI right after inmate_main(), CPU 0 doe=
s not starve. But it's completely strange and undefined behaviour, sometime=
s it crashes if I put the WFI right after a printk(), whereas right before =
the printk() it doesn't crash.
>=20
> Works:
>=20
> void inmate_main(void)
> {
> 		...
> 		asm volatile("wfi" : : : "memory");
> 		printk("IVSHMEM: Done setting up...\n");
> 		printk("IVSHMEM: waiting for interrupt.\n");
> 		//asm volatile("wfi" : : : "memory");
> }
>=20
> Does not work:
>=20
> void inmate_main(void)
> {
> 		...
> 		//asm volatile("wfi" : : : "memory");
> 		printk("IVSHMEM: Done setting up...\n");
> 		printk("IVSHMEM: waiting for interrupt.\n");
> 		asm volatile("wfi" : : : "memory");
> }
>=20
> I know this sounds completely strange but I reproduced this multiple time=
s, compiler is this:
>=20
> gcc version 6.3.0 20170516 (Debian 6.3.0-18)
>=20
> BR,
> Jan
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Antonios Motakis (Tony) [mailto:antonios.motakis@huawei.com]=20
> Gesendet: Dienstag, 23. Juli 2019 06:40
> An: von Wiarda, Jan; Mark Rutland
> Cc: JailhouseMailingListe; Jan Kiszka
> Betreff: Re: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
>=20
> Hi Jan,
>=20
> On 22-Jul-19 7:11 PM, von Wiarda, Jan wrote:
>> Hi Mark,
>>
>> I'm not touching bit 13 or 14 in HCR_EL2, they're both 0. HCR_EL2 is the=
 same for 64 bit and 32 bit inmates when the crash happens, except for HCR_=
RW_BIT, obviously. HCR_EL2 value is 0x28001B at crash time.
>>
>=20
> It's quite an interesting crash that you have there; I wouldn't expect th=
is to happen.
>=20
> The idea with trapping WFI/WFE is to be able to suspend a VM that is just=
 waiting for something to happen. Since Jailhouse is a partitioning hypervi=
sor, you shouldn't need to trap it, nor should its use normally influence t=
he other cores. Yet something is amiss here.
>=20
> Is the root cell cpu (CPU 0) specifically crashing with an unexpected syn=
chronous exit to Jailhouse? What is the output?
>=20
> I don't remember what event 0x28001B maps to, I would check the ARM ARM f=
irst to figure out what the unexpected event in CPU 0 was, for a clue to mo=
tivate further investigation.
>=20
> Additionally, this WFI code instructs the compiler that memory contents m=
ay change, so ordering of generated instructions, inserted barriers etc, ar=
e influenced. This is a far shot, but maybe the code generated around the W=
FI is the culprit? Maybe not, but I would try to rule it out:
> (a) First I'd try replacing the WFI with a nop, to observe the behavior w=
ithout the WFI but without changing compiler behavior and maintaining any c=
ompiler barriers.
> (b) I would also try replacing it with an infinite loop ("b .") to get th=
e inmate to wait forever at this position, and see what happens.
>=20
> Happy debugging :)
>=20
> Best regards,
> Tony
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/95F51F4B902CAC40AF459205F6322F01C4EE0E41E3%40BMK019S01.emtrio=
n.local.

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E41E3BMK019S01emtr_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
6lAPdSVw5zfwPjCVA0FSFlAxEtHA99wgKcPRwGehwCtjLhSVEn8oKS50/3FxhIRB6lB7hGPfCJJ7
EedhP+COkmahwCDT9xlg3AANYWdeYYrhK//kwP5kduBXAibCABLlsZbygET/9TWXRdmmDiPSdHpj
f+HYcf+G0DBhoCKh4v8BoNCA8RiAf3Oxlaj1Kdlh9SHO4CiSYs+T4Jfg3BF2MHRj6lCMsv0f52SL
AJM/lE+VX5Zvl3n/7XGG4p3xRIQv9lOAJvB7E090MfMBdGFaqChhJiBG/zGj/ZBJtNeRmwEYY0b1
J6T9neFwABE+kXgVRUKhVYnx/yexMpJG5tcyUBY+Aw2D2ab/T4d8opzCw/AZYITTczFSaPNBlTgY
KGImIC/2iDA+gb9MfIQSJ7Uf4VQhDKFsJPD/HcBesMRRZQB7AofSfzSccr97As3ye3KKUzLz5bFw
5TD/GuNCQaCBfqIuIwVFOB/20fcY4Sbwdag63n/xkmbx8eD/N7D6UNlgEhjmAWFO4SXhsM/hFhlQ
LaGD4UFHnSF7kG9dEEYSEpAocGgpQFmgZ0k58UNU7cBEQdTAT4FoQFNFUy1EReEl32bYZtDWIJ+R
GXJDf+J7oL5FLdE5UCih8BB6wHjhJQx9fYvQbQAAAAAfAEIAAQAAACAAAAB2AG8AbgAgAFcAaQBh
AHIAZABhACwAIABKAGEAbgAAAB8AZQABAAAAMgAAAEoAYQBuAC4AdgBvAG4AVwBpAGEAcgBkAGEA
QABlAG0AdAByAGkAbwBuAC4AZABlAAAAAAAfAGQAAQAAAAoAAABTAE0AVABQAAAAAAACAUEAAQAA
AHQAAAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAIB2AG8AbgAgAFcAaQBhAHIAZABhACwAIABKAGEA
bgAAAFMATQBUAFAAAABKAGEAbgAuAHYAbwBuAFcAaQBhAHIAZABhAEAAZQBtAHQAcgBpAG8AbgAu
AGQAZQAAAB8AGgwBAAAAIAAAAHYAbwBuACAAVwBpAGEAcgBkAGEALAAgAEoAYQBuAAAAHwAfDAEA
AAAyAAAASgBhAG4ALgB2AG8AbgBXAGkAYQByAGQAYQBAAGUAbQB0AHIAaQBvAG4ALgBkAGUAAAAA
AB8AHgwBAAAACgAAAFMATQBUAFAAAAAAAAIBGQwBAAAAdAAAAAAAAACBKx+kvqMQGZ1uAN0BD1QC
AAAAgHYAbwBuACAAVwBpAGEAcgBkAGEALAAgAEoAYQBuAAAAUwBNAFQAUAAAAEoAYQBuAC4AdgBv
AG4AVwBpAGEAcgBkAGEAQABlAG0AdAByAGkAbwBuAC4AZABlAAAAHwAxQAEAAAACAAAAAAAAAAsA
QDoBAAAAHwAwQAEAAAACAAAAAAAAAB8AGgABAAAAEgAAAEkAUABNAC4ATgBvAHQAZQAAAAAAAwDx
PwcEAAALAEA6AQAAAAMA/T/kBAAAAgELMAEAAAAQAAAAAgIx6FHoSEKZJF1X1gUEuwMAFwABAAAA
QAA5AABU+mocSdUBQAAIMNfE74QcSdUBCwACAAEAAAALACMAAAAAAAMAJgAAAAAACwApAAAAAAAL
ACsAAAAAAAMALgAAAAAAAwA2AAAAAAAfAHAAAQAAAGQAAAA2ADQAIABiAGkAdAAgAEgAeQBwAGUA
cgB2AGkAcwBvAHIAIABjAHIAYQBzAGgAIABhAHQAIAAzADIAIABiAGkAdAAgAFcARgBJACAAaQBu
AHMAdAByAHUAYwB0AGkAbwBuAAAAAgFxAAEAAAAbAAAAAdVBQD4R1sVykNk/RpKcGrhqiiHCFgH2
vOggAB8ANRABAAAAigAAADwAOQA1AEYANQAxAEYANABCADkAMAAyAEMAQQBDADQAMABBAEYANAA1
ADkAMgAwADUARgA2ADMAMgAyAEYAMAAxAEMANABFAEUAMABFADQAMQBFADMAQABCAE0ASwAwADEA
OQBTADAAMQAuAGUAbQB0AHIAaQBvAG4ALgBsAG8AYwBhAGwAPgAAAAAAHwA5EAEAAADOAgAAPAA5
ADUARgA1ADEARgA0AEIAOQAwADIAQwBBAEMANAAwAEEARgA0ADUAOQAyADAANQBGADYAMwAyADIA
RgAwADEAQwA0AEUARQAwAEUAMwBDAEIANABAAEIATQBLADAAMQA5AFMAMAAxAC4AZQBtAHQAcgBp
AG8AbgAuAGwAbwBjAGEAbAA+ACAAPAAyADAAMQA5ADAANwAyADIAMAA5ADQANwA1ADIALgBHAEIA
MgA4ADQAMAAwAEAAbABhAGsAcgBpAGQAcwAuAGMAYQBtAGIAcgBpAGQAZwBlAC4AYQByAG0ALgBj
AG8AbQA+ACAAPAA5ADUARgA1ADEARgA0AEIAOQAwADIAQwBBAEMANAAwAEEARgA0ADUAOQAyADAA
NQBGADYAMwAyADIARgAwADEAQwA0AEUARQAwAEUAMwBEADEANABAAEIATQBLADAAMQA5AFMAMAAx
AC4AZQBtAHQAcgBpAG8AbgAuAGwAbwBjAGEAbAA+ACAAPAA1ADUAMQA4AGEAYgA4ADkALQAxADUA
YwA3AC0AYwAxAGMAMgAtAGMANQA2AGUALQBmADgANAAwAGMAYwAyADkANgBjAGUAYwBAAGgAdQBh
AHcAZQBpAC4AYwBvAG0APgAgADwAOQA1AEYANQAxAEYANABCADkAMAAyAEMAQQBDADQAMABBAEYA
NAA1ADkAMgAwADUARgA2ADMAMgAyAEYAMAAxAEMANABFAEUAMABFADMARABCAEQAQABCAE0ASwAw
ADEAOQBTADAAMQAuAGUAbQB0AHIAaQBvAG4ALgBsAG8AYwBhAGwAPgAgADwANgA3ADQAYwA2AGMA
YgAyAC0ANgAyAGEAYwAtADQANQA2AGMALQAyAGEANQBlAC0AYQBjADAAOABlADkANABlADAAMgA2
ADIAQABzAGkAZQBtAGUAbgBzAC4AYwBvAG0APgAAAAAAHwBCEAEAAABmAAAAPAA2ADcANABjADYA
YwBiADIALQA2ADIAYQBjAC0ANAA1ADYAYwAtADIAYQA1AGUALQBhAGMAMAA4AGUAOQA0AGUAMAAy
ADYAMgBAAHMAaQBlAG0AZQBuAHMALgBjAG8AbQA+AAAAAAADAIAQ/////x8A8xABAAAAeAAAAEEA
VwAlADMAQQAgADYANAAgAGIAaQB0ACAASAB5AHAAZQByAHYAaQBzAG8AcgAgAGMAcgBhAHMAaAAg
AGEAdAAgADMAMgAgAGIAaQB0ACAAVwBGAEkAIABpAG4AcwB0AHIAdQBjAHQAaQBvAG4ALgBFAE0A
TAAAAAsA9BAAAAAACwD1EAAAAAALAPYQAAAAAEAABzBBAOuEHEnVAQIBEDABAAAARgAAAAAAAACr
z3ahydfzQrBY9HUopEQsBwCV9R9LkCysQK9FkgX2Mi8BALSd1wkBAABGsFVF9zmqTbt7/FmeXR1M
ALfaanvrAAAAAAMA3j/p/QAAHwD4PwEAAAAgAAAAdgBvAG4AIABXAGkAYQByAGQAYQAsACAASgBh
AG4AAAACAfk/AQAAAIQAAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAAL089RklSU1QgT1JH
QU5JWkFUSU9OL09VPUVYQ0hBTkdFIEFETUlOSVNUUkFUSVZFIEdST1VQIChGWURJQk9IRjIzU1BE
TFQpL0NOPVJFQ0lQSUVOVFMvQ049SkFOLlZPTldJQVJEQQAfAPo/AQAAACAAAAB2AG8AbgAgAFcA
aQBhAHIAZABhACwAIABKAGEAbgAAAAIB+z8BAAAAhAAAAAAAAADcp0DIwEIQGrS5CAArL+GCAQAA
AAAAAAAvTz1GSVJTVCBPUkdBTklaQVRJT04vT1U9RVhDSEFOR0UgQURNSU5JU1RSQVRJVkUgR1JP
VVAgKEZZRElCT0hGMjNTUERMVCkvQ049UkVDSVBJRU5UUy9DTj1KQU4uVk9OV0lBUkRBAAMAGUAA
AAAAAwAaQAAAAAADAAlZAQAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAAAAABCFAAAAAAAACwAAgAgg
BgAAAAAAwAAAAAAAAEYAAAAAA4UAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAABgQAAAAAA
AAUAAIADIAYAAAAAAMAAAAAAAABGAAAAAAKBAAAAAAAAAAAAAAMAAIADIAYAAAAAAMAAAAAAAABG
AAAAABOBAAABAAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAAHIEAAAAAAAALAACAAyAGAAAAAADA
AAAAAAAARgAAAAAmgQAAAAAAAAMAAIADIAYAAAAAAMAAAAAAAABGAAAAABCBAAAAAAAAAwAAgAMg
BgAAAAAAwAAAAAAAAEYAAAAAEYEAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAAqgQAAAAAA
AAMAAIADIAYAAAAAAMAAAAAAAABGAAAAACmBAAAAAAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAA
JIEAAAAAAAALAACAAyAGAAAAAADAAAAAAAAARgAAAAAsgQAAAAAAAB8AAIADIAYAAAAAAMAAAAAA
AABGAAAAACeBAAABAAAAAgAAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAASgQAAAQAAAB8A
AIADIAYAAAAAAMAAAAAAAABGAAAAACGBAAABAAAAAgAAAAAAAAALAACAAyAGAAAAAADAAAAAAAAA
RgAAAAADgQAAAAAAAAMAAIADIAYAAAAAAMAAAAAAAABGAAAAACOBAAD///9/CwAAgAggBgAAAAAA
wAAAAAAAAEYAAAAADoUAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAAAAABhQAAAAAAAAMAAIAI
IAYAAAAAAMAAAAAAAABGAAAAABiFAAAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAABoUAAAAA
AAALAACACCAGAAAAAADAAAAAAAAARgAAAACChQAAAAAAAEAAAIAIIAYAAAAAAMAAAAAAAABGAAAA
AL+FAADwpXslHEnVAQMADTT5PwAAAgEUNAEAAAAQAAAAVJShwCl/EBulhwgAKyolFx8APQABAAAA
CgAAAEEAVwA6ACAAAAAAAB8ANwABAAAAbAAAAEEAVwA6ACAANgA0ACAAYgBpAHQAIABIAHkAcABl
AHIAdgBpAHMAbwByACAAYwByAGEAcwBoACAAYQB0ACAAMwAyACAAYgBpAHQAIABXAEYASQAgAGkA
bgBzAHQAcgB1AGMAdABpAG8AbgAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAB4AAABhAGMAYwBl
AHAAdABsAGEAbgBnAHUAYQBnAGUAAAAAAAEAAAAMAAAAZABlAC0ARABFAAAAHwAAgIYDAgAAAAAA
wAAAAAAAAEYBAAAAIAAAAHgALQBtAHMALQBoAGEAcwAtAGEAdAB0AGEAYwBoAAAAAQAAAAIAAAAA
AAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAKAAAAHgALQB0AG0ALQBhAHMALQBwAHIAbwBkAHUA
YwB0AC0AdgBlAHIAAAABAAAATAAAAFMATQBFAFgALQAxADEALgAwAC4AMAAuADQAMgA4ADMALQA4
AC4AMQAwADAALgAxADAANgAyAC0AMgA0ADgAMQA2AC4AMAAwADMAAAAfAACAhgMCAAAAAADAAAAA
AAAARgEAAAAeAAAAeAAtAHQAbQAtAGEAcwAtAHIAZQBzAHUAbAB0AAAAAAABAAAANAAAAE4AbwAt
AC0AMQAzAC4AMgA3ADIANAAwADAALQA4AC4AMAAwADAAMAAwADAALQAzADEAAAAfAACAhgMCAAAA
AADAAAAAAAAARgEAAAAkAAAAeAAtAHQAbQAtAGEAcwAtAG0AYQB0AGMAaABlAGQAaQBkAAAAAQAA
ANgDAAA3ADAAMAAyADIANQAtADcAMAAzADEANAAwAC0ANwAwADEAMAA5ADAALQA3ADAAMwA1ADAA
MwAtADcAMAAwADIAMgA0AC0ANwAwADIANwA3ADAALQA3ADAAMAA3ADUAOQAtADcAMAA0ADIAMwAx
AC0ANwAJADAAMQAwADUAOAAtADcAMAA1ADIAMgAwAC0ANwAwADUAMQA2ADEALQA3ADAAMAA3ADgA
NgAtADcAMAA0ADAANQAzAC0ANwAwADQANAA3ADIALQA3ADgAMAAwADMAOAAtADcAMAAzADkAOAAy
AC0ANwAwADQAMAA2ADQALQA3ADAAMwA2ADUANQAtADgANQAzADgAMQAzAAkALQA4ADUAMwA1ADUA
MAAtADgANQAzADcAMAAyAC0ANwAwADIAOAA4ADcALQA4ADUAMAAyADkAOAAtADcAMAA1ADIANAA5
AC0AMQAzADkAMAAxADAALQA3ADAANQAxADUAMwAtADcAMAA0ADAANwA0AC0ANwAwADQANAA5ADgA
LQA3ADAAMAAyADcAOAAtADcAMAA0ADMACQAyADgALQA3ADAANQAxADUANQAtADcAMAAyADEANQA2
AC0AMQA4ADgAMAAxADkALQA3ADAAMgA5ADcANQAtADcAMAAyADgANQAyAC0ANwAwADEANAAzADIA
LQA3ADAAMQA0ADQAMwAtADcAMAAzADkANAA5AC0ANwAwADUAMAAyADIALQA3ADAAMgA2ADAAMAAt
ADcAOAAJADAAMAAyADIALQA3ADAANAA3ADEAOAAtADcAMAAyADEANAA3AC0ANwAwADIANQAwADAA
LQA3ADAANAA3ADEANAAtADcAMAAyADEANAA2AC0ANwAwADQANQA5ADkALQAxADAANQA3ADAAMAAt
ADcAMAAxADYANgA3AC0ANwAwADIAOAA3ADcALQAxADAANQAyADUAMAAtAAkANwAwADEAOAAwADMA
LQA3ADAAMQAwADcANQAtADcAMAAzADMAMAAwAC0ANwAwADIAMwAwADEALQA3ADAAMAA0ADkAMgAt
ADcAMAAyADQAMAA5AC0ANwAwADIANwA5ADgALQA3ADAAMQA5ADAAMQAtADcAMAAxADEAMQAxAC0A
NwAwADQANgA3ADMALQA3ADAAMAA3ADYACQAyAC0ANwAwADEANQA3ADYALQA3ADAAMgA3ADUANAAt
ADYAMwAtADEANAA4ADAAMAA0AC0AMQA0ADgAMQAzADMALQAyADAAMAA0ADMALQA0ADIAMAAwADAA
LQA0ADIAMAAwADMALQA2ADMAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAA6AAAAeAAtAHQAbQAt
AGEAcwAtAHUAcwBlAHIALQBhAHAAcAByAG8AdgBlAGQALQBzAGUAbgBkAGUAcgAAAAAAAQAAAAYA
AABOAG8AAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgAAAB4AC0AdABtAC0AYQBzAC0AdQBz
AGUAcgAtAGIAbABvAGMAawBlAGQALQBzAGUAbgBkAGUAcgAAAAEAAAAGAAAATgBvAAAAAABUKQ==

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E41E3BMK019S01emtr_--
