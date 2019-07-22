Return-Path: <jailhouse-dev+bncBAABBGVU23UQKGQEGBFINNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F776FE8E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 13:12:26 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id g8sf19022890wrw.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 04:12:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563793946; cv=pass;
        d=google.com; s=arc-20160816;
        b=YOn8KbS1e9aofTQiQ5ZCpGiXFyKDovVlN8IVpV2G8ejWbLBp5I5djLKsYOdQOyKi9b
         4VD/oBXkTadqAuMU7D+tZuoS5NPtwN0xxBSvu1lcIzCQC9bEekIvuBIPwwC7a69TmCEH
         3fPuR4m5gYROjFlOdafImUNsAxYN8sc7M8rtfhEYRZJUoT3P2Jk6zmj7DMzzYuo0mDku
         bYYy1XHPqSn/Id4lct0m7xF8lRmosxfoI+CsX3hwH0dMMpHAVk6IfQEzcVllfjZ2fuWA
         Qnu2QPfOVlFd4P8eIdtZtJg1A54IQAlVU5a0+hM8ZWZNj/+b2ATgVXPN2gOOwrDZR8VO
         bYZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:acceptlanguage
         :content-language:accept-language:in-reply-to:references:message-id
         :thread-index:thread-topic:subject:date:cc:to:from:sender
         :dkim-signature;
        bh=s+zzgOX++QSvLbfP9NpCvU/lPZw7ZOWiEeZR1ZiHg5c=;
        b=AbQcOkDyPg3J7p1YZInTSPqfuxsik/CSmju8N60BSW9Ju1dEqGWc2zl4PRpALKMbMe
         FNFxViA9ajsZq5js4+MA/V7m+xOeEqL6dbckr1UN074N2KickPPz96H9l46qDr9tt8On
         ycf7alYi0+RxINvtyt0r+VYbaY0BlURkrosaF2nRd35lgSfXynUpMP9UY3cMm6TeJhTb
         MJ4b8UbDFk8E24HqVkHNHyN9B6Q7CColENxwCKA5a+p7NWJPfpLkfiwMcz94KCsbhGGE
         29awdV9tMkrs5pDyVjoHzQrc03SFR4BHsoXMq0Cgb8m+mPWGEE1ZGZk/l9ddM/FaufyQ
         1kFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:date:subject:thread-topic:thread-index:message-id
         :references:in-reply-to:accept-language:content-language
         :acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=s+zzgOX++QSvLbfP9NpCvU/lPZw7ZOWiEeZR1ZiHg5c=;
        b=KozGay9pEqaxs7RW7h5PmN3YyGc+GO0wLMScEiC9rcMpheKBG1cII3IafY+etfjx11
         qVVXOKPWtL8hxtUofZIaFi5pckS+pxDpY8S6bYVuoP+xJf79L5FoELXaoLbrNZYKT533
         ZWEBJIiZyDQ6DNou7cDsv9kiAPWhyLv7Ka8CYq4Aj7vjqtHxRvIPjT9GCljptpA/MhR2
         WSx6g8IMuD71Ilg4gITf8Ff1A8qq6soBPIht/+IT9PyTgBWKA64/Fev3COnW1gdgWDIQ
         Op4R/gJnJzZh8qY9Z4LhZsodsbI8jEDJwi3/QwpHIR4WNfUq9I3ZxfJT2FilyN7i/6dj
         Lixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:date:subject:thread-topic
         :thread-index:message-id:references:in-reply-to:accept-language
         :content-language:acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s+zzgOX++QSvLbfP9NpCvU/lPZw7ZOWiEeZR1ZiHg5c=;
        b=pTGG5Cht/UCYiSCej8EbOcRBZSZHXzqRBbO7jpldUyJ+xfu19zY/U2sTS/Bkd0D4k+
         C56ctCyD2iuGXXwcTfXSTRgohawMYKPRvmHG42wkJWimEY1Bmhh8wrzgq7Ay+Dx3E1Pb
         /c0wrM7MqdfUS4DQBVhDB9XYQB/YO1OWkLkBIKqOg6AUUpkOxXG3CCfsNltoZxbdfMvx
         SLuL7XEhv1HpNNWoNZDCZsSz2cOFTjliknl+mCYGTKXyVFka3iNSXam3Nk1kA04UvLda
         KaHTBkOGUdGJZ2exCN2VPgUETDwd/natgpyzrgB3ZJzoizXtkRn5BXZXS/SzmxVWeLS6
         KTtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUPFt3em2AGsD3ROcsqQ1vI876LS9g2r4opcUqAaFWqNycehHsi
	Czp//O0B7I9cyBZIlzD7pbs=
X-Google-Smtp-Source: APXvYqwdUcqk7DyBQgbq4ykU5kQ7e0q8ynBo1HJyWn92VwiKm2lg+SJk2bQJ5hl2L6sh0NScDHBj/g==
X-Received: by 2002:a05:600c:218d:: with SMTP id e13mr63847366wme.29.1563793946275;
        Mon, 22 Jul 2019 04:12:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a745:: with SMTP id e5ls11639322wrd.5.gmail; Mon, 22 Jul
 2019 04:12:25 -0700 (PDT)
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr75928118wrk.98.1563793945915;
        Mon, 22 Jul 2019 04:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563793945; cv=none;
        d=google.com; s=arc-20160816;
        b=GglaggEc/W4f69Bu1OsVeNIllXlPJeRaa73bCl2CzSUJk1GYzxBQRzQsuA69yy5h2V
         PgrjszDdavNs22KgFYX8sKOFkxfoI4C9TcppPbRkVGBQ83AGaDA2/RmhrGJBLcQyz/02
         +OIGIEY4c/nb8pzxjmJ591s+eYoKjuLg+xOYd2adSs0JEK8ijzq5STsvJ5IjKeo0v5OF
         /h3VDE6S64OreZ2A+iyv2HuucMpd0nRUu+HlCp6VVCSlYHb2S52B/jio6yBb4AECA3S7
         sm8zO4eqOT4K2H5Mvin7WrxHIYbbYBpfvw1Ivo370bGtuiHz9wqJveCLVl7I8M4/2DfV
         Hhaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:acceptlanguage:content-language:accept-language
         :in-reply-to:references:message-id:thread-index:thread-topic:subject
         :date:cc:to:from;
        bh=l4VFe8yPuCXZRAEBKMKhnlu7F07sCdRUFugQOcof49U=;
        b=M7zCcOBhTxkMEP9SCTYX4EFoSaUJebejj8pxFDzmLsUxdnXIEfScDOOJtuYFBjY7Os
         Xya8ZlOAJLGOpCFQJatc1BZTLixos2X/iz0LPRBGdsNhakg62w4JVj8Kpeb4mPcVhGqG
         Y9nkeDAdTyNFtZAkokmnT95H3D8AeiA3Bn/vScigpQ8p/+kceKfe6n+JsKHpSL8AOo77
         Fi5dVpMa8GfNlbA6rQgm6RugL3XXnns1JvldrOvc0RmZIcVcEVG9BDkVolaXmYh9nHJa
         ZERoco2/caReqtYw9GkGs32f0L6f8prC6k5RO6SgNh2GKNc36zSbPoXO2o9QWZ4Vv6uH
         dXqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
Received: from mail3.emtrion.de (mail3.emtrion.de. [80.150.99.69])
        by gmr-mx.google.com with ESMTPS id p15si1489604wmb.0.2019.07.22.04.12.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 22 Jul 2019 04:12:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) client-ip=80.150.99.69;
Received: from BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0]) by
 BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0%10]) with mapi; Mon, 22
 Jul 2019 13:12:10 +0200
Content-Type: multipart/mixed;
	boundary="_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3D14BMK019S01emtr_"
From: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>
To: Mark Rutland <mark.rutland@arm.com>
CC: JailhouseMailingListe <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
Date: Mon, 22 Jul 2019 13:11:55 +0200
Subject: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Topic: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Index: AdVAcpA7+rrDBhp0TA2OvHcQ+49B8gABdTdw
Message-ID: <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
 <20190722094752.GB28400@lakrids.cambridge.arm.com>
In-Reply-To: <20190722094752.GB28400@lakrids.cambridge.arm.com>
Accept-Language: de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
acceptlanguage: de-DE
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-24784.003
x-tm-as-result: No--14.371800-8.000000-31
x-tm-as-matchedid: 700225-703140-701090-703503-702887-780022-704718-705161-7
	02147-705116-704542-705115-105640-853813-853802-853702-850298-703032-702600
	-705249-139010-702345-703655-705220-704949-703017-700950-704053-700759-7040
	74-704714-704131-705212-705154-701432-700535-703624-705271-701591-704706-14
	8004-148133-20043-42000-42003-63
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

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3D14BMK019S01emtr_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

I'm not touching bit 13 or 14 in HCR_EL2, they're both 0. HCR_EL2 is the sa=
me for 64 bit and 32 bit inmates when the crash happens, except for HCR_RW_=
BIT, obviously. HCR_EL2 value is 0x28001B at crash time.

@Jan: We're planning to submit patches, but I guess we'll have to make it m=
ore generic first, before we can submit something. Will have to try the QEM=
U setup.

Best regards,
Jan

-----Urspr=C3=BCngliche Nachricht-----
Von: Mark Rutland [mailto:mark.rutland@arm.com]=20
Gesendet: Montag, 22. Juli 2019 11:48
An: von Wiarda, Jan
Cc: JailhouseMailingListe
Betreff: Re: 64 bit Hypervisor crash at 32 bit WFI instruction

On Mon, Jul 22, 2019 at 09:19:50AM +0200, von Wiarda, Jan wrote:
> Hi all,
>=20
> we implemented support for Jailhouse 32 bit inmates running on 64-bit
> Jailhouse on the i.MX 8M Mini and it works fine, GIC demo runs without
> problems. Now I have one problem, that just occurred. I'm trying to
> get the ivshmem demo running in 32 bit and it does work until it comes
> to the line
>=20
> asm volatile("wfi" : : : "memory");
>=20
> When I give the inmate CPUs 1-3 in 32 bit mode and the inmate accesses
> this line, the 64 bit inmate CPU 0 crashes. If I comment this line out
>=20
> //asm volatile("wfi" : : : "memory");
>=20
> both 64 bit root cell and 32 bit inmate run just fine. Now apparently
> the 64 bit Jailhouse Hypervisor has a problem with WFI beeing executed
> by a 32 bit inmate, as with a 64 bit inmate there is no problem. Is
> there an explanation for this behaviour? I guess I will now have to
> handle the WFI exception. How do I know the inmate is exiting because
> of a WFI, all exits I see are these:
>=20
> #define ESR_EC_SMC64			0x17
> #define ESR_EC_SYS64			0x18
> #define ESR_EC_DABT_LOW			0x24
>=20
> In the ARMv8 manual it says, ESR_EL2 has an EC =3D=3D 0b000001, that trap=
s
> WFI and WFE and there is a define
>=20
> #define  HSR_EC_WFI		0x01
>=20
> but it's not used and it's for AArch32 only. Now I wonder, what's the
> best way to handle this?

AFAICT, jailhouse doesn't set HCR_EL2.{TWE,TWI}, so WFI should never be
trapped to EL2.

Are you setting those bits (or leaving them preserved) in your 32-bit
enablement code?

Thanks,
Mark.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/95F51F4B902CAC40AF459205F6322F01C4EE0E3D14%40BMK019S01.emtrio=
n.local.

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3D14BMK019S01emtr_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
Uk12ODTB3G51B0A1EieAeSsBl7OPJuGCgwOgl/AgPT0mUPZiHqCj0TFg9TlgKrBoCPdNMn0CTTBF
cKaIZILAl0T/n3+aByTwl8RNMZi5LrCnn/szIyQQJ4iiBUBI4RxgW+T7rDEn0kEHEBHAKMECIC0S
91+UXFBEIXIlcCmwGICsMfclkXsYO4J3ohAx8o73BABiPyIcQUZBXSAscWrzVudmkm4nN8FjwSUF
L8Bge1RXRSy1kKnQfd8lcBkgTSMqcAhgbBxgGFD/GjE2gSIVpKIq0HDRMhC1M/uyTCXheQhgOiKS
g14RV0H7JAEEICgFsR5wjEG6s2SB5z5AQ/EaIWQpJMK6IQXA/yjAWTkJ8AGgVYQb0QEAsi3+VBmh
H1AiBiHCL8YVQsJgAAAAHwBCAAEAAAAgAAAAdgBvAG4AIABXAGkAYQByAGQAYQAsACAASgBhAG4A
AAAfAGUAAQAAADIAAABKAGEAbgAuAHYAbwBuAFcAaQBhAHIAZABhAEAAZQBtAHQAcgBpAG8AbgAu
AGQAZQAAAAAAHwBkAAEAAAAKAAAAUwBNAFQAUAAAAAAAAgFBAAEAAAB0AAAAAAAAAIErH6S+oxAZ
nW4A3QEPVAIAAACAdgBvAG4AIABXAGkAYQByAGQAYQAsACAASgBhAG4AAABTAE0AVABQAAAASgBh
AG4ALgB2AG8AbgBXAGkAYQByAGQAYQBAAGUAbQB0AHIAaQBvAG4ALgBkAGUAAAAfABoMAQAAACAA
AAB2AG8AbgAgAFcAaQBhAHIAZABhACwAIABKAGEAbgAAAB8AHwwBAAAAMgAAAEoAYQBuAC4AdgBv
AG4AVwBpAGEAcgBkAGEAQABlAG0AdAByAGkAbwBuAC4AZABlAAAAAAAfAB4MAQAAAAoAAABTAE0A
VABQAAAAAAACARkMAQAAAHQAAAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAIB2AG8AbgAgAFcAaQBh
AHIAZABhACwAIABKAGEAbgAAAFMATQBUAFAAAABKAGEAbgAuAHYAbwBuAFcAaQBhAHIAZABhAEAA
ZQBtAHQAcgBpAG8AbgAuAGQAZQAAAB8AMUABAAAAAgAAAAAAAAALAEA6AQAAAB8AMEABAAAAAgAA
AAAAAAAfABoAAQAAABIAAABJAFAATQAuAE4AbwB0AGUAAAAAAAMA8T8HBAAACwBAOgEAAAADAP0/
5AQAAAIBCzABAAAAEAAAABVEeRtRYgdGnWb6YHyMdfoDABcAAQAAAEAAOQCAj0xFfkDVAUAACDD+
1TFOfkDVAQsAAgABAAAACwAjAAAAAAADACYAAAAAAAsAKQAAAAAACwArAAAAAAADAC4AAAAAAAMA
NgAAAAAAHwBwAAEAAABkAAAANgA0ACAAYgBpAHQAIABIAHkAcABlAHIAdgBpAHMAbwByACAAYwBy
AGEAcwBoACAAYQB0ACAAMwAyACAAYgBpAHQAIABXAEYASQAgAGkAbgBzAHQAcgB1AGMAdABpAG8A
bgAAAAIBcQABAAAAGwAAAAHVQHKQO/q6wwYadEwNjrx3EPuPQfIAAXU3cAAfADUQAQAAAIoAAAA8
ADkANQBGADUAMQBGADQAQgA5ADAAMgBDAEEAQwA0ADAAQQBGADQANQA5ADIAMAA1AEYANgAzADIA
MgBGADAAMQBDADQARQBFADAARQAzAEQAMQA0AEAAQgBNAEsAMAAxADkAUwAwADEALgBlAG0AdABy
AGkAbwBuAC4AbABvAGMAYQBsAD4AAAAAAB8AORABAAAA8AAAADwAOQA1AEYANQAxAEYANABCADkA
MAAyAEMAQQBDADQAMABBAEYANAA1ADkAMgAwADUARgA2ADMAMgAyAEYAMAAxAEMANABFAEUAMABF
ADMAQwBCADQAQABCAE0ASwAwADEAOQBTADAAMQAuAGUAbQB0AHIAaQBvAG4ALgBsAG8AYwBhAGwA
PgAgADwAMgAwADEAOQAwADcAMgAyADAAOQA0ADcANQAyAC4ARwBCADIAOAA0ADAAMABAAGwAYQBr
AHIAaQBkAHMALgBjAGEAbQBiAHIAaQBkAGcAZQAuAGEAcgBtAC4AYwBvAG0APgAAAB8AQhABAAAA
ZgAAADwAMgAwADEAOQAwADcAMgAyADAAOQA0ADcANQAyAC4ARwBCADIAOAA0ADAAMABAAGwAYQBr
AHIAaQBkAHMALgBjAGEAbQBiAHIAaQBkAGcAZQAuAGEAcgBtAC4AYwBvAG0APgAAAAAAAwCAEP//
//8fAPMQAQAAAHgAAABBAFcAJQAzAEEAIAA2ADQAIABiAGkAdAAgAEgAeQBwAGUAcgB2AGkAcwBv
AHIAIABjAHIAYQBzAGgAIABhAHQAIAAzADIAIABiAGkAdAAgAFcARgBJACAAaQBuAHMAdAByAHUA
YwB0AGkAbwBuAC4ARQBNAEwAAAALAPQQAAAAAAsA9RAAAAAACwD2EAAAAABAAAcwohEtTn5A1QEC
ARAwAQAAAEYAAAAAAAAAq892ocnX80KwWPR1KKRELAcAlfUfS5AsrECvRZIF9jIvAQC0ndcJAQAA
RrBVRfc5qk27e/xZnl0dTAC32mp7rgAAAAADAN4/r28AAB8A+D8BAAAAIAAAAHYAbwBuACAAVwBp
AGEAcgBkAGEALAAgAEoAYQBuAAAAAgH5PwEAAACEAAAAAAAAANynQMjAQhAatLkIACsv4YIBAAAA
AAAAAC9PPUZJUlNUIE9SR0FOSVpBVElPTi9PVT1FWENIQU5HRSBBRE1JTklTVFJBVElWRSBHUk9V
UCAoRllESUJPSEYyM1NQRExUKS9DTj1SRUNJUElFTlRTL0NOPUpBTi5WT05XSUFSREEAHwD6PwEA
AAAgAAAAdgBvAG4AIABXAGkAYQByAGQAYQAsACAASgBhAG4AAAACAfs/AQAAAIQAAAAAAAAA3KdA
yMBCEBq0uQgAKy/hggEAAAAAAAAAL089RklSU1QgT1JHQU5JWkFUSU9OL09VPUVYQ0hBTkdFIEFE
TUlOSVNUUkFUSVZFIEdST1VQIChGWURJQk9IRjIzU1BETFQpL0NOPVJFQ0lQSUVOVFMvQ049SkFO
LlZPTldJQVJEQQADABlAAAAAAAMAGkAAAAAAAwAJWQEAAAADAACACCAGAAAAAADAAAAAAAAARgAA
AAAQhQAAAAAAAAsAAIAIIAYAAAAAAMAAAAAAAABGAAAAAAOFAAAAAAAAAwAAgAMgBgAAAAAAwAAA
AAAAAEYAAAAAAYEAAAAAAAAFAACAAyAGAAAAAADAAAAAAAAARgAAAAACgQAAAAAAAAAAAAADAACA
AyAGAAAAAADAAAAAAAAARgAAAAATgQAAAQAAAAsAAIADIAYAAAAAAMAAAAAAAABGAAAAAByBAAAA
AAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAAJoEAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAA
AAAQgQAAAAAAAAMAAIADIAYAAAAAAMAAAAAAAABGAAAAABGBAAAAAAAAAwAAgAMgBgAAAAAAwAAA
AAAAAEYAAAAAKoEAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAApgQAAAAAAAAsAAIADIAYA
AAAAAMAAAAAAAABGAAAAACSBAAAAAAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAALIEAAAAAAAAf
AACAAyAGAAAAAADAAAAAAAAARgAAAAAngQAAAQAAAAIAAAAAAAAAAwAAgAMgBgAAAAAAwAAAAAAA
AEYAAAAAEoEAAAEAAAAfAACAAyAGAAAAAADAAAAAAAAARgAAAAAhgQAAAQAAAAIAAAAAAAAACwAA
gAMgBgAAAAAAwAAAAAAAAEYAAAAAA4EAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAAjgQAA
////fwsAAIAIIAYAAAAAAMAAAAAAAABGAAAAAA6FAAAAAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYA
AAAAAYUAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAAAAAYhQAAAAAAAAsAAIAIIAYAAAAAAMAA
AAAAAABGAAAAAAaFAAAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAgoUAAAAAAABAAACACCAG
AAAAAADAAAAAAAAARgAAAAC/hQAAwNWxgn1A1QEDAA00+T8AAAIBFDQBAAAAEAAAAFSUocApfxAb
pYcIACsqJRcfAD0AAQAAAAoAAABBAFcAOgAgAAAAAAAfADcAAQAAAGwAAABBAFcAOgAgADYANAAg
AGIAaQB0ACAASAB5AHAAZQByAHYAaQBzAG8AcgAgAGMAcgBhAHMAaAAgAGEAdAAgADMAMgAgAGIA
aQB0ACAAVwBGAEkAIABpAG4AcwB0AHIAdQBjAHQAaQBvAG4AAAAfAACAhgMCAAAAAADAAAAAAAAA
RgEAAAAeAAAAYQBjAGMAZQBwAHQAbABhAG4AZwB1AGEAZwBlAAAAAAABAAAADAAAAGQAZQAtAEQA
RQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAACAAAAB4AC0AbQBzAC0AaABhAHMALQBhAHQAdABh
AGMAaAAAAAEAAAACAAAAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAACgAAAB4AC0AdABtAC0A
YQBzAC0AcAByAG8AZAB1AGMAdAAtAHYAZQByAAAAAQAAAEwAAABTAE0ARQBYAC0AMQAxAC4AMAAu
ADAALgA0ADIAOAAzAC0AOAAuADEAMAAwAC4AMQAwADYAMgAtADIANAA3ADgANAAuADAAMAAzAAAA
HwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAHgAAAHgALQB0AG0ALQBhAHMALQByAGUAcwB1AGwAdAAA
AAAAAQAAADQAAABOAG8ALQAtADEANAAuADMANwAxADgAMAAwAC0AOAAuADAAMAAwADAAMAAwAC0A
MwAxAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAJAAAAHgALQB0AG0ALQBhAHMALQBtAGEAdABj
AGgAZQBkAGkAZAAAAAEAAAB+AgAANwAwADAAMgAyADUALQA3ADAAMwAxADQAMAAtADcAMAAxADAA
OQAwAC0ANwAwADMANQAwADMALQA3ADAAMgA4ADgANwAtADcAOAAwADAAMgAyAC0ANwAwADQANwAx
ADgALQA3ADAANQAxADYAMQAtADcACQAwADIAMQA0ADcALQA3ADAANQAxADEANgAtADcAMAA0ADUA
NAAyAC0ANwAwADUAMQAxADUALQAxADAANQA2ADQAMAAtADgANQAzADgAMQAzAC0AOAA1ADMAOAAw
ADIALQA4ADUAMwA3ADAAMgAtADgANQAwADIAOQA4AC0ANwAwADMAMAAzADIALQA3ADAAMgA2ADAA
MAAJAC0ANwAwADUAMgA0ADkALQAxADMAOQAwADEAMAAtADcAMAAyADMANAA1AC0ANwAwADMANgA1
ADUALQA3ADAANQAyADIAMAAtADcAMAA0ADkANAA5AC0ANwAwADMAMAAxADcALQA3ADAAMAA5ADUA
MAAtADcAMAA0ADAANQAzAC0ANwAwADAANwA1ADkALQA3ADAANAAwAAkANwA0AC0ANwAwADQANwAx
ADQALQA3ADAANAAxADMAMQAtADcAMAA1ADIAMQAyAC0ANwAwADUAMQA1ADQALQA3ADAAMQA0ADMA
MgAtADcAMAAwADUAMwA1AC0ANwAwADMANgAyADQALQA3ADAANQAyADcAMQAtADcAMAAxADUAOQAx
AC0ANwAwADQANwAwADYALQAxADQACQA4ADAAMAA0AC0AMQA0ADgAMQAzADMALQAyADAAMAA0ADMA
LQA0ADIAMAAwADAALQA0ADIAMAAwADMALQA2ADMAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAA
ADoAAAB4AC0AdABtAC0AYQBzAC0AdQBzAGUAcgAtAGEAcABwAHIAbwB2AGUAZAAtAHMAZQBuAGQA
ZQByAAAAAAABAAAABgAAAE4AbwAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAOAAAAHgALQB0
AG0ALQBhAHMALQB1AHMAZQByAC0AYgBsAG8AYwBrAGUAZAAtAHMAZQBuAGQAZQByAAAAAQAAAAYA
AABOAG8AAAAAAE7A

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3D14BMK019S01emtr_--
