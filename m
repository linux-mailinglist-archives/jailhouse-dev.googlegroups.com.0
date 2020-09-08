Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBZGG335AKGQELIZL4MA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E2261382
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 17:29:42 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id y53sf3999742qth.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pA/aI9PQ3/i/Nik8T9U0zbPiP4uPB8qYCjJ6nSt3+4Q=;
        b=BQXtaKM6+ejrnOT5301VrW8dFbMgceZzm5GMoCiIcRE4ZvMaT8xVN0mq+LlDOrVuNE
         M/04s5ftD1XW9NiVxnKbSIw6t7QD0CJnsRShoBKZ75Qcxg8LmkWj9bXnWD39Ns042NaK
         vzKX/5azKX9dy6qwIwWzDpkHmMCG/zn2V/aM4a4GIA0uRv8KoS52HGsGKaBctCZR4yjH
         50QhPkhmi6bDeYzBh+xrt1BZ2Lp3Plf+Iq6GKCSBKxH6Kqms7NJKI4Ak5C98yJLZhs91
         2OCuJ9Xo/bSDFLSd/tS5KVbiGCm7dPXQIH1oIfd5y9tF+kT7k1nhhFkbR745Olui6s0U
         quQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pA/aI9PQ3/i/Nik8T9U0zbPiP4uPB8qYCjJ6nSt3+4Q=;
        b=RaA9II6bmn8tqCGIXlm2/r/Hjzck/WF1QIQPPIQO7AHNZJkKHqBEqTD+knmkKLPHLg
         Mth+Qt4DECm1lp98aZH2HsNo9wq+4dfhwx0QbspXIS06E9jP4KNTCfWdtHuePlnUeYCy
         Dc5OThsDjykbVbjXKVNjNIoWsNU35jWgn/TE6vPM1ZB0XIWRAnfnulqptI0kucHtemlt
         enGIJ+gXNtZTccP8LtOENcq+uDBueeV9e+CHDCEpSFzDwbCYAdacTiLl+DsgduMXe1C0
         bSD8BsRzxarK/9YfA1tWPZmrW6x7pBkEnBltOaGnJ7Ym56p7FkLuYmflEIYyqzJa6OaX
         Kgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pA/aI9PQ3/i/Nik8T9U0zbPiP4uPB8qYCjJ6nSt3+4Q=;
        b=S8cR68MN3voJar1ba4Re4VFeP07fNbtGhkKcGJogXaseMbxAaNeO6BN5BCDSr5TbC7
         jNdEVZiHsh98KhXitwbuTmsBI4+27wXT54oxYrcjzRqMjLpYR9t6cW3o9vC7b631B5ow
         b0NnCMY3mumsWU1g6UeY4zIyuLd8tnVAjzq5axl5gbVqrkcfx1rhIvmNe3fuVm5X01Fa
         3hXyXy1UkjJgYIzvFP6gs1BfFNGUiCznP4WhyqVtdvR53UkMkPPHM/205WK6zjPhG7MV
         D/6KwpMZGavuF3HbPbv7Lvdpsx1wtjdGEwF8TLHXT1keWTYuGhgAZOJDIfOjW9GWVTM4
         JUUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530EGt0Mghjid3FH3syBK01wRqStN8ko4IaBjeLSoBbcFUs9XXPb
	TUlSnlFiy75nnDelC+jgkuE=
X-Google-Smtp-Source: ABdhPJy3OKBw75NAJpukdjpCOA2BJqSv6hPHvsaHH5aHHScKhztm4udh3OQHIxVTwoSJ6Oi5NNdpYw==
X-Received: by 2002:a0c:d443:: with SMTP id r3mr602567qvh.17.1599578981018;
        Tue, 08 Sep 2020 08:29:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:f50b:: with SMTP id l11ls9686925qkk.6.gmail; Tue, 08 Sep
 2020 08:29:40 -0700 (PDT)
X-Received: by 2002:a37:78b:: with SMTP id 133mr564234qkh.107.1599578980208;
        Tue, 08 Sep 2020 08:29:40 -0700 (PDT)
Date: Tue, 8 Sep 2020 08:29:39 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <14e0bc1b-c52f-492d-aad1-a565969f73f5n@googlegroups.com>
In-Reply-To: <4fbc4f7c-de79-8bbb-357e-f5a056698f56@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
 <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
 <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com>
 <0cf9a640-02d0-4928-873e-08d407bbed17n@googlegroups.com>
 <4fbc4f7c-de79-8bbb-357e-f5a056698f56@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_844_8459868.1599578979393"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_844_8459868.1599578979393
Content-Type: multipart/alternative; 
	boundary="----=_Part_845_1521278546.1599578979393"

------=_Part_845_1521278546.1599578979393
Content-Type: text/plain; charset="UTF-8"

Thank you for the response!

The linux kernel created as described starts.

The kernel configuration option "CONFIG_IOMMU_SUPPORT" is set ( 
CONFIG_IOMMU_SUPPORT=y).
All other configuration options with "*IOMMU* are not set (as I already 
mentioned).

The kernel command line contains "intel_iommu=on".
"dmesg | grep DMAR" returns an entry "ACPI: DMAR ..." (that is new for me).

However, I still cannot create a configuration for the root cell with 
"jailhouse config create"; I get the same error messages again:

Traceback (most recent call last):
  File "/usr/libexec/jailhouse/jailhouse-config-create", line 270, in 
<module>
    (iommu_units, extra_memregs) = sysfs_parser.parse_dmar(pcidevices, 
ioapics,
  File "/usr/lib/python3.8/site-packages/pyjailhouse/sysfs_parser.py", line 
377, in parse_dmar

    raise RuntimeError('DMAR region size cannot be identified.\n'
RuntimeError: DMAR region size cannot be identified.
Target Linux must run with Intel IOMMU enabled.

So I still don't have "a booting setup for Jailhouse"!

What do you mean exactly with "you will still need the Intel IOMMU 
parameters"?
Do you mean the kernel configuration option "CONFIG_INTEL_IOMMU" or do you 
mean the kernel comand line entry " intel_iommu=on"? 

Why is the option "CONFIG_INTEL_IOMMU" not included in the configuration 
fragment "jailhouse.cfg", if this is required? 

I hope that at some point I will come to a system configuration that is 
useful for jailhouse.
I am already using everything that is provided in the "meta-agl-devel" 
layer with regard to linux kernel and jailhouse.

Best regards
Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/14e0bc1b-c52f-492d-aad1-a565969f73f5n%40googlegroups.com.

------=_Part_845_1521278546.1599578979393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thank you for the response!</div><div><br></div><div>The linux kernel =
created as described starts.</div><div><br></div><div>The kernel configurat=
ion option "CONFIG_IOMMU_SUPPORT" is set (
CONFIG_IOMMU_SUPPORT=3Dy).</div><div>All other=20
configuration=20

options with "*IOMMU* are not set (as I already mentioned).<br>

</div><div></div><div><br></div><div>The kernel command line contains "inte=
l_iommu=3Don".</div><div>
"<span style=3D"font-family: Courier New;">dmesg | grep DMAR</span>" return=
s an entry "ACPI: DMAR ..." (that is new for me).<br></div><div><br></div><=
div>However, I still cannot create a configuration for the root cell with "=
jailhouse config create"; I get the same error messages again:</div><div><b=
r></div><div>
<div><span style=3D"font-family: Courier New;"><span><div><div><span>Traceb=
ack (most recent call last):<br></span></div></div></span></span></div><div=
><span style=3D"font-family: Courier New;"><span><div><div><span>&nbsp; Fil=
e "/usr/libexec/jailhouse/jailhouse-config-create", line 270, in &lt;module=
&gt;<br>&nbsp;&nbsp;&nbsp; (iommu_units, extra_memregs) =3D sysfs_parser.pa=
rse_dmar(pcidevices, ioapics,<br>&nbsp; File "/usr/lib/python3.8/site-packa=
ges/pyjailhouse/sysfs_parser.py", line 377, in parse_dmar</span></div></div=
></span></span></div><div><span style=3D"font-family: Courier New;"><span><=
div><div><span><br>&nbsp;&nbsp;&nbsp; raise RuntimeError('DMAR region size =
cannot be identified.\n'<br>RuntimeError: DMAR region size cannot be identi=
fied.<br>Target Linux must run with Intel IOMMU enabled.</span></div></div>=
</span></span></div>

</div><div><br></div><div>So I still don't have "a booting setup for Jailho=
use"!<br></div><div><br></div><div>What do you mean exactly with "you will =
still need the Intel IOMMU parameters"?</div><div>Do you mean the kernel co=
nfiguration option "CONFIG_INTEL_IOMMU" or do you mean the kernel comand li=
ne entry "
intel_iommu=3Don"? <br></div><div><br></div><div>Why is the option "CONFIG_=
INTEL_IOMMU" not included in the configuration fragment "jailhouse.cfg",=20
<span><span> if this is required?</span></span>



</div><div><br></div><div>I hope that at some point I will come to a system=
 configuration that is useful for jailhouse.</div><div>I am already using e=
verything that is provided in the "meta-agl-devel" layer with regard to lin=
ux kernel and jailhouse.<br></div><div><br></div><div class=3D"gmail_quote"=
>Best regards</div><div class=3D"gmail_quote">Jan.</div><div class=3D"gmail=
_quote"><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/14e0bc1b-c52f-492d-aad1-a565969f73f5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/14e0bc1b-c52f-492d-aad1-a565969f73f5n%40googlegroups.co=
m</a>.<br />

------=_Part_845_1521278546.1599578979393--

------=_Part_844_8459868.1599578979393--
