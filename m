Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB3U2XD5AKGQEYGG6VQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F79C258ADF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 10:59:28 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id p43sf452337qtb.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Sep 2020 01:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w8T5MTr7yAd/4ChxuTcS6dBYLr83VwCvjeWE3li4w7E=;
        b=IjJL5AiacLoa4Ie3Sp3etQkstMkG5DVQWgz6Lz3PA9NgWMLgfUFfa5s4Xn+K7dfyCw
         OuPBPnH6QafZ86NJfdMK8gyNWLw1N5AfjMDd0r8NCIZIAwnFxn/9dTCM2yLhao//09TD
         VDtosI0OcMgKkO6CTm84K0UHwUu856LJqYD6s+Ut/QU4qC+S3uePbz6rXo+DBFX9tRE3
         WKsagwrmgD9Fl7fjGLAV1AMmh+YWJupCTPw3ttnGxXn7yO9JNcNuQhekg0+6VgKuIGeb
         W9q88t6G8Wh8eWFHUYEijL1QvuiPfScU9BBvZqN6mu+lEAMPbtAyCtYkDbY2RsB/mv0p
         WuWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w8T5MTr7yAd/4ChxuTcS6dBYLr83VwCvjeWE3li4w7E=;
        b=WgvgXQA93r/cTiEOxc6MLFzm12D7yCjK2y2gJKEuGeAmDoTB3nS4jKbL446dzOI0Rz
         KzdUGeedF03q8dlFVhklhZK+deoHMrZkyyVN06StyU9mIfGfEnMl1kQVYEXIuwBIiYH3
         wy7R43MsR3AQqQgvIIY5wAxUDl5Z1mwXt+Ybm1OBbvtnZSq5ukDz36SBB2aAOx02AA08
         UZy4BGMB0AUsnheOJLqUpT6vRqk6L/EF3OKT7wCxyKuMUqLF6EttFFSrz0TBpke6LseU
         nnRkTSC/1L+oH0x5pfym/ibmyyM7jADfXHk2Uxo2AdMOVFi4x9IllK2pO2CLToLPtdTX
         228w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=w8T5MTr7yAd/4ChxuTcS6dBYLr83VwCvjeWE3li4w7E=;
        b=NqwMq9C1ghkdWeXfIXMDB3rwNOnIAiP3+FveTHHv7XoOU5zISA1SUy5Ap2bNUDqITM
         rtRYCHjlB0PAFV5r1kINcxfh45kKRDCFek7nbiHBlxthvRyXactoGN0jUAbN4qIGlOdC
         D7oYU7IDN7zbELmQs57Pw32ThL+6LsIyDj1dXIQokKutwIphDN8RZ4+SA7qIcrqRU7bE
         V15/48e7F5e9y7SRiH0zZx8kY3tCdSmyiEP2X5aHFpk/iC+EHZZwJ4l0IJZaA4lPnAo8
         cp5wIEoXLOkq32UQQoxxM8eWlCb4ONq3X2V8nKYk6Q5MQfo9GkNu6YOOFsz1uwMSmRHH
         4WVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5333yadJyCQS6+TjHsamka4lQCan2xS2V+/sxZk7WQyvAhC3RIWf
	ZnEMdFJGX+W/j/x4KeGE3Fw=
X-Google-Smtp-Source: ABdhPJym7wfXz8Cr13cUmf+nSi+JkztEBYjLdHuv/TXSgY64Zc45MdXRjW1iemFGr2uuDMUtLV9+DA==
X-Received: by 2002:ac8:47c4:: with SMTP id d4mr692066qtr.43.1598950767115;
        Tue, 01 Sep 2020 01:59:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:eb82:: with SMTP id x2ls72034qvo.1.gmail; Tue, 01 Sep
 2020 01:59:26 -0700 (PDT)
X-Received: by 2002:a0c:f9cd:: with SMTP id j13mr885660qvo.227.1598950766572;
        Tue, 01 Sep 2020 01:59:26 -0700 (PDT)
Date: Tue, 1 Sep 2020 01:59:25 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2cbf413b-e6d5-42c3-8f27-5f0f1be11268n@googlegroups.com>
In-Reply-To: <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_202_1844976272.1598950765825"
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

------=_Part_202_1844976272.1598950765825
Content-Type: multipart/alternative; 
	boundary="----=_Part_203_1120469112.1598950765825"

------=_Part_203_1120469112.1598950765825
Content-Type: text/plain; charset="UTF-8"

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

Remarks:

- my system has an "Intel BayTrail SoC" wih 2 cores
- I've added "intel_iommu=off" to the kernel command line
- "dmesg | grep DMAR" brings no result
- option "Intel Virtualization Technology" is enabled in the BIOS
- "cat /proc/cpuinfo | grep vmx" or "grep --color vmx /proc/cpuinfo" brings 
that "vmx" is in the "flags"
- "lscpu" brings "Virtualization: VT-x"


What should I do?


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2cbf413b-e6d5-42c3-8f27-5f0f1be11268n%40googlegroups.com.

------=_Part_203_1120469112.1598950765825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've adjusted the file "sysfs_parser.py" and commented out line 754.<br>Thi=
s means that the "has_extended_caps" tag is not set to "True".<br><br>Now I=
 get the following messages:<br><br><span style=3D"font-family: Courier New=
;">Feature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; Availability<br>------------------------------&nbsp; -----------------=
-<br>Number of CPUs &gt; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok<br>Long mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ok<br><br>Traceback (most recent call last):<br=
>&nbsp; File "/usr/libexec/jailhouse/jailhouse-hardware-check", line 147, i=
n &lt;module&gt;<br>&nbsp;&nbsp;&nbsp; iommu, _ =3D sysfs_parser.parse_dmar=
(pci_devices, ioapics, dmar_regions)<br>&nbsp; File "/usr/lib/python3.7/sit=
e-packages/pyjailhouse/sysfs_parser.py", line 348, in parse_dmar<br>&nbsp;&=
nbsp;&nbsp; f =3D input_open('/sys/firmware/acpi/tables/DMAR', 'rb')<br>&nb=
sp; File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", li=
ne 89, in input_open<br>&nbsp;&nbsp;&nbsp; raise e<br>&nbsp; File "/usr/lib=
/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 85, in input_op=
en<br>&nbsp;&nbsp;&nbsp; f =3D open(root_dir + name, mode)<br>FileNotFoundE=
rror: [Errno 2] No such file or directory: '//sys/firmware/acpi/tables/DMAR=
'</span><br><br>The directory "/sys/firmware/acpi/tables/DMAR" does not act=
ually exist on my system!<br>There are only the following directories:<br><=
br>l<span style=3D"font-family: Courier New;">s -l /sys/firmware/acpi/table=
s/<br>-r-------- 1 root root&nbsp;&nbsp; 104 Sep&nbsp; 1 07:24 APIC<br>-r--=
------ 1 root root&nbsp;&nbsp; 332 Sep&nbsp; 1 07:50 CSRT<br>-r-------- 1 r=
oot root 42635 Sep&nbsp; 1 07:50 DSDT<br>-r-------- 1 root root&nbsp;&nbsp;=
 268 Sep&nbsp; 1 07:50 FACP<br>-r-------- 1 root root&nbsp;&nbsp;&nbsp; 64 =
Sep&nbsp; 1 07:50 FACS<br>-r-------- 1 root root&nbsp;&nbsp; 156 Sep&nbsp; =
1 07:50 FIDT<br>-r-------- 1 root root&nbsp;&nbsp;&nbsp; 68 Sep&nbsp; 1 07:=
50 FPDT<br>-r-------- 1 root root&nbsp;&nbsp;&nbsp; 56 Sep&nbsp; 1 07:50 HP=
ET<br>-r-------- 1 root root&nbsp;&nbsp; 260 Sep&nbsp; 1 07:50 LPIT<br>-r--=
------ 1 root root&nbsp;&nbsp;&nbsp; 60 Sep&nbsp; 1 07:50 MCFG<br>-r-------=
- 1 root root&nbsp; 1891 Sep&nbsp; 1 07:50 SSDT1<br>-r-------- 1 root root&=
nbsp;&nbsp; 656 Sep&nbsp; 1 07:50 SSDT2<br>-r-------- 1 root root&nbsp;&nbs=
p; 378 Sep&nbsp; 1 07:50 SSDT3<br>-r-------- 1 root root&nbsp;&nbsp;&nbsp; =
66 Sep&nbsp; 1 07:50 UEFI<br>drwxr-xr-x 2 root root&nbsp;&nbsp;&nbsp;&nbsp;=
 0 Sep&nbsp; 1 07:50 data<br>drwxr-xr-x 2 root root&nbsp;&nbsp;&nbsp;&nbsp;=
 0 Sep&nbsp; 1 07:50 dynamic</span><br><br>Remarks:<br><br>- my system has =
an "Intel BayTrail SoC" wih 2 cores<br>- I've added "<span style=3D"font-fa=
mily: Courier New;">intel_iommu=3Doff</span>" to the kernel command line<br=
>- "<span style=3D"font-family: Courier New;">dmesg | grep DMAR</span>" bri=
ngs no result<br>- option "Intel Virtualization Technology" is enabled in t=
he BIOS<br>- "<span style=3D"font-family: Courier New;">cat /proc/cpuinfo |=
 grep vmx</span>" or "<span style=3D"font-family: Courier New;">grep --colo=
r vmx /proc/cpuinfo</span>" brings that "vmx" is in the "flags"<br>- "<span=
 style=3D"font-family: Courier New;">lscpu</span>" brings "Virtualization: =
VT-x"<br><br><br>What should I do?<br><br><br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2cbf413b-e6d5-42c3-8f27-5f0f1be11268n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2cbf413b-e6d5-42c3-8f27-5f0f1be11268n%40googlegroups.co=
m</a>.<br />

------=_Part_203_1120469112.1598950765825--

------=_Part_202_1844976272.1598950765825--
