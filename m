Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBJH7W75AKGQEKNAXX2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CACE2589F9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 10:00:38 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id x10sf366230qtp.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Sep 2020 01:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ofXEl5TNhglHlPwN7iY+PKaRyxrrYeSWLCvzuAzruzo=;
        b=oMT5aqbXTI/4xgq4iaaXTRCugD/Oph3l9jaJEBNIxiyKMlhVISAfJWT/lVF9MLWNoE
         iSaqBd9WSTo4PdyKeX4GTuNisxj4ymqv99boSZt4g5Bh+9aCzdWCpX0MDO/O/1d7qej7
         tIJ39UeWZ9hIQuZ2jwrHONQsItFQVyJunRieFMpQ1j2ziAYU6WkXN9czEbKRr11jSJwF
         rJ3izssOOyqlxLl2qPCaUL8B23oozTODRjQwi/laD1S9jM7HmEK3VA4ZjUpoFhZiJbDT
         uoIU55yFNDjdKriAnv1VlwF16QS6u9isDXyvD4+YUwuXqjjgq+99tnk35WkPxvt5E+h9
         jlXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ofXEl5TNhglHlPwN7iY+PKaRyxrrYeSWLCvzuAzruzo=;
        b=McWtw7veOeiC+8WalFMRriRXEF/TRoHp+mIDxPCut8nXkd971/hGoiKsclpSNUXPRa
         kfY6IOqwAjxmvL1mAfv6vCHCUdsi8R0PhMJZK3Fvt08Ff5+SSszdRPesLpcGoJEySx7e
         S3dBRA7CO1cjRu2ZWCBKb3jIG6DApKusgRmRTJEPI/NYGcjkd/sDwGpe0/FfMik4jei3
         Fvr4npHRcCZjPG9S/JPEkOXNrqi8n75leU7VO4+huYsuIeSKX0/aSrtVnv34Aob1yYz+
         +PdUrj15dEXIcbJZikGAe03SQvn1rMsQFmSM6Y4pG4+eZNolUQ0ZJYfwga4wA95i+naD
         2sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ofXEl5TNhglHlPwN7iY+PKaRyxrrYeSWLCvzuAzruzo=;
        b=TkRoRVVxYvupmvhjrXy3VqDuiRf8KzvNdN5ssYDWXrWkpqwXi+fCe2mn+f7Qn/ivTX
         Avo1+MmPZUAq7PwAS1wMwfmu4WLGJjvBg3W/SZ5n1WD2umqYsbUfJGbf/Vudd+LhiJbO
         rtTfFqxCtt0xDOUQlf/NJWXLnZ2ULR+mrgn1P0Aru48GnEzAkU2VVeLhiSPKKkwh4ktZ
         6MReFgjlHvG+4RrJWjqRBccka6/D7VKjVnGBuMUBdg23MjqeBHwUAk50I4H4aqGUsGRK
         Ie6s1X5pZedTAHQj8VcSIW3f+43106ZLqCQ9CN3aAz1MAQ2qQaxjqxBiLudCrr8jCGzV
         Tdvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532EBq68CAEkJYFxe/eEE1ulx//qPJvknN1WL1+lfIkn8iQVysDa
	tjwObfv4pxqCmX4nq4u1PU4=
X-Google-Smtp-Source: ABdhPJwwrykOVkEBeujjw2cwt8tqOMpOGMcqnlIfGe5EGFZmY75QZzoxiBSsKv5z0UsadN2PjTNkMQ==
X-Received: by 2002:a37:93c1:: with SMTP id v184mr630463qkd.165.1598947237068;
        Tue, 01 Sep 2020 01:00:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:1445:: with SMTP id b5ls113244qvy.2.gmail; Tue, 01
 Sep 2020 01:00:36 -0700 (PDT)
X-Received: by 2002:a05:6214:10ca:: with SMTP id r10mr694818qvs.185.1598947236182;
        Tue, 01 Sep 2020 01:00:36 -0700 (PDT)
Date: Tue, 1 Sep 2020 01:00:35 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
In-Reply-To: <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_226_1132826795.1598947235388"
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

------=_Part_226_1132826795.1598947235388
Content-Type: multipart/alternative; 
	boundary="----=_Part_227_1985417197.1598947235388"

------=_Part_227_1985417197.1598947235388
Content-Type: text/plain; charset="UTF-8"

Fortsetzung:

I've adjusted the file "sysfs_parser.py" and commented out line 754.
This means that the "has_extended_caps" tag is not set to "True".

Now I get the following messages:

Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok
Traceback (most recent call last):
  File "/usr/libexec/jailhouse/jailhouse-hardware-check", line 147, in 
<module>
    iommu, _ = sysfs_parser.parse_dmar(pci_devices, ioapics, dmar_regions)
  File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 
348, in parse_dmar
    f = input_open('/sys/firmware/acpi/tables/DMAR', 'rb')
  File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 
89, in input_open
    raise e
  File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 
85, in input_open
    f = open(root_dir + name, mode)
FileNotFoundError: [Errno 2] No such file or directory: 
'//sys/firmware/acpi/tables/DMAR'

The directory "/sys/firmware/acpi/tables/DMAR" does not actually exist on 
my system!
There are only the following directories: 

ls -l /sys/firmware/acpi/tables/
-r-------- 1 root root   104 Sep  1 07:24 APIC
-r-------- 1 root root   332 Sep  1 07:50 CSRT
-r-------- 1 root root 42635 Sep  1 07:50 DSDT
-r-------- 1 root root   268 Sep  1 07:50 FACP
-r-------- 1 root root    64 Sep  1 07:50 FACS
-r-------- 1 root root   156 Sep  1 07:50 FIDT
-r-------- 1 root root    68 Sep  1 07:50 FPDT
-r-------- 1 root root    56 Sep  1 07:50 HPET
-r-------- 1 root root   260 Sep  1 07:50 LPIT
-r-------- 1 root root    60 Sep  1 07:50 MCFG
-r-------- 1 root root  1891 Sep  1 07:50 SSDT1
-r-------- 1 root root   656 Sep  1 07:50 SSDT2
-r-------- 1 root root   378 Sep  1 07:50 SSDT3
-r-------- 1 root root    66 Sep  1 07:50 UEFI
drwxr-xr-x 2 root root     0 Sep  1 07:50 data
drwxr-xr-x 2 root root     0 Sep  1 07:50 dynamic

What should I do?





-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/716a1db0-3392-40d6-a6ac-051ca2a52ce7n%40googlegroups.com.

------=_Part_227_1985417197.1598947235388
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Fortsetzung:</div><div><br></div>I've adjusted the file "sysfs_parser.=
py" and commented out line 754.<br>This means that the "has_extended_caps" =
tag is not set to "True".<div><br></div><div>Now I get the following messag=
es:</div><div><br></div><div><span style=3D"font-family: Courier New;">Feat=
ure&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Av=
ailability<br>------------------------------&nbsp; ------------------<br>Nu=
mber of CPUs &gt; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ok<br>Long mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ok<br>Traceback (most recent call last):<br>&nbsp; Fil=
e "/usr/libexec/jailhouse/jailhouse-hardware-check", line 147, in &lt;modul=
e&gt;<br>&nbsp;&nbsp;&nbsp; iommu, _ =3D sysfs_parser.parse_dmar(pci_device=
s, ioapics, dmar_regions)<br>&nbsp; File "/usr/lib/python3.7/site-packages/=
pyjailhouse/sysfs_parser.py", line 348, in parse_dmar<br>&nbsp;&nbsp;&nbsp;=
 f =3D input_open('/sys/firmware/acpi/tables/DMAR', 'rb')<br>&nbsp; File "/=
usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 89, in i=
nput_open<br>&nbsp;&nbsp;&nbsp; raise e<br>&nbsp; File "/usr/lib/python3.7/=
site-packages/pyjailhouse/sysfs_parser.py", line 85, in input_open<br>&nbsp=
;&nbsp;&nbsp; f =3D open(root_dir + name, mode)<br>FileNotFoundError: [Errn=
o 2] No such file or directory: '//sys/firmware/acpi/tables/DMAR'<br></span=
><br></div><div>The directory "/sys/firmware/acpi/tables/DMAR" does not act=
ually exist on my system!</div><div>There are only the following directorie=
s: <br></div><div><br></div><div><span style=3D"font-family: Courier New;">=
ls -l /sys/firmware/acpi/tables/</span><br></div><div></div><div><span styl=
e=3D"font-family: Courier New;">-r-------- 1 root root&nbsp;&nbsp; 104 Sep&=
nbsp; 1 07:24 APIC<br>-r-------- 1 root root&nbsp;&nbsp; 332 Sep&nbsp; 1 07=
:50 CSRT<br>-r-------- 1 root root 42635 Sep&nbsp; 1 07:50 DSDT<br>-r------=
-- 1 root root&nbsp;&nbsp; 268 Sep&nbsp; 1 07:50 FACP<br>-r-------- 1 root =
root&nbsp;&nbsp;&nbsp; 64 Sep&nbsp; 1 07:50 FACS<br>-r-------- 1 root root&=
nbsp;&nbsp; 156 Sep&nbsp; 1 07:50 FIDT<br>-r-------- 1 root root&nbsp;&nbsp=
;&nbsp; 68 Sep&nbsp; 1 07:50 FPDT<br>-r-------- 1 root root&nbsp;&nbsp;&nbs=
p; 56 Sep&nbsp; 1 07:50 HPET<br>-r-------- 1 root root&nbsp;&nbsp; 260 Sep&=
nbsp; 1 07:50 LPIT<br>-r-------- 1 root root&nbsp;&nbsp;&nbsp; 60 Sep&nbsp;=
 1 07:50 MCFG<br>-r-------- 1 root root&nbsp; 1891 Sep&nbsp; 1 07:50 SSDT1<=
br>-r-------- 1 root root&nbsp;&nbsp; 656 Sep&nbsp; 1 07:50 SSDT2<br>-r----=
---- 1 root root&nbsp;&nbsp; 378 Sep&nbsp; 1 07:50 SSDT3<br>-r-------- 1 ro=
ot root&nbsp;&nbsp;&nbsp; 66 Sep&nbsp; 1 07:50 UEFI<br>drwxr-xr-x 2 root ro=
ot&nbsp;&nbsp;&nbsp;&nbsp; 0 Sep&nbsp; 1 07:50 data<br>drwxr-xr-x 2 root ro=
ot&nbsp;&nbsp;&nbsp;&nbsp; 0 Sep&nbsp; 1 07:50 dynamic</span></div><div><br=
></div><div>What should I do?</div><div><br></div><div><br></div><div><br><=
/div><div><br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/716a1db0-3392-40d6-a6ac-051ca2a52ce7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/716a1db0-3392-40d6-a6ac-051ca2a52ce7n%40googlegroups.co=
m</a>.<br />

------=_Part_227_1985417197.1598947235388--

------=_Part_226_1132826795.1598947235388--
