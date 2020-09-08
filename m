Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBFHU3T5AKGQEUOW7NTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id 59262260CD3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 10:00:22 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id h191sf7117406qke.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LO/2TosmnXIbbpeadInsRQCUGiGz9kdq9dg0LU6PLxo=;
        b=bA35CmM5KRkJyybLr5+IedCIlcKEl8SFVTHboDroELUabcKgSMZ9h7OU/IwHsq8hus
         WJiXVlU973lwlLMsG+aFeRk3wmqAVQzWtWt0jA3kDVEe7sYOCHMZssbthTfVcZ0B3civ
         xY0tcULA1xVKtwlu1snKRkoj8/Y9pXWyY7uNZ69UhS3/breVfCSEtHl4z9jCVpC5AkH5
         PDwvK++jSyQ+7vkuNtSAz8l+eyw9NrBixThRjbXfVIH42pRfBi6RRkUYNiFiQUOASOCB
         1XEso0XJwaU9JA7cxIgEj6CGMz+tBTdV7RroVsCQ3pC4XJolHAnlAfi6JnY9rS4YPzRg
         OUfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LO/2TosmnXIbbpeadInsRQCUGiGz9kdq9dg0LU6PLxo=;
        b=JWjqXOOpVUwHhVou2VGrQwTMueDszXbs/qng4tIm4rGTiAx7flbs9hkfiyDKUhR5po
         e4IvByNqK/CE79sXWQQAmzjIgXHyRgb23g0NU/W5BnEUlOGcTVOmHp2fIX2mVm7BRHxg
         I5dQ9o1pOSbHp5TieERVc4UL4Y5cjwsg/H27uhnMrIXMPre6+wNgy6+yrauuBWla2Oln
         V7ijC5EEg3Fm93TJXstIK+jMr0dlz66U/0V+inbBtDkNPCgbBZjJRPrgYRlXhZGwvAlE
         PJvepT+UHTzrZUPfU1rpBA4gKZRFvPrq0nSRU5YjIOVTIoes9CqNkzEk+rfVLZ8NTgdI
         Um4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LO/2TosmnXIbbpeadInsRQCUGiGz9kdq9dg0LU6PLxo=;
        b=WabGfjOuAN9xs8+e+40CuJL+pAg2924rAp4UkVAXEwnXqs4cO6wlwY6UAuUc7QwJdE
         SaQ6Pgc/QDOd2hp3upH+py9YTBE3F6puhfMnVupHcsIm2Qq2tMV4OtUakaiV8eLFz7DB
         HSyWcEjW7EFUQ06Emj/ODV25fyjyIyUKmXfPrk9rIV4kx5YUlzwpIDzDaRVFCBm2j8NW
         gsCgSeKvMTEPL5bOmGH6qh7NwXtdtCQ+iiVK9rxibRLPUSzDyDpPq/V24lplDig5KHt0
         0jgxuNLx5n0OuJpA1QsLTwIdF+3yZVjbX2oA8HHRO6qt8f4hQV/jzWUD5Z08F9TRfJm3
         3CUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532KHYoTt2jS+VRWOmUItmf7V8nIgRNG7lSSbcK03ym5s6DAoE3N
	vqNvv4JcrxFzZiQojvDlWVk=
X-Google-Smtp-Source: ABdhPJzGiCzVRlWRx9K38EqD7iWMnPg/W44GPlGKcfHDFVjl1m9kliapbkqnnUZ4g7jAbQ2pvj7nOg==
X-Received: by 2002:aed:3e2e:: with SMTP id l43mr24648784qtf.392.1599552021049;
        Tue, 08 Sep 2020 01:00:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:16c4:: with SMTP id d4ls858569qvz.5.gmail; Tue, 08
 Sep 2020 01:00:20 -0700 (PDT)
X-Received: by 2002:a0c:9d04:: with SMTP id m4mr38501qvf.18.1599552020393;
        Tue, 08 Sep 2020 01:00:20 -0700 (PDT)
Date: Tue, 8 Sep 2020 01:00:19 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
In-Reply-To: <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_876_1861895106.1599552019504"
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

------=_Part_876_1861895106.1599552019504
Content-Type: multipart/alternative; 
	boundary="----=_Part_877_533806974.1599552019504"

------=_Part_877_533806974.1599552019504
Content-Type: text/plain; charset="UTF-8"

Hello everyone!

Now I have build the BSP (Linux Kernel 5.4.61, Root-FS with hypervisor 
"jailhouse") with Yocto/Poky "dunfell".

I'm using an embedded PC with "Intel Core i7-8559U".
This CPU supports "VT-x" and "VT-d".

Now I don't have the errors with "python" either.

However, I still cannot create a configuration for the root cell!

If I execute the command "jailhouse config create sysconfig.c", I get the 
following messages:

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


These messages are similar to the messages when I run the "jailhouse 
hardware check" command.
(I had already reported that.)

What can be the problem?
What else could I explore or try out?

The kernel command line is:
BOOT_IMAGE=/boot/bzImage root=PARTUUID=4f8941f9-aabf-4b0e-ae9f-5857dc993a3d 
rootwait net.ifnames=0 biosdevname=0 ro quiet loglevel=3 console=tty1 
consoleblank=0 intel_iommu=off

I've tried to read out "/sys/firmware/acpi/tables/DMAR", but this is 
probably a binary file.
I suspect that I need to use the "Intel ASL compiler / decompiler".
However, this is not included in the BSP.

I've tried a lot now, but so far without success.
I really need help now!

Best regards
Jan.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6ad242dd-b69f-4176-a10a-1e84edf3b670n%40googlegroups.com.

------=_Part_877_533806974.1599552019504
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello everyone!</div><div><br></div><div>Now I have build the BSP (Lin=
ux Kernel 5.4.61, Root-FS with hypervisor "jailhouse") with Yocto/Poky "dun=
fell".<br></div><div><div><br></div><div>I'm using an embedded PC with "Int=
el Core i7-8559U".</div><div>This CPU supports "VT-x" and "VT-d".</div><div=
><br></div><div>Now I don't have the errors with "python" either.</div><div=
><br></div><div><span style=3D"background-color: yellow;">However, I still =
cannot create a configuration for the root cell!</span></div><div><br></div=
><div>If I execute the command "jailhouse config create sysconfig.c", I get=
 the following messages:<br></div><div><br></div><div><span style=3D"font-f=
amily: Courier New;">Traceback (most recent call last):<br>&nbsp; File "/us=
r/libexec/jailhouse/jailhouse-config-create", line 270, in &lt;module&gt;<b=
r>&nbsp;&nbsp;&nbsp; (iommu_units, extra_memregs) =3D sysfs_parser.parse_dm=
ar(pcidevices, ioapics,<br>&nbsp; File "/usr/lib/python3.8/site-packages/py=
jailhouse/sysfs_parser.py", line 377, in parse_dmar<br>&nbsp;&nbsp;&nbsp; r=
aise RuntimeError('DMAR region size cannot be identified.\n'<br>RuntimeErro=
r: DMAR region size cannot be identified.<br>Target Linux must run with Int=
el IOMMU enabled.</span></div><div><br></div><div><br></div><div>These mess=
ages are similar to the messages when I run the "jailhouse hardware check" =
command.</div><div>(I had already reported that.)</div><div><br></div><div>=
<div><span style=3D"background-color: yellow;">What can be the problem?<br>=
</span></div><div><div><span style=3D"background-color: yellow;">What else =
could I explore or try out?</span></div></div><div><span style=3D"backgroun=
d-color: yellow;"><br></span></div>The kernel command line is:</div><div><s=
pan style=3D"font-family: Courier New;">BOOT_IMAGE=3D/boot/bzImage root=3DP=
ARTUUID=3D4f8941f9-aabf-4b0e-ae9f-5857dc993a3d rootwait net.ifnames=3D0 bio=
sdevname=3D0 ro quiet loglevel=3D3 console=3Dtty1 consoleblank=3D0 intel_io=
mmu=3Doff</span><br></div><div><br></div><div>I've tried to read out "/sys/=
firmware/acpi/tables/DMAR", but this is probably a binary file.</div><div>I=
 suspect that I need to use the "Intel ASL compiler / decompiler".</div><di=
v>However, this is not included in the BSP.</div><div></div><div><br></div>=
I've tried a lot now, but so far without success.<br>I really need help now=
!<br><div><br></div><div>Best regards</div><div>Jan.<br></div><div><br></di=
v></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6ad242dd-b69f-4176-a10a-1e84edf3b670n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6ad242dd-b69f-4176-a10a-1e84edf3b670n%40googlegroups.co=
m</a>.<br />

------=_Part_877_533806974.1599552019504--

------=_Part_876_1861895106.1599552019504--
