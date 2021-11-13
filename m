Return-Path: <jailhouse-dev+bncBC653PXTYYERBNMAX2GAMGQEXXLP4BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2244F23E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Nov 2021 10:07:03 +0100 (CET)
Received: by mail-qv1-xf3f.google.com with SMTP id n18-20020a0cbe92000000b00384d0c98fccsf10822906qvi.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Nov 2021 01:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OIfVu0OScwCIec9UtCuEdgOT+9Lz9raPPHkqnLW2Evo=;
        b=TfFacNo78qug0JOqcxb/T01vROKmj2mGS9ODKbK2cGD5UhJNOgdT7XRT0TwgO2Cy0E
         0StUeJ7Lhq9MA1fmitob486i7oUtAdh2EJ59z5xJ0SzT5RjwNB/THs4k6YF+67Nk8myu
         ujLFy2+UA24iKb6ll1tZmfn9a1ggqny7SgTcjJsciSu3xpigdffib0XWKSIAfenWrNT1
         LtoNnKRP7S1x7MLrwvKSbExaeuOCitF88bFgqzXtg7xHJHGVtnHyzAaaKcFlaV9hJdsB
         UeWvd5QjSxYhQZLFUIMBWNA6VrCslka9O2JHYF9hvlXrUpVVyEqesASBserCZpGWwu1O
         CvXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OIfVu0OScwCIec9UtCuEdgOT+9Lz9raPPHkqnLW2Evo=;
        b=qDDi/9fumAn9A7vliB32Hp/NU45/Ly8xHPAuofTvfWBESqh7OnAHYg+g8A77c/7WNG
         JPKbP3Nvmp57GGXKrsS335I9dFKaLUWYELEPPo3bdB9vLNxDFCrBl7jIt3pKTfzDQSkH
         IseN4+IBU/kko49FbDatKDA5f4YIULYcP6gM4AZZpa2uqk6sPHrvdzLI3+pJtnhGuIZ8
         86iIBeIS7qWprGQAMtHGdENt1wut+rFJF56zVfl5b5ZwR3L4Fo9bpVmHaDa2POYo+TQm
         reCGTi9JDyG5/Si3R2Fz1nYJZjzyEgr9rCSCyhHqfdZAdt5slwG9MvNsm+tToxhmVeun
         rHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OIfVu0OScwCIec9UtCuEdgOT+9Lz9raPPHkqnLW2Evo=;
        b=Tl57nTXT0d+SzUUcP/cmU/N+F9eaut35wbFt8C1uSi8sOCq0EDPBBBkotOxeWIEQCJ
         bUBbvsxn5uD1pI3yIku3aP53SNEMOs988QErG+lh292XUgO7Da0RBptuafVoSvs2qxn5
         Rpa+J5AuklPWUmg4WwHNgSY4IMoV5FR/Z2O5+zqEmQtbOVAk0cSUEYpMMVxGh+h0oNSE
         dzESHVGAD1WS0SCftMG8tt70kuCf5HbeQ/G4jvnzMKNQS9VJCuTh+1h4+9DCcT4cWWhA
         29UcAMLed9zJzMY6IYbXdYPmzb0nNlbJybQdS4nfeUApS2L6xqOENRZBesMH53LZ9fyR
         t2pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ZcvqRLvXM3hVaxXAyLatWW0rnRef+AAp13aR1AQxIuL9eE6kV
	/qsFdld1wS0qRvuV6ZJ6kgU=
X-Google-Smtp-Source: ABdhPJy0x6uywI6vGZd9dQ4dWojH/x429lJ/tqmxVPeSdBErNnA8xrGx13y/67YF2qFgiWV10EAi+Q==
X-Received: by 2002:a05:620a:4051:: with SMTP id i17mr18055663qko.333.1636794422184;
        Sat, 13 Nov 2021 01:07:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:e34c:: with SMTP id a12ls2940259qvm.2.gmail; Sat, 13 Nov
 2021 01:07:01 -0800 (PST)
X-Received: by 2002:a0c:c784:: with SMTP id k4mr11752225qvj.1.1636794421529;
        Sat, 13 Nov 2021 01:07:01 -0800 (PST)
Date: Sat, 13 Nov 2021 01:07:00 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
In-Reply-To: <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
 <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1672_1626844729.1636794420941"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_1672_1626844729.1636794420941
Content-Type: multipart/alternative; 
	boundary="----=_Part_1673_940939732.1636794420942"

------=_Part_1673_940939732.1636794420942
Content-Type: text/plain; charset="UTF-8"



> >That is unusual, don't recall a concrete reason. Did you set 
> >platform_info.pci_domain in the root cell config? Make sure it does not 
> >collide with already existing (physical) PCI host controller domains. 
>
Yes, it is by default enabled "pci_domain = 1, what do you mean colliding? 
the configuration file and the physical pcie0 are at the same address: 
0xfd500000.
I changed .pci_mmconfig_base = 0xfd500000,
and the error is not appearing anymore, but no virtual devices were added, 
I am not sure if this step is correct.
IVSHMEM shared memory 00:00.0
            .phys_start = 0x2faf0000,
IVSHMEM shared memory 00:01.0
            .phys_start = 0xfd500000,

Regards, 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69d8e666-daf5-4146-b96e-8a6578ec2cf6n%40googlegroups.com.

------=_Part_1673_940939732.1636794420942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;">&gt;That is unusual, don't recall a concrete reason. Did you set
<br>&gt;platform_info.pci_domain in the root cell config? Make sure it does=
 not
<br>&gt;collide with already existing (physical) PCI host controller domain=
s.
<br></blockquote><div>Yes, it is by default enabled "pci_domain =3D 1, what=
 do you mean colliding? the configuration file and the physical pcie0 are a=
t the same address: 0xfd500000.</div><div>I changed .pci_mmconfig_base =3D =
0xfd500000,</div><div>and the error is not appearing anymore, but no virtua=
l devices were added, I am not sure if this step is correct.</div><div>IVSH=
MEM shared memory 00:00.0</div><div>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; .phys_start =3D 0x2faf0000,<br><div>IVSHMEM shared memory=
 00:01.0</div><div>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 .phys_start =3D 0xfd500000,<br><br></div></div><div>Regards, <br>Moustafa =
Noufale<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/69d8e666-daf5-4146-b96e-8a6578ec2cf6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/69d8e666-daf5-4146-b96e-8a6578ec2cf6n%40googlegroups.co=
m</a>.<br />

------=_Part_1673_940939732.1636794420942--

------=_Part_1672_1626844729.1636794420941--
