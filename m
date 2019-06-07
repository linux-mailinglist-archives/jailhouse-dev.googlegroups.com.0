Return-Path: <jailhouse-dev+bncBCZ3TK6ASEDBBLFF5DTQKGQEWLEBYXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC703850F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 09:30:52 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id a25sf311585lfl.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 00:30:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559892652; cv=pass;
        d=google.com; s=arc-20160816;
        b=u4NQ4hrnD//oGKnAU3aNJpgMVRtzyyGGvO2Q8+RprBN+z7v16fQG7KcpBUgkp6X/ha
         tuA2+fCbt1NN/CAg23RTv6rWNO+S5f3UmgBC/4ZZCMpM5qnAgBZLCw+xC7Ns9Sn0L7zP
         cwSmqJIPYl+0ijIXEEmWMOi75fCYnbAW3rj8Dwye0VnnZIQI4uMRIoI368d/szn7Em2O
         1vWKFTldchGJXII5Gw0L6S8k1Bdo74QA90CBn4nP5dyM88LlHQzoyjUI4gv7NjFbRbhJ
         O4s005kXcgwzPSjrMBFmy3YT1plfdgD/mEPq8ysM6TcLp1K5Trzetjm3CvSGoLeZhCQu
         aUMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=eNMn0Fi18FwJKvzISi9gWrRfoMUamyC3KEpHfMYaEwg=;
        b=aUO2WPRFqv6Ygkui9FGNe+xjykKPPlCmcxxvt3aEu3dtEJJzSDep1F4Lo9khq4Z/Rz
         v8BTm475Rrvsba+F9YguMEce/S6a7nRJl2/9I9kTWhLy1QBUkRjPUA9r5lor49SuyceE
         11f1iblv3EQDOV0OOZjEK3Y130pPAHzrpq7DDcO1HMkB48LvVsFN5AMYj81dJaFRVfs3
         0SRjgQVaMUoBaMaqGsBAfTs1PYx3DA4FiuRyLA2pCILiMd1Zd/56ziz84bUdHfENgeBm
         QMu5I80qbg8PUd/PPrOKEeEh0bvJ7g7GGSo9LtTns+jfwkQwil9dMuMoROymGmiPcpo0
         +Obw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eNMn0Fi18FwJKvzISi9gWrRfoMUamyC3KEpHfMYaEwg=;
        b=YUi2mTXEALjYhJHVuXIPOZXymafFHfreWhImtAf8R9PjrGABIPYbMmteJ6l8D0ZvLf
         LA/Ve92Bl7RAD6YvrEn4s0g9CXTEU3dRClI8aMQG4KOrYlaEcdborkU8JrquTi0XFk5h
         GMqIjvplcO3b+3dYfPRWwpP08Eo86TskKwj9C9zOrtMmnWGGHgbSAXtbvPTYryKWoadt
         TBBJZzfark/CoQ+BN3nSqmvKPDdRFVef4ZzDWurGKOqibYmjvjItsucFwQn7EcU1vpKW
         lCnK7JvnU1gMW6m9r6v/vxW4+RJPRRUnfX9AfJfVMHDmNbrRQK253eOS1HaTmC1BjJXK
         /pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eNMn0Fi18FwJKvzISi9gWrRfoMUamyC3KEpHfMYaEwg=;
        b=HtZZN6ClHe0GIwV0Skfh/SUKLq82LSxsiISeWWrWJRm/bfJcgNX/mOOxscsJbE+DNm
         LjrABQcQpx2uzFSxY7yOOJKRTGTxUG+0E1mj9MmZJhAzp7aTBXenEHclaw4ALpRXSZvU
         DP50del7xiaFTWs/JVWdfoPeYioBfa6uGXywqUUBMV7xvPJPZBhrchMhIdQp2RpUhqwA
         eP3nSkfQjzDDbFIN9NRuL/0U+s84CUMxeF59/VvSUh2kxjlYf/nVY9Y1w7IEm+LtLmyP
         gfif6glonluF4NPzc1e5hR+mDXby5fepITNSzPD8OJvLmxIoLn20JVcZudh+81Hh3zai
         XbrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/r6oBFCm5vlI7tnIEGBYXdCu3wJeQ5xvXZH+BKiE33MYpLkqX
	JnL1vHEXKe/vW34QwYF9uUU=
X-Google-Smtp-Source: APXvYqwg/xmORiDRvMrEm8dKaA0U8TWGLEI3kbuExne7GAnFW/AUAFZLm4Fm/P6qzvtkKJT8sqFOsg==
X-Received: by 2002:a2e:8796:: with SMTP id n22mr26927626lji.75.1559892652300;
        Fri, 07 Jun 2019 00:30:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e0a:: with SMTP id e10ls101563ljk.9.gmail; Fri, 07 Jun
 2019 00:30:51 -0700 (PDT)
X-Received: by 2002:a2e:8583:: with SMTP id b3mr8578301lji.171.1559892651800;
        Fri, 07 Jun 2019 00:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559892651; cv=none;
        d=google.com; s=arc-20160816;
        b=XyoC0Zbj97BP5m2hmd52ek9lwLM2qgXn5/HDzIf0IPW7ROJWDx97uw4YH1szqVXMLG
         QZHyJBtoeiedP7hXtGFRrEFeXdcM/cI7dX8hthifEBtB3A/vDhaZpCET5Muxh9btxFYg
         RCLZzF802rgRH/fOU6naEyTGB9iv7jQHGwSSJYxk+yIW1IRVyUA9hqtVyfd7v53KHjQw
         YIh3z038I3Edm8VxViF4LbngUzbdCRdlaPuIGmn1xvi5gxf8A6ZUJZrISikvCjYVo2Tr
         orSVPOhvVsNVOZAD+D7Doy0s2CURuBcUMPlPluKItZ6ov82+6hVnCH/xTEzg3CL0zdun
         5yHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=InneaWjJd1FaedTlwYBEAiDIKelxlHyVV+1XTmtXdmg=;
        b=O+4eSr/OCIgXSmArHqocdfMGAY47AKK8d8OhDn3CnhzH9LqofIsbLLp9VwLvTQVVol
         Mkxqu7SIQl4dpDv2Ic/n2QU+Sow5X7ZFUYOE4buE7bBCK8JenyhQNbuVThoiJePQOfUs
         DDAD1tvd85f4x3GWgIi+sOm3d8kGWbOigIjQfh/VoK5Bka/tX+AiM6wiWyb0vfVccQQc
         sILWwYvM1ZWIsUDq++g/HpDHqu9NKhSjRu9l3Dg/mIIDfVzr2jxug7Hajo6X5djAVEcI
         OC8gCwNM3181CtddXvyV3SrqN8So2zdMwmQ4eFuNv314G0DIMfrX9XVNt5FJRttUQch1
         FBFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c15si73627lji.0.2019.06.07.00.30.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 00:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x577Uo7i008306
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 09:30:50 +0200
Received: from jpc.jpnet (DEMCHP-JPPJ.ppmd.siemens.net [139.25.69.153])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x577UobY002493
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 7 Jun 2019 09:30:50 +0200
Received: by jpc.jpnet (Postfix, from userid 1223)
	id 8B04F1B20242; Fri,  7 Jun 2019 09:30:50 +0200 (CEST)
Date: Fri, 7 Jun 2019 09:30:50 +0200
From: "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Johannes Maisch <johannesmaisch95@gmail.com>,
        "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Daniel Schmid <dascit16@hs-esslingen.de>
Subject: Re: Freertos-demo bare-metal boot
Message-ID: <20190607073050.z6bwedzkvwvy6u5l@jpc.jpnet>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
 <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
 <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
 <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
 <95b6464e-f439-9b8f-8df6-2ad7281c5cf9@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <95b6464e-f439-9b8f-8df6-2ad7281c5cf9@oth-regensburg.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Original-Sender: johann.pfefferl@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.40
 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hello,

Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de> wrote:
> Hi Hans,
> hi all,
>=20
> is the inmate actually supposed to run on bare-metal w/o jailhouse?

It was never tested before.

>=20
> Correct UART consoles are set? I'd try to add a very early printk inside
> freertos just to check if that part is 'alive'. As you have already
> remarked, the UART requires clock gating on bare-metal, while we in
> Jailhouse, we may handover a gated uart device.

The UART is initialized completely by FreeRTOS itself. I do not suppose
that the UART is already working.

>=20
> And then there's paging: AFAIR, u-boot hands over with id-mapped paging
> enabled, didn't it? On jailhouse, we hand over with paging completely
> disabled.

Yes. I think that could be the main reason why it does not start.
FreeRTOS is configuring MMU, Caches by its own. It assumes that all this
is off when it enters the "boot_stub.S" code. It simply starts from a
Reset state. The reset vector is the entry point here. The inmate_main
only runs correctly if the stack for IRQ and privileged mode are setup
already.

>=20
> On 6/6/19 5:52 PM, Johannes Maisch wrote:
> > Hello,
> > thanks for your assistance. However, we can't boot freertos at the
> > moment. I adapted the linker script like this and rebuilt the
> > freertos-demo:
> >=20
> > ENTRY(vectors)
> >=20
> > SECTIONS {
> > =C2=A0=C2=A0=C2=A0 /* jailhouse arm inmates have to start at address ze=
ro */
>=20
> That comment is no longer up to date - inmates don't have to start at
> zero, I added the CONFIG_INMATE_BASE option a while ago, for exactly
> this case: it allows to use the same inmates on bare-metal, as well as
> as jailhouse guests.
>=20
> The motivation of my patches were motivated by your exact use-case:
> Having the same inmate for both, bare-metal and in jailhouse, is ideal
> for benchmarks or comparisons.
>=20
>   Ralf
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D 0x48000000;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .boot=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : { *(.boot) }
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(4096);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stack_top =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
> > =C2=A0=C2=A0=C2=A0 irq_stack_top =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bss_start =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *(.bss)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *(COMMON)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > after that i tried to boot freertos in u-boot with the following comman=
ds:
> >=20
> > =3D> load mmc 0:1 0x48000000 freertos-demo.bin
> > reading freertos-demo.bin
> > 198508 bytes read in 45 ms (4.2 MiB/s)
> > =3D> go 0x48000000
> >=20
> > But the Freertos-demo still doesn't work. Is there anything else we hav=
e
> > to do?
> >=20
> > Johannes
> >=20
> >=20
> > Am 04.06.2019 um 12:27 schrieb Dr. Johann Pfefferl:
> >> Hello,
> >>
> >> the start address can be adapted in the linker script file
> >> "lscript.lds".
> >>
> >> The UART is initialized completely by FreeRTOS itself including the
> >> clock gating (hopefully).
> >>
> >> Hans
> >>
> >> Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>> On 04.06.19 11:09, johannesmaisch95@gmail.com wrote:
> >>>> Hello,
> >>>>
> >>>> we want to do a comparison of running FreeRTOS on the Banana Pi with
> >>>> Jailhouse and running FreeRTOS bare-metal on the Banana Pi for a
> >>>> study-project at Hochschule Esslingen. We were successfull in doing
> >>>> this with the Jailhouse hypervisor, but we currently didn't find a
> >>>> way to boot FreeRTOS bare-metal on the banana pi. So our question
> >>>> is, if there's a way to boot the freertos-demo.bin from the
> >>>> freertos-cell bare-metal on the banana pi.
> >>>>
> >>> Conceptually, you need to make the demo executable at a different
> >>> physical
> >>> address (it's configured to run from address 0, but RAM starts at
> >>> 0x40000000
> >>> on the board), and then you could load it there via u-boot and jump
> >>> to it.
> >>> You also have to ensure that the demo configures its uart itself and
> >>> doesn't
> >>> rely on the root cell to do anything. I don't recall if that is
> >>> already the
> >>> case. Hans may tell more about that.
> >>>
> >>> Jan
> >>>
> >>> --=C2=A0
> >>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >>> Corporate Competence Center Embedded Linux
> >=20
> >=20

--=20
Siemens AG
Corporate Technology
Research & Technology Center
CT RDA IOT SES-DE
Otto-Hahn-Ring 6
81739 Muenchen, Germany
mailto: johann.pfefferl@siemens.com
phone: +49 1520 3450 138
fax:   +49 89 636 33045
_____________________________________________________
SIEMENS AG: Chairman of the Supervisory Board: Jim Hagemann Snabe
Managing Board: Joe Kaeser, Chairman, President and Chief Executive Officer
Roland Busch, Lisa Davis, Klaus Helmrich, Janina Kugel, Cedrik Neike,
Michael Sen, Ralf P. Thomas
Registered offices: Berlin and Munich, Germany
Commercial registries: Berlin Charlottenburg, HRB 12300, Munich, HRB 6684
WEEE-Reg.-No. DE 23691322

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20190607073050.z6bwedzkvwvy6u5l%40jpc.jpnet.
For more options, visit https://groups.google.com/d/optout.
