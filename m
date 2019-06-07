Return-Path: <jailhouse-dev+bncBCZ3TK6ASEDBBWM65DTQKGQEVLI2ZXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 992C8384CF
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 09:16:42 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id j11sf115963ljh.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 00:16:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559891802; cv=pass;
        d=google.com; s=arc-20160816;
        b=MTdjPAysQwoS+eru8hzqQBI6zcAeRFqnxhEwHau8tXBgiB+acKi7Ul2RDnsE6BSP0O
         7NgDRDZkTIEnOkLyEOFEpnp8o5ECUzKHHj1gNJyOGsG2CJ94ndzyEEPyk1Oz2qJpYHkU
         48/lczc4XERamSqgXXI8f/QmZIlbls60jotl7zDC1SIKMPtFNC/cD+wdKS3bxL9A7VMf
         4UinCN+eOgfCnhO4y0EZCrM7TVCdXz9T1T23erQOTwJ3vJLKw8PeFCSknYsa2Rhm2KAX
         56W5PRCA8tEkoNA8QPcvCMw8s+YRBsACRUMdml3ojNpPgh7Pm6ijiOaOrTAdBi6+nuzr
         tghQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=M/s8NI7C0IhK6808aHXIBp2Yz7/uMBJrhyhAO3oNjsw=;
        b=V5AgN5Drng+1JKHafrEFwnnTp5dchOvL7Z8yO+b5xN53OA3WD/QkSMu6kCtYYNUxD/
         ZjI59TaUB3Knli4uMvVzJK/odFaHAhEZiXMCqPzfIykG5VhZ6vtPI1vB1Wumh4/gLBGr
         8UAtxMjZmMt0n2Qz35gj1/QnxtNXHcvOt9/DHO6LX0kAvSPqexkZwIqPrYEcmnoJvFZJ
         Evgn5f2Gl0G6d65XzoqonWQkB7/VISRtAFdrnF8WU3Fc+Oy0fse3cWkDmCJI74US/N3T
         MrB9ArBnhyazWSluLHP5nY5Xy3rVrQQaDWjE+cVqtfg2SkbW3QtyaQjpQ1xPbUOTTbW/
         XdJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M/s8NI7C0IhK6808aHXIBp2Yz7/uMBJrhyhAO3oNjsw=;
        b=bgmq/pKCfA6TxP7xFLbw2QkIgATB7fJtnJQ7S9tYr7fVXvrz9zXBApKO4TFCOHB7dY
         P7ENZhjOq9VoS5pyS2cPA8ocGiWV8TLSVjgtmgTAF/lI5oL822GnhsvbfXdwbKJiYCcN
         DfS3xo19k17FqyQb6yIZPBXXN3S5tDbc/I2FbpNnN76hMq1GWqGz7XnyfaI5VFDFNY9Q
         Z8d58obDG/Ne0Er8WPajcEOwtYdezs9WAsz/GSxOtJ2TO9T9ndmMYmu2o1f10J58sgp3
         3KhKUx3AKYhXRNrGTU8Pm9Vf14maYG+4EG6/C+NCC12Q0sujJXC/PQtPXqAApPZCqQ/5
         ywiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M/s8NI7C0IhK6808aHXIBp2Yz7/uMBJrhyhAO3oNjsw=;
        b=EFYU95X3Lv6kDoKI893uM6faT7QlvePpGH5O/f2VMHZR6OLf27MKmTQKTEvSZKpWlH
         sHjiCWRCf5wRMq98ireAe3PeUNBMZixC3DjJn3TSb1vWxA3vONghzK0sYZgfBzbynbLt
         gmkzDEZFzYrRa7mcr929P2Zao2vn6V05lh5o9QdQWfLaw23OxPsWshFp4J2cmj9KgmoH
         pF9os97TItBqZ2p2ZWhBHjzLoNbKxR5FxOkjAEnSbSeIplJg6LGYNC8OkARMUA9xYIZL
         oCoR86BzOT+wes8V8ZiMsdf+FkJ5v75twlTlwtXW4F59rPGTz5fl58M/piTLx7FtY6Qj
         +PYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUrwnOV7KIIfgh12fAzBUTXNEX985H9/S4KTVHEBbZoDuV0xbWg
	vw4PL5ZSaCoNUak7dW9jJBA=
X-Google-Smtp-Source: APXvYqx0gfGl/k+r+Hu+iHwUMOH9eZdywfqNw7V4zZTcMcdMz53zWCsSDXN6gDXpb1vGr4NNt2keMg==
X-Received: by 2002:a2e:2c04:: with SMTP id s4mr1908619ljs.61.1559891802133;
        Fri, 07 Jun 2019 00:16:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:523a:: with SMTP id i26ls723613lfl.9.gmail; Fri, 07 Jun
 2019 00:16:41 -0700 (PDT)
X-Received: by 2002:a19:740e:: with SMTP id v14mr27188533lfe.144.1559891801592;
        Fri, 07 Jun 2019 00:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559891801; cv=none;
        d=google.com; s=arc-20160816;
        b=di6EJOjYKA2bZFCeEDRXLVF6ShtrLl1J1FhHhoEpl+Z2k+Rffx9imxqfE8MsX5sNwr
         027EZBMzBsCfzmiAhDRwpcL6L+2104Gflft44+4T7XQNU3/p3NwoMFcd0Lfd5ksJpmvT
         h/bWt/CH2Km8GYYQTZTBttNuveVO13aDwJNh0/ro6Fs3ZRkhHsMTiXnDiDZ1LhLPUypV
         QxwVKrUJRaQ/96SwWWW7c/HYT7JLl4Qi6M5NNyG2uleRqntnz8Y0BiNvN8wxHTsv6xFT
         K9uePYZKZO60uJdtuXGGcZEXfYIOdIr5/xlQXiDJzOBXmp8idGE9BhbYZ4UP6fkmxHYT
         rVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=cMjn4UM0dx1Kd4Y/0G98YMKm6UcEkAyNBnKw1vHoGXI=;
        b=X/YQEUhg67cBdu0KpPbA/a7xgyr2CaOvUI3KEtis0hSsG+ehsQs1fcPzwO1NXb/HyF
         VPfcx3GhnCOT/Ye7/voqlEJqFgg5zzfCReJ8Mq4GWB/BvT6ucjd4/rCMYIz3pbK5mevm
         o+3SGE3IPWEWCM3EKnQsXjExSidfylV/LY8SjmBrZoegaTqDotZ66T23+H2164bMeHMr
         biJ2fltlYlfUGYk7RG9wSQWQYsQzuIuuEeNDXWNNnN0IPd2H2RsFOqxS+80SLixaw3yn
         ygpl5dpNKk+O5pgwbTURzrbBL4os60saxYIfj6O/16S5JeOku2ssCO5ecUqHM3ICnwQA
         CUOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id p88si25520lja.5.2019.06.07.00.16.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 00:16:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of johann.pfefferl@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x577GeLX013982
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 09:16:40 +0200
Received: from jpc.jpnet (DEMCHP-JPPJ.ppmd.siemens.net [139.25.69.153])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id x577GddZ001675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 7 Jun 2019 09:16:39 +0200
Received: by jpc.jpnet (Postfix, from userid 1223)
	id 197551B20242; Fri,  7 Jun 2019 09:16:40 +0200 (CEST)
Date: Fri, 7 Jun 2019 09:16:40 +0200
From: "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Johannes Maisch <johannesmaisch95@gmail.com>,
        "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Daniel Schmid <dascit16@hs-esslingen.de>
Subject: Re: Freertos-demo bare-metal boot
Message-ID: <20190607071640.i7nmepioqthtpjan@jpc.jpnet>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
 <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
 <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
 <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
 <cfab21e5-f8ea-15b1-981a-82592abe25c9@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cfab21e5-f8ea-15b1-981a-82592abe25c9@siemens.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Original-Sender: johann.pfefferl@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of johann.pfefferl@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;       dmarc=pass
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

Hello,

Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 06.06.19 17:52, Johannes Maisch wrote:
> > Hello,
> > thanks for your assistance. However, we can't boot freertos at the
> > moment. I adapted the linker script like this and rebuilt the
> > freertos-demo:
> >=20
> > ENTRY(vectors)
> >=20
> > SECTIONS {
> >  =C2=A0=C2=A0=C2=A0 /* jailhouse arm inmates have to start at address z=
ero */
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D 0x48000000;
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .boot=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : { *(.boot) }
> >=20
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(4096);
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stack_top =3D .;
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
> >  =C2=A0=C2=A0=C2=A0 irq_stack_top =3D .;
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bss_start =3D .;
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : {
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *(.bss)
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *(COMMON)
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
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
e to do?
> >=20
>=20
> Hans, I suppose this build on top of the lib inmate in Jailhouse, ie. its
> loader stub, right? That now expects the Jailhouse Comm Region to be pres=
ent
> and filled.

No, I do not rely on the jailhouse loader stub. The loader stub is
included in the file "boot_stub.S". Of course the boot stub assumes a
specific state of the CPU. If u-boot provides a different state (MMU
already on, Caches on, Runtime/Protection mode, ...) then FreeRTOS will not=
 boot.

>=20
> Johannes, try commenting out the revision and signature check in
> jailhouse/inmates/lib/setup.c for the bare-metal build.
>=20
> Jan
>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

Hans

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
jailhouse-dev/20190607071640.i7nmepioqthtpjan%40jpc.jpnet.
For more options, visit https://groups.google.com/d/optout.
